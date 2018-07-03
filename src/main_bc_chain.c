#include <msp430.h>
#include <stdlib.h>

#ifdef LOGIC
#define LOG(...)
#define PRINTF(...)
#define EIF_PRINTF(...)
#define INIT_CONSOLE(...)
#else
#include <libio/log.h>
#endif
#include <libchain/chain.h>
#include <libmspbuiltins/builtins.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>
#include <libmspmath/msp-math.h>
#include <libwispbase/wisp-base.h>

#ifdef CONFIG_LIBEDB_PRINTF
#include <libedb/edb.h>
#endif

__attribute__((interrupt(51))) 
	void TimerB1_ISR(void){
		PMMCTL0 = PMMPW | PMMSWPOR;
		TBCTL |= TBCLR;
	}
__attribute__((section("__interrupt_vector_timer0_b1"),aligned(2)))
void(*__vector_timer0_b1)(void) = TimerB1_ISR;

#include "pins.h"

#define SEED 4L
#define ITER 100
#define CHAR_BIT 8

__nv static char bc_bits[256] =
{
      0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,  /* 0   - 15  */
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 16  - 31  */
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 32  - 47  */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 48  - 63  */
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 64  - 79  */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 80  - 95  */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 96  - 111 */
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 112 - 127 */
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 128 - 143 */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 144 - 159 */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 160 - 175 */
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 176 - 191 */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 192 - 207 */
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 208 - 223 */
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 224 - 239 */
      4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8   /* 240 - 255 */
};

struct c0 {
	CHAN_FIELD(unsigned, func);
};
struct c1 {
	CHAN_FIELD(unsigned, n);
};
struct c2 {
	CHAN_FIELD(unsigned, iter);
	CHAN_FIELD(uint32_t, seed);
};

struct c3 {
	SELF_CHAN_FIELD(unsigned, func);
};
#define FIELD_INIT_c3 {\
	SELF_FIELD_INITIALIZER\
}

struct c4 {
	SELF_CHAN_FIELD(unsigned, iter);
	SELF_CHAN_FIELD(uint32_t, seed);
	SELF_CHAN_FIELD(unsigned, n);
};
#define FIELD_INIT_c4 {\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER\
}

struct c5 {
	CHAN_FIELD(unsigned, n);
};

struct c6 {
	CHAN_FIELD(unsigned, n);
};
struct c7 {
	CHAN_FIELD(unsigned, iter);
	CHAN_FIELD(uint32_t, seed);
};

struct c8 {
	SELF_CHAN_FIELD(unsigned, iter);
	SELF_CHAN_FIELD(uint32_t, seed);
	SELF_CHAN_FIELD(unsigned, n);
};
#define FIELD_INIT_c8 {\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER\
}

struct c9 {
	CHAN_FIELD(unsigned, n);
};

struct c10 {
	CHAN_FIELD(unsigned, n);
};
struct c11 {
	CHAN_FIELD(unsigned, iter);
	CHAN_FIELD(uint32_t, seed);
};

struct c12 {
	SELF_CHAN_FIELD(unsigned, iter);
	SELF_CHAN_FIELD(uint32_t, seed);
	SELF_CHAN_FIELD(unsigned, n);
};
#define FIELD_INIT_c12 {\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER\
}

struct c13 {
	CHAN_FIELD(unsigned, n);
};

struct c14 {
	CHAN_FIELD(unsigned, n);
};
struct c15 {
	CHAN_FIELD(unsigned, iter);
	CHAN_FIELD(uint32_t, seed);
};

struct c16 {
	SELF_CHAN_FIELD(unsigned, iter);
	SELF_CHAN_FIELD(uint32_t, seed);
	SELF_CHAN_FIELD(unsigned, n);
};
#define FIELD_INIT_c16 {\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER\
}

struct c17 {
	CHAN_FIELD(unsigned, n);
};

struct c18 {
	CHAN_FIELD(unsigned, n);
};
struct c19 {
	CHAN_FIELD(unsigned, iter);
	CHAN_FIELD(uint32_t, seed);
};

struct c20 {
	SELF_CHAN_FIELD(unsigned, iter);
	SELF_CHAN_FIELD(uint32_t, seed);
	SELF_CHAN_FIELD(unsigned, n);
};
#define FIELD_INIT_c20 {\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER\
}

struct c21 {
	CHAN_FIELD(unsigned, n);
};

struct c22 {
	CHAN_FIELD(unsigned, n);
};
struct c23 {
	CHAN_FIELD(unsigned, iter);
	CHAN_FIELD(uint32_t, seed);
};

struct c24 {
	SELF_CHAN_FIELD(unsigned, iter);
	SELF_CHAN_FIELD(uint32_t, seed);
	SELF_CHAN_FIELD(unsigned, n);
};
#define FIELD_INIT_c24 {\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER\
}

struct c25 {
	CHAN_FIELD(unsigned, n);
};

struct c26 {
	CHAN_FIELD(unsigned, n);
};
struct c27 {
	CHAN_FIELD(unsigned, iter);
	CHAN_FIELD(uint32_t, seed);
};

struct c28 {
	SELF_CHAN_FIELD(unsigned, iter);
	SELF_CHAN_FIELD(uint32_t, seed);
	SELF_CHAN_FIELD(unsigned, n);
};
#define FIELD_INIT_c28 {\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER,\
	SELF_FIELD_INITIALIZER\
}

struct c29 {
	CHAN_FIELD(unsigned, n);
};

CHANNEL(task_init, task_select_func, c0);
CHANNEL(task_init, task_bit_count, c1);
CHANNEL(task_select_func, task_bit_count, c2);
SELF_CHANNEL(task_select_func, c3);
SELF_CHANNEL(task_bit_count, c4);
CHANNEL(task_bit_count, task_end, c5);

CHANNEL(task_init, task_bitcount, c6);
CHANNEL(task_select_func, task_bitcount, c7);
SELF_CHANNEL(task_bitcount, c8);
CHANNEL(task_bitcount, task_end, c9);

CHANNEL(task_init, task_ntbl_bitcnt, c10);
CHANNEL(task_select_func, task_ntbl_bitcnt, c11);
SELF_CHANNEL(task_ntbl_bitcnt, c12);
CHANNEL(task_ntbl_bitcnt, task_end, c13);

CHANNEL(task_init, task_ntbl_bitcount, c14);
CHANNEL(task_select_func, task_ntbl_bitcount, c15);
SELF_CHANNEL(task_ntbl_bitcount, c16);
CHANNEL(task_ntbl_bitcount, task_end, c17);

CHANNEL(task_init, task_BW_btbl_bitcount, c18);
CHANNEL(task_select_func, task_BW_btbl_bitcount, c19);
SELF_CHANNEL(task_BW_btbl_bitcount, c20);
CHANNEL(task_BW_btbl_bitcount, task_end, c21);

CHANNEL(task_init, task_AR_btbl_bitcount, c22);
CHANNEL(task_select_func, task_AR_btbl_bitcount, c23);
SELF_CHANNEL(task_AR_btbl_bitcount, c24);
CHANNEL(task_AR_btbl_bitcount, task_end, c25);

CHANNEL(task_init, task_bit_shifter, c26);
CHANNEL(task_select_func, task_bit_shifter, c27);
SELF_CHANNEL(task_bit_shifter, c28);
CHANNEL(task_bit_shifter, task_end, c29);

TASK(1, task_init)
TASK(2, task_select_func)
TASK(3, task_bit_count)
TASK(4, task_bitcount)
TASK(5, task_ntbl_bitcnt)
TASK(6, task_ntbl_bitcount)
TASK(7, task_BW_btbl_bitcount)
TASK(8, task_AR_btbl_bitcount)
TASK(9, task_bit_shifter)
TASK(10, task_end)

static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

void init() {
	BITSET(TBCCTL1 , CCIE);
	TBCCR1 = 100;
	BITSET(TBCTL , (TBSSEL_1 | ID_3 | MC_2 | TBCLR));

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

    PRINTF(".%u.\r\n", curctx->task->idx);
}

void task_init() {
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_1);
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
	LOG("init\r\n");
	unsigned func = 0;
	unsigned n = 0;
	CHAN_OUT1(unsigned, func, func, CH(task_init, task_select_func));
	CHAN_OUT1(unsigned, n, n, CH(task_init, task_bit_count));
	CHAN_OUT1(unsigned, n, n, CH(task_init, task_bitcount));
	CHAN_OUT1(unsigned, n, n, CH(task_init, task_ntbl_bitcnt));
	CHAN_OUT1(unsigned, n, n, CH(task_init, task_ntbl_bitcount));
	CHAN_OUT1(unsigned, n, n, CH(task_init, task_BW_btbl_bitcount));
	CHAN_OUT1(unsigned, n, n, CH(task_init, task_AR_btbl_bitcount));
	CHAN_OUT1(unsigned, n, n, CH(task_init, task_bit_shifter));
	TRANSITION_TO(task_select_func);
}

void task_select_func() {
	LOG("select func\r\n");

	unsigned func = *CHAN_IN2(unsigned, func, SELF_IN_CH(task_select_func),
			CH(task_init, task_select_func));
	uint32_t seed = (uint32_t)SEED; // for test, seed is always the same
	unsigned iter = 0;
	LOG("func: %u\r\n", func);
	if(func == 0){
		CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_bit_count));
		CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_bit_count));
		func++;
		CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
		TRANSITION_TO(task_bit_count);
	}
	else if(func == 1){
		CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_bitcount));
		CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_bitcount));
		func++;
		CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
		TRANSITION_TO(task_bitcount);
	}
	else if(func == 2){
		CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_ntbl_bitcnt));
		CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_ntbl_bitcnt));
		func++;
		CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
		TRANSITION_TO(task_ntbl_bitcnt);
	}
	else if(func == 3){
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_ntbl_bitcount));
			CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_ntbl_bitcount));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_ntbl_bitcount);
	}
	else if(func == 4){
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_BW_btbl_bitcount));
			CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_BW_btbl_bitcount));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_BW_btbl_bitcount);
	}
	else if(func == 5){
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_AR_btbl_bitcount));
			CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_AR_btbl_bitcount));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_AR_btbl_bitcount);
	}
	else if(func == 6){
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_bit_shifter));
			CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_bit_shifter));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_bit_shifter);
	}
	else{
		TRANSITION_TO(task_end);

	}
#if 0
	switch(func){
		case 0:
			LOG("a\r\n");
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_bit_count));
			CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_bit_count));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_bit_count);
			break;
		case 1:
			LOG("b\r\n");
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_bitcount));
			CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_bitcount));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_bitcount);
			break;
		case 2:
			LOG("c\r\n");
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_ntbl_bitcnt));
			CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_ntbl_bitcnt));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_ntbl_bitcnt);
			break;
		case 3:
			LOG("d\r\n");
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_ntbl_bitcount));
			CHAN_OUT1(uint32_t, seed, seed, CH(task_select_func, task_ntbl_bitcount));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_ntbl_bitcount);
			break;
		case 4:
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_BW_btbl_bitcount));
			CHAN_OUT1(unsigned, seed, seed, CH(task_select_func, task_BW_btbl_bitcount));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_BW_btbl_bitcount);
			break;
		case 5:
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_AR_btbl_bitcount));
			CHAN_OUT1(unsigned, seed, seed, CH(task_select_func, task_AR_btbl_bitcount));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_AR_btbl_bitcount);
			break;
		case 6:
			CHAN_OUT1(unsigned, iter, iter, CH(task_select_func, task_bit_shifter));
			CHAN_OUT1(unsigned, seed, seed, CH(task_select_func, task_bit_shifter));
			func++;
			CHAN_OUT1(unsigned, func, func, SELF_CH(task_select_func));
			TRANSITION_TO(task_bit_shifter);
			break;
		default: TRANSITION_TO(task_end);
	}
#endif
}
void task_bit_count() {
	LOG("bit_count\r\n");
	unsigned n = *CHAN_IN2(unsigned, n, CH(task_init, task_bit_count), SELF_CH(task_bit_count));
	unsigned iter = *CHAN_IN2(unsigned, iter, CH(task_select_func, task_bit_count), SELF_CH(task_bit_count));
	uint32_t seed = *CHAN_IN2(uint32_t, seed, CH(task_select_func, task_bit_count), SELF_CH(task_bit_count));
	uint32_t next_seed = seed + 13;
	unsigned temp = 0;
	if(seed) do 
		temp++;
	while (0 != (seed = seed&(seed-1)));
	n += temp;
	CHAN_OUT2(unsigned, n, n, CH(task_bit_count, task_end), SELF_CH(task_bit_count));
	iter++;
	CHAN_OUT1(unsigned, iter, iter, SELF_CH(task_bit_count));
	CHAN_OUT1(uint32_t, seed, next_seed, SELF_CH(task_bit_count));
	
	if(iter < ITER){
		TRANSITION_TO(task_bit_count);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_bitcount() {
	LOG("bitcount\r\n");
	unsigned n = *CHAN_IN2(unsigned, n, CH(task_init, task_bitcount), SELF_CH(task_bitcount));
	unsigned iter = *CHAN_IN2(unsigned, iter, CH(task_select_func, task_bitcount), SELF_CH(task_bitcount));
	uint32_t seed = *CHAN_IN2(uint32_t, seed, CH(task_select_func, task_bitcount), SELF_CH(task_bitcount));
	uint32_t next_seed = seed + 13;
	unsigned temp = 0;
	seed = ((seed & 0xAAAAAAAAL) >>  1) + (seed & 0x55555555L);
	seed = ((seed & 0xCCCCCCCCL) >>  2) + (seed & 0x33333333L);
	seed = ((seed & 0xF0F0F0F0L) >>  4) + (seed & 0x0F0F0F0FL);
	seed = ((seed & 0xFF00FF00L) >>  8) + (seed & 0x00FF00FFL);
	seed = ((seed & 0xFFFF0000L) >> 16) + (seed & 0x0000FFFFL);
	n += (int)seed;
	CHAN_OUT2(unsigned, n, n, CH(task_bitcount, task_end), SELF_CH(task_bitcount));
	iter++;
	CHAN_OUT1(unsigned, iter, iter, SELF_CH(task_bitcount));
	CHAN_OUT1(uint32_t, seed, next_seed, SELF_CH(task_bitcount));

	if(iter < ITER){
		TRANSITION_TO(task_bitcount);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
int recursive_cnt(uint32_t x){
	int cnt = bc_bits[(int)(x & 0x0000000FL)];

	if (0L != (x >>= 4))
		cnt += recursive_cnt(x);

	return cnt;
}
void task_ntbl_bitcnt() {
	LOG("ntbl_bitcnt\r\n");
	unsigned n = *CHAN_IN2(unsigned, n, CH(task_init, task_ntbl_bitcnt), SELF_CH(task_ntbl_bitcnt));
	unsigned iter = *CHAN_IN2(unsigned, iter, CH(task_select_func, task_ntbl_bitcnt), SELF_CH(task_ntbl_bitcnt));
	uint32_t seed = *CHAN_IN2(uint32_t, seed, CH(task_select_func, task_ntbl_bitcnt), SELF_CH(task_ntbl_bitcnt));
	uint32_t next_seed = seed + 13;
	unsigned temp = 0;
	n += recursive_cnt(seed);	
	CHAN_OUT2(unsigned, n, n, CH(task_ntbl_bitcnt, task_end), SELF_CH(task_ntbl_bitcnt));
	iter++;
	CHAN_OUT1(unsigned, iter, iter, SELF_CH(task_ntbl_bitcnt));
	CHAN_OUT1(uint32_t, seed, next_seed, SELF_CH(task_ntbl_bitcnt));

	if(iter < ITER){
		TRANSITION_TO(task_ntbl_bitcnt);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_ntbl_bitcount() {
	LOG("ntbl_bitcount\r\n");
	unsigned n = *CHAN_IN2(unsigned, n, CH(task_init, task_ntbl_bitcount), SELF_CH(task_ntbl_bitcount));
	unsigned iter = *CHAN_IN2(unsigned, iter, CH(task_select_func, task_ntbl_bitcount), SELF_CH(task_ntbl_bitcount));
	uint32_t seed = *CHAN_IN2(uint32_t, seed, CH(task_select_func, task_ntbl_bitcount), SELF_CH(task_ntbl_bitcount));
	uint32_t next_seed = seed + 13;
	unsigned temp = 0;
	n += bc_bits[ (int) (seed & 0x0000000FUL)       ] +
		bc_bits[ (int)((seed & 0x000000F0UL) >> 4) ] +
		bc_bits[ (int)((seed & 0x00000F00UL) >> 8) ] +
		bc_bits[ (int)((seed & 0x0000F000UL) >> 12)] +
		bc_bits[ (int)((seed & 0x000F0000UL) >> 16)] +
		bc_bits[ (int)((seed & 0x00F00000UL) >> 20)] +
		bc_bits[ (int)((seed & 0x0F000000UL) >> 24)] +
		bc_bits[ (int)((seed & 0xF0000000UL) >> 28)];
	CHAN_OUT2(unsigned, n, n, CH(task_ntbl_bitcount, task_end), SELF_CH(task_ntbl_bitcount));
	iter++;
	CHAN_OUT1(unsigned, iter, iter, SELF_CH(task_ntbl_bitcount));
	CHAN_OUT1(uint32_t, seed, next_seed, SELF_CH(task_ntbl_bitcount));

	if(iter < ITER){
		TRANSITION_TO(task_ntbl_bitcount);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_BW_btbl_bitcount() {
	LOG("BW_btbl_bitcount\r\n");
	unsigned n = *CHAN_IN2(unsigned, n, CH(task_init, task_BW_btbl_bitcount), SELF_CH(task_BW_btbl_bitcount));
	unsigned iter = *CHAN_IN2(unsigned, iter, CH(task_select_func, task_BW_btbl_bitcount), SELF_CH(task_BW_btbl_bitcount));
	uint32_t seed = *CHAN_IN2(uint32_t, seed, CH(task_select_func, task_BW_btbl_bitcount), SELF_CH(task_BW_btbl_bitcount));
	uint32_t next_seed = seed + 13;
	unsigned temp = 0;
	union 
	{ 
		unsigned char ch[4]; 
		long y; 
	} U; 

	U.y = seed; 

	n += bc_bits[ U.ch[0] ] + bc_bits[ U.ch[1] ] + 
		bc_bits[ U.ch[3] ] + bc_bits[ U.ch[2] ]; 
	CHAN_OUT2(unsigned, n, n, CH(task_BW_btbl_bitcount, task_end), SELF_CH(task_BW_btbl_bitcount));
	iter++;
	CHAN_OUT1(unsigned, iter, iter, SELF_CH(task_BW_btbl_bitcount));
	CHAN_OUT1(uint32_t, seed, next_seed, SELF_CH(task_BW_btbl_bitcount));

	if(iter < ITER){
		TRANSITION_TO(task_BW_btbl_bitcount);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_AR_btbl_bitcount() {
	LOG("AR_btbl_bitcount\r\n");
	unsigned n = *CHAN_IN2(unsigned, n, CH(task_init, task_AR_btbl_bitcount), SELF_CH(task_AR_btbl_bitcount));
	unsigned iter = *CHAN_IN2(unsigned, iter, CH(task_select_func, task_AR_btbl_bitcount), SELF_CH(task_AR_btbl_bitcount));
	uint32_t seed = *CHAN_IN2(uint32_t, seed, CH(task_select_func, task_AR_btbl_bitcount), SELF_CH(task_AR_btbl_bitcount));
	uint32_t next_seed = seed + 13;
	unsigned temp = 0;
	unsigned char * Ptr = (unsigned char *) &seed ;
	int Accu ;

	Accu  = bc_bits[ *Ptr++ ];
	Accu += bc_bits[ *Ptr++ ];
	Accu += bc_bits[ *Ptr++ ];
	Accu += bc_bits[ *Ptr ];
	n+= Accu;
	CHAN_OUT2(unsigned, n, n, CH(task_AR_btbl_bitcount, task_end), SELF_CH(task_AR_btbl_bitcount));
	iter++;
	CHAN_OUT1(unsigned, iter, iter, SELF_CH(task_AR_btbl_bitcount));
	CHAN_OUT1(uint32_t, seed, next_seed, SELF_CH(task_AR_btbl_bitcount));

	if(iter < ITER){
		TRANSITION_TO(task_AR_btbl_bitcount);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_bit_shifter() {
	LOG("bit_shifter\r\n");
	unsigned n = *CHAN_IN2(unsigned, n, CH(task_init, task_bit_shifter), SELF_CH(task_bit_shifter));
	unsigned iter = *CHAN_IN2(unsigned, iter, CH(task_select_func, task_bit_shifter), SELF_CH(task_bit_shifter));
	uint32_t seed = *CHAN_IN2(uint32_t, seed, CH(task_select_func, task_bit_shifter), SELF_CH(task_bit_shifter));
	uint32_t next_seed = seed + 13;
	unsigned temp = 0;
	
	int i, nn;

	for (i = nn = 0; seed && (i < (sizeof(long) * CHAR_BIT)); ++i, seed >>= 1)
		nn += (int)(seed & 1L);
	n += nn;

	CHAN_OUT2(unsigned, n, n, CH(task_bit_shifter, task_end), SELF_CH(task_bit_shifter));
	iter++;
	CHAN_OUT1(unsigned, iter, iter, SELF_CH(task_bit_shifter));
	CHAN_OUT1(uint32_t, seed, next_seed, SELF_CH(task_bit_shifter));

	if(iter < ITER){
		TRANSITION_TO(task_bit_shifter);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}

void task_end() {
	GPIO(PORT_AUX3, OUT) |= BIT(PIN_AUX_3);
	GPIO(PORT_AUX3, OUT) &= ~BIT(PIN_AUX_3);
	LOG("end\r\n");
	unsigned n_0 = *CHAN_IN1(unsigned, n, CH(task_bit_count, task_end));
	unsigned n_1 = *CHAN_IN1(unsigned, n, CH(task_bitcount, task_end));
	unsigned n_2 = *CHAN_IN1(unsigned, n, CH(task_ntbl_bitcnt, task_end));
	unsigned n_3 = *CHAN_IN1(unsigned, n, CH(task_ntbl_bitcount, task_end));
	unsigned n_4 = *CHAN_IN1(unsigned, n, CH(task_BW_btbl_bitcount, task_end));
	unsigned n_5 = *CHAN_IN1(unsigned, n, CH(task_AR_btbl_bitcount, task_end));
	unsigned n_6 = *CHAN_IN1(unsigned, n, CH(task_bit_shifter, task_end));
	PRINTF("%u\r\n", n_0);
	PRINTF("%u\r\n", n_1);
	PRINTF("%u\r\n", n_2);
	PRINTF("%u\r\n", n_3);
	PRINTF("%u\r\n", n_4);
	PRINTF("%u\r\n", n_5);
	PRINTF("%u\r\n", n_6);
	TRANSITION_TO(task_init);
}

	ENTRY_TASK(task_init)
INIT_FUNC(init)
