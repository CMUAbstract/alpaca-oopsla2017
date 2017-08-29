#include "dino.h"

unsigned qwerty = 93000;

int baz(float j){
  int i = (int)j;
  return i;
}

int bar(void){
  int i = 0; 

  for(i = 0; i < 1000; i++){
    qwerty++; 
  }

  return qwerty;
}

int foo(void){

  int i = 0;
  for(i = 0; i < 1000; i++){
   
    __DINO_task_boundary(&i);
    if(i % 2){
      __DINO_task_boundary(&i);
      i = bar();
    }

    if( i == 17 ){
      __DINO_task_boundary(&i);
      float j = i * i;
      j = j / 2.314;
      i = baz(j);
    }

    __NV_x = i;

  }


}

int main (void) {
    volatile unsigned y = 13;
    unsigned z;

   
    __asm__("nop"); 
    z = __DINO_task_boundary(&z);
    __asm__("nop"); 

    if (y == __numboundaries) {
        __NV_x = y;
        z = __NV_x;
    } else {
        z = y;
    }

    z = __DINO_task_boundary(&z);

    y = __NV_x;
    z = y;

    return z;
}
