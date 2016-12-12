#include "hw.h"

void flash_led (unsigned which_led) {
    if (which_led < LED_MIN)
        return;
    if (which_led > LED_MAX)
        return;

    /* XXX flash an LED:
     * LED on
     * set timer
     * on timer expiration,
     * LED off
     */
}
