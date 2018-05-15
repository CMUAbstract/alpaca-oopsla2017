#include <stdio.h>

#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include <libwispbase/wisp-base.h>
#include <libalpaca/alpaca.h>
#include <libmspbuiltins/builtins.h>
#ifdef LOGIC
#define LOG(...)
#define PRINTF(...)
#define EIF_PRINTF(...)
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

// timer for measuring performance

#define NUM_INSERTS (NUM_BUCKETS / 4) // shoot for 25% occupancy
#define NUM_LOOKUPS NUM_INSERTS
#define NUM_BUCKETS 128 // must be a power of 2
#define MAX_RELOCATIONS 8
#define BUFFER_SIZE 32

__attribute__((interrupt(51))) 
	void TimerB1_ISR(void){
		PMMCTL0 = PMMPW | PMMSWPOR;
		TBCTL |= TBCLR;
	}
__attribute__((section("__interrupt_vector_timer0_b1"),aligned(2)))
void(*__vector_timer0_b1)(void) = TimerB1_ISR;

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

TASK(task_init)
TASK(task_generate_key)
TASK(task_insert)
TASK(task_calc_indexes)
TASK(task_calc_indexes_index_1)
TASK(task_calc_indexes_index_2)
TASK(task_add) // TODO: rename: add 'insert' prefix
TASK(task_relocate)
TASK(task_insert_done)
TASK(task_lookup)
TASK(task_lookup_search)
TASK(task_lookup_done)
TASK(task_print_stats)
TASK(task_done)
TASK(task_init_array)
TASK(task_init_loop)

GLOBAL_SB(fingerprint_t, filter, NUM_BUCKETS);
GLOBAL_SB(index_t, index);
GLOBAL_SB(value_t, key);
GLOBAL_SB(task_func_t*, next_task);
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
GLOBAL_SB(unsigned, loop_idx);

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
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_1);
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
	GV(loop_idx) = 0;
	TRANSITION_TO(task_init_loop);
}

void task_init_loop()
{
	unsigned i;
	for (i = 0; i < NUM_BUCKETS ; ++i) {
		GV(filter, i) = 0;
	}
	GV(insert_count) = 0;
	GV(lookup_count) = 0;
	GV(inserted_count) = 0;
	GV(member_count) = 0;
	GV(key) = init_key;
	GV(next_task) = &(task_insert);
	LOG("init end!!\r\n");
	TRANSITION_TO(task_generate_key);
}
void task_init_array() {
	LOG("init array start\r\n");
	unsigned i;
	for (i = 0; i < BUFFER_SIZE - 1; ++i) {
		GV(filter, i + _global_index*(BUFFER_SIZE-1)) = 0;
	}
	++GV(index);
	if (GV(index) == NUM_BUCKETS/(BUFFER_SIZE-1)) {
		TRANSITION_TO(task_generate_key);
	}
	else {
		TRANSITION_TO(task_init_array);
	}
}
void task_generate_key()
{
	LOG("generate key start\r\n");

	// insert pseufo-random integers, for testing
	// If we use consecutive ints, they hash to consecutive DJB hashes...
	// NOTE: we are not using rand(), to have the sequence available to verify
	// that that are no false negatives (and avoid having to save the values).
	GV(key) = (GV(key) + 1) * 17;
	LOG("generate_key: key: %x\r\n", GV(key));
	TRANSITION_TO(*GV(next_task));
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
	TRANSITION_TO(*GV(next_task));
}

// This task is redundant.
// Alpaca never needs this but since Chain code had it, leaving it for fair comparison.
void task_insert()
{
	LOG("insert: key %04x\r\n", GV(key));
	GV(next_task) = &(task_add);
	TRANSITION_TO(task_calc_indexes);
}

void task_add()
{
	// Fingerprint being inserted
	LOG("add: fp %04x\r\n", GV(fingerprint));

	// index1,fp1 and index2,fp2 are the two alternative buckets
	LOG("add: idx1 %u fp1 %04x\r\n", GV(index1), GV(filter, _global_index1));

	if (!GV(filter, _global_index1)) {
		LOG("add: filled empty slot at idx1 %u\r\n", GV(index1));

		GV(success) = true;
		GV(filter, _global_index1) = GV(fingerprint);
		TRANSITION_TO(task_insert_done);
	} else {
		LOG("add: fp2 %04x\r\n", GV(filter, _global_index2));
		if (!GV(filter, _global_index2)) {
			LOG("add: filled empty slot at idx2 %u\r\n", GV(index2));

			GV(success) = true;
			GV(filter, _global_index2) = GV(fingerprint);
			TRANSITION_TO(task_insert_done);
		} else { // evict one of the two entries
			fingerprint_t fp_victim;
			index_t index_victim;

			if (rand() % 2) {
				index_victim = GV(index1);
				fp_victim = GV(filter, _global_index1);
			} else {
				index_victim = GV(index2);
				fp_victim = GV(filter, _global_index2);
			}

			LOG("add: evict [%u] = %04x\r\n", index_victim, fp_victim);

			// Evict the victim
			GV(filter, index_victim) = GV(fingerprint);
			GV(index1) = index_victim;
			GV(fingerprint) = fp_victim;
			GV(relocation_count) = 0;

			TRANSITION_TO(task_relocate);
		}
	}
}

void task_relocate()
{
	fingerprint_t fp_victim = GV(fingerprint);
	index_t fp_hash_victim = hash_to_index(fp_victim);
	index_t index2_victim = GV(index1) ^ fp_hash_victim;

	LOG("relocate: victim fp hash %04x idx1 %u idx2 %u\r\n",
			fp_hash_victim, GV(index1), index2_victim);

	LOG("relocate: next victim fp %04x\r\n", GV(filter, index2_victim));


	if (!GV(filter, index2_victim)) { // slot was free
		GV(success) = true;
		GV(filter, index2_victim) = fp_victim;
		TRANSITION_TO(task_insert_done);
	} else { // slot was occupied, rellocate the next victim

		LOG("relocate: relocs %u\r\n", GV(relocation_count));

		if (GV(relocation_count) >= MAX_RELOCATIONS) { // insert failed
			PRINTF("relocate: max relocs reached: %u\r\n", GV(relocation_count));
			GV(success) = false;
			TRANSITION_TO(task_insert_done);
		}

		++GV(relocation_count);
		GV(index1) = index2_victim;
		GV(fingerprint) = GV(filter, index2_victim);
		GV(filter, index2_victim) = fp_victim;
		TRANSITION_TO(task_relocate);
	}
}

void task_insert_done()
{
#if VERBOSE > 0
	unsigned i;

	LOG("insert done: filter:\r\n");
	for (i = 0; i < NUM_BUCKETS; ++i) {

		LOG("%04x ", GV(filter, i));
		if (i > 0 && (i + 1) % 8 == 0)
			LOG("\r\n");
	}
	LOG("\r\n");
#endif

	++GV(insert_count);
	GV(inserted_count) += GV(success);

	LOG("insert done: insert %u inserted %u\r\n", GV(insert_count), GV(inserted_count));

	if (GV(insert_count) < NUM_INSERTS) {
		GV(next_task) = &(task_insert);
		TRANSITION_TO(task_generate_key);
	} else {
		GV(next_task) = &(task_lookup);
		GV(key) = init_key;
		TRANSITION_TO(task_generate_key);
	}
}

void task_lookup()
{
	LOG("lookup: key %04x\r\n", GV(key));
	GV(next_task) = &(task_lookup_search);
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
	++GV(lookup_count);

	GV(member_count) += GV(member);
	LOG("lookup done: lookups %u members %u\r\n", GV(lookup_count), GV(member_count));

	if (GV(lookup_count) < NUM_LOOKUPS) {
		GV(next_task) = &(task_lookup);
		TRANSITION_TO(task_generate_key);
	} else {
		TRANSITION_TO(task_print_stats);
	}
}

void task_print_stats()
{
	unsigned i;

	//BLOCK_PRINTF_BEGIN();
	//BLOCK_PRINTF("filter:\r\n");
	//for (i = 0; i < NUM_BUCKETS; ++i) {
	//	BLOCK_PRINTF("%04x ", GV(filter, i));
	//	if (i > 0 && (i + 1) % 8 == 0){
	//		BLOCK_PRINTF("\r\n");
	//	}
	//}
	//BLOCK_PRINTF_END();
	PRINTF("stats: inserts %u members %u total %u\r\n",
			GV(inserted_count), GV(member_count), NUM_INSERTS);
	TRANSITION_TO(task_done);
}

void task_done()
{
//	count++;
//	if(count == 5){
//		count = 0;
//	}
	GV(loop_idx)++;
	if (GV(loop_idx) < 5) {
		TRANSITION_TO(task_init_loop);
	}
	else {
		GPIO(PORT_AUX3, OUT) |= BIT(PIN_AUX_3);
		GPIO(PORT_AUX3, OUT) &= ~BIT(PIN_AUX_3);
		TRANSITION_TO(task_init);
	}
}
static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

void init()
{
	BITSET(TBCCTL1 , CCIE);
	TBCCR1 = 40;
	BITSET(TBCTL , (TBSSEL_1 | ID_3 | MC_2 | TBCLR));

	// set timer for measuring time
	//	*timer &= ~(0x0020); //set bit 5 to zero(halt!)
	init_hw();

	INIT_CONSOLE();

	__enable_interrupt();
#ifdef LOGIC
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_2);
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
	GPIO(PORT_AUX3, OUT) &= ~BIT(PIN_AUX_3);

	GPIO(PORT_AUX, DIR) |= BIT(PIN_AUX_2);
	GPIO(PORT_AUX, DIR) |= BIT(PIN_AUX_1);
	GPIO(PORT_AUX3, DIR) |= BIT(PIN_AUX_3);
#ifdef OVERHEAD
	// When timing overhead, pin 2 is on for
	// region of interest
#else
	// elsewise, pin2 is toggled on boot
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_2);
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_2);
#endif
#endif
	PRINTF(".%x.\r\n", curctx->task);
}

	ENTRY_TASK(task_init)
INIT_FUNC(init)
