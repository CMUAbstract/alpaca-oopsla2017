#include "game.h"

void main (void) {
    unsigned score = 0;
    unsigned cur_pattern[MAX_SEQUENCE_LEN+1];
    unsigned user_pattern[MAX_SEQUENCE_LEN+1];

    /* main loop */
    while (1) {
        generate_pattern(cur_pattern);
        show_pattern(cur_pattern);

        get_user_pattern(user_pattern);
        if (pattern_eq(user_pattern, cur_pattern)) {
            /* XXX you win; do something */
        } else {
            /* XXX you lose; do something */
        }
    }
}
