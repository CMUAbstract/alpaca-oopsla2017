#include <string.h>
#include <msp430.h>
#include <dino.h>

#undef DO_TASKS
#undef DO_RECOVERY

#define ARR_BASE 0xD000

#ifndef ARR_LEN
#define ARR_LEN 0x0400
#endif

#define ARR_BND (ARR_BASE + ARR_LEN)


#define MAX_VAL 256
/*These two numbers should be incremented together
  and should have the same value at the end of the
  execution
*/
volatile unsigned int *arr = (unsigned int *)ARR_BASE;
volatile unsigned int *arrBnd = (unsigned int *)ARR_BND;
volatile unsigned int *ptr;

#ifdef DO_TASKS

#define ATOMIC_TASK 0
DINO_RECOVERY_ROUTINE_LIST_BEGIN()

  DINO_RECOVERY_RTN_BEGIN(ATOMIC_TASK)

    #ifdef DO_RECOVERY
    unsigned int *VERSION_arr = DINO_BIND(unsigned int *)   
    int i;
    for(i = 0; i < arrBnd-arr /*ptr arithmetic! int: 4 - 0 = 2!*/; i++){
      arr[i] = VERSION_arr[i];
    }
    #endif

  DINO_RECOVERY_RTN_END()

DINO_RECOVERY_ROUTINE_LIST_END()

#endif /*DO_RECOVERY*/

/*TODO: Macrofy and put in DINO_RESTORE_CHECK*/
DINO_DO_ALWAYS(){

  WDTCTL = WDTPW | WDTHOLD;// Stop watchdog timer
  PMMCTL0 = PMMPW;// Open PMM Module
  PM5CTL0 &= ~LOCKLPM5;// Clear locked IO Pins
  
  P1DIR |= 0x01;// Set P1.0 to output direction
  P1OUT &= ~0x01;// Toggle P1.0 using exclusive-OR
  
  if( *arr == 0xFFFF ){
    /*First-start initialization -- safe to do always*/
    ptr = arrBnd;
    while( ptr >= arr ){
      *ptr = 0;
      ptr--; 
    }
  }

  if( *arr >= MAX_VAL){
    P1OUT |= 0x01;// Toggle P1.0 using exclusive-OR
  }

}

int main(void) {

  #ifdef DO_TASKS

  #ifdef DO_RECOVERY
  unsigned int VERSION_arr[(arrBnd - arr)];
  DINO_DO_ALWAYS();
  DINO_RESTORE_CHECK()

  #endif

  #endif

  for(;;) {

    #ifdef DO_TASKS

    #ifdef DO_RECOVERY
    unsigned int *vptr = &(VERSION_arr[0]);
    unsigned int *gptr = arr;
    while( gptr < arrBnd ){
      *vptr = *gptr;
      vptr++;
      gptr++;
    }
    DINO_TASK_BOUNDARY(ATOMIC_TASK,VERSION_arr) 

    #else

    DINO_TASK_BOUNDARY(ATOMIC_TASK,NULL) 

    #endif

    #endif
    if( *arr == 0xFFFF ){
      /*First-start initialization -- safe to do always*/
      ptr = arrBnd;
      while( ptr >= arr ){
        *ptr = 0;
        ptr--; 
      }
    }

    if( *arr < MAX_VAL){

      ptr = arr;
      while( ptr < arrBnd  ){
        (*ptr)++; 
        ptr++;
      }

    }else{
      P1OUT |= 0x01;// Toggle P1.0 using exclusive-OR
    }

  }

  return 0;

}
