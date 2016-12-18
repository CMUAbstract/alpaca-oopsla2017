#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

//#include <libwispbase/wisp-base.h>
//#include <wisp-base.h>
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

#define DELAY() do { \
	uint32_t delay = 0x2ffff; \
	while (delay--); \
} while (0);

#ifdef CONT_POWER
#define TASK_PROLOGUE() DELAY()
#else // !CONT_POWER
#define TASK_PROLOGUE()
#endif // !CONT_POWER
unsigned overflow=0;
__nv unsigned data[MAX_DIRTY_GV_SIZE];
__nv uint8_t* data_dest[MAX_DIRTY_GV_SIZE];
__nv unsigned data_size[MAX_DIRTY_GV_SIZE];
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


// Have to define the vector table elements manually, because clang,
// unlike gcc, does not generate sections for the vectors, it only
// generates symbols (aliases). The linker script shipped in the
// TI GCC distribution operates on sections, so we define a symbol and put it
// in its own section here named as the linker script wants it.
// The 2 bytes per alias symbol defined by clang are wasted.
__attribute__((section("__interrupt_vector_timer0_b1"),aligned(2)))
void(*__vector_timer0_b1)(void) = TimerB1_ISR;

typedef struct _str {
	unsigned a;
	unsigned b;
	unsigned c;
} str;

	TASK(1, task_init)
	TASK(2, task_A)
	TASK(3, task_B)

	GLOBAL_SB(unsigned, a); //2
	GLOBAL_SB(bool, b); //1
	GLOBAL_SB(uint64_t, c); //8
	GLOBAL_SB(uint8_t, d); //1
	GLOBAL_SB(str, e); //1
	GLOBAL_SB(unsigned, f, 5); //4

	GLOBAL_SB(unsigned, a_bak);
	GLOBAL_SB(bool, b_bak);
	GLOBAL_SB(uint64_t, c_bak);
	GLOBAL_SB(uint8_t, d_bak);
	GLOBAL_SB(str, e_bak);
	GLOBAL_SB(unsigned, f_bak, 5);
//void write_to_gbuf(const void *value, void* data_addr, size_t var_size){

//}
static void init_hw()
{
    msp_watchdog_disable();
    msp_gpio_unlock();
    msp_clock_setup();
}
void func1();
void func2();
void func3();
void func4();
void func5();
void func6();
void func7();
void func8();
void func9();
void init()
{
	TBCTL &= 0xE6FF; //set 12,11 bit to zero (16bit) also 8 to zero (SMCLK)
	TBCTL |= 0x0200; //set 9 to one (SMCLK)
	TBCTL |= 0x00C0; //set 7-6 bit to 11 (divider = 8);
	//	TBCTL &= ~(0x00C0); //divider = 1
	TBCTL &= 0xFFEF; //set bit 4 to zero
	TBCTL |= 0x0020; //set bit 5 to one (5-4=10: continuous mode)
	TBCTL |= 0x0002; //interrupt enable
//	TBCTL &= ~(0x0002); //interrupt disable
#if (RTIME > 0) || (WTGTIME > 0) || (CTIME > 0)
	TBCTL &= ~(0x0020); //set bit 5 to zero(halt!)
#endif
    	init_hw();
//	WISP_init();
	GPIO(PORT_LED_1, DIR) |= BIT(PIN_LED_1);
	GPIO(PORT_LED_2, DIR) |= BIT(PIN_LED_2);
#if defined(PORT_LED_3)
	GPIO(PORT_LED_3, DIR) |= BIT(PIN_LED_3);
#endif
#ifdef CONFIG_EDB
	//debug_setup();
	edb_init();
#endif

	INIT_CONSOLE();
	__enable_interrupt();
	set_dirty_buf(&data, &data_dest, &data_size);
}
void func5(){
	GV(c)++;
	func7();
	func8();
	func9();
}
void func4(){
	GV(b)++;

}
void func9(){
	GV(e).a++;
}
void func1(){
	GV(a) = 0;
	func5();
	func6();
}
void task_init()
{
	GV(a) = 0;
	GV(b) = 0;
	GV(c) = 0;
	GV(d) = 0;
	GV(e).a = 0;
	GV(e).b = 0;
	GV(e).c = 0;
	for (int i =0; i < 5; ++i)
		GV(f, i) = 0;
	TRANSITION_TO(task_A);
}
void func8(){
	GV(e).b++;
}
void func7(){
	GV(d)++;
}
void func6(){
	GV(f, 0)++;

}
void func2(){
	GV(c)++;
	func6();
	func3();

}
void task_A()
{
	GV(f, 2) = 1;
	GV(b)++;
//	GV(e).a++;
	func1();
	printf("a\n");
	TRANSITION_TO(task_B);
}
void func3(){
	GV(f, 1)++;
	func4();

}
void task_B()
{
	GV(b)++;
	func6();
//	func2();
//	func3();
	TRANSITION_TO(task_A);
}
ENTRY_TASK(task_init)
INIT_FUNC(init)
