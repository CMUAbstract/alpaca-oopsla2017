volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh0;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh1;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh2;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh3;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh4;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh5;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh6;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh7;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh8;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh9;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempThresh10;
unsigned __dino_read__NV_tempThresh(unsigned i){
  if( i == 0 ){
    return __NV_tempThresh0;
  }else if( i == 1 ){
    return __NV_tempThresh1;
  }else if( i == 2 ){
    return __NV_tempThresh2;
  }else if( i == 3 ){
    return __NV_tempThresh3;
  }else if( i == 4 ){
    return __NV_tempThresh4;
  }else if( i == 5 ){
    return __NV_tempThresh5;
  }else if( i == 6 ){
    return __NV_tempThresh6;
  }else if( i == 7 ){
    return __NV_tempThresh7;
  }else if( i == 8 ){
    return __NV_tempThresh8;
  }else if( i == 9 ){
    return __NV_tempThresh9;
  }else if( i == 10 ){
    return __NV_tempThresh10;
  }else { /*should never get here!*/ return 0; }
}
void __dino_write__NV_tempThresh(unsigned i,unsigned v){
  if( i == 0 ){
    __NV_tempThresh0 = v;
  }else if( i == 1 ){
    __NV_tempThresh1 = v;
  }else if( i == 2 ){
    __NV_tempThresh2 = v;
  }else if( i == 3 ){
    __NV_tempThresh3 = v;
  }else if( i == 4 ){
    __NV_tempThresh4 = v;
  }else if( i == 5 ){
    __NV_tempThresh5 = v;
  }else if( i == 6 ){
    __NV_tempThresh6 = v;
  }else if( i == 7 ){
    __NV_tempThresh7 = v;
  }else if( i == 8 ){
    __NV_tempThresh8 = v;
  }else if( i == 9 ){
    __NV_tempThresh9 = v;
  }else if( i == 10 ){
    __NV_tempThresh10 = v;
  }else { /*should never get here!*/ return; }
}
