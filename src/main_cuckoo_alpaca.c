#include <stdio.h>
#include <param.h>

#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include <libalpaca/alpaca.h>
#include <libmspbuiltins/builtins.h>
#ifdef LOGIC
#define LOG(...)
#define PRINTF(...)
#define BLOCK_PRINTF(...)
#define BLOCK_PRINTF_BEGIN(...)
#define BLOCK_PRINTF_END(...)
#define INIT_CONSOLE(...)
#else
#include <libio/log.h>
#endif
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>
#ifdef CONFIG_EDB
#include <libedb/edb.h>
#endif

#include "pins.h"

#define NUM_INSERTS (NUM_BUCKETS / 4) // shoot for 25% occupancy
#define NUM_LOOKUPS NUM_INSERTS
//#define NUM_BUCKETS 512 // must be a power of 2
#define NUM_BUCKETS 128 // must be a power of 2
#define MAX_RELOCATIONS 8
#define BUFFER_SIZE 32

typedef uint16_t value_t;
typedef uint16_t hash_t;
typedef uint16_t fingerprint_t;
typedef uint16_t index_t; // bucket index

typedef struct _insert_count {
	unsigned insert_count;
	unsigned inserted_count;
} insert_count_t;

typedef struct _lookup_count {
	unsigned lookup_count;
	unsigned member_count;
} lookup_count_t;

TASK(1,  task_init)
TASK(2,  task_generate_key)
TASK(3,  task_insert)
TASK(4,  task_calc_indexes)
TASK(5,  task_calc_indexes_index_1)
TASK(6,  task_calc_indexes_index_2)
TASK(7,  task_add) // TODO: rename: add 'insert' prefix
TASK(8,  task_relocate)
TASK(9,  task_insert_done)
TASK(10, task_lookup)
TASK(11, task_lookup_search)
TASK(12, task_lookup_done)
TASK(13, task_print_stats)
TASK(14, task_done)
TASK(15, task_init_array)

/* This is originally done by the compiler */
__nv uint8_t* data_src[131];
__nv uint8_t* data_dest[131];
__nv unsigned data_size[131];
GLOBAL_SB(fingerprint_t, filter_bak, NUM_BUCKETS);
GLOBAL_SB(uint16_t, filter_isDirty, NUM_BUCKETS);
GLOBAL_SB(value_t, insert_count_bak);
GLOBAL_SB(value_t, lookup_count_bak);
GLOBAL_SB(value_t, inserted_count_bak);
GLOBAL_SB(value_t, member_count_bak);
GLOBAL_SB(value_t, key_bak);
GLOBAL_SB(index_t, index_bak);
GLOBAL_SB(fingerprint_t, fingerprint_bak);
GLOBAL_SB(value_t, index1_bak);
GLOBAL_SB(value_t, relocation_count_bak);
void clear_isDirty() {
	PRINTF("clear\r\n");
	memset(&GV(filter_isDirty, 0), 0, sizeof(_global_filter_isDirty));
}
/* end */

GLOBAL_SB(fingerprint_t, filter, NUM_BUCKETS);
GLOBAL_SB(index_t, index);
GLOBAL_SB(value_t, key);
GLOBAL_SB(task_t*, next_task);
GLOBAL_SB(fingerprint_t, fingerprint);
GLOBAL_SB(value_t, index1);
GLOBAL_SB(value_t, index2);
GLOBAL_SB(value_t, relocation_count);
GLOBAL_SB(value_t, insert_count);
GLOBAL_SB(value_t, inserted_count);
GLOBAL_SB(value_t, lookup_count);
GLOBAL_SB(value_t, member_count);
GLOBAL_SB(bool, success);
GLOBAL_SB(bool, member);

static value_t init_key = 0x0001; // seeds the pseudo-random sequence of keys

static hash_t djb_hash(uint8_t* data, unsigned len)
{
	uint16_t hash = 5381;
	unsigned int i;

	for(i = 0; i < len; data++, i++)
		hash = ((hash << 5) + hash) + (*data);


	return hash & 0xFFFF;
}

static index_t hash_to_index(fingerprint_t fp)
{
	hash_t hash = djb_hash((uint8_t *)&fp, sizeof(fingerprint_t));
	return hash & (NUM_BUCKETS - 1); // NUM_BUCKETS must be power of 2
}

static fingerprint_t hash_to_fingerprint(value_t key)
{
	return djb_hash((uint8_t *)&key, sizeof(value_t));
}

void task_init()
{
#ifdef LOGIC
	// Out high
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_1);
	// Out low
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
#endif
	PRINTF("start\r\n");
	unsigned i;
	for (i = 0; i < NUM_BUCKETS ; ++i) {
		GV(filter, i) = 0;
	}
	GV(insert_count) = 0;
	GV(lookup_count) = 0;
	GV(inserted_count) = 0;
	GV(member_count) = 0;
	GV(key) = init_key;
	GV(next_task) = TASK_REF(task_insert);
	TRANSITION_TO(task_generate_key);
}

void task_init_array() {
	// privatize index
	PRIV(index);

	LOG("init array start\r\n");
	unsigned i;
	for (i = 0; i < BUFFER_SIZE - 1; ++i) {
		GV(filter, i + _global_index_bak*(BUFFER_SIZE-1)) = 0;
	}
	++GV(index_bak);
	if (GV(index_bak) == NUM_BUCKETS/(BUFFER_SIZE-1)) {
		COMMIT(index);
		TRANSITION_TO(task_generate_key);
	}
	else {
		COMMIT(index);
		TRANSITION_TO(task_init_array);
	}
}

void task_generate_key()
{
	PRIV(key)
	LOG("generate key start\r\n");

	// insert pseufo-random integers, for testing
	// If we use consecutive ints, they hash to consecutive DJB hashes...
	// NOTE: we are not using rand(), to have the sequence available to verify
	// that that are no false negatives (and avoid having to save the values).
	GV(key_bak) = (GV(key_bak) + 1) * 17;
	LOG("generate_key: key: %x\r\n", GV(key_bak));
	COMMIT(key);
	transition_to(GV(next_task));
}

void task_calc_indexes()
{
	GV(fingerprint) = hash_to_fingerprint(GV(key));
	LOG("calc indexes: fingerprint: key %04x fp %04x\r\n", GV(key), GV(fingerprint));

	TRANSITION_TO(task_calc_indexes_index_1);
}

void task_calc_indexes_index_1()
{
	GV(index1) = hash_to_index(GV(key));
	LOG("calc indexes: index1: key %04x idx1 %u\r\n", GV(key), GV(index1));
	TRANSITION_TO(task_calc_indexes_index_2);
}

void task_calc_indexes_index_2()
{
	index_t fp_hash = hash_to_index(GV(fingerprint));
	GV(index2) = GV(index1) ^ fp_hash;

	LOG("calc indexes: index2: fp hash: %04x idx1 %u idx2 %u\r\n",
			fp_hash, GV(index1), GV(index2));
	transition_to(GV(next_task));
}

// This task is redundant.
// Alpaca never needs this but since Chain code had it, leaving it for fair comparison.
void task_insert()
{
	LOG("insert: key %04x\r\n", GV(key));
	GV(next_task) = TASK_REF(task_add);
	TRANSITION_TO(task_calc_indexes);
}

void task_add()
{
	PRIV(index1);
	PRIV(fingerprint);
	// Fingerprint being inserted
	LOG("add: fp %04x\r\n", GV(fingerprint_bak));

	DY_PRIV(filter, _global_index1_bak);
	if (!GV(filter_bak, _global_index1_bak)) {
		LOG("add: filled empty slot at idx1 %u\r\n", GV(index1_bak));

		GV(success) = true;
		GV(filter_bak, _global_index1_bak) = GV(fingerprint_bak);
		DY_COMMIT(filter, _global_index1_bak);

		COMMIT(index1);
		COMMIT(fingerprint);
		TRANSITION_TO(task_insert_done);
	} else {
		DY_PRIV(filter, _global_index2);
		if (!GV(filter_bak, _global_index2)) {
			LOG("add: filled empty slot at idx2 %u\r\n", GV(index2));

			GV(success) = true;
			GV(filter_bak, _global_index2) = GV(fingerprint_bak);
			DY_COMMIT(filter, _global_index2);

			COMMIT(index1);
			COMMIT(fingerprint);
			TRANSITION_TO(task_insert_done);
		} else { // evict one of the two entries
			fingerprint_t fp_victim;
			index_t index_victim;

			if (rand() % 2) {
				index_victim = GV(index1_bak);
				DY_PRIV(filter, _global_index1_bak);
				fp_victim = GV(filter_bak, _global_index1_bak);
			} else {
				index_victim = GV(index2);
				DY_PRIV(filter, _global_index2);
				fp_victim = GV(filter_bak, _global_index2);
			}

			LOG("add: evict [%u] = %04x\r\n", index_victim, fp_victim);

			// Evict the victim
			GV(filter_bak, index_victim) = GV(fingerprint_bak);
			DY_COMMIT(filter, index_victim);

			GV(index1_bak) = index_victim;
			GV(fingerprint_bak) = fp_victim;
			GV(relocation_count) = 0;

			COMMIT(index1);
			COMMIT(fingerprint);
			TRANSITION_TO(task_relocate);
		}
	}
}

void task_relocate()
{
	PRIV(fingerprint);
	PRIV(index1);
	PRIV(relocation_count);

	fingerprint_t fp_victim = GV(fingerprint_bak);
	index_t fp_hash_victim = hash_to_index(fp_victim);
	index_t index2_victim = GV(index1_bak) ^ fp_hash_victim;

	LOG("victim: %04x\r\n", fp_victim);
	LOG("relocate: victim fp hash %04x idx1 %u idx2 %u\r\n",
			fp_hash_victim, GV(index1_bak), index2_victim);

	DY_PRIV(filter, index2_victim);
	if (!GV(filter_bak, index2_victim)) { // slot was free
		GV(success) = true;
		GV(filter_bak, index2_victim) = fp_victim;
		DY_COMMIT(filter, index2_victim);

		COMMIT(fingerprint);
		COMMIT(index1);
		COMMIT(relocation_count);
		TRANSITION_TO(task_insert_done);
	} else { // slot was occupied, rellocate the next victim

		LOG("relocate: relocs %u\r\n", GV(relocation_count_bak));

		if (GV(relocation_count_bak) >= MAX_RELOCATIONS) { // insert failed
			PRINTF("relocate: max relocs reached: %u\r\n", GV(relocation_count_bak));
			GV(success) = false;
			COMMIT(fingerprint);
			COMMIT(index1);
			COMMIT(relocation_count);
			TRANSITION_TO(task_insert_done);
		}

		++GV(relocation_count_bak);
		GV(index1_bak) = index2_victim;

		DY_PRIV(filter, index2_victim);
		GV(fingerprint_bak) = GV(filter_bak, index2_victim);
		GV(filter_bak, index2_victim) = fp_victim;
		DY_COMMIT(filter, index2_victim);

		COMMIT(fingerprint);
		COMMIT(index1);
		COMMIT(relocation_count);
		TRANSITION_TO(task_relocate);
	}
}

void task_insert_done()
{
	PRIV(insert_count);
	PRIV(inserted_count);

	++GV(insert_count_bak);
	GV(inserted_count_bak) += GV(success);

	LOG("insert done: insert %u inserted %u\r\n", GV(insert_count_bak), GV(inserted_count_bak));

	unsigned i;
	BLOCK_LOG_BEGIN();
	for (i = 0; i < NUM_BUCKETS; ++i) {
		BLOCK_LOG("%04x ", _global_filter[i]);
		if (i > 0 && (i + 1) % 8 == 0)
			BLOCK_LOG("\r\n");
	}
	BLOCK_LOG_END();

	if (GV(insert_count_bak) < NUM_INSERTS) {
		GV(next_task) = TASK_REF(task_insert);

		COMMIT(insert_count);
		COMMIT(inserted_count);
		TRANSITION_TO(task_generate_key);
	} else {
		GV(next_task) = TASK_REF(task_lookup);
		GV(key) = init_key;

		COMMIT(insert_count);
		COMMIT(inserted_count);
		TRANSITION_TO(task_generate_key);
	}
}

void task_lookup()
{
	LOG("lookup: key %04x\r\n", GV(key));
	GV(next_task) = TASK_REF(task_lookup_search);
	TRANSITION_TO(task_calc_indexes);
}

void task_lookup_search()
{
	LOG("lookup search: fp %04x idx1 %u idx2 %u\r\n", GV(fingerprint), GV(index1), GV(index2));
	LOG("lookup search: fp1 %04x\r\n", GV(filter, _global_index1));

	if (GV(filter, _global_index1) == GV(fingerprint)) {
		GV(member) = true;
	} else {
		LOG("lookup search: fp2 %04x\r\n", GV(filter, _global_index2));

		if (GV(filter, _global_index2) == GV(fingerprint)) {
			GV(member) = true;
		}
		else {
			GV(member) = false;
		}
	}

	LOG("lookup search: fp %04x member %u\r\n", GV(fingerprint), GV(member));

	if (!GV(member)) {
		PRINTF("lookup: key %04x not member\r\n", GV(fingerprint));
	}

	TRANSITION_TO(task_lookup_done);
}

void task_lookup_done()
{
	PRIV(lookup_count);
	PRIV(member_count);

	++GV(lookup_count_bak);

	GV(member_count_bak) += GV(member);
	LOG("lookup done: lookups %u members %u\r\n", GV(lookup_count_bak), GV(member_count_bak));

	if (GV(lookup_count_bak) < NUM_LOOKUPS) {
		GV(next_task) = TASK_REF(task_lookup);

		COMMIT(lookup_count);
		COMMIT(member_count);
		TRANSITION_TO(task_generate_key);
	} else {
		COMMIT(lookup_count);
		COMMIT(member_count);
		TRANSITION_TO(task_print_stats);
	}
}

void task_print_stats()
{
	unsigned i;
	//
	PRINTF("end\r\n");
	//PRINTF("TIME end is 65536*%u+%u\r\n",overflow,(unsigned)TBR);
	//	BLOCK_PRINTF_BEGIN();
	//	BLOCK_PRINTF("filter:\r\n");
	//	for (i = 0; i < NUM_BUCKETS; ++i) {
	//		BLOCK_PRINTF("%04x ", GV(filter, i));
	//		if (i > 0 && (i + 1) % 8 == 0){
	//			BLOCK_PRINTF("\r\n");
	//		}
	//	}
	//	BLOCK_PRINTF_END();
	PRINTF("stats: inserts %u members %u total %u\r\n",
			GV(inserted_count), GV(member_count), NUM_INSERTS);
	TRANSITION_TO(task_done);
}

void task_done()
{
	TRANSITION_TO(task_init);
}
static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

void init()
{
	init_hw();

#ifdef CONFIG_EDB
	edb_init();
#endif

	INIT_CONSOLE();

	__enable_interrupt();

#ifdef LOGIC
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_2);

	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
	GPIO(PORT_AUX3, OUT) &= ~BIT(PIN_AUX_3);
	// Output enabled
	GPIO(PORT_AUX, DIR) |= BIT(PIN_AUX_1);
	GPIO(PORT_AUX, DIR) |= BIT(PIN_AUX_2);
	GPIO(PORT_AUX3, DIR) |= BIT(PIN_AUX_3);
	//
	// Out high
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_2);
	// Out low
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_2);
#endif

	PRINTF(".%u.\r\n", curctx->task->idx);
}

ENTRY_TASK(task_init)
INIT_FUNC(init)
