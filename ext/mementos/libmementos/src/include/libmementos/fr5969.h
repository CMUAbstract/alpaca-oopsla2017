#include <msp430.h>

#define TOPOFSTACK 0x2400
#define STARTOFDATA 0x1C00
#define FRAM_END 0xFF7F /*BRANDON: hacked to accomodate mov vs. movx bug*/
