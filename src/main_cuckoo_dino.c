#include <msp430.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include <libmspbuiltins/builtins.h>
#include <libio/log.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>
#include <libmspmath/msp-math.h>

#ifdef CONFIG_EDB
#include <libedb/edb.h>
#else
#define ENERGY_GUARD_BEGIN()
#define ENERGY_GUARD_END()
#endif

#ifdef DINO
#include <libdino/dino.h>
#endif

#include "pins.h"

// #define SHOW_PROGRESS_ON_LED
#include <stdint.h>

//#define NUM_BUCKETS 256 // must be a power of 2
#define NUM_BUCKETS 128 // must be a power of 2
//#define NUM_BUCKETS 64 // must be a power of 2
#define MAX_RELOCATIONS 8

typedef uint16_t value_t;
typedef uint16_t hash_t;
typedef uint16_t fingerprint_t;
typedef uint16_t index_t; // bucket index

#define NUM_KEYS (NUM_BUCKETS / 4) // shoot for 25% occupancy
#define INIT_KEY 0x1

/* This is for progress reporting only */
#define SET_CURTASK(t) curtask = t

#define TASK_MAIN                   1
#define TASK_GENERATE_KEY           2
#define TASK_INSERT_FINGERPRINT     3
#define TASK_INSERT_INDEX_1         4
#define TASK_INSERT_INDEX_2         5
#define TASK_INSERT_UPDATE          6
#define TASK_RELOCATE_VICTIM        7
#define TASK_RELOCATE_UPDATE        8
#define TASK_LOOKUP_FINGERPRINT     9
#define TASK_LOOKUP_INDEX_1        10
#define TASK_LOOKUP_INDEX_2        11
#define TASK_LOOKUP_CHECK          12
#define TASK_PRINT_RESULTS         13

#ifdef DINO

#define TASK_BOUNDARY(t, x) \
        DINO_TASK_BOUNDARY(x); \
        SET_CURTASK(t); \

#define DINO_MANUAL_RESTORE_NONE() \
        DINO_MANUAL_REVERT_BEGIN() \
        DINO_MANUAL_REVERT_END() \

#define DINO_MANUAL_RESTORE_PTR(nm, type) \
        DINO_MANUAL_REVERT_BEGIN() \
        DINO_MANUAL_REVERT_PTR(type, nm); \
        DINO_MANUAL_REVERT_END() \

#define DINO_MANUAL_RESTORE_VAL(nm, label) \
        DINO_MANUAL_REVERT_BEGIN() \
        DINO_MANUAL_REVERT_VAL(nm, label); \
        DINO_MANUAL_REVERT_END() \

#else // !DINO

#define TASK_BOUNDARY(t, x) SET_CURTASK(t)

#define DINO_RESTORE_CHECK()
#define DINO_MANUAL_VERSION_PTR(...)
#define DINO_MANUAL_VERSION_VAL(...)
#define DINO_MANUAL_RESTORE_NONE()
#define DINO_MANUAL_RESTORE_PTR(...)
#define DINO_MANUAL_RESTORE_VAL(...)
#define DINO_MANUAL_REVERT_BEGIN(...)
#define DINO_MANUAL_REVERT_END(...)
#define DINO_MANUAL_REVERT_VAL(...)

#endif // !DINO
static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}
void print_filter(fingerprint_t *filter)
{
    unsigned i;
	BLOCK_PRINTF_BEGIN();
	for (i = 0; i < NUM_BUCKETS; ++i) {
		BLOCK_PRINTF("%04x ", filter[i]);
		if (i > 0 && (i + 1) % 8 == 0){
			BLOCK_PRINTF("\r\n");
		}
	}
	BLOCK_PRINTF_END();
}

void log_filter(fingerprint_t *filter)
{
	unsigned i;
	BLOCK_LOG_BEGIN();
	for (i = 0; i < NUM_BUCKETS; ++i) {
		BLOCK_LOG("%04x ", filter[i]);
		if (i > 0 && (i + 1) % 8 == 0)
			BLOCK_LOG("\r\n");
	}
	BLOCK_LOG_END();
}

// TODO: to avoid having to wrap every thing printf macro (to prevent
// a mementos checkpoint in the middle of it, which could be in the
// middle of an EDB energy guard), make printf functions in libio
// and exclude libio from Mementos passes
void print_stats(unsigned inserts, unsigned members, unsigned total)
{
	PRINTF("stats: inserts %u members %u total %u\r\n",
			inserts, members, total);
}

static __nv unsigned curtask;

static hash_t djb_hash(uint8_t* data, unsigned len)
{
	uint32_t hash = 5381;
	unsigned int i;

	for(i = 0; i < len; data++, i++)
		hash = ((hash << 5) + hash) + (*data);

	return hash & 0xFFFF;
}

static index_t hash_fp_to_index(fingerprint_t fp)
{
	hash_t hash = djb_hash((uint8_t *)&fp, sizeof(fingerprint_t));
	return hash & (NUM_BUCKETS - 1); // NUM_BUCKETS must be power of 2
}

static index_t hash_key_to_index(value_t fp)
{
	hash_t hash = djb_hash((uint8_t *)&fp, sizeof(value_t));
	return hash & (NUM_BUCKETS - 1); // NUM_BUCKETS must be power of 2
}

static fingerprint_t hash_to_fingerprint(value_t key)
{
	return djb_hash((uint8_t *)&key, sizeof(value_t));
}

static value_t generate_key(value_t prev_key)
{
	TASK_BOUNDARY(TASK_GENERATE_KEY, NULL);
	DINO_MANUAL_RESTORE_NONE();

	// insert pseufo-random integers, for testing
	// If we use consecutive ints, they hash to consecutive DJB hashes...
	// NOTE: we are not using rand(), to have the sequence available to verify
	// that that are no false negatives (and avoid having to save the values).
	return (prev_key + 1) * 17;
}

static bool insert(fingerprint_t *filter, value_t key)
{
	fingerprint_t fp1, fp2, fp_victim, fp_next_victim;
	index_t index_victim, fp_hash_victim;
	unsigned relocation_count = 0;

	TASK_BOUNDARY(TASK_INSERT_FINGERPRINT, NULL);
	DINO_MANUAL_RESTORE_NONE();

	fingerprint_t fp = hash_to_fingerprint(key);

	TASK_BOUNDARY(TASK_INSERT_INDEX_1, NULL);
	DINO_MANUAL_RESTORE_NONE();

	index_t index1 = hash_key_to_index(key);

	TASK_BOUNDARY(TASK_INSERT_INDEX_2, NULL);
	DINO_MANUAL_RESTORE_NONE();

	index_t fp_hash = hash_fp_to_index(fp);
	index_t index2 = index1 ^ fp_hash;

	DINO_MANUAL_VERSION_VAL(fingerprint_t, filter[index1], filter_index1);
	DINO_MANUAL_VERSION_VAL(fingerprint_t, filter[index2], filter_index2);
	TASK_BOUNDARY(TASK_INSERT_UPDATE, NULL);
	DINO_MANUAL_REVERT_BEGIN();
	DINO_MANUAL_REVERT_VAL(filter[index1], filter_index1);
	DINO_MANUAL_REVERT_VAL(filter[index2], filter_index2);
	DINO_MANUAL_REVERT_END();

	LOG("insert: key %04x fp %04x h %04x i1 %u i2 %u\r\n",
			key, fp, fp_hash, index1, index2);

	fp1 = filter[index1];
	LOG("insert: fp1 %04x\r\n", fp1);
	if (!fp1) { // slot 1 is free
		filter[index1] = fp;
	} else {
		fp2 = filter[index2];
		LOG("insert: fp2 %04x\r\n", fp2);
		if (!fp2) { // slot 2 is free
			filter[index2] = fp;
		} else { // both slots occupied, evict
			if (rand() & 0x80) { // don't use lsb because it's systematic
				index_victim = index1;
				fp_victim = fp1;
			} else {
				index_victim = index2;
				fp_victim = fp2;
			}

			LOG("insert: evict [%u] = %04x\r\n", index_victim, fp_victim);
			filter[index_victim] = fp; // evict victim

			do { // relocate victim(s)
				TASK_BOUNDARY(TASK_RELOCATE_VICTIM, NULL);
				DINO_MANUAL_RESTORE_NONE();

				fp_hash_victim = hash_fp_to_index(fp_victim);
				index_victim = index_victim ^ fp_hash_victim;

				DINO_MANUAL_VERSION_VAL(fingerprint_t, filter[index_victim], filter_victim);
				TASK_BOUNDARY(TASK_RELOCATE_UPDATE, NULL);
				DINO_MANUAL_RESTORE_VAL(filter[index_victim], filter_victim);

				fp_next_victim = filter[index_victim];
				filter[index_victim] = fp_victim;

				LOG("insert: moved %04x to %u; next victim %04x\r\n",
						fp_victim, index_victim, fp_next_victim);

				fp_victim = fp_next_victim;
			} while (fp_victim && ++relocation_count < MAX_RELOCATIONS);

			if (fp_victim) {
				//PRINTF("insert: lost fp %04x\r\n", fp_victim);
				return false;
			}
		}
	}

	return true;
}

static bool lookup(fingerprint_t *filter, value_t key)
{
	TASK_BOUNDARY(TASK_LOOKUP_FINGERPRINT, NULL);
	DINO_MANUAL_RESTORE_NONE();

	fingerprint_t fp = hash_to_fingerprint(key);

	TASK_BOUNDARY(TASK_LOOKUP_INDEX_1, NULL);
	DINO_MANUAL_RESTORE_NONE();

	index_t index1 = hash_key_to_index(key);

	TASK_BOUNDARY(TASK_LOOKUP_INDEX_2, NULL);
	DINO_MANUAL_RESTORE_NONE();

	index_t fp_hash = hash_fp_to_index(fp);
	index_t index2 = index1 ^ fp_hash;

	TASK_BOUNDARY(TASK_LOOKUP_CHECK, NULL);
	DINO_MANUAL_RESTORE_NONE();

	LOG("lookup: key %04x fp %04x h %04x i1 %u i2 %u\r\n",
			key, fp, fp_hash, index1, index2);

	return filter[index1] == fp || filter[index2] == fp;
}
unsigned overflow=0;
__attribute__((interrupt(51))) 
	void TimerB1_ISR(void){
		TBCTL &= ~(0x0002);
		if(TBCTL && 0x0001){
			overflow++;
			TBCTL |= 0x0004;
			TBCTL |= (0x0002);
			TBCTL &= ~(0x0001);	
		}
	}
__attribute__((section("__interrupt_vector_timer0_b1"),aligned(2)))
void(*__vector_timer0_b1)(void) = TimerB1_ISR;

void init()
{
#ifdef BOARD_MSP_TS430
	TBCTL &= 0xE6FF; //set 12,11 bit to zero (16bit) also 8 to zero (SMCLK)
	TBCTL |= 0x0200; //set 9 to one (SMCLK)
	TBCTL |= 0x00C0; //set 7-6 bit to 11 (divider = 8);
	TBCTL &= 0xFFEF; //set bit 4 to zero
	TBCTL |= 0x0020; //set bit 5 to one (5-4=10: continuous mode)
	TBCTL |= 0x0002; //interrupt enable*/
#endif
	init_hw();
#ifdef CONFIG_EDB
	edb_init();
#endif

	INIT_CONSOLE();

	__enable_interrupt();
	EIF_PRINTF(".%u.\r\n", curtask);
}
int main()
{

	unsigned i;
	value_t key;
	// Mementos can't handle globals: it restores them to .data, when they are
	// in .bss... So, for now, just keep all data on stack.
#ifdef MEMENTOS

#ifdef MEMENTOS_NONVOLATILE
	static __nv fingerprint_t filter[NUM_BUCKETS];
#else
	fingerprint_t filter[NUM_BUCKETS];
#endif

	// Can't use C initializer because it gets converted into
	// memset, but the memset linked in by GCC is of the wrong calling
	// convention, but we can't override with our own memset because C runtime
	// calls memset with GCC's calling convention. Catch 22.
#else // !MEMENTOS
	static __nv fingerprint_t filter[NUM_BUCKETS];
#endif // !MEMENTOS


#ifndef MEMENTOS
	init();
#endif

	DINO_RESTORE_CHECK();
	while (1) {
		for (i = 0; i < NUM_BUCKETS; ++i)
			filter[i] = 0;
		TASK_BOUNDARY(TASK_MAIN, NULL);
		DINO_MANUAL_RESTORE_NONE();

		key = INIT_KEY;
		unsigned inserts = 0;
		for (i = 0; i < NUM_KEYS; ++i) {
			key = generate_key(key);
			bool success = insert(filter, key);
			LOG("insert: key %04x success %u\r\n", key, success);
			if (!success)
				//             PRINTF("insert: key %04x failed\r\n", key);
				log_filter(filter);

			inserts += success;

		}
		LOG("inserts/total: %u/%u\r\n", inserts, NUM_KEYS);

		key = INIT_KEY;
		unsigned members = 0;
		for (i = 0; i < NUM_KEYS; ++i) {
			key = generate_key(key);
			bool member = lookup(filter, key);
			LOG("lookup: key %04x member %u\r\n", key, member);
			if (!member) {
				fingerprint_t fp = hash_to_fingerprint(key);
				//PRINTF("lookup: key %04x fp %04x not member\r\n", key, fp);
			}
			members += member;
		}
		LOG("members/total: %u/%u\r\n", members, NUM_KEYS);

		TASK_BOUNDARY(TASK_PRINT_RESULTS, NULL);
		DINO_MANUAL_RESTORE_NONE();

		PRINTF("REAL TIME end is 65536*%u+%u\r\n",overflow,(unsigned)TBR);
		print_filter(filter);
		print_stats(inserts, members, NUM_KEYS);
		exit(0);
	}

	return 0;
}
