#include <msp430.h>
#include <libio/log.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>
#ifdef CONFIG_LIBEDB_PRINTF
#include <libedb/edb.h>
#endif
static void init_hw()
{
    msp_watchdog_disable();
    msp_gpio_unlock();
    msp_clock_setup();
}

int main()
{
//	WISP_init();
    	init_hw();
#ifdef CONFIG_EDB
	//debug_setup();
	edb_init();
#endif
	INIT_CONSOLE();
	__enable_interrupt();
	while(1){
//		WATCHPOINT(1);
		PRINTF("%u\r\n",5);
		PRINTF("%x\r\n",255);
		PRINTF("test\r\n");
	}
	return 0;
}
