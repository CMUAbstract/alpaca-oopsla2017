#include <stdlib.h>
#include <limits.h>

#include <msp430.h>

#include <dino.h>

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

#define NOTEOFF 0x80
#define NOTEON 0x90
#define MAXCHAN 0x0F //0x83 - chan 3, off; 0x9c - chan 13 on; etc
#define MAXNOTE 0x7F //Keys 0 -- 127
#define MAXVEL 0x7F //Strike velocity 0 -- 127
#define MAXPACKETS 10000
#define BUFLEN  3

#define INIT_TASK 0
#define INPUT_TASK 1
#define MSG_TASK 2
#define SEND_TASK 3

DINO_RECOVERY_ROUTINE_LIST_BEGIN()

  DINO_RECOVERY_RTN_BEGIN(INIT_TASK)
  DINO_RECOVERY_RTN_END()

  DINO_RECOVERY_RTN_BEGIN(INPUT_TASK)
  DINO_RECOVERY_RTN_END()
  
  DINO_RECOVERY_RTN_BEGIN(MSG_TASK)
  DINO_RECOVERY_RTN_END()
  
  DINO_RECOVERY_RTN_BEGIN(SEND_TASK)
  DINO_RECOVERY_RTN_END()

DINO_RECOVERY_ROUTINE_LIST_END()




typedef struct _MIDImsg{
  unsigned int seqNum;
  unsigned char status; /*NOTEOFF or NOTEON*/
  unsigned char data0;   /*Key number*/
  unsigned char data1;   /*Velocity (0 - 127)*/
} MIDImsg;


typedef struct _MIDIbuf{

  MIDImsg msg0;
  MIDImsg msg1;
  MIDImsg msg2;
  MIDImsg msg3;

} MIDIbuf;



/*currTemp is a pointer to the current entry in the data log*/
volatile __attribute__((section("FRAMVARS"))) unsigned int currentState;
volatile __attribute__((section("FRAMVARS"))) unsigned int currentLED;
volatile __attribute__((section("FRAMVARS"))) unsigned int inErrorState;
volatile __attribute__((section("FRAMVARS"))) unsigned int initialized;
volatile __attribute__((section("FRAMVARS"))) unsigned int reboots;
volatile __attribute__((section("FRAMVARS"))) unsigned int msgSequenceNumber;
volatile __attribute__((section("FRAMVARS"))) unsigned int which;
volatile __attribute__((section("FRAMVARS"))) MIDIbuf MIDIBuf;

/*The "transmission buffer"*/
volatile __attribute__((section("FRAMVARS"))) unsigned char TXvel0;
volatile __attribute__((section("FRAMVARS"))) unsigned char TXvel1;
volatile __attribute__((section("FRAMVARS"))) unsigned char TXvel2;
volatile __attribute__((section("FRAMVARS"))) unsigned char TXvel3;
void abortWithError(){
  
  inErrorState = 0xBEEE;  
  while(1){ P1OUT ^= BIT0; int i; for(i = 0; i < 0xfff; i++); }

}

 
void initializeHardware(){
  
  P1DIR |= BIT0;
  P4DIR |= BIT4;// Set P4.4 to output direction
  P1OUT &= ~BIT0;  
  P4OUT &= ~BIT4;  
#if defined(USE_LEDS) && defined(FLASH_ON_BOOT)
  P1OUT |= BIT0;
  P4OUT |= BIT4;
  int i;
  for (i = 0; i < 0xffff; i++)
    ;
  P1OUT &= ~BIT0;  
  P4OUT &= ~BIT4;  
#endif //USE LEDS

}

void initializeNVData() {

  if(initialized != 0xBEEE){

    currentState = 0;
    currentLED = 0;    
    reboots = 0;

    msgSequenceNumber = 0;
    which = -1;
    MIDIBuf.msg0.seqNum = 0xFFFF;
    MIDIBuf.msg0.status = 0xFF;
    MIDIBuf.msg0.data0 = 0xFF; /*for now... -- eventually this should be the speed/dir*/
    MIDIBuf.msg0.data1 = 0xFF;

    MIDIBuf.msg1.seqNum = 0xFFFF;
    MIDIBuf.msg1.status = 0xFF;
    MIDIBuf.msg1.data0 = 0xFF; /*for now... -- eventually this should be the speed/dir*/
    MIDIBuf.msg1.data1 = 0xFF;

    MIDIBuf.msg2.seqNum = 0xFFFF;
    MIDIBuf.msg2.status = 0xFF;
    MIDIBuf.msg2.data0 = 0xFF; /*for now... -- eventually this should be the speed/dir*/
    MIDIBuf.msg2.data1 = 0xFF;

    MIDIBuf.msg3.seqNum = 0xFFFF;
    MIDIBuf.msg3.status = 0xFF;
    MIDIBuf.msg3.data0 = 0xFF; /*for now... -- eventually this should be the speed/dir*/
    MIDIBuf.msg3.data1 = 0xFF;
  }

  initialized = 0xBEEE;
}

void addMIDIMessage(unsigned int speed, unsigned int direction){

    which++; 
    msgSequenceNumber++;
    switch(which){

      case 0:
      MIDIBuf.msg0.seqNum = msgSequenceNumber;
      MIDIBuf.msg0.status = NOTEON;
      MIDIBuf.msg0.data0 = 0x80; /*for now... -- eventually this should be the speed/dir*/
      MIDIBuf.msg0.data1 = speed % MAXVEL;
      break;

      case 1:
      MIDIBuf.msg1.seqNum = msgSequenceNumber;
      MIDIBuf.msg1.status = NOTEON;
      MIDIBuf.msg1.data0 = 0x80; /*for now... -- eventually this should be the speed/dir*/
      MIDIBuf.msg1.data1 = speed % MAXVEL;
      break;
      
      case 2:
      MIDIBuf.msg2.seqNum = msgSequenceNumber;
      MIDIBuf.msg2.status = NOTEON;
      MIDIBuf.msg2.data0 = 0x80; /*for now... -- eventually this should be the speed/dir*/
      MIDIBuf.msg2.data1 = speed % MAXVEL;
      break;

      case 3:
      MIDIBuf.msg3.seqNum = msgSequenceNumber;
      MIDIBuf.msg3.status = NOTEON;
      MIDIBuf.msg3.data0 = 0x80; /*for now... -- eventually this should be the speed/dir*/
      MIDIBuf.msg3.data1 = speed % MAXVEL;
      break;

      default:
      abortWithError();
      break;

    };
    
}


void sendAllMessages(){

  P4OUT ^= BIT4;

  TXvel0 = MIDIBuf.msg0.data1;
  MIDIBuf.msg0.seqNum = 0xFFFF;
  MIDIBuf.msg0.status = 0xFF;
  MIDIBuf.msg0.data0 = 0xFF; /*for now... -- eventually this should be the speed/dir*/
  MIDIBuf.msg0.data1 = 0xFF;

  TXvel1 = MIDIBuf.msg1.data1;
  MIDIBuf.msg1.seqNum = 0xFFFF;
  MIDIBuf.msg1.status = 0xFF;
  MIDIBuf.msg1.data0 = 0xFF; /*for now... -- eventually this should be the speed/dir*/
  MIDIBuf.msg1.data1 = 0xFF;

  TXvel2 = MIDIBuf.msg2.data1;
  MIDIBuf.msg2.seqNum = 0xFFFF;
  MIDIBuf.msg2.status = 0xFF;
  MIDIBuf.msg2.data0 = 0xFF; /*for now... -- eventually this should be the speed/dir*/
  MIDIBuf.msg2.data1 = 0xFF;

  TXvel3 = MIDIBuf.msg3.data1;
  MIDIBuf.msg3.seqNum = 0xFFFF;
  MIDIBuf.msg3.status = 0xFF;
  MIDIBuf.msg3.data0 = 0xFF; /*for now... -- eventually this should be the speed/dir*/
  MIDIBuf.msg3.data1 = 0xFF;

}
extern int adc12_sample();
void getInput(unsigned int *s, unsigned int *d){

  *s = (unsigned int)adc12_sample();

}

__attribute__((section(".init9"), aligned(2)))
int main(void){

  WDTCTL = WDTPW | WDTHOLD;  // Stop watchdog timer
  PM5CTL0 &= ~LOCKLPM5;

  reboots++;
  initializeHardware();

  if( inErrorState == 0xBEEE ){

    abortWithError();

  }
  
  DINO_RESTORE_CHECK();

  DINO_TASK_BOUNDARY(INIT_TASK,NULL);
  initializeNVData();


  while( msgSequenceNumber < MAXPACKETS ){ 

    unsigned int speed = 0;
    unsigned int direction = 0;

    DINO_TASK_BOUNDARY(INPUT_TASK,NULL);
    getInput(&speed,&direction); /*Reads speed and direction*/

    DINO_TASK_BOUNDARY(MSG_TASK,NULL);
    addMIDIMessage(speed,direction);

    if( which == BUFLEN ){
      DINO_TASK_BOUNDARY(SEND_TASK,NULL);
      sendAllMessages();  
      which = -1;
    }

  }

  P1OUT |= BIT0;
  while(1){};


}
