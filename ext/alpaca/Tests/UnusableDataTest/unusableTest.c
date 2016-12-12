#include <stdlib.h>
#include <msp430.h>
#include <stdarg.h>
#include "../../DinoRuntime/dino.h"

/*Allocate in NV memory*/
unsigned int *x0 = (unsigned int *)0xD000;


#define MAIN_TASK 0x0

DINO_RECOVERY_ROUTINE_LIST_BEGIN()

  DINO_RECOVERY_RTN_BEGIN( MAIN_TASK )

        unsigned int oldx = DINO_BIND(unsigned int); 
        *x0 = oldx;

  DINO_RECOVERY_RTN_END() 

DINO_RECOVERY_ROUTINE_LIST_END()        

int main(int argc, char *argv[]){
  
  WDTCTL = WDTPW | WDTHOLD;// Stop watchdog timer
  PMMCTL0 = PMMPW;// Open PMM Module
  PM5CTL0 &= ~LOCKLPM5;// Clear locked IO Pins
  P1DIR |= 0x01;// Set P1.0 to output direction

  DINO_RESTORE_CHECK()  

  *x0 = 10;
  
  unsigned int oldx; 
  while(1){

    DINO_TASK_BOUNDARY( MAIN_TASK, oldx );   
 
    /*oldx is to restore *x0 after the light loop*/
    oldx = *x0;

    P1OUT = 0x1;
    while(*x0 < (oldx * 1000)){ (*x0) = (*x0) + 1;}
    P1OUT = 0x0;
    while(*x0 > oldx){ (*x0) = (*x0) - 1;}

    (oldx)--;
    *x0 = oldx;

    if( oldx <= 0 ){
      *x0 = 10;
    }

  }

}
