#include <msp430.h>
#include "logger.h"

unsigned __numsamples = 0;

unsigned
    *__NV_fine_start,     *__NV_fine_end,
    *__NV_coarse_start,   *__NV_coarse_end,
    *__NV_coarser_start,  *__NV_coarser_end,
    *__NV_coarsest_start, *__NV_coarsest_end;

unsigned sample (void) {
    return 1;
}

void update_log_fine (unsigned sample) {
    /* update the end pointer */
    __NV_fine_end = (__NV_fine_end + 1) % NUM_FINE_SAMPLES;
    *__NV_fine_end = sample;

    if (__NV_fine_end == __NV_fine_start)
        ++NV_fine_start;
}

void update_log_coarse (unsigned sample) {
}

void update_log_coarser (unsigned sample) {
}

void update_log_coarsest (unsigned sample) {
}

void main (void) {
    unsigned cursample = 0;

    while (1) {

        cursample = sample();

        update_log_fine(cursample);

        if (!(__numsamples % SAMPLES_COARSE)) {
            update_log_coarse(cursample);
        }

        if (!(__numsamples % SAMPLES_COARSER)) {
            update_log_coarser(cursample);
        }

        if (!(__numsamples % SAMPLES_COARSEST)) {
            update_log_coarsest(cursample);
        }

    }
}
