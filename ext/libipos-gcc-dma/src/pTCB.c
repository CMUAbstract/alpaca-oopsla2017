/*
 *  These functions are responsible for building the persistent circular list in non-volatile memory
 */

#include <pTCB.h>

unsigned int* __head   =   (unsigned int*)    LIST_HEAD;
#define BLOCK   1
#define UNBLOCK   0
__nv unsigned char funcBlocker = 0;

volatile unsigned int  __totNumTask =0;

__nv unsigned __numTasks = 0;
__nv taskId *__tasks;

/*
 * memMapper create a node of linkedlist in persistent memory (FRAM)
 */
void os_memMapper(unsigned int *cnt, taskId _task)
{
    *(__head +*cnt) = (unsigned int) _task.func;
    ++(*cnt);
    *(__head +*cnt) = _task.block;  // This can be splitted into two bytes. One for blocking and one of priority
    ++(*cnt);
    *(__head +*cnt) =(unsigned int) (__head +1+(*cnt)); // a pointer to the next node
    ++(*cnt);
}

//void ememMapper(unsigned int *cnt, taskId* _task)
//{
//    taskId* __task = (taskId*)(__head +*cnt);
//            __task->func = _task->func;
//            __task->block = _task->block;
//
//
//           *cnt+= sizeof(taskId);
//}

/*
 * building the persistent circular linked list
 */
#if 0
void os_addTasks(unsigned char numTasks, taskId tasks[]){
    if( funcBlocker != 0xAD)
    {
        unsigned char i = 0;
        unsigned int cnt=0;
        __totNumTask = numTasks;
        while (i<numTasks)
        {
            os_memMapper(&cnt, tasks[i]);
            i++;
        }
        *(__head +(--cnt) ) =  (unsigned int)  LIST_HEAD;   // link the tail of the linkedlist with the head

        __task_address    =  (unsigned int) __head ;
        funcBlocker = 0xAD;
    }
}
#endif
void os_addTasks(unsigned char numTasks, taskId tasks[]){
	if( funcBlocker != 0xAD)
	{
		__numTasks = numTasks;
		__tasks = tasks;
		__nv_task_index = 0;
		funcBlocker = 0xAD;
	}
}

unsigned int * os_search(funcPt func)
{
	unsigned int* __current = __head;

	do{
		// Do three lock ups before looping before executing a new loop cycle (a bit of optimizations)
		if( (funcPt) *__current ==  func )
		{
			return __current;
		}

		__current = (unsigned int*) *(__current+NEXT_OFFSET_PT);  // pointer arithmetic

		if( (funcPt) *__current ==  func )
		{
			return __current;
		}

		__current = (unsigned int*) *(__current+NEXT_OFFSET_PT);

		if( (funcPt) *__current ==  func )
		{
			return __current;
		}

	}while( __current != __head);

	return NULL;
}


