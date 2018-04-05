#include <msp430.h>
#include <param.h>
#include <stdlib.h>

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
#include <libalpaca/alpaca.h>
#include <libmspbuiltins/builtins.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>
#include <libmspmath/msp-math.h>

#ifdef CONFIG_LIBEDB_PRINTF
#include <libedb/edb.h>
#endif

#include "pins.h"

#define SEED 4L
#define ITER 100
#define CHAR_BIT 8

__nv static char bits[256] =
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
GLOBAL_SB(unsigned, n_0);
GLOBAL_SB(unsigned, n_1);
GLOBAL_SB(unsigned, n_2);
GLOBAL_SB(unsigned, n_3);
GLOBAL_SB(unsigned, n_4);
GLOBAL_SB(unsigned, n_5);
GLOBAL_SB(unsigned, n_6);

GLOBAL_SB(unsigned, func);

GLOBAL_SB(uint32_t, seed);
GLOBAL_SB(unsigned, iter);

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

/* This is originally done by the compiler */
__nv uint8_t* data_src[3];
__nv uint8_t* data_dest[3];
__nv unsigned data_size[3];
GLOBAL_SB(unsigned, n_0_bak);
GLOBAL_SB(unsigned, n_1_bak);
GLOBAL_SB(unsigned, n_2_bak);
GLOBAL_SB(unsigned, n_3_bak);
GLOBAL_SB(unsigned, n_4_bak);
GLOBAL_SB(unsigned, n_5_bak);
GLOBAL_SB(unsigned, n_6_bak);
GLOBAL_SB(unsigned, func_bak);
GLOBAL_SB(uint32_t, seed_bak);
GLOBAL_SB(unsigned, iter_bak);
void clear_isDirty(){}
/* end */

static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

void init() {
	init_hw();

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

void task_init() {
	PRINTF("start\n");
	LOG("init\r\n");
#ifdef LOGIC
	// Out high
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_1);
	// Out low
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
#endif
	GV(func) = 0;
	GV(n_0) = 0;
	GV(n_1) = 0;
	GV(n_2) = 0;
	GV(n_3) = 0;
	GV(n_4) = 0;
	GV(n_5) = 0;
	GV(n_6) = 0;

	TRANSITION_TO(task_select_func);
}

void task_select_func() {
	// var func get privatized by the compiler
	PRIV(func);
	LOG("select func\r\n");

	GV(seed) = (uint32_t)SEED; // for test, seed is always the same
	GV(iter) = 0;
	LOG("func: %u\r\n", GV(func_bak));
	if(GV(func_bak) == 0){
		GV(func_bak)++;
		COMMIT(func);
		TRANSITION_TO(task_bit_count);
	}
	else if(GV(func_bak) == 1){
		GV(func_bak)++;
		COMMIT(func);
		TRANSITION_TO(task_bitcount);
	}
	else if(GV(func_bak) == 2){
		GV(func_bak)++;
		COMMIT(func);
		TRANSITION_TO(task_ntbl_bitcnt);
	}
	else if(GV(func_bak) == 3){
		GV(func_bak)++;
		COMMIT(func);
		TRANSITION_TO(task_ntbl_bitcount);
	}
	else if(GV(func_bak) == 4){
		GV(func_bak)++;
		COMMIT(func);
		TRANSITION_TO(task_BW_btbl_bitcount);
	}
	else if(GV(func_bak) == 5){
		GV(func_bak)++;
		COMMIT(func);
		TRANSITION_TO(task_AR_btbl_bitcount);
	}
	else if(GV(func_bak) == 6){
		GV(func_bak)++;
		COMMIT(func);
		TRANSITION_TO(task_bit_shifter);
	}
	else{
		COMMIT(func);
		TRANSITION_TO(task_end);
	}
}

void task_bit_count() {
	// privatize seed, n_0, iter
	PRIV(seed);
	PRIV(n_0);
	PRIV(iter);

	LOG("bit_count\r\n");
	uint32_t tmp_seed = GV(seed_bak);
	GV(seed_bak) = GV(seed_bak) + 13;
	unsigned temp = 0;
	if(tmp_seed) do
		temp++;
	while (0 != (tmp_seed = tmp_seed&(tmp_seed-1)));
	GV(n_0_bak) += temp;
	GV(iter_bak)++;

	if(GV(iter_bak) < ITER){
		COMMIT(seed);
		COMMIT(n_0);
		COMMIT(iter);
		TRANSITION_TO(task_bit_count);
	}
	else{
		COMMIT(seed);
		COMMIT(n_0);
		COMMIT(iter);
		TRANSITION_TO(task_select_func);
	}
}

void task_bitcount() {
	// privatize seed, n_1, iter
	PRIV(seed);
	PRIV(n_1);
	PRIV(iter);

	LOG("bitcount\r\n");
	uint32_t tmp_seed = GV(seed_bak);
	GV(seed_bak) = GV(seed_bak) + 13;
	tmp_seed = ((tmp_seed & 0xAAAAAAAAL) >>  1) + (tmp_seed & 0x55555555L);
	tmp_seed = ((tmp_seed & 0xCCCCCCCCL) >>  2) + (tmp_seed & 0x33333333L);
	tmp_seed = ((tmp_seed & 0xF0F0F0F0L) >>  4) + (tmp_seed & 0x0F0F0F0FL);
	tmp_seed = ((tmp_seed & 0xFF00FF00L) >>  8) + (tmp_seed & 0x00FF00FFL);
	tmp_seed = ((tmp_seed & 0xFFFF0000L) >> 16) + (tmp_seed & 0x0000FFFFL);
	GV(n_1_bak) += (int)tmp_seed;
	GV(iter_bak)++;

	if(GV(iter_bak) < ITER){
		COMMIT(seed);
		COMMIT(n_1);
		COMMIT(iter);
		TRANSITION_TO(task_bitcount);
	}
	else{
		COMMIT(seed);
		COMMIT(n_1);
		COMMIT(iter);
		TRANSITION_TO(task_select_func);
	}
}

int recursive_cnt(uint32_t x){
	int cnt = bits[(int)(x & 0x0000000FL)];

	if (0L != (x >>= 4))
		cnt += recursive_cnt(x);

	return cnt;
}

void task_ntbl_bitcnt() {
	// privatize seed, n_2, iter
	PRIV(seed);
	PRIV(n_2);
	PRIV(iter);

	LOG("ntbl_bitcnt\r\n");
	GV(n_2_bak) += recursive_cnt(GV(seed_bak));
	GV(seed_bak) = GV(seed_bak) + 13;
	GV(iter_bak)++;

	if(GV(iter_bak) < ITER){
		COMMIT(seed);
		COMMIT(n_2);
		COMMIT(iter);
		TRANSITION_TO(task_ntbl_bitcnt);
	}
	else{
		COMMIT(seed);
		COMMIT(n_2);
		COMMIT(iter);
		TRANSITION_TO(task_select_func);
	}
}

void task_ntbl_bitcount() {
	// privatize seed, n_3, iter
	PRIV(seed);
	PRIV(n_3);
	PRIV(iter);

	LOG("ntbl_bitcount\r\n");
	GV(n_3_bak) += bits[ (int) (GV(seed_bak) & 0x0000000FUL)       ] +
		bits[ (int)((GV(seed_bak) & 0x000000F0UL) >> 4) ] +
		bits[ (int)((GV(seed_bak) & 0x00000F00UL) >> 8) ] +
		bits[ (int)((GV(seed_bak) & 0x0000F000UL) >> 12)] +
		bits[ (int)((GV(seed_bak) & 0x000F0000UL) >> 16)] +
		bits[ (int)((GV(seed_bak) & 0x00F00000UL) >> 20)] +
		bits[ (int)((GV(seed_bak) & 0x0F000000UL) >> 24)] +
		bits[ (int)((GV(seed_bak) & 0xF0000000UL) >> 28)];
	GV(seed_bak) = GV(seed_bak) + 13;
	GV(iter_bak)++;

	if(GV(iter_bak) < ITER){
		COMMIT(seed);
		COMMIT(n_3);
		COMMIT(iter);
		TRANSITION_TO(task_ntbl_bitcount);
	}
	else{
		COMMIT(seed);
		COMMIT(n_3);
		COMMIT(iter);
		TRANSITION_TO(task_select_func);
	}
}

void task_BW_btbl_bitcount() {
	// privatize seed, n_4, iter
	PRIV(seed);
	PRIV(n_4);
	PRIV(iter);

	LOG("BW_btbl_bitcount\r\n");
	union
	{
		unsigned char ch[4];
		long y;
	} U;

	U.y = GV(seed_bak);

	GV(n_4_bak) += bits[ U.ch[0] ] + bits[ U.ch[1] ] +
		bits[ U.ch[3] ] + bits[ U.ch[2] ];
	GV(seed_bak) = GV(seed_bak) + 13;
	GV(iter_bak)++;

	if(GV(iter_bak) < ITER){
		COMMIT(seed);
		COMMIT(n_4);
		COMMIT(iter);
		TRANSITION_TO(task_BW_btbl_bitcount);
	}
	else{
		COMMIT(seed);
		COMMIT(n_4);
		COMMIT(iter);
		TRANSITION_TO(task_select_func);
	}
}

void task_AR_btbl_bitcount() {
	// privatize seed, n_5, iter
	PRIV(seed);
	PRIV(n_5);
	PRIV(iter);

	LOG("AR_btbl_bitcount\r\n");
	unsigned char * Ptr = (unsigned char *) &GV(seed_bak) ;
	int Accu ;

	Accu  = bits[ *Ptr++ ];
	Accu += bits[ *Ptr++ ];
	Accu += bits[ *Ptr++ ];
	Accu += bits[ *Ptr ];
	GV(n_5_bak)+= Accu;
	GV(seed_bak) = GV(seed_bak) + 13;
	GV(iter_bak)++;

	if(GV(iter_bak) < ITER){
		COMMIT(seed);
		COMMIT(n_5);
		COMMIT(iter);
		TRANSITION_TO(task_AR_btbl_bitcount);
	}
	else{
		COMMIT(seed);
		COMMIT(n_5);
		COMMIT(iter);
		TRANSITION_TO(task_select_func);
	}
}

void task_bit_shifter() {
	// privatize seed, n_6, iter
	PRIV(seed);
	PRIV(n_6);
	PRIV(iter);

	LOG("bit_shifter\r\n");
	int i, nn;
	uint32_t tmp_seed = GV(seed_bak);
	for (i = nn = 0; tmp_seed && (i < (sizeof(long) * CHAR_BIT)); ++i, tmp_seed >>= 1)
		nn += (int)(tmp_seed & 1L);
	GV(n_6_bak) += nn;
	GV(seed_bak) = GV(seed_bak) + 13;

	GV(iter_bak)++;

	if(GV(iter_bak) < ITER){
		COMMIT(seed);
		COMMIT(n_6);
		COMMIT(iter);
		TRANSITION_TO(task_bit_shifter);
	}
	else{
		COMMIT(seed);
		COMMIT(n_6);
		COMMIT(iter);
		TRANSITION_TO(task_select_func);
	}
}

void task_end() {
	PRINTF("end\r\n");
	PRINTF("%u\r\n", GV(n_0));
	PRINTF("%u\r\n", GV(n_1));
	PRINTF("%u\r\n", GV(n_2));
	PRINTF("%u\r\n", GV(n_3));
	PRINTF("%u\r\n", GV(n_4));
	PRINTF("%u\r\n", GV(n_5));
	PRINTF("%u\r\n", GV(n_6));
#ifdef LOGIC
	GPIO(PORT_AUX3, OUT) |= BIT(PIN_AUX_3);
	GPIO(PORT_AUX3, OUT) &= ~BIT(PIN_AUX_3);
#endif
	TRANSITION_TO(task_init);
}


ENTRY_TASK(task_init)
INIT_FUNC(init)
