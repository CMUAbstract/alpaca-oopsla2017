#ifndef __COMMON_H__
#define __COMMON_H__

#if defined(MEMENTOS_LATCH) || defined(MEMENTOS_RETURN) || \
    defined(MEMENTOS_TIMER) || defined(MEMENTOS_ORACLE)
#define MEMENTOS
#endif

#define MEMENTOS_MAIN_ATTRIBUTES // legacy def to avoid changing apps

#define MEMREF(x) (*((unsigned int*)(x)))

#endif // __COMMON_H__
