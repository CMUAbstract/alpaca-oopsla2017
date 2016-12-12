unsigned __dino_task_boundary(unsigned *foo){ printf("FFFFF\n"); }
unsigned __NV_x;

int baz(float j){
  int i = j;
  __NV_x = 100;
  return i;

}

int bar(void){

  int i = 0; 
  for(i = 0; i < 1000; i++){

    if( i % 2 ){

      baz(i + 1); 

    }else{

      baz(i - 1);

    }

  }
 int qwerty = 1000;
  return qwerty;

}

int foo(void){

  unsigned i = 0;
  for(i = 0; i < 1000; i++){
   
    // DINOVersioner should insert versioning (copy NV to V) here
    __DINO_task_boundary(&i);

    // DINOVersioner should unwind the versioning here (copy V to NV)
    i = __DINO_restore(i);

    if(i % 2){

      i = bar();

    }

  }

  return i;
}

int main (void) {

    volatile unsigned y = 13;
    unsigned z;

   
    z = __DINO_task_boundary(&z);

    foo();

    return z;

}
