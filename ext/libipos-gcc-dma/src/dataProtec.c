
/*
 * dataProtec.c
 *
 *  Created on: 16 May 2017
 *      Author: Amjad
 */

#include "dataProtec.h"

/*####################################
              Paging
#####################################*/

//TODO check what happened when page size changed
unsigned int __pagsInTemp[NUM_PAG] = {0};
__nv unsigned int __persis_pagsInTemp[NUM_PAG] = {0};

unsigned int CrntPagHeader = BIGEN_ROM;
__nv unsigned int __persis_CrntPagHeader = BIGEN_ROM;


/*
 * Bring a page to its ROM buffer
 */
void __bringCrntPagROM()
{
    // Configure DMA channel 1
    __data16_write_addr((unsigned short) &DMA0SA,(unsigned long) ( __persis_CrntPagHeader) );
                                            // Source block address
    __data16_write_addr((unsigned short) &DMA0DA,(unsigned long) RAM_PAG );
                                            // Destination single address
    DMA0SZ = PAG_SIZE_W;                            // Block size
    DMA0CTL = DMADT_5 | DMASRCINCR_3 | DMADSTINCR_3; // Rpt, inc
    DMA0CTL |= DMAEN;                         // Enable DMA0

    DMA0CTL |= DMAREQ;                      // Trigger block transfer

    CrntPagHeader = __persis_CrntPagHeader; // update the volatile current page header
}


/*
 * Send a page to its temp buffer
 */
void __sendPagTemp(unsigned int pagHeader)
{
    // Configure DMA channel 1
    __data16_write_addr((unsigned short) &DMA1SA,(unsigned long) RAM_PAG);
                                            // Source block address
    __data16_write_addr((unsigned short) &DMA1DA,(unsigned long) pagHeader + TOT_PAG_SIZE );
                                            // Destination single address
    DMA1SZ = PAG_SIZE_W;                            // Block size
    DMA1CTL = DMADT_5 | DMASRCINCR_3 | DMADSTINCR_3; // Rpt, inc
    DMA1CTL |= DMAEN;                         // Enable DMA0

    DMA1CTL |= DMAREQ;                      // Trigger block transfer



    // Find the page index
    unsigned int pageGuess = pagHeader - BIGEN_ROM ; // possible values are 0, 0x400, 0x800, 0xc00 ...
    unsigned char idx=0;
    unsigned int __pageSizes = PAG_SIZE;
    while( pageGuess >= __pageSizes )
    {
        idx++;
        __pageSizes +=   PAG_SIZE;               // move to next page
    }

    // Keep track of the buffered pages
    __pagsInTemp[ idx ] = pagHeader;
}


/*
 * Bring a page to its temp buffer
 */
void __bringPagTemp(unsigned int pagHeader)
{
    // Configure DMA channel 1
    __data16_write_addr((unsigned short) &DMA1SA,(unsigned long) (pagHeader + TOT_PAG_SIZE) );
                                            // Source block address
    __data16_write_addr((unsigned short) &DMA1DA,(unsigned long)  RAM_PAG );
                                            // Destination single address
    DMA1SZ = PAG_SIZE_W;                            // Block size
    DMA1CTL = DMADT_5 | DMASRCINCR_3 | DMADSTINCR_3; // Rpt, inc
    DMA1CTL |= DMAEN;                         // Enable DMA0

    DMA1CTL |= DMAREQ;                      // Trigger block transfer
}

/*
 * Bring a page to its ROM buffer
 */
void __bringPagROM(unsigned int pagHeader)
{
    // Configure DMA channel 1
    __data16_write_addr((unsigned short) &DMA1SA,(unsigned long) (pagHeader) );
                                            // Source block address
    __data16_write_addr((unsigned short) &DMA1DA,(unsigned long) RAM_PAG );
                                            // Destination single address
    DMA1SZ = PAG_SIZE_W;                            // Block size
    DMA1CTL = DMADT_5 | DMASRCINCR_3 | DMADSTINCR_3; // Rpt, inc
    DMA1CTL |= DMAEN;                         // Enable DMA0

    DMA1CTL |= DMAREQ;                      // Trigger block transfer
}

/*
 * Send a page to its final locaiton
 */
void __sendPagROM(unsigned int pagHeader)
{
    // Configure DMA channel 1
    __data16_write_addr((unsigned short) &DMA2SA,(unsigned long) pagHeader + TOT_PAG_SIZE);
                                            // Source block address
    __data16_write_addr((unsigned short) &DMA2DA,(unsigned long)  pagHeader );
                                            // Destination single address
    DMA2SZ = PAG_SIZE_W;                            // Block size
    DMA2CTL = DMADT_5 | DMASRCINCR_3 | DMADSTINCR_3; // Rpt, inc
    DMA2CTL |= DMAEN;                         // Enable DMA0

    DMA2CTL |= DMAREQ;                      // Trigger block transfer
}

uint8_t* __return_addr(uint8_t* var) {
	if (var > END_ROM || var < BIGEN_ROM) {
		return var;
	}
	if( __IS_VAR_IN_CRNT_PAG(*var) )
	{ 
		return __VAR_PT_IN_RAM(*var);
	}
	else{
		__pageSwap((var));
		return __VAR_PT_IN_RAM(*var);
	}
}



/*
 * pageSwap:
 */
//TODO this function does not
unsigned int __pageSwap(unsigned int * varAddr)
{

	//1// send the current page
	__sendPagTemp( CrntPagHeader );
	//2// Find the requested page
	unsigned int ReqPagTag;
	unsigned int ReqPagTag_dirty = (unsigned int) varAddr;
	unsigned int __temp_pagSize = BIGEN_ROM+PAG_SIZE ; // the upper limit of the first page
	// TODO we are not checking if the var is not in any page !
	unsigned char idx=0;
	while( ! (ReqPagTag_dirty <= __temp_pagSize) )  // if the var is not with the page
	{
		idx++;
		__temp_pagSize +=   PAG_SIZE;               // move to next page
	}

	ReqPagTag = __temp_pagSize-PAG_SIZE;

	//3// pull the ther requested page from the temp buffer or ROM
	if( __pagsInTemp[idx] == ReqPagTag)
	{
		// Bring from the temp buffer
		__bringPagTemp(ReqPagTag);
	}else{
		// bring from pages final locations in ROM
		__bringPagROM(ReqPagTag);
	}
	//4// keep track of the current page
	CrntPagHeader = ReqPagTag;
	return 0;
}

/*####################################
  Paging commit
#####################################*/

void __pagsCommit()
{
	unsigned int cnt;
	for (cnt=0; cnt < NUM_PAG; cnt++)
	{
		// send the pages to their final locations in ROM
		if(__persis_pagsInTemp[cnt] )
		{
			__sendPagROM( __persis_pagsInTemp[cnt] );
		}
	}
}






