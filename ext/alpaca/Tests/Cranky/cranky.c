#include <msp430.h>

void adc12_setup();
int adc12_sample();

#define DIR_BUFF_SIZE 10
int direction_buffer[DIR_BUFF_SIZE] = {0};
int which_dir_buff = 0;

int read_direction = 0;

int main(void) {

  WDTCTL = WDTPW | WDTHOLD;// Stop watchdog timer
  PMMCTL0 = PMMPW;// Open PMM Module
  PM5CTL0 &= ~LOCKLPM5;// Clear locked IO Pins
  P1DIR |= 0x01;// Set P1.0 to output direction
  P4DIR |= 0x01;// Set P4.0 to output direction
  //P1DIR |= 0x02;// Set P1.1 to output direction
  // Leave P1.2 as input direction

  P1OUT |= 0x01;// Toggle P1.0 using exclusive-OR
  adc12_setup();
  
  for(;;) {

    volatile int speed = getspeed();// volatile to prevent optimization
    volatile int speediter = speed * 5;

    volatile int dir = getdirection();
    volatile int diriter = dir * 5;

    do{

      speediter--;
      diriter--;
      
      if(speediter <= 0){
        P1OUT ^= 0x01;// Toggle P1.0 using exclusive-OR
        speed = getspeed();
        speediter = speed * 5;
      }

      if(diriter <= 0){
        P4OUT ^= 0x01;
        dir = getdirection();
        diriter = dir * 5;
      }
    

    }while(1);

  }

  return 0;

}

int getspeed(){

  int i = adc12_sample_chan(ADC12INCH_1);//Speed should be connected to Pin 2
  return i;
  /*postcondition: return value is speed between 0 and 4096*/
}

int getdirection(){

  //ccw = ~0V 
  //cw = ~2V 
  int i = adc12_sample_chan(ADC12INCH_2);//Speed should be connected to Pin 3
  return i;

}
