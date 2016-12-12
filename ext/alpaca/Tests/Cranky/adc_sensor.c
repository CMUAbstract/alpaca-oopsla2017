#include <msp430.h>


void adc12_setup(){

}

int adc12_sample_chan(unsigned ADC_Chan){

  /*Precondition: ADC_Chan is one of the ADC12INCH_x defines*/
  /*See mspgcc/msp430/include/msp430xxyyzz.h*/

  ADC12CTL0 &= ~ADC12ENC;
  ADC12CTL0 |= ADC12SHT0_8 | ADC12ON;
  ADC12CTL1 |= ADC12SHP;
  ADC12MCTL0 |= ADC_Chan | ADC12VRSEL_0;
  ADC12CTL0 |= ADC12SC | ADC12ENC;
  ADC12IFGR0 = 0;
  ADC12IER0 = ADC12IE0;
  while (ADC12CTL1 & ADC12BUSY);
  int ret = ADC12MEM0;
  ADC12CTL0 &= ~ADC12ENC;
  ADC12CTL1 = 0;
  ADC12CTL0 = 0;
 
  return ret;

}
