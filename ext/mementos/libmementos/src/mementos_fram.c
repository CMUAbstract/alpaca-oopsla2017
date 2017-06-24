/* See license.txt for licensing information. */

#include <mementos.h>
#include <msp430builtins.h>

__attribute__((section(".nv_vars")))
unsigned int *__mementos_active_bundle_ptr = (unsigned int *)0xffff;

extern unsigned int i, j, k;
extern unsigned int baseaddr;
#ifdef MEMENTOS_STUCK_PATH_WATCHPOINT
extern unsigned int __mementos_last_restore_pc;
#endif // MEMENTOS_STUCK_PATH_WATCHPOINT

#ifndef MEMENTOS_FRAM
#error Inappropriate use of mementos_fram.c without MEMENTOS_FRAM defined
#endif

void __mementos_checkpoint (void) {
    /* Size of globals in bytes.  Count this far from the beginning of RAM to
     * capture globals.  Comes from the AddGlobalSizeGlobal pass. */
    extern int GlobalAllocSize;


#ifndef MEMENTOS_ORACLE // always checkpoint when called in oracle mode
#ifdef MEMENTOS_TIMER
    /* early exit if not ok to checkpoint */
    if (!ok_to_checkpoint) {
        return;
    }
#endif // MEMENTOS_TIMER
#ifdef MEMENTOS_VOLTAGE_CHECK
    /* early exit if voltage check says that checkpoint is unnecessary */
    if (VOLTAGE_CHECK >= V_THRESH) {
#ifdef MEMENTOS_TIMER
        ok_to_checkpoint = 0; // put the flag back down
#endif // MEMENTOS_TIMER
        __asm__ volatile ("RET"); // would 'return', but that triggers a bug XXX
    }
#endif // MEMENTOS_VOLTAGE_CHECK
#endif // MEMENTOS_ORACLE
    __mementos_log_event(MEMENTOS_STATUS_STARTING_CHECKPOINT);

    /* push all the registers onto the stack; they will be copied to NVRAM from
     * there.  any funny business here is to capture the values of the registers
     * as they appeared just before this function was called -- some
     * backtracking is necessary. */

    /*Note on R4:
      R4 was pushed to the stack during the preamble.  We need to get it back*/
    /*That push means R1+2, then we push PC, SP, and R2, which means we need R1+8*/ 

    /*Note on NOP:
      There appears to be an implementation bug in the MSP430FR5969 that incorrectly
      increments the PC by only 2 after the PUSH 4(R1) that executes.  The PC is then
      wrong and execution diverges.  I think this is related to erratum CPU40 documented
      here http://www.ti.com/lit/er/slaz473f/slaz473f.pdf.  The setup does not exactly
      match but the behavior seems to be the same.
    */
     
    __asm__ volatile ("PUSH 4(R1)");     // PC will appear at 28(R1)
    __asm__ volatile ("NOP");            // This NOP is required.  See note above.
    __asm__ volatile ("PUSH R1");        // SP will appear at 26(R1)
    __asm__ volatile ("ADD #6, 0(R1)");  // +6 to account for FP (pushed in preamble) + PC + R1
    __asm__ volatile ("PUSH R2");        // R2  will appear at 24(R1)
    // skip R3 (constant generator)
    __asm__ volatile ("PUSH 8(R1)");     // R4  will appear at 22(R1) [see note above]
    __asm__ volatile ("PUSH R5");        // R5  will appear at 20(R1)
    __asm__ volatile ("PUSH R6");        // R6  will appear at 18(R1)
    __asm__ volatile ("PUSH R7");        // R7  will appear at 16(R1)
    __asm__ volatile ("PUSH R8");        // R8  will appear at 14(R1)
    __asm__ volatile ("PUSH R9");        // R9  will appear at 12(R1)
    __asm__ volatile ("PUSH R10");       // R10 will appear at 10(R1)
    __asm__ volatile ("PUSH R11");       // R11 will appear at 8(R1)
    __asm__ volatile ("PUSH R12");       // R12 will appear at 6(R1)
    __asm__ volatile ("PUSH R13");       // R13 will appear at 4(R1)
    __asm__ volatile ("PUSH R14");       // R14 will appear at 2(R1)
    __asm__ volatile ("PUSH R15");       // R15 will appear at 0(R1)

    /**** figure out where to put this checkpoint bundle ****/
    /* precompute the size of the stack portion of the bundle */
    __asm__ volatile ("MOV 26(R1), %0" :"=m"(j)); // j = SP
    /* j now contains the pre-call value of the stack pointer */

    baseaddr = __mementos_locate_next_bundle();

    /********** phase #0: save size header (2 bytes) **********/
 
    //Save these registers so we can put them back after
    //we're done using them to compute the size of the stack
    __asm__ volatile ("PUSH R12");
    __asm__ volatile ("PUSH R13");

    // compute size of stack (in bytes) into R13
    __asm__ volatile ("MOV #" xstr(TOPOFSTACK) ", R13");
    __asm__ volatile ("SUB %0, R13" ::"m"(j)); // j == old stack pointer

    // write size of stack (R13) to high word at baseaddr
    __asm__ volatile ("MOV %0, R12" ::"m"(baseaddr));
    __asm__ volatile ("MOV R13, 2(R12)");

    // store GlobalAllocSize into R13, round it up to the next word boundary
    __asm__ volatile ("MOV %0, R13" ::"m"(GlobalAllocSize));
    __asm__ volatile ("INC R13");
    __asm__ volatile ("AND #0xFFFE, R13");

    // write GlobalAllocSize to low word at baseaddr
    __asm__ volatile ("MOV R13, 0(R12)");

    __asm__ volatile ("POP R13");
    __asm__ volatile ("POP R12");

    /********** phase #1: checkpoint registers. **********/
    __asm__ volatile ("MOV %0, R14" ::"m"(baseaddr));
    __asm__ volatile ("POP 32(R14)"); // R15
    __asm__ volatile ("POP 30(R14)"); // R14
    __asm__ volatile ("POP 28(R14)"); // R13
    __asm__ volatile ("POP 26(R14)"); // R12
    __asm__ volatile ("POP 24(R14)"); // R11
    __asm__ volatile ("POP 22(R14)"); // R10
    __asm__ volatile ("POP 20(R14)"); // R9
    __asm__ volatile ("POP 18(R14)"); // R8
    __asm__ volatile ("POP 16(R14)"); // R7
    __asm__ volatile ("POP 14(R14)"); // R6
    __asm__ volatile ("POP 12(R14)"); // R5
    __asm__ volatile ("POP 10(R14)");  // R4
    // skip R3 (constant generator)
    __asm__ volatile ("POP 8(R14)");  // R2
    __asm__ volatile ("POP 6(R14)");  // R1
    __asm__ volatile ("POP 4(R14)");    // R0

    /********** phase #2: checkpoint memory. **********/

    /* checkpoint the stack by walking from SP to ToS */
    /*There needs to be a "+ 2" on this expression to get 
      past the last register, which is at baseaddr + BSH + BSR.
      The constant 2 refers to the size of the last register*/
    k = baseaddr + BUNDLE_SIZE_HEADER + BUNDLE_SIZE_REGISTERS + 2;
    for (i = j; i < TOPOFSTACK; i += 2 /*sizeof(unsigned)*/) {
        MEMREF_UINT(k + (i - j)) = MEMREF_UINT(i);
    }
    k += (i - j); // skip over checkpointed stack

    /* checkpoint as much of the data segment as is necessary */
    for (i = STARTOFDATA; i < STARTOFDATA+ROUND_TO_NEXT_EVEN(GlobalAllocSize);
            i += sizeof(unsigned int)) {
        MEMREF_UINT(k + (i - STARTOFDATA)) = MEMREF_UINT(i);
    }
    k += (i - STARTOFDATA); // skip over checkpointed globals

#ifdef MEMENTOS_STUCK_PATH_WATCHPOINT
    // We completed a checkpoint (*), so clear the last restore info.
    // NOTE: (*) Ideally, this would be atomic with the checkpoint operation. To
    // accomplish that, we'd need to redesign so that the restore bit/info is
    // part of the checkpoint. As we have it now, there is a (negligible) chance
    // that a stuck path would not get detected -- if power fails between this
    // clearing of the last restore PC and the finalizing of the checkpoint.
    __mementos_last_restore_pc = 0x0;
#endif // MEMENTOS_STUCK_PATH_WATCHPOINT

    // write the magic number
    MEMREF_UINT(k) = MEMENTOS_MAGIC_NUMBER;
    __mementos_active_bundle_ptr = (unsigned int *)baseaddr;
    __mementos_log_event(MEMENTOS_STATUS_COMPLETED_CHECKPOINT);

#ifdef MEMENTOS_TIMER
    // CCR0 = TIMER_INTERVAL; // XXX choose a good interval -- what are the units?
    ok_to_checkpoint = 0; // not OK to checkpoint until next timer fire
#endif
}

/* find a place in the reserved FRAM area for storage of a new bundle of state.
 * */
unsigned int __mementos_locate_next_bundle () {
    unsigned int baseaddr;
    unsigned int target;

    baseaddr = __mementos_find_active_bundle();
    switch (baseaddr) {
    case FRAM_FIRST_BUNDLE_SEG:
        target = FRAM_SECOND_BUNDLE_SEG;
        break;
    case FRAM_SECOND_BUNDLE_SEG:
        target = FRAM_FIRST_BUNDLE_SEG;
    default: // case 0xFFFFu:
        target = FRAM_FIRST_BUNDLE_SEG;
        break;
    }
    return target;
}

unsigned int __mementos_find_active_bundle (void) {
    unsigned int active_ptr = (unsigned int)__mementos_active_bundle_ptr;
    if (__mementos_bundle_in_range(active_ptr))
        return active_ptr;
    return 0xffff;
}

void __mementos_atboot_cleanup (void) {
}

void __mementos_inactive_cleanup (unsigned int active_bundle_addr) {
}

unsigned int __mementos_bundle_in_range (unsigned int bun_addr) {
    return ((bun_addr >= FRAM_FIRST_BUNDLE_SEG) && (bun_addr < FRAM_END));
}

/*
void __mementos_fram_clear (unsigned long target) {
    unsigned long i;
    for (i = target; i < (target + (FRAM_SECOND_BUNDLE_SEG - FRAM_FIRST_BUNDLE_SEG)); ++i) {
        MEMREF(i) = 0;
    }
}
*/

unsigned int __mementos_force_free (void) {
    // XXX should never need this, but should implement anyway
    return 0;
}
