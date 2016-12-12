#define MIN_SEQUENCE_LEN 4
#define MAX_SEQUENCE_LEN 7

#define END_OF_PATTERN 99

void generate_pattern (unsigned *dest_pattern);
void show_pattern (unsigned *pattern);
unsigned pattern_eq (unsigned *pat1, unsigned *pat2);
