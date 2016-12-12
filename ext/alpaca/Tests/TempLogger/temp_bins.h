volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin0;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin1;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin2;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin3;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin4;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin5;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin6;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin7;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin8;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin9;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_tempBin10;
unsigned __dino_read__NV_tempBin(unsigned i){
  if( i == 0 ){
    return __NV_tempBin0;
  }else if( i == 1 ){
    return __NV_tempBin1;
  }else if( i == 2 ){
    return __NV_tempBin2;
  }else if( i == 3 ){
    return __NV_tempBin3;
  }else if( i == 4 ){
    return __NV_tempBin4;
  }else if( i == 5 ){
    return __NV_tempBin5;
  }else if( i == 6 ){
    return __NV_tempBin6;
  }else if( i == 7 ){
    return __NV_tempBin7;
  }else if( i == 8 ){
    return __NV_tempBin8;
  }else if( i == 9 ){
    return __NV_tempBin9;
  }else if( i == 10 ){
    return __NV_tempBin10;
  }else { /*should never get here!*/ return 0; }
}
void __dino_write__NV_tempBin(unsigned i,unsigned v){
  if( i == 0 ){
    __NV_tempBin0 = v;
  }else if( i == 1 ){
    __NV_tempBin1 = v;
  }else if( i == 2 ){
    __NV_tempBin2 = v;
  }else if( i == 3 ){
    __NV_tempBin3 = v;
  }else if( i == 4 ){
    __NV_tempBin4 = v;
  }else if( i == 5 ){
    __NV_tempBin5 = v;
  }else if( i == 6 ){
    __NV_tempBin6 = v;
  }else if( i == 7 ){
    __NV_tempBin7 = v;
  }else if( i == 8 ){
    __NV_tempBin8 = v;
  }else if( i == 9 ){
    __NV_tempBin9 = v;
  }else if( i == 10 ){
    __NV_tempBin10 = v;
  }else { /*should never get here!*/ return; }
}
