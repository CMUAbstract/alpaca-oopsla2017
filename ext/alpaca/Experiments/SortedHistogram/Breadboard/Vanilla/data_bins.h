volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin0;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin1;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin2;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin3;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin4;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin5;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin6;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin7;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin8;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin9;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataBin10;
unsigned __histo_read__NV_dataBin(unsigned i){
  if( i == 0 ){
    return __NV_dataBin0;
  }else if( i == 1 ){
    return __NV_dataBin1;
  }else if( i == 2 ){
    return __NV_dataBin2;
  }else if( i == 3 ){
    return __NV_dataBin3;
  }else if( i == 4 ){
    return __NV_dataBin4;
  }else if( i == 5 ){
    return __NV_dataBin5;
  }else if( i == 6 ){
    return __NV_dataBin6;
  }else if( i == 7 ){
    return __NV_dataBin7;
  }else if( i == 8 ){
    return __NV_dataBin8;
  }else if( i == 9 ){
    return __NV_dataBin9;
  }else if( i == 10 ){
    return __NV_dataBin10;
  }else { /*should never get here!*/ return 0; }
}
void __histo_write__NV_dataBin(unsigned i,unsigned v){
  if( i == 0 ){
    __NV_dataBin0 = v;
  }else if( i == 1 ){
    __NV_dataBin1 = v;
  }else if( i == 2 ){
    __NV_dataBin2 = v;
  }else if( i == 3 ){
    __NV_dataBin3 = v;
  }else if( i == 4 ){
    __NV_dataBin4 = v;
  }else if( i == 5 ){
    __NV_dataBin5 = v;
  }else if( i == 6 ){
    __NV_dataBin6 = v;
  }else if( i == 7 ){
    __NV_dataBin7 = v;
  }else if( i == 8 ){
    __NV_dataBin8 = v;
  }else if( i == 9 ){
    __NV_dataBin9 = v;
  }else if( i == 10 ){
    __NV_dataBin10 = v;
  }else { /*should never get here!*/ return; }
}
