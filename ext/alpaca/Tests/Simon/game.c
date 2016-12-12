#include "game.h"
#include "hw.h"

void generate_pattern (unsigned *dest_pattern) {
    unsigned random;
    unsigned plen;
    unsigned i;

    random = rand();

    /* get pattern length from top 2 bits */
    plen = MIN_SEQUENCE_LEN + (random >> 14);

    /* treat 2 bits at a time as the sequence number */
    for (i = 0; i < plen; ++i) {
        dest_pattern[i] = (random >> (i*2)) & 0x03;
        random >>= 2;
    }
    dest_pattern[i] = END_OF_PATTERN;
}

void show_pattern (unsigned *pattern) {
    int i;

    while ((i < MAX_SEQUENCE_LEN) && (pattern[i] != END_OF_PATTERN)) {
        flash_led(pattern[i]);
    }
}

void get_user_pattern (unsigned *dest_pattern) {
    /* XXX gather inputs */
}

unsigned pattern_eq (unsigned *pat1, unsigned *pat2) {
    unsigned i, j;

    for (i = 0; i < MAX_SEQUENCE_LEN; ++i) {
        if (pat1[i] != pat2[i]) {
            return 0;
        }
    }
    if (pat1[i] == END_OF_PATTERN) {
        return 1;
    }
}
