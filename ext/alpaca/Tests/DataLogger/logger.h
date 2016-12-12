#ifndef __LOGGER_H_
#define __LOGGER_H_

/* At multiple levels N of granularity, update every N samples */
#define SAMPLES_COARSE   100
#define SAMPLES_COARSER  1000
#define SAMPLES_COARSEST 10000

extern unsigned __numsamples;

extern unsigned
    *__NV_fineptr,
    *__NV_coarseptr,
    *__NV_coarserptr,
    *__NV_coarsestptr;

#endif /* __LOGGER_H_ */
