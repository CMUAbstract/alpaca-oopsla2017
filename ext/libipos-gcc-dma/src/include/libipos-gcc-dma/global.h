#include <stdbool.h>
#include <stdint.h>
#include <stdlib.h>

#ifndef INCLUDE_GLOBAL_H_
#define INCLUDE_GLOBAL_H_

#define __nv  __attribute__((section(".nv_vars")))
#define __p  __attribute__((section(".p_vars")))
//#define __v  __attribute__((section(".ram_vars")))

// Special memory locaitons
#define BASE_ADDR       0x1980
#define LIST_HEAD       (BASE_ADDR)           //2 bytes

// function pointer
typedef void (* funcPt)(void);

//This is a task interface. It is shared between the user and IPOS
typedef struct _taskId{
  funcPt * func;
  unsigned block;
}taskId;

//extern unsigned int __task_address;
extern volatile unsigned int  __totNumTask;
extern unsigned int __persis_CrntPagHeader;
extern unsigned int __pagsInTemp[];
extern unsigned int __persis_pagsInTemp[];
extern unsigned __numTasks;
extern taskId* __tasks;
extern unsigned __nv_task_index;
//extern uint16_t *__head;

#define BLOCK_OFFSET_PT     1
#define NEXT_OFFSET_PT      2

#define BLOCK_OFFSET        2
#define NEXT_OFFSET         4

#endif /* INCLUDE_GLOBAL_H_ */
