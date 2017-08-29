/*
 * dataProtec.h
 *
 *  Created on: 16 May 2017
 *      Author: amjad
 */

#include <msp430fr5969.h>
#include <stdint.h>
#include "global.h"

#ifndef INCLUDE_DATAPROTEC_H_
#define INCLUDE_DATAPROTEC_H_

/*
 * Max available memory is 48/2 = 24
 * Page size = 1KB
 * Maximum number of supported pages are 8
 * This code requires linker script modification to put the variables
 * in a known location (the pages locations 0xBF70)
 */


// The location of any page is given by (BIGEN_ROM + pag_tag - PAG_SIZE)
// The TEMP location of any page is given by ( END_ROM - TOT_PAG_SIZE + pag_tag - PAG_SIZE )
#define END_ROM         0xFF70    //  using the address 0xFF7F disables DMA transfer
#define END_RAM         0x2200
#define TAG_SIZE        6
#define PAG_ADDR_SIZE   (16 - TAG_SIZE)
//#define NUM_PAG         8
#define NUM_PAG         8
#define PAG_SIZE        0x0400  // 1KB
#define MS6B            0xfc00
#define RAM_PAG         (END_RAM - PAG_SIZE)
#define TOT_PAG_SIZE    (PAG_SIZE * NUM_PAG)
#define PAG_SIZE_W      (PAG_SIZE/2)  //1KB
#define BIGEN_ROM       ( (END_ROM - TOT_PAG_SIZE) - TOT_PAG_SIZE  ) // 0xBF70


void __sendPagTemp(unsigned int pagTag);
void __bringPagTemp(unsigned int pagTag);
void __bringPagROM(unsigned int pagTag);
void __sendPagROM(unsigned int pagTag);
unsigned int __pageSwap(unsigned int * varAddr);
void __pagsCommit();
void __bringCrntPagROM();

extern unsigned int CrntPagHeader;  // Holds the address of the first byte of a page

// Memory access interface

// TODO send the page to temp buffer only if we wrote to it
// #define __VAR_TAG(var)               ((uint16_t) (&(var)) )

#define __VAR_ADDR(var)                 ((unsigned int) (&(var)) )

#define __IS_VAR_IN_CRNT_PAG(var)       ( ( __VAR_ADDR(var)  >= CrntPagHeader ) && \
                                        ( __VAR_ADDR(var)  <  (CrntPagHeader+PAG_SIZE) ))

#define __VAR_PT_IN_RAM(var)            (  (__typeof__(var)*) (  (__VAR_ADDR(var) - CrntPagHeader) + RAM_PAG )  )


#define WVAR(var, val)  if( __IS_VAR_IN_CRNT_PAG(var) )\
                                { \
                                    *__VAR_PT_IN_RAM(var) = val ;\
                                }\
                                else{\
                                    __pageSwap(&(var)) ;\
                                    * __VAR_PT_IN_RAM(var) = val;\
                                    }


#define GWVAR(var, oper,val)  if( __IS_VAR_IN_CRNT_PAG(var) )\
                                { \
                                    *__VAR_PT_IN_RAM(var) oper val ;\
                                }\
                                else{\
                                    __pageSwap(&(var)) ;\
                                    * __VAR_PT_IN_RAM(var) oper val;\
                                    }


#define RVAR(var)   (\
                        (  __IS_VAR_IN_CRNT_PAG(var) ) ? \
                        ( * __VAR_PT_IN_RAM(var) ):\
                        ( *(  (__typeof__(var)*) ( (( __pageSwap(&(var)) +  __VAR_ADDR(var) ) - CrntPagHeader)  + RAM_PAG  )  )  )\
                    )
#if 0
#define VAR(var)  if( __IS_VAR_IN_CRNT_PAG(var) )\
                                { \
                                    __VAR_PT_IN_RAM(var) ;\
                                }\
                                else{\
                                    __pageSwap(&(var)) ;\
                                    __VAR_PT_IN_RAM(var) ;\
                                    }
#endif
#define VAR(var) (__typeof__(var)*) __return_addr(&var)
#define P(var) (*((__typeof__(var)*) __return_addr(&var)))
#endif /* INCLUDE_DATAPROTEC_H_ */
















