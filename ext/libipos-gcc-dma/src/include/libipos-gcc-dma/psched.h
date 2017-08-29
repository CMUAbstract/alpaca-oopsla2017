#include "pTCB.h"
#include "dataProtec.h"
#include "global.h"

#ifndef PSECHED_H_
#define PSECHED_H_

// functions prototyping
void os_initTasks( const unsigned int numTasks, funcPt tasks[]);
void os_scheduler();

void os_exit_critical();
void os_enter_critical();

void os_jump(unsigned int j);

#endif
