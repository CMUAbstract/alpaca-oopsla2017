#include <msp430.h>

/* adapted from github.com/wisp/wisp5 */
inline unsigned rand (void) {
    unsigned i, rv;

    ADC12CTL0 = ADC12CTL1 = ADC12CTL2 = ADC12MCTL0 = ADC12IER0 = 0;

    ADC12CTL1 = ADC12SSEL_2 | ADC12DIV_0 | ADC12SHP;
    ADC12CTL0 = ADC12SHT0_2;

    /* single sample on channel A10 */
    ADC12CTL2 = ADC12RES_2;
    ADC12MCTL0 = ADC12VRSEL_1 | ADC12INCH_10;
    ADC12CTL1 |= ADC12CONSEQ_0;

    /* turn ADC on */
    ADC12CTL0 |= ADC12ON;
    while (ADC12CTL1 & ADC12BUSY);
    ADC12CTL0 |= ADC12ENC;

    /* shift 16 samples' low-order bits into rv */
    rv = 0;
    for (i = 0; i < (sizeof(unsigned))*8; ++i) {
        ADC12CTL0 |= ADC12SC;
        while (ADC12CTL1 & ADC12BUSY);

        rv <<= 1;
        rv |= ADC12MEM0 & 1;
    }

    ADC12CTL0 = ADC12CTL1 = ADC12CTL2 = ADC12MCTL0 = ADC12IER0 = 0;

    return rv;
}
