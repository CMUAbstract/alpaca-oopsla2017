#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

#include <libchain/chain.h>
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

#define TEST_SAMPLE_DATA

#define NIL 0 // like NULL, but for indexes, not real pointers

#define DICT_SIZE         512
#define BLOCK_SIZE         64

#if 0 // These are largest Mementos with volatile vars can handle
#define DICT_SIZE         280
#define BLOCK_SIZE         16
#endif

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

struct msg_dict {
    CHAN_FIELD_ARRAY(node_t, dict, DICT_SIZE);
};

struct msg_roots {
    CHAN_FIELD_ARRAY(node_t, dict, NUM_LETTERS); // like, dict, but only with root nodes
};

struct msg_compressed_data {
    CHAN_FIELD_ARRAY(node_t, compressed_data, BLOCK_SIZE);
    CHAN_FIELD(unsigned, sample_count);
};

struct msg_index {
    CHAN_FIELD(index_t, index);
};

struct msg_parent {
    CHAN_FIELD(index_t, parent);
};

struct msg_compress {
    CHAN_FIELD(index_t, parent);
    CHAN_FIELD(unsigned, sample_count);
};

struct msg_sibling {
    CHAN_FIELD(index_t, sibling);
};

struct msg_self_sibling {
    SELF_CHAN_FIELD(index_t, sibling);
};
#define FIELD_INIT_msg_self_sibling {\
    SELF_FIELD_INITIALIZER \
}

struct msg_letter {
    CHAN_FIELD(letter_t, letter);
};

struct msg_self_letter {
    SELF_CHAN_FIELD(index_t, letter);
};
#define FIELD_INIT_msg_self_letter {\
    SELF_FIELD_INITIALIZER \
}

struct msg_parent_node {
    CHAN_FIELD(node_t, parent_node);
};

struct msg_last_sibling {
    CHAN_FIELD(index_t, sibling);
    CHAN_FIELD(node_t, sibling_node);
};

struct msg_child {
    CHAN_FIELD(index_t, child);
};

struct msg_parent_info {
    CHAN_FIELD(index_t, parent);
    CHAN_FIELD(node_t, parent_node);
};

struct msg_node_count {
    CHAN_FIELD(index_t, node_count);
};

struct msg_self_node_count {
    SELF_CHAN_FIELD(index_t, node_count);
};
#define FIELD_INIT_msg_self_node_count {\
    SELF_FIELD_INITIALIZER \
}

struct msg_out_len {
    CHAN_FIELD(index_t, out_len);
};

struct msg_self_out_len {
    SELF_CHAN_FIELD(index_t, out_len);
};
#define FIELD_INIT_msg_self_out_len {\
    SELF_FIELD_INITIALIZER \
}

struct msg_symbol {
    CHAN_FIELD(index_t, symbol);
};

struct msg_sample_count {
    CHAN_FIELD(unsigned, sample_count);
};

struct msg_self_sample_count {
    SELF_CHAN_FIELD(index_t, sample_count);
};
#define FIELD_INIT_msg_self_sample_count {\
    SELF_FIELD_INITIALIZER \
}

struct msg_letter_idx {
    CHAN_FIELD(unsigned, letter_idx);
};

struct msg_self_letter_idx {
    SELF_CHAN_FIELD(unsigned, letter_idx);
};
#define FIELD_INIT_msg_self_letter_idx {\
    SELF_FIELD_INITIALIZER \
}

struct msg_sample {
    CHAN_FIELD(sample_t, sample);
};

#ifdef TEST_SAMPLE_DATA
struct msg_prev_sample {
    CHAN_FIELD(sample_t, prev_sample);
};

struct msg_self_prev_sample {
    SELF_CHAN_FIELD(sample_t, prev_sample);
};
#define FIELD_INIT_msg_self_prev_sample {\
    SELF_FIELD_INITIALIZER \
}
#endif

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

CHANNEL(task_init, task_init_dict, msg_letter);
CHANNEL(task_init, task_sample, msg_letter_idx);
#ifdef TEST_SAMPLE_DATA
CHANNEL(task_init, task_measure_temp, msg_prev_sample);
#endif
CHANNEL(task_init, task_compress, msg_compress);
SELF_CHANNEL(task_init_dict, msg_self_letter);
MULTICAST_CHANNEL(msg_roots, ch_roots, task_init_dict,
                  task_find_sibling, task_add_node);
CHANNEL(task_init, task_append_compressed, msg_out_len);
CHANNEL(task_init_dict, task_add_insert, msg_node_count);
MULTICAST_CHANNEL(msg_dict, ch_dict, task_add_insert,
                  task_compress, task_find_sibling, task_add_node);
SELF_CHANNEL(task_sample, msg_self_letter_idx);
#ifdef TEST_SAMPLE_DATA
SELF_CHANNEL(task_measure_temp, msg_self_prev_sample);
#endif
CHANNEL(task_measure_temp, task_letterize, msg_sample);
CHANNEL(task_sample, task_letterize, msg_letter_idx);
MULTICAST_CHANNEL(msg_letter, ch_letter, task_letterize,
                  task_find_sibling, task_add_insert);
CHANNEL(task_compress, task_add_insert, msg_parent_info);
CHANNEL(task_compress, task_find_sibling, msg_child);
CHANNEL(task_compress, task_append_compressed, msg_sample_count);
//MULTICAST_CHANNEL(msg_parent, ch_parent, task_compress,
//                  task_add_insert, task_append_compressed);
MULTICAST_CHANNEL(msg_sibling, ch_sibling, task_compress,
                  task_find_sibling, task_add_node);
SELF_CHANNEL(task_compress, msg_self_sample_count);
CHANNEL(task_find_sibling, task_compress, msg_parent);
SELF_CHANNEL(task_find_sibling, msg_self_sibling);
SELF_CHANNEL(task_add_node, msg_self_sibling);
CHANNEL(task_add_node, task_add_insert, msg_last_sibling);
SELF_CHANNEL(task_add_insert, msg_self_node_count);
CHANNEL(task_add_insert, task_append_compressed, msg_symbol);
SELF_CHANNEL(task_append_compressed, msg_self_out_len);
CHANNEL(task_append_compressed, task_print, msg_compressed_data);
CHANNEL(task_append_compressed, task_compress, msg_sample_count);
unsigned overflow=0;
//__attribute__((interrupt(TIMERB1_VECTOR))) 
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

static void init_hw()
{
    msp_watchdog_disable();
    msp_gpio_unlock();
    msp_clock_setup();
}
void init()
{
#if BOARD == mspts430
	TBCTL &= 0xE6FF; //set 12,11 bit to zero (16bit) also 8 to zero (SMCLK)
	TBCTL |= 0x0200; //set 9 to one (SMCLK)
	TBCTL |= 0x00C0; //set 7-6 bit to 11 (divider = 8);
	TBCTL &= 0xFFEF; //set bit 4 to zero
	TBCTL |= 0x0020; //set bit 5 to one (5-4=10: continuous mode)
	TBCTL |= 0x0002; //interrupt enable
#endif
	init_hw();

#ifdef CONFIG_EDB
	edb_init(); 
#endif

	INIT_CONSOLE();

	__enable_interrupt();

	EIF_PRINTF(".%u.\r\n", curctx->task->idx);
}

static sample_t acquire_sample(letter_t prev_sample)
{
	//letter_t sample = rand() & 0x0F;
	letter_t sample = (prev_sample + 1) & 0x03;
	return sample;
}

void task_init()
{
	//  TASK_PROLOGUE();
	LOG("init\r\n");

	index_t parent = 0;
	LOG("init: start parent %u\r\n", parent);
	index_t out_len = 0;
	letter_t letter = 0;
	unsigned letter_idx = 0;
	unsigned sample_count = 1; // count the initial sample (see above)
#ifdef TEST_SAMPLE_DATA
	letter_t prev_sample = 0;
#endif

	CHAN_OUT1(index_t, parent, parent, CH(task_init, task_compress));
	CHAN_OUT1(index_t, out_len, out_len, CH(task_init, task_append_compressed));
	CHAN_OUT1(letter_t, letter, letter, CH(task_init, task_init_dict));
#ifdef TEST_SAMPLE_DATA
	CHAN_OUT1(letter_t, prev_sample, prev_sample, CH(task_init, task_measure_temp));
#endif
	CHAN_OUT1(unsigned, letter_idx, letter_idx, CH(task_init, task_sample));
	CHAN_OUT1(unsigned, sample_count, sample_count,
			CH(task_init, task_compress));

	TRANSITION_TO(task_init_dict);
}

void task_init_dict()
{
	letter_t letter = *CHAN_IN2(letter_t, letter,
			CH(task_init, task_init_dict),
			SELF_IN_CH(task_init_dict));

	LOG("init dict: letter %u\r\n", letter);

	node_t node = {
		.letter = letter,
		.sibling = NIL, // no siblings for 'root' nodes
		.child = NIL, // init an empty list for children
	};

	CHAN_OUT1(node_t, dict[letter], node,
			MC_OUT_CH(ch_roots, task_init_dict,
				task_find_sibling, task_add_node));

	letter++;

	if (letter < NUM_LETTERS) {
		CHAN_OUT1(letter_t, letter, letter, SELF_OUT_CH(task_init_dict));
		TRANSITION_TO(task_init_dict);
	} else {
		index_t node_count = NUM_LETTERS;
		CHAN_OUT1(index_t, node_count, node_count, CH(task_init_dict, task_add_insert));

		TRANSITION_TO(task_sample);
	} 
}

void task_sample()
{
	unsigned letter_idx = *CHAN_IN2(unsigned, letter_idx,
			CH(task_init, task_sample),
			SELF_IN_CH(task_sample));
	CHAN_OUT1(unsigned, letter_idx, letter_idx,
			CH(task_sample, task_letterize));

	LOG("sample: letter idx %u\r\n", letter_idx);

	unsigned next_letter_idx = letter_idx + 1;
	if (next_letter_idx == NUM_LETTERS_IN_SAMPLE)
		next_letter_idx = 0;

	CHAN_OUT1(unsigned, letter_idx, next_letter_idx, SELF_OUT_CH(task_sample));

	if (letter_idx == 0) {
		TRANSITION_TO(task_measure_temp);
	} else {
		TRANSITION_TO(task_letterize);
	}
}

void task_measure_temp()
{
	//  TASK_PROLOGUE();

	sample_t prev_sample;

#ifdef TEST_SAMPLE_DATA
	prev_sample = *CHAN_IN2(letter_t, prev_sample,
			CH(task_init, task_measure_temp),
			SELF_IN_CH(task_measure_temp));
#else
	prev_sample = 0;
#endif

	sample_t sample = acquire_sample(prev_sample);
	LOG("measure: %u\r\n", sample);

#ifdef TEST_SAMPLE_DATA
	prev_sample = sample;
	CHAN_OUT1(letter_t, prev_sample, prev_sample, SELF_OUT_CH(task_measure_temp));
#endif

	CHAN_OUT1(sample_t, sample, sample, CH(task_measure_temp, task_letterize));
	TRANSITION_TO(task_letterize);
}

void task_letterize()
{
	sample_t sample = *CHAN_IN1(sample_t, sample,
			CH(task_measure_temp, task_letterize));
	unsigned letter_idx = *CHAN_IN1(unsigned, letter_idx,
			CH(task_sample, task_letterize));

	unsigned letter_shift = LETTER_SIZE_BITS * letter_idx;
	letter_t letter = (sample & (LETTER_MASK << letter_shift)) >> letter_shift;

	LOG("letterize: sample %x letter %x (%u)\r\n", sample, letter, letter);

	CHAN_OUT1(letter_t, letter, letter,
			MC_OUT_CH(ch_letter, task_letterize,
				task_find_sibling, task_add_insert));

	TRANSITION_TO(task_compress);
}

void task_compress()
{
	node_t parent_node;

	// pointer into the dictionary tree; starts at a root's child
	index_t parent = *CHAN_IN2(index_t, parent,
			CH(task_init, task_compress),
			CH(task_find_sibling, task_compress));


	// See notes about this split in task_add_node. It's a memory optimization.
	if (parent < NUM_LETTERS) {
		parent_node = *CHAN_IN2(node_t, dict[parent],
				MC_IN_CH(ch_roots, task_init_dict, task_compress),
				MC_IN_CH(ch_dict, task_add_insert, task_compress));
	} else {
		parent_node = *CHAN_IN1(node_t, dict[parent],
				MC_IN_CH(ch_dict, task_add_insert, task_compress));
	}
	LOG("compress: parent %u\r\n", parent);

	LOG("compress: parent node: l %u s %u c %u\r\n",
			parent_node.letter, parent_node.sibling, parent_node.child);

	CHAN_OUT1(index_t, sibling, parent_node.child,
			MC_OUT_CH(ch_sibling, task_compress,
				task_find_sibling, task_add_node));

	// Send a full node instead of only the index to avoid the need for
	// task_add to channel the dictionary to self and thus avoid
	// duplicating the memory for the dictionary (premature opt?).
	// In summary: instead of self-channeling the whole array, we
	// proxy only one element of the array.
	//
	// NOTE: source of inefficiency: we execute this on every step of traversal
	// over the nodes in the tree, but really need this only for the last one.
	CHAN_OUT1(node_t, parent_node, parent_node,
			CH(task_compress, task_add_insert));
	CHAN_OUT1(index_t, parent, parent,
			CH(task_compress, task_add_insert));

	CHAN_OUT1(index_t, child, parent_node.child, CH(task_compress, task_find_sibling));

	unsigned sample_count = *CHAN_IN3(unsigned, sample_count,
			CH(task_init, task_compress),
			SELF_IN_CH(task_compress),
			CH(task_append_compressed, task_compress)); 
	sample_count++;
	CHAN_OUT2(unsigned, sample_count, sample_count,
			SELF_OUT_CH(task_compress),
			CH(task_compress, task_append_compressed));

	TRANSITION_TO(task_find_sibling);
}

void task_find_sibling()
{
	node_t *sibling_node;

	index_t sibling = *CHAN_IN2(index_t, sibling,
			MC_IN_CH(ch_sibling, task_compress, task_find_sibling),
			SELF_IN_CH(task_find_sibling));

	index_t letter = *CHAN_IN1(letter_t, letter,
			MC_IN_CH(ch_letter, task_letterize,
				task_find_sibling));

	LOG("find sibling: l %u s %u\r\n", letter, sibling);

	if (sibling != NIL) {

		// See comments in task_add_node about this split. It's a memory optimization.
		if (sibling < NUM_LETTERS) {
			sibling_node = CHAN_IN2(node_t, dict[sibling],
					MC_IN_CH(ch_roots, task_init_dict, task_find_sibling),
					MC_IN_CH(ch_dict, task_add_insert, task_find_sibling));
		} else {
			sibling_node = CHAN_IN1(node_t, dict[sibling],
					MC_IN_CH(ch_dict, task_add_insert, task_find_sibling));
		}

		LOG("find sibling: l %u, sn: l %u s %u c %u\r\n", letter,
				sibling_node->letter, sibling_node->sibling, sibling_node->child);

		if (sibling_node->letter == letter) { // found
			LOG("find sibling: found %u\r\n", sibling);
			CHAN_OUT1(index_t, parent, sibling,
					CH(task_find_sibling, task_compress));
			TRANSITION_TO(task_letterize);
		} else { // continue traversing the siblings
			CHAN_OUT1(index_t, sibling, sibling_node->sibling,
					SELF_OUT_CH(task_find_sibling));
			TRANSITION_TO(task_find_sibling);
		}

	} else { // not found in any of the siblings

		LOG("find sibling: not found\r\n");

		// Reset the node pointer into the dictionary tree to point to the
		// root's child corresponding to the letter we are about to insert
		// NOTE: The cast here relies on the fact that root's children are
		// initialized in by inserting them in order of the letter value.
		index_t starting_node_idx = (index_t)letter;
		CHAN_OUT1(index_t, parent, starting_node_idx,
				CH(task_find_sibling, task_compress));

		// Add new node to dictionary tree, and, after that, append the
		// compressed symbol to the result
		//
		index_t child = *CHAN_IN1(index_t, child,
				CH(task_compress, task_find_sibling));
		LOG("find sibling: child %u\r\n", child);
		if (child == NIL) {
			TRANSITION_TO(task_add_insert);
		} else {
			TRANSITION_TO(task_add_node); 
		}
	}
}

void task_add_node()
{
	// TASK_PROLOGUE();

	node_t *sibling_node;

	index_t sibling = *CHAN_IN2(index_t, sibling,
			MC_IN_CH(ch_sibling, task_compress, task_add_node),
			SELF_IN_CH(task_add_node));

	// This split is a memory optimization. It is to avoid having the
	// channel from init task allocate memory for the whole dict, and
	// instead to hold only the ones it actually modifies.
	//
	// NOTE: the init nodes do not come exclusively from the init task,
	// because they might be later modified.
	if (sibling < NUM_LETTERS) {
		sibling_node = CHAN_IN2(node_t, dict[sibling],
				MC_IN_CH(ch_roots, task_init_dict, task_add_node),
				MC_IN_CH(ch_dict, task_add_insert, task_add_node));
	} else {
		sibling_node = CHAN_IN1(node_t, dict[sibling],
				MC_IN_CH(ch_dict, task_add_insert, task_add_node));
	}

	LOG("add node: s %u, sn: l %u s %u c %u\r\n", sibling,
			sibling_node->letter, sibling_node->sibling, sibling_node->child);

	if (sibling_node->sibling != NIL) {

		index_t next_sibling = sibling_node->sibling;
		CHAN_OUT1(index_t, sibling, next_sibling, SELF_OUT_CH(task_add_node));
		TRANSITION_TO(task_add_node);

	} else { // found last sibling in the list

		LOG("add node: found last\r\n");

		node_t sibling_node_obj = *sibling_node;

		CHAN_OUT1(index_t, sibling, sibling,
				CH(task_add_node, task_add_insert));
		CHAN_OUT1(node_t, sibling_node, sibling_node_obj,
				CH(task_add_node, task_add_insert));

		TRANSITION_TO(task_add_insert);
	}
}

void task_add_insert()
{
	// TASK_PROLOGUE();

	index_t node_count = *CHAN_IN2(index_t, node_count,
			CH(task_init_dict, task_add_insert),
			SELF_IN_CH(task_add_insert));

	LOG("add insert: nodes %u\r\n", node_count);

	if (node_count == DICT_SIZE) { // wipe the table if full

		// PRINTF("add insert: dict full\r\n");

		// TODO: clear table  (re-initialize root nodes)
		while (1);
	}

	index_t parent = *CHAN_IN1(index_t, parent,
			CH(task_compress, task_add_insert));
	node_t *parent_node = CHAN_IN1(node_t, parent_node,
			CH(task_compress, task_add_insert));

	index_t letter = *CHAN_IN1(letter_t, letter,
			MC_IN_CH(ch_letter, task_letterize, task_add_insert));

	LOG("add insert: l %u p %u, pn l %u s %u c%u\r\n", letter, parent,
			parent_node->letter, parent_node->sibling, parent_node->child);

	index_t child = node_count;
	node_t child_node = {
		.letter = letter,
		.sibling = NIL,
		.child = NIL,
	};

	if (parent_node->child == NIL) { // the only child

		LOG("add insert: only child\r\n");

		node_t parent_node_obj = *parent_node;
		parent_node_obj.child = child;

		CHAN_OUT1(node_t, dict[parent], parent_node_obj,
				MC_OUT_CH(ch_dict, task_add_insert,
					task_compress, task_find_sibling, task_add_node));

	} else { // a sibling

		index_t last_sibling = *CHAN_IN1(index_t, sibling,
				CH(task_add_node, task_add_insert));

		node_t last_sibling_node = *CHAN_IN1(node_t, sibling_node,
				CH(task_add_node, task_add_insert));

		LOG("add insert: sibling %u\r\n", last_sibling);

		last_sibling_node.sibling = child;

		CHAN_OUT1(node_t, dict[last_sibling], last_sibling_node, 
				MC_OUT_CH(ch_dict, task_add_insert,
					task_compress, task_find_sibling, task_add_node));
	}

	index_t symbol = parent;
	CHAN_OUT1(node_t, dict[child], child_node,
			MC_OUT_CH(ch_dict, task_add_insert,
				task_compress, task_find_sibling, task_add_node));


	CHAN_OUT1(index_t, symbol, symbol,
			CH(task_add_insert, task_append_compressed));

	node_count++;

	CHAN_OUT1(index_t, node_count, node_count, SELF_OUT_CH(task_add_insert));

	TRANSITION_TO(task_append_compressed);
}

void task_append_compressed()
{
	//  TASK_PROLOGUE();

	index_t symbol = *CHAN_IN1(index_t, symbol,
			CH(task_add_insert, task_append_compressed));

	// TODO: encode with huffman code here

	unsigned out_len = *CHAN_IN2(unsigned, out_len,
			CH(task_init, task_append_compressed),
			SELF_IN_CH(task_append_compressed));

	CHAN_OUT1(index_t, compressed_data[out_len], symbol,
			CH(task_append_compressed, task_print));
	LOG("append comp: sym %u len %u \r\n", symbol, out_len);

	if (++out_len == BLOCK_SIZE) {
		out_len = 0;
		unsigned sample_count = *CHAN_IN1(unsigned, sample_count,
				CH(task_compress, task_append_compressed));
		CHAN_OUT1(unsigned, sample_count, sample_count,
				CH(task_append_compressed, task_print));

		sample_count = 0; // reset counter
		CHAN_OUT1(unsigned, sample_count, sample_count,
				CH(task_append_compressed, task_compress));

		CHAN_OUT1(unsigned, out_len, out_len,
				SELF_OUT_CH(task_append_compressed));
		TRANSITION_TO(task_print);
	} else {
		CHAN_OUT1(unsigned, out_len, out_len,
				SELF_OUT_CH(task_append_compressed));
		TRANSITION_TO(task_sample);
	}
}

void task_print()
{
	// TASK_PROLOGUE();

	unsigned i;

	unsigned sample_count = *CHAN_IN1(unsigned, sample_count,
			CH(task_append_compressed, task_print));
	PRINTF("TIME end is 65536*%u+%u\r\n",overflow,(unsigned)TBR);
	BLOCK_PRINTF_BEGIN();
	BLOCK_PRINTF("compressed block:\r\n");
	for (i = 0; i < BLOCK_SIZE; ++i) {
		index_t index = *CHAN_IN1(index_t, compressed_data[i],
				CH(task_append_compressed, task_print));
		BLOCK_PRINTF("%04x ", index);
		if (i > 0 && (i + 1) % 8 == 0)
			BLOCK_PRINTF("\r\n");
	}
	BLOCK_PRINTF("\r\n");
	BLOCK_PRINTF("rate: samples/block: %u/%u\r\n", sample_count, BLOCK_SIZE);
	BLOCK_PRINTF_END();
	//TRANSITION_TO(task_sample); // restart app
	TRANSITION_TO(task_done); // for now just do one block
}

void task_done()
{
	TRANSITION_TO(task_done);
}

	ENTRY_TASK(task_init)
INIT_FUNC(init)
