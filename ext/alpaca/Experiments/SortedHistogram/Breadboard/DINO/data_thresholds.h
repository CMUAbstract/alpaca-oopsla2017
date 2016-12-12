volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh0;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh1;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh2;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh3;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh4;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh5;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh6;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh7;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh8;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh9;
volatile __attribute__((section("FRAMVARS"))) unsigned int __NV_dataThresh10;
unsigned __histo_read__NV_dataThresh(unsigned i){
  if( i == 0 ){
    return __NV_dataThresh0;
  }else if( i == 1 ){
    return __NV_dataThresh1;
  }else if( i == 2 ){
    return __NV_dataThresh2;
  }else if( i == 3 ){
    return __NV_dataThresh3;
  }else if( i == 4 ){
    return __NV_dataThresh4;
  }else if( i == 5 ){
    return __NV_dataThresh5;
  }else if( i == 6 ){
    return __NV_dataThresh6;
  }else if( i == 7 ){
    return __NV_dataThresh7;
  }else if( i == 8 ){
    return __NV_dataThresh8;
  }else if( i == 9 ){
    return __NV_dataThresh9;
  }else if( i == 10 ){
    return __NV_dataThresh10;
  }else { /*should never get here!*/ return 0; }
}
void __histo_write__NV_dataThresh(unsigned i,unsigned v){
  if( i == 0 ){
    __NV_dataThresh0 = v;
  }else if( i == 1 ){
    __NV_dataThresh1 = v;
  }else if( i == 2 ){
    __NV_dataThresh2 = v;
  }else if( i == 3 ){
    __NV_dataThresh3 = v;
  }else if( i == 4 ){
    __NV_dataThresh4 = v;
  }else if( i == 5 ){
    __NV_dataThresh5 = v;
  }else if( i == 6 ){
    __NV_dataThresh6 = v;
  }else if( i == 7 ){
    __NV_dataThresh7 = v;
  }else if( i == 8 ){
    __NV_dataThresh8 = v;
  }else if( i == 9 ){
    __NV_dataThresh9 = v;
  }else if( i == 10 ){
    __NV_dataThresh10 = v;
  }else { /*should never get here!*/ return; }
}
