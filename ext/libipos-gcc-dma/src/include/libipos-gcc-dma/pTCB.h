/*
 * persistentList.h
 *
 *  Created on: 21 Apr 2017
 *      Author: amjad
 */
#include "global.h"

#ifndef INCLUDE_PERSISTENTLIST_H_
#define INCLUDE_PERSISTENTLIST_H_


// each call will increase the pointer by 6 bytes
void os_memMapper(unsigned int *cnt, taskId _task);

void os_addTasks(unsigned char numTasks, taskId tasks[]);
unsigned int* os_search(funcPt func);

#endif /* INCLUDE_PERSISTENTLIST_H_ */
