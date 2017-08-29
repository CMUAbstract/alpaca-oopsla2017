#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include <libwispbase/wisp-base.h>
#include <libalpaca/alpaca.h>
#include <libmspbuiltins/builtins.h>
#include <libio/log.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>

#ifdef CONFIG_LIBEDB_PRINTF
#include <libedb/edb.h>
#endif

#include "pins.h"

#define NIL 0 // like NULL, but for indexes, not real pointers

#define DICT_SIZE         512
#define BLOCK_SIZE         64

#define NUM_LETTERS_IN_SAMPLE        2
#define LETTER_MASK             0x00FF
#define LETTER_SIZE_BITS             8
#define NUM_LETTERS (LETTER_MASK + 1)

// for timer
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

typedef unsigned index_t;
typedef unsigned letter_t;
typedef unsigned sample_t;
unsigned volatile *timer = &TBCTL;

typedef struct _node_t {
	letter_t letter; // 'letter' of the alphabet
	index_t sibling; // this node is a member of the parent's children list
	index_t child;   // link-list of children
} node_t;

TASK(1, task_init)
TASK(2, task_init_dict)
TASK(3, task_sample)
TASK(4, task_measure_temp)
TASK(5, task_letterize)
TASK(6, task_compress)
TASK(7, task_find_sibling)
TASK(8, task_add_node)
TASK(9, task_add_insert)
TASK(10, task_append_compressed)
TASK(11, task_print)
TASK(12, task_done)

GLOBAL_SB(letter_t, letter);
GLOBAL_SB(unsigned, letter_idx);
GLOBAL_SB(sample_t, prev_sample);
GLOBAL_SB(index_t, out_len);
GLOBAL_SB(index_t, node_count);
GLOBAL_SB(node_t, dict, DICT_SIZE);
GLOBAL_SB(sample_t, sample);
GLOBAL_SB(index_t, sample_count);
GLOBAL_SB(index_t, sibling);
GLOBAL_SB(index_t, child);
GLOBAL_SB(index_t, parent);
GLOBAL_SB(index_t, parent_next);
GLOBAL_SB(node_t, parent_node);
GLOBAL_SB(node_t, compressed_data, BLOCK_SIZE);
GLOBAL_SB(node_t, sibling_node);
GLOBAL_SB(index_t, symbol);

static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

void init()
{
	// only for timers
#ifdef BOARD_MSP_TS430
	*timer &= 0xE6FF; //set 12,11 bit to zero (16bit) also 8 to zero (SMCLK)
	*timer |= 0x0200; //set 9 to one (SMCLK)
	*timer |= 0x00C0; //set 7-6 bit to 11 (divider = 8);
	*timer &= 0xFFEF; //set bit 4 to zero
	*timer |= 0x0020; //set bit 5 to one (5-4=10: continuous mode)
	*timer |= 0x0002; //interrupt enable
//	*timer &= ~(0x0020); //set bit 5 to zero(halt!)
#endif
	init_hw();
#ifdef CONFIG_EDB
	edb_init();
#endif

	INIT_CONSOLE();
	__enable_interrupt();
	PRINTF(".%u.\r\n", curctx->task->idx);
}

static sample_t acquire_sample(letter_t prev_sample)
{
	letter_t sample = (prev_sample + 1) & 0x03;
	return sample;
}

void task_init()
{
	LOG("init\r\n");
	GV(parent_next) = 0;
	LOG("init: start parent %u\r\n", GV(parent));
	GV(out_len) = 0;
	GV(letter) = 0;
	GV(prev_sample) = 0;
	GV(letter_idx) = 0;;
	GV(sample_count) = 1;
	TRANSITION_TO(task_init_dict);
}

void task_init_dict()
{
	LOG("init dict: letter %u\r\n", GV(letter));

	node_t node = {
		.letter = GV(letter),
		.sibling = NIL, // no siblings for 'root' nodes
		.child = NIL, // init an empty list for children
	};
	int i = GV(letter);	
	GV(dict, i) = node; 
	GV(letter)++;
	if (GV(letter) < NUM_LETTERS) {
		TRANSITION_TO(task_init_dict);
	} else {
		GV(node_count) = NUM_LETTERS;
		TRANSITION_TO(task_sample);
	} 
}

void task_sample()
{
	LOG("sample: letter idx %u\r\n", GV(letter_idx));

	unsigned next_letter_idx = GV(letter_idx) + 1;
	if (next_letter_idx == NUM_LETTERS_IN_SAMPLE)
		next_letter_idx = 0;

	if (GV(letter_idx) == 0) {
		GV(letter_idx) = next_letter_idx;
		TRANSITION_TO(task_measure_temp);
	} else {
		GV(letter_idx) = next_letter_idx;
		TRANSITION_TO(task_letterize);
	}
}

void task_measure_temp()
{
	sample_t prev_sample;
	prev_sample = GV(prev_sample);

	sample_t sample = acquire_sample(prev_sample);
	LOG("measure: %u\r\n", sample);
	prev_sample = sample;
	GV(prev_sample) = prev_sample;
	GV(sample) = sample;
	TRANSITION_TO(task_letterize);
}

void task_letterize()
{
	unsigned letter_idx = GV(letter_idx);
	if (letter_idx == 0)
		letter_idx = NUM_LETTERS_IN_SAMPLE;
	else
		letter_idx--;
	unsigned letter_shift = LETTER_SIZE_BITS * letter_idx;
	letter_t letter = (GV(sample) & (LETTER_MASK << letter_shift)) >> letter_shift;

	LOG("letterize: sample %x letter %x (%u)\r\n", GV(sample), letter, letter);

	GV(letter) = letter;
	TRANSITION_TO(task_compress);
}

void task_compress()
{
	node_t parent_node;

	// pointer into the dictionary tree; starts at a root's child
	index_t parent = GV(parent_next);

	LOG("compress: parent %u\r\n", parent);

	parent_node = GV(dict, parent);

	LOG("compress: parent node: l %u s %u c %u\r\n", parent_node.letter, parent_node.sibling, parent_node.child);

	GV(sibling) = parent_node.child;
	GV(parent_node) = parent_node;
	GV(parent) = parent;
	GV(child) = parent_node.child;
	GV(sample_count)++;

	TRANSITION_TO(task_find_sibling);
}

void task_find_sibling()
{
	node_t *sibling_node;

	LOG("find sibling: l %u s %u\r\n", GV(letter), GV(sibling));

	if (GV(sibling) != NIL) {
		int i = GV(sibling);
		sibling_node = &GV(dict,i); 

		LOG("find sibling: l %u, sn: l %u s %u c %u\r\n", GV(letter),
				sibling_node->letter, sibling_node->sibling, sibling_node->child);

		if (sibling_node->letter == GV(letter)) { // found
			LOG("find sibling: found %u\r\n", GV(sibling));

			GV(parent_next) = GV(sibling);

			TRANSITION_TO(task_letterize);
		} else { // continue traversing the siblings
			if(sibling_node->sibling != 0){
				GV(sibling) = sibling_node->sibling;
				TRANSITION_TO(task_find_sibling);
			}
		}

	} 
	LOG("find sibling: not found\r\n");

	index_t starting_node_idx = (index_t)GV(letter);
	GV(parent_next) = starting_node_idx;

	LOG("find sibling: child %u\r\n", GV(child));


	if (GV(child) == NIL) {
		TRANSITION_TO(task_add_insert);
	} else {
		TRANSITION_TO(task_add_node); 
	}
}

void task_add_node()
{
	node_t *sibling_node;

	int i = GV(sibling);
	sibling_node = &GV(dict, i);

	LOG("add node: s %u, sn: l %u s %u c %u\r\n", GV(sibling),
			sibling_node->letter, sibling_node->sibling, sibling_node->child);

	if (sibling_node->sibling != NIL) {
		index_t next_sibling = sibling_node->sibling;
		GV(sibling) = next_sibling;
		TRANSITION_TO(task_add_node);

	} else { // found last sibling in the list

		LOG("add node: found last\r\n");

		node_t sibling_node_obj = *sibling_node;
		GV(sibling_node) = sibling_node_obj;

		TRANSITION_TO(task_add_insert);
	}
}

void task_add_insert()
{
	LOG("add insert: nodes %u\r\n", GV(node_count));

	if (GV(node_count) == DICT_SIZE) { // wipe the table if full
		while (1);
	}
	LOG("add insert: l %u p %u, pn l %u s %u c%u\r\n", GV(letter), GV(parent),
			GV(parent_node).letter, GV(parent_node).sibling, GV(parent_node).child);

	index_t child = GV(node_count);
	node_t child_node = {
		.letter = GV(letter),
		.sibling = NIL,
		.child = NIL,
	};

	if (GV(parent_node).child == NIL) { // the only child
		LOG("add insert: only child\r\n");

		node_t parent_node_obj = GV(parent_node);
		parent_node_obj.child = child;
		int i = GV(parent);
		GV(dict, i) = parent_node_obj;

	} else { // a sibling

		index_t last_sibling = GV(sibling);
		node_t last_sibling_node = GV(sibling_node);                   

		LOG("add insert: sibling %u\r\n", last_sibling);

		last_sibling_node.sibling = child;
		GV(dict, last_sibling) = last_sibling_node;
	}
	GV(dict, child) = child_node;
	GV(symbol) = GV(parent);
	GV(node_count)++;

	TRANSITION_TO(task_append_compressed);
}

void task_append_compressed()
{
	LOG("append comp: sym %u len %u \r\n", GV(symbol), GV(out_len));
	int i = GV(out_len);
	GV(compressed_data, i).letter = GV(symbol);

	if (++GV(out_len) == BLOCK_SIZE) {
		TRANSITION_TO(task_print);
	} else {
		TRANSITION_TO(task_sample);
	}
}

void task_print()
{
	unsigned i;

	PRINTF("TIME end is 65536*%u+%u\r\n",overflow,(unsigned)TBR);
	BLOCK_PRINTF_BEGIN();
	BLOCK_PRINTF("compressed block:\r\n");
	for (i = 0; i < BLOCK_SIZE; ++i) {
		index_t index = GV(compressed_data, i).letter;
		BLOCK_PRINTF("%04x ", index);
		if (i > 0 && (i + 1) % 8 == 0){
			BLOCK_PRINTF("\r\n");
		}
	}
	BLOCK_PRINTF("\r\n");
	BLOCK_PRINTF("rate: samples/block: %u/%u\r\n", GV(sample_count), BLOCK_SIZE);
	BLOCK_PRINTF_END();
	TRANSITION_TO(task_done); 
}

void task_done()
{
	//	TRANSITION_TO(task_init);
}

	ENTRY_TASK(task_init)
INIT_FUNC(init)
