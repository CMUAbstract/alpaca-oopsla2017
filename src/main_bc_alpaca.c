#include <msp430.h>
#include <stdlib.h>

#include <libwispbase/wisp-base.h>
#ifdef LOGIC
#define LOG(...)
#define PRINTF(...)
#define EIF_PRINTF(...)
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

__attribute__((interrupt(51))) 
	void TimerB1_ISR(void){
		PMMCTL0 = PMMPW | PMMSWPOR;
		TBCTL |= TBCLR;
	}
__attribute__((section("__interrupt_vector_timer0_b1"),aligned(2)))
void(*__vector_timer0_b1)(void) = TimerB1_ISR;

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

TASK(task_init)
TASK(task_select_func)
TASK(task_bit_count)
TASK(task_bitcount)
TASK(task_ntbl_bitcnt)
TASK(task_ntbl_bitcount)
TASK(task_BW_btbl_bitcount)
TASK(task_AR_btbl_bitcount)
TASK(task_bit_shifter)
TASK(task_end)

static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

void init() {
	BITSET(TBCCTL1 , CCIE);
	TBCCR1 = 40;
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
	PRINTF(".%x.\r\n", curctx->task);
}

void task_init() {
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_1);
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
	LOG("init\r\n");

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
	LOG("select func\r\n");

	GV(seed) = (uint32_t)SEED; // for test, seed is always the same
	GV(iter) = 0;
	LOG("func: %u\r\n", GV(func));
	if(GV(func) == 0){
		GV(func)++;
		TRANSITION_TO(task_bit_count);
	}
	else if(GV(func) == 1){
		GV(func)++;
		TRANSITION_TO(task_bitcount);
	}
	else if(GV(func) == 2){
		GV(func)++;
		TRANSITION_TO(task_ntbl_bitcnt);
	}
	else if(GV(func) == 3){
		GV(func)++;
		TRANSITION_TO(task_ntbl_bitcount);
	}
	else if(GV(func) == 4){
		GV(func)++;
		TRANSITION_TO(task_BW_btbl_bitcount);
	}
	else if(GV(func) == 5){
		GV(func)++;
		TRANSITION_TO(task_AR_btbl_bitcount);
	}
	else if(GV(func) == 6){
		GV(func)++;
		TRANSITION_TO(task_bit_shifter);
	}
	else{
		TRANSITION_TO(task_end);

	}
}
void task_bit_count() {
	LOG("bit_count\r\n");
	uint32_t tmp_seed = GV(seed);
	GV(seed) = GV(seed) + 13;
	unsigned temp = 0;
	if(tmp_seed) do 
		temp++;
	while (0 != (tmp_seed = tmp_seed&(tmp_seed-1)));
	GV(n_0) += temp;
	GV(iter)++;

	if(GV(iter) < ITER){
		TRANSITION_TO(task_bit_count);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_bitcount() {
	LOG("bitcount\r\n");
	uint32_t tmp_seed = GV(seed);
	GV(seed) = GV(seed) + 13;
	tmp_seed = ((tmp_seed & 0xAAAAAAAAL) >>  1) + (tmp_seed & 0x55555555L);
	tmp_seed = ((tmp_seed & 0xCCCCCCCCL) >>  2) + (tmp_seed & 0x33333333L);
	tmp_seed = ((tmp_seed & 0xF0F0F0F0L) >>  4) + (tmp_seed & 0x0F0F0F0FL);
	tmp_seed = ((tmp_seed & 0xFF00FF00L) >>  8) + (tmp_seed & 0x00FF00FFL);
	tmp_seed = ((tmp_seed & 0xFFFF0000L) >> 16) + (tmp_seed & 0x0000FFFFL);
	GV(n_1) += (int)tmp_seed;
	GV(iter)++;

	if(GV(iter) < ITER){
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
	GV(n_2) += recursive_cnt(GV(seed));	
	GV(seed) = GV(seed) + 13;
	GV(iter)++;

	if(GV(iter) < ITER){
		TRANSITION_TO(task_ntbl_bitcnt);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_ntbl_bitcount() {
	LOG("ntbl_bitcount\r\n");
	GV(n_3) += bc_bits[ (int) (GV(seed) & 0x0000000FUL)       ] +
		bc_bits[ (int)((GV(seed) & 0x000000F0UL) >> 4) ] +
		bc_bits[ (int)((GV(seed) & 0x00000F00UL) >> 8) ] +
		bc_bits[ (int)((GV(seed) & 0x0000F000UL) >> 12)] +
		bc_bits[ (int)((GV(seed) & 0x000F0000UL) >> 16)] +
		bc_bits[ (int)((GV(seed) & 0x00F00000UL) >> 20)] +
		bc_bits[ (int)((GV(seed) & 0x0F000000UL) >> 24)] +
		bc_bits[ (int)((GV(seed) & 0xF0000000UL) >> 28)];
	GV(seed) = GV(seed) + 13;
	GV(iter)++;

	if(GV(iter) < ITER){
		TRANSITION_TO(task_ntbl_bitcount);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_BW_btbl_bitcount() {
	LOG("BW_btbl_bitcount\r\n");
	union 
	{ 
		unsigned char ch[4]; 
		long y; 
	} U; 

	U.y = GV(seed); 

	GV(n_4) += bc_bits[ U.ch[0] ] + bc_bits[ U.ch[1] ] + 
		bc_bits[ U.ch[3] ] + bc_bits[ U.ch[2] ]; 
	GV(seed) = GV(seed) + 13;
	GV(iter)++;

	if(GV(iter) < ITER){
		TRANSITION_TO(task_BW_btbl_bitcount);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_AR_btbl_bitcount() {
	LOG("AR_btbl_bitcount\r\n");
	unsigned char * Ptr = (unsigned char *) &GV(seed) ;
	int Accu ;

	Accu  = bc_bits[ *Ptr++ ];
	Accu += bc_bits[ *Ptr++ ];
	Accu += bc_bits[ *Ptr++ ];
	Accu += bc_bits[ *Ptr ];
	GV(n_5)+= Accu;
	GV(seed) = GV(seed) + 13;
	GV(iter)++;

	if(GV(iter) < ITER){
		TRANSITION_TO(task_AR_btbl_bitcount);
	}
	else{
		TRANSITION_TO(task_select_func);
	}
}
void task_bit_shifter() {
	LOG("bit_shifter\r\n");
	int i, nn;
	uint32_t tmp_seed = GV(seed);
	for (i = nn = 0; tmp_seed && (i < (sizeof(long) * CHAR_BIT)); ++i, tmp_seed >>= 1)
		nn += (int)(tmp_seed & 1L);
	GV(n_6) += nn;
	GV(seed) = GV(seed) + 13;

	GV(iter)++;

	if(GV(iter) < ITER){
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
	PRINTF("%u\r\n", GV(n_0));
	PRINTF("%u\r\n", GV(n_1));
	PRINTF("%u\r\n", GV(n_2));
	PRINTF("%u\r\n", GV(n_3));
	PRINTF("%u\r\n", GV(n_4));
	PRINTF("%u\r\n", GV(n_5));
	PRINTF("%u\r\n", GV(n_6));
	TRANSITION_TO(task_init);
}

ENTRY_TASK(task_init)
INIT_FUNC(init)
