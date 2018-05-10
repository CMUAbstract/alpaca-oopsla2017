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
#define TEST_SAMPLE_DATA

/* This is for progress reporting only */
#define SET_CURTASK(t) curtask = t

#define TASK_MAIN                   0
#define TASK_INIT_DICT              1
#define TASK_COMPRESS               2
#define TASK_SAMPLE                 3
#define TASK_FIND_CHILD             4
#define TASK_FIND_SIBLING           5
#define TASK_ADD_NODE               6
#define TASK_ADD_NODE_INIT          7
#define TASK_ADD_NODE_FIND_LAST     8
#define TASK_ADD_NODE_LINK_SIBLING  9
#define TASK_ADD_NODE_LINK_CHILD   10
#define TASK_APPEND_COMPRESSED     11
#define TASK_PRINT                 12

#ifdef DINO

#define TASK_BOUNDARY(t) \
        DINO_TASK_BOUNDARY(NULL); \
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

#define TASK_BOUNDARY(t) SET_CURTASK(t)

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

#define NIL 0 // like NULL, but for indexes, not real pointers

#define DICT_SIZE         512
#define BLOCK_SIZE         64

#define NUM_LETTERS_IN_SAMPLE        2
#define LETTER_MASK             0x00FF
#define LETTER_SIZE_BITS             8
#define NUM_LETTERS (LETTER_MASK + 1)
typedef unsigned index_t;
typedef unsigned letter_t;
typedef unsigned sample_t;

// NOTE: can't use pointers, since need to ChSync, etc
typedef struct _node_t {
    letter_t letter; // 'letter' of the alphabet
    index_t sibling; // this node is a member of the parent's children list
    index_t child;   // link-list of children
} node_t;

typedef struct _dict_t {
    node_t nodes[DICT_SIZE];
    unsigned node_count;
} dict_t;

typedef struct _log_t {
    index_t data[BLOCK_SIZE];
    unsigned count;
    unsigned sample_count;
} log_t;
static __nv unsigned curtask;
void print_log(log_t *log)
{
	PRINTF("rate: samples/block: %u/%u\r\n",
			log->sample_count, log->count);
	//unsigned i;
	//BLOCK_PRINTF_BEGIN();
	//BLOCK_PRINTF("rate: samples/block: %u/%u\r\n",
	//		log->sample_count, log->count);
	//BLOCK_PRINTF("compressed block:\r\n");
	//for (i = 0; i < log->count; ++i) {
	//	BLOCK_PRINTF("%04x ", log->data[i]);
	//	if (i > 0 && ((i + 1) & (8 - 1)) == 0){
	//	}
	//	BLOCK_PRINTF("\r\n");
	//}
	//if ((log->count & (8 - 1)) != 0){
	//}
	//BLOCK_PRINTF("\r\n");
	//BLOCK_PRINTF_END();
}

static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}
static sample_t acquire_sample(letter_t prev_sample)
{
	//letter_t sample = rand() & 0x0F;
	letter_t sample = (prev_sample + 1) & 0x03;
	return sample;
}

void init_dict(dict_t *dict)
{
	letter_t l;

	LOG("init dict\r\n");
	dict->node_count = 0;

	for (l = 0; l < NUM_LETTERS; ++l) {
		DINO_MANUAL_VERSION_VAL(unsigned, dict->node_count, dict_node_count);
		TASK_BOUNDARY(TASK_INIT_DICT);
		DINO_MANUAL_RESTORE_VAL(dict->node_count, dict_node_count);

		curtask = l; // HACK for progress display

		node_t *node = &dict->nodes[l];
		node->letter = l;
		node->sibling = 0;
		node->child = 0;

		dict->node_count++;
		LOG("init dict: node count %u\r\n", dict->node_count);
	}
}

index_t find_child(letter_t letter, index_t parent, dict_t *dict)
{
	TASK_BOUNDARY(TASK_FIND_CHILD);
	DINO_MANUAL_RESTORE_NONE();

	node_t *parent_node = &dict->nodes[parent];

	LOG("find child: l %u p %u c %u\r\n", letter, parent, parent_node->child);

	if (parent_node->child == NIL) {
		LOG("find child: not found (no children)\r\n");
		return NIL;
	}

	index_t sibling = parent_node->child;
	while (sibling != NIL) {

		TASK_BOUNDARY(TASK_FIND_SIBLING);
		DINO_MANUAL_RESTORE_NONE();

		node_t *sibling_node = &dict->nodes[sibling];

		LOG("find child: l %u, s %u l %u s %u\r\n", letter,
				sibling, sibling_node->letter, sibling_node->sibling);

		if (sibling_node->letter == letter) { // found
			LOG("find child: found %u\r\n", sibling);
			return sibling;
		} else {
			sibling = sibling_node->sibling;
		}
	}

	LOG("find child: not found (no match)\r\n");
	return NIL; 
}

void add_node(letter_t letter, index_t parent, dict_t *dict)
{
	TASK_BOUNDARY(TASK_ADD_NODE);
	DINO_MANUAL_RESTORE_NONE();

	if (dict->node_count == DICT_SIZE) {
		PRINTF("add node: table full\r\n");
		while(1); // bail for now
	}

	DINO_MANUAL_VERSION_VAL(unsigned, dict->node_count, dict_node_count);
	TASK_BOUNDARY(TASK_ADD_NODE_INIT);
	DINO_MANUAL_RESTORE_VAL(dict->node_count, dict_node_count);
	// Initialize the new node
	node_t *node = &dict->nodes[dict->node_count];

	node->letter = letter;
	node->sibling = NIL;
	node->child = NIL;

	index_t node_index = dict->node_count++;

	index_t child = dict->nodes[parent].child;

	LOG("add node: i %u l %u, p: %u pc %u\r\n",
			node_index, letter, parent, child);

	if (child) {
		LOG("add node: is sibling\r\n");

		// Find the last sibling in list
		index_t sibling = child;
		node_t *sibling_node = &dict->nodes[sibling];
		while (sibling_node->sibling != NIL) {

			TASK_BOUNDARY(TASK_ADD_NODE_FIND_LAST);
			DINO_MANUAL_RESTORE_NONE();

			LOG("add node: sibling %u, l %u s %u\r\n",
					sibling, letter, sibling_node->sibling);
			sibling = sibling_node->sibling;
			sibling_node = &dict->nodes[sibling];
		}

		TASK_BOUNDARY(TASK_ADD_NODE_LINK_SIBLING);
		DINO_MANUAL_RESTORE_NONE();

		// Link-in the new node
		LOG("add node: last sibling %u\r\n", sibling);
		dict->nodes[sibling].sibling = node_index;
	} else {
		TASK_BOUNDARY(TASK_ADD_NODE_LINK_CHILD);
		DINO_MANUAL_RESTORE_NONE();

		LOG("add node: is only child\r\n");
		dict->nodes[parent].child = node_index;
	}
}

void append_compressed(index_t parent, log_t *log)
{
	DINO_MANUAL_VERSION_VAL(unsigned, log->count, log_count);
	TASK_BOUNDARY(TASK_APPEND_COMPRESSED);
	DINO_MANUAL_RESTORE_VAL(log->count, log_count);

	LOG("append comp: p %u cnt %u\r\n", parent, log->count);
	log->data[log->count++] = parent;
}

void init()
{
	init_hw();

	INIT_CONSOLE();

	__enable_interrupt();

	EIF_PRINTF(".%u.\r\n", curtask);
}

int main()
{
	init();
	// Mementos can't handle globals: it restores them to .data, when they are
	// in .bss... So, for now, just keep all data on stack.
	static __nv dict_t dict;
	static __nv log_t log;
	//	test_func();
	DINO_RESTORE_CHECK(); 

	TASK_BOUNDARY(TASK_MAIN);
	DINO_MANUAL_RESTORE_NONE();
	while (1) {
		init_dict(&dict);

		// Initialize the pointer into the dictionary to one of the root nodes
		// Assume all streams start with a fixed prefix ('0'), to avoid having
		// to letterize this out-of-band sample.
		letter_t letter = 0;

		unsigned letter_idx = 0;
		index_t parent, child;
		sample_t sample, prev_sample = 0;

		log.sample_count = 1; // count the initial sample (see above)
		log.count = 0; // init compressed counter

		while (1) {
			TASK_BOUNDARY(TASK_COMPRESS);
			DINO_MANUAL_RESTORE_NONE();

			child = (index_t)letter; // relyes on initialization of dict
			LOG("compress: parent %u\r\n", child); // naming is odd due to loop


			if (letter_idx == 0) {
				sample = acquire_sample(prev_sample);
				prev_sample = sample;
			}

			LOG("letter index: %u\r\n", letter_idx);
			letter_idx++;
			if (letter_idx == NUM_LETTERS_IN_SAMPLE)
				letter_idx = 0;
			do {
				DINO_MANUAL_VERSION_VAL(unsigned, log.sample_count, log_sample_count);
				TASK_BOUNDARY(TASK_MAIN);
				DINO_MANUAL_RESTORE_VAL(log.sample_count, log_sample_count);

				unsigned letter_idx_tmp = (letter_idx == 0) ? NUM_LETTERS_IN_SAMPLE : letter_idx - 1; 

				unsigned letter_shift = LETTER_SIZE_BITS * letter_idx_tmp;
				letter = (sample & (LETTER_MASK << letter_shift)) >> letter_shift;
				LOG("letterize: sample %x letter %x (%u)\r\n",
						sample, letter, letter);

				log.sample_count++;
				parent = child;
				child = find_child(letter, parent, &dict);
			} while (child != NIL);

			append_compressed(parent, &log);
			add_node(letter, parent, &dict);

			if (log.count == BLOCK_SIZE) {

				TASK_BOUNDARY(TASK_PRINT);
				DINO_MANUAL_RESTORE_NONE();
				print_log(&log);
				log.count = 0;
				log.sample_count = 0;
				break;
			}
		}
	}
	return 0;
}
