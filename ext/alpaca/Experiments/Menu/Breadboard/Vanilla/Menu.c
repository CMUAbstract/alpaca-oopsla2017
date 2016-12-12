#include <stdlib.h>
#include <limits.h>

#include <msp430.h>

#define STATE_BUTTON_OPEN 0
#define STATE_BUTTON_CLOSED 1
#define STATE_DONE 2
#define STATE_UPDATING 3
#define STATE_ERROR 4

#define NUM_LEDS 3
#define MAX_LED 2 /*0,1, & 2*/
#define LED_STATE_COUNT 10 

#undef USE_LEDS
#undef FLASH_ON_BOOT

/*currTemp is a pointer to the current entry in the data log*/
volatile __attribute__((section("FRAMVARS"))) unsigned int currentState;
volatile __attribute__((section("FRAMVARS"))) unsigned int currentLED;
volatile __attribute__((section("FRAMVARS"))) unsigned int inErrorState;
volatile __attribute__((section("FRAMVARS"))) unsigned int initialized;
volatile __attribute__((section("FRAMVARS"))) unsigned int reboots;
volatile __attribute__((section("FRAMVARS"))) int pressCount;
volatile __attribute__((section("FRAMVARS"))) unsigned int frameBuffer0;
volatile __attribute__((section("FRAMVARS"))) unsigned int frameBuffer1;
volatile __attribute__((section("FRAMVARS"))) unsigned int frameBuffer2;

const char LEDStates[LED_STATE_COUNT] = {0,1,2,1,0,2,0,1,2,1};

void abortWithError(){
  
  inErrorState = 0xBEEE;  

  P1OUT |= BIT0;
  P4OUT &= ~BIT3;
  P4OUT &= ~BIT4;

  while(1){ P1OUT ^= BIT0; P4OUT ^= BIT3; int i; for(i = 0; i < 0xfff;i++); }

}

void LEDOff(){

  if( currentLED == 0 ){
    P1OUT &= ~BIT0;
  }else if( currentLED == 1 ){
    P4OUT &= ~BIT3;
  }else if( currentLED == 2 ){
    P4OUT &= ~BIT4;
  }

}

void LEDOn(){

  if( currentLED == 0 ){
    P1OUT |= BIT0;
  }else if( currentLED == 1 ){
    P4OUT |= BIT3;
  }else if( currentLED == 2 ){
    P4OUT |= BIT4;
  }

}
 
void initializeHardware(){
  
  P1DIR |= BIT0;
  P4DIR |= BIT3;// Set P4.3 to output direction
  P4DIR |= BIT4;// Set P4.4 to output direction
  P4DIR &= ~BIT6;// Set P4.6 to output direction
  P1OUT &= ~BIT0;  
  P4OUT &= ~BIT3;  
  P4OUT &= ~BIT4;  
#if defined(USE_LEDS) && defined(FLASH_ON_BOOT)
  P1OUT |= BIT0;
  P4OUT |= BIT3;
  P4OUT |= BIT4;
  int i;
  for (i = 0; i < 0xffff; i++)
    ;
  P1OUT &= ~BIT0;  
  P4OUT &= ~BIT3;  
  P4OUT &= ~BIT4;  
#endif //USE LEDS

}

void initializeNVData() {
  if(initialized != 0xBEEE){
    currentState = 0;
    currentLED = 0;    
    reboots = 0;
    pressCount = -1;
    LEDOn();
    frameBuffer0 = 0;
    frameBuffer1 = 0;
    frameBuffer2 = 0;
  }
  initialized = 0xBEEE;
}

void nextLED(){

  /*If this gets called twice, we'll see
    an idempotence violation in the form
    of the thing jumping two LEDs ahead*/
  currentLED++;
  if( currentLED > MAX_LED ){
    currentLED = 0;
  }

}

void celebrate(){

  int i;
  P1OUT &= ~BIT0;
  P4OUT &= ~BIT3;
  P4OUT &= ~BIT4;
  P1OUT |= BIT0;
  for(i = 0; i < 0xff; i++);
  P1OUT &= ~BIT0;
  P4OUT |= BIT3;
  for(i = 0; i < 0xff; i++);
  P4OUT &= ~BIT3;
  P4OUT |= BIT4;
  for(i = 0; i < 0xff; i++);
  P4OUT &= ~BIT4;
   
}

void updateText(){
  
  char state[6] = {'s','t','a','t','e',0};
  state[5] = (char)(pressCount + 48);

  unsigned c = state[0]; 
  frameBuffer0 = c;

  c = state[1]; 
  frameBuffer0 = frameBuffer0 | (c << 8);

  c = state[2]; 
  frameBuffer1 = c;

  c = state[3]; 
  frameBuffer1 = frameBuffer1 | (c << 8);

  c = state[4]; 
  frameBuffer2 = c;

  c = state[5]; 
  frameBuffer2 = frameBuffer2 | (c << 8);

}

void buttonUp(){

  LEDOff();
  nextLED();
  LEDOn();

}

void buttonDown(){

}

__attribute__((section(".init9"), aligned(2)))
int main(void){

  WDTCTL = WDTPW | WDTHOLD;  // Stop watchdog timer
  PM5CTL0 &= ~LOCKLPM5;
  initializeHardware();

  if( inErrorState == 0xBEEE ){

    abortWithError();

  }
  
  initializeNVData();

  reboots++;

  while( 1 ){

    if( currentState == STATE_BUTTON_OPEN ){

      LEDOn();
      if( P4IN & BIT6 ){ 
        buttonDown();
        currentState = STATE_BUTTON_CLOSED;
      } /*Button not pressed, so wait*/

    }else if( currentState == STATE_BUTTON_CLOSED ){
      
      LEDOn();
      if( !(P4IN & BIT6) ){  

          currentState = STATE_UPDATING;

      } /*Button is still pressed, so hang here*/
    
    }else if( currentState == STATE_UPDATING){

      pressCount++;/*TODO: update a buffer below celebrate 
                     based on teh value of pressCOunt, then
                     check the buffer has all entries full
                      */
      celebrate();
      updateText();
      if( pressCount < LED_STATE_COUNT ){
        currentLED = LEDStates[pressCount];
        currentState = STATE_BUTTON_OPEN;
      }else if( pressCount == LED_STATE_COUNT ){
        currentState = STATE_DONE;
      }else{
        currentState = STATE_ERROR;
      }


    }else if( currentState == STATE_DONE ){
      
      int i;
      for(i = 0; i < NUM_LEDS; i++){
        currentLED = i;
        LEDOff();
      }

      if( P4IN & BIT6 ){

        pressCount = -1;
        currentLED = 0; 
        while( P4IN & BIT6 ) ;
        LEDOn();
        currentState = STATE_BUTTON_OPEN;

      } 



    }else{

      abortWithError(); 

    }


  }

}
