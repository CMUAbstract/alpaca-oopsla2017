#include <msp430.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stdio.h>
#include <adxl362z.h>

#define LOW_POWER // don't use LEDs

#define MODEL_SIZE 100
#define NUM_FEATURES 2
#define ACCEL_WINDOW_SIZE 4
static float stationary[MODEL_SIZE] = {
#include "int_stationary_model.h"
};

static float walking[MODEL_SIZE] = {
#include "int_walking_model.h"
};

extern volatile unsigned int __NV_walkingCount asm("0xD000"); //= (unsigned int*)0xD000;
extern volatile unsigned int __NV_stationaryCount asm("0xD002"); //= (unsigned int*)0xD002;
extern volatile unsigned int __NV_totalCount asm("0xD004"); //= (unsigned int*)0xD004;

typedef long int accelReading[3];
typedef accelReading accelWindow[ACCEL_WINDOW_SIZE];

static accelWindow aWin;
static int currSamp = 0;

static accelReading mean;
static accelReading stddev;

static long int meanmag;
static long int stddevmag;

void getOneSample(accelReading tr){

  long x = (long)ACCEL_getX();
  long y = (long)ACCEL_getY();
  long z = (long)ACCEL_getZ();

  tr[0] = x;
  tr[1] = y;
  tr[2] = z;

}

void getNextSample(){

  getOneSample( aWin[currSamp] );
  currSamp = (currSamp + 1);
  if( currSamp >= ACCEL_WINDOW_SIZE ){
    currSamp = 0;
  }

}


void featurize(){

  mean[0] = mean[1] = mean[2] = 0;
  stddev[0] = stddev[1] = stddev[2] = 0;
  int i;
  for(i = 0; i < ACCEL_WINDOW_SIZE; i++){
    mean[0] = mean[0] + aWin[i][0];//x
    mean[1] = mean[1] + aWin[i][1];//y
    mean[2] = mean[2] + aWin[i][2];//z
  }
  mean[0] = mean[0] / ACCEL_WINDOW_SIZE;
  mean[1] = mean[1] / ACCEL_WINDOW_SIZE;
  mean[2] = mean[2] / ACCEL_WINDOW_SIZE;

  for(i = 0; i < ACCEL_WINDOW_SIZE; i++){
    stddev[0] += aWin[i][0] > mean[0] ? aWin[i][0] - mean[0] : mean[0] - aWin[i][0];//x
    stddev[1] += aWin[i][1] > mean[1] ? aWin[i][1] - mean[1] : mean[1] - aWin[i][1];//x
    stddev[2] += aWin[i][2] > mean[2] ? aWin[i][2] - mean[2] : mean[2] - aWin[i][2];//x
  }
  stddev[0] = stddev[0] / (ACCEL_WINDOW_SIZE-1);
  stddev[1] = stddev[1] / (ACCEL_WINDOW_SIZE-1);
  stddev[2] = stddev[2] / (ACCEL_WINDOW_SIZE-1);
 
  meanmag = mean[0] + mean[1] + mean[2] / 3;
  stddevmag = stddev[0] + stddev[1] + stddev[2] / 3;

}

#define MODEL_COMPARISONS 10
int classify(){

  int walk_less_error = 0;
  int stat_less_error = 0;
  int i;
  for( i = 0; i < MODEL_COMPARISONS; i+=NUM_FEATURES ){

    long int stat_mean_err = (stationary[i] > meanmag) ?
                          (stationary[i] - meanmag) :
                          (meanmag - stationary[i]);

    long int stat_sd_err =   (stationary[i+1] > stddevmag) ?
                          (stationary[i+1] - stddevmag) :
                          (stddevmag - stationary[i+1]);
    
    long int walk_mean_err = (walking[i] > meanmag) ?
                          (walking[i] - meanmag) :
                          (meanmag - walking[i]);

    long int walk_sd_err =   (walking[i+1] > stddevmag) ?
                          (walking[i+1] - stddevmag) :
                          (stddevmag - walking[i+1]);

    if( walk_mean_err < stat_mean_err ){
      walk_less_error ++;
    }else{
      stat_less_error ++;
    }

    if( walk_sd_err < stat_sd_err ){
      walk_less_error ++;
    }else{
      stat_less_error ++;
    }
    
  }

  if(walk_less_error > stat_less_error ){
    return 1;
  }else{
    return 0;
  }

}




void initializeNVData(){
  
  /*The erase-initial condition*/
  if(__NV_walkingCount == 0xffff &&
     __NV_stationaryCount == 0xffff &&
     __NV_totalCount == 0xffff){
    
    __NV_walkingCount = 0;
    __NV_stationaryCount = 0;
    __NV_totalCount = 0;

  }

}

void initializeHardware(){

  /*Before anything else, do the device hardware configuration*/
  
  P1DIR |= 0x01;// Set P1.0 to output direction
#ifndef LOW_POWER
  P1OUT = 0x01;// Toggle P1.0 using exclusive-OR
#endif

#ifndef LOW_POWER
  P4DIR |= BIT4 | BIT5;// Set P4.4/5 to output direction
  P4OUT |= BIT4 | BIT5;// Toggle P4.4/5 using exclusive-OR
  int i;
  for(i = 0; i < 0xffff; i++);
  P4OUT &= ~BIT4;// Toggle P4.4 using exclusive-OR
  P4OUT &= ~BIT5;// Toggle P4.5 using exclusive-OR
#endif

  ACCEL_setup();
  ACCEL_SetReg(0x2D,0x02); 

}

void clearExperimentalData(){
   
#ifndef LOW_POWER
  P4OUT |= BIT4 | BIT5;// Toggle P4.4/5 using exclusive-OR
#endif
  __NV_walkingCount = 0;
  __NV_stationaryCount = 0;
  __NV_totalCount = 0;
#ifndef LOW_POWER
  int i;
  for(i = 0; i < 0xffff; i++);
  P4OUT &= ~BIT4;// Toggle P4.4 using exclusive-OR
  P4OUT &= ~BIT5;// Toggle P4.5 using exclusive-OR
#endif
  
}

__attribute__((section(".init9"), aligned(2)))
int main(int argc, char *argv[]){
  WDTCTL = WDTPW | WDTHOLD;// Stop watchdog timer
  PM5CTL0 &= ~LOCKLPM5;

  initializeHardware();
  initializeNVData();
  while(1){
    

    while( (__NV_totalCount) >= 100 ){

      if( P4IN & BIT6 ){
        clearExperimentalData();
      }

    }

    if( P4IN & BIT6 ){

      clearExperimentalData();

    }

    getNextSample();
    P1OUT ^= 0x01;

    featurize();

    int class = classify();
    
      

    /*__NV_totalCount, __NV_walkingCount, and __NV_stationaryCount 
    have an nv-internal consistency requirement.
    This code should be atomic.
    */

    __NV_totalCount++;

    int q;
    for(q = 0; q < 0xFF; q++);

    if(class){
#ifndef LOW_POWER
      P4OUT &= ~BIT4;
      P4OUT |= BIT5;
#endif
      (__NV_walkingCount)++;
    }else{
#ifndef LOW_POWER
      P4OUT &= ~BIT5;// Toggle P1.0 using exclusive-OR
      P4OUT |= BIT4;
#endif
      (__NV_stationaryCount)++;
    }

  }

}

