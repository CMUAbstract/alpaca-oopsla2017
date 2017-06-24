#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

//#include <libwispbase/wisp-base.h>
//#include <wisp-base.h>
#include <libchain/chain.h>
#include <libmspbuiltins/builtins.h>
#include <libio/log.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>
#include <libmspmath/msp-math.h>

#ifdef CONFIG_LIBEDB_PRINTF
#include <libedb/edb.h>
#endif


#include "pins.h"

// #define VERBOSE

#include "../data/keysize.h"

#define KEY_SIZE_BITS    64
#define DIGIT_BITS       8 // arithmetic ops take 8-bit args produce 16-bit result
#define DIGIT_MASK       0x00ff
#define NUM_DIGITS       (KEY_SIZE_BITS / DIGIT_BITS)

/** @brief Type large enough to store a product of two digits */
typedef uint16_t digit_t;
//typedef uint8_t digit_t;

typedef struct {
    uint8_t n[NUM_DIGITS]; // modulus
    digit_t e;  // exponent
} pubkey_t;

#if NUM_DIGITS < 2
#error The modular reduction implementation requires at least 2 digits
#endif

#define LED1 (1 << 0)
#define LED2 (1 << 1)

#define SEC_TO_CYCLES 4000000 /* 4 MHz */

#define BLINK_DURATION_BOOT (5 * SEC_TO_CYCLES)
#define BLINK_DURATION_TASK SEC_TO_CYCLES
#define BLINK_BLOCK_DONE    (1 * SEC_TO_CYCLES)
#define BLINK_MESSAGE_DONE  (2 * SEC_TO_CYCLES)

#define PRINT_HEX_ASCII_COLS 8

unsigned overflow=0;
__attribute__((interrupt(51))) 
void TimerB1_ISR(void){
	TBCTL &= ~(0x0002);
	if(TBCTL && 0x0001){
		overflow++;
		TBCTL |= 0x0004;
		TBCTL |= (0x0002);
		TBCTL &= ~(0x0001);	
	}
}
__attribute__((section("__interrupt_vector_timer0_b1"),aligned(2)))
void(*__vector_timer0_b1)(void) = TimerB1_ISR;
// #define SHOW_PROGRESS_ON_LED
// #define SHOW_COARSE_PROGRESS_ON_LED

// Blocks are padded with these digits (on the MSD side). Padding value must be
// chosen such that block value is less than the modulus. This is accomplished
// by any value below 0x80, because the modulus is restricted to be above
// 0x80 (see comments below).
static const uint8_t PAD_DIGITS[] = { 0x01 };
#define NUM_PAD_DIGITS (sizeof(PAD_DIGITS) / sizeof(PAD_DIGITS[0]))

// To generate a key pair: see scripts/

// modulus: byte order: LSB to MSB, constraint MSB>=0x80
static __ro_nv const pubkey_t pubkey = {
#include "../data/key64.txt"
};

static __ro_nv const unsigned char PLAINTEXT[] =
#include "../data/plaintext.txt"
;

#define NUM_PLAINTEXT_BLOCKS (sizeof(PLAINTEXT) / (NUM_DIGITS - NUM_PAD_DIGITS) + 1)
#define CYPHERTEXT_SIZE (NUM_PLAINTEXT_BLOCKS * NUM_DIGITS)

struct msg_mult_mod_args {
    CHAN_FIELD_ARRAY(digit_t, A, NUM_DIGITS);
    CHAN_FIELD_ARRAY(digit_t, B, NUM_DIGITS);
    CHAN_FIELD(task_t*, next_task);
};

struct msg_mult_mod_result {
    CHAN_FIELD_ARRAY(digit_t, R, NUM_DIGITS);
};

struct msg_mult {
    CHAN_FIELD_ARRAY(digit_t, A, NUM_DIGITS);
    CHAN_FIELD_ARRAY(digit_t, B, NUM_DIGITS);
    CHAN_FIELD(unsigned, digit);
    CHAN_FIELD(unsigned, carry);
};

struct msg_reduce {
    CHAN_FIELD_ARRAY(digit_t, NN, NUM_DIGITS);
    CHAN_FIELD_ARRAY(digit_t, M, NUM_DIGITS);
    CHAN_FIELD(task_t*, next_task);
};

struct msg_modulus {
    CHAN_FIELD_ARRAY(digit_t, NN, NUM_DIGITS);
};

struct msg_exponent {
    CHAN_FIELD(digit_t, E);
};

struct msg_self_exponent {
    SELF_CHAN_FIELD(digit_t, E);
};
#define FIELD_INIT_msg_self_exponent {\
    SELF_FIELD_INITIALIZER \
}

struct msg_mult_digit {
    CHAN_FIELD(unsigned, digit);
    CHAN_FIELD(unsigned, carry);
};

struct msg_self_mult_digit {
    SELF_CHAN_FIELD(unsigned, digit);
    SELF_CHAN_FIELD(unsigned, carry);
};
#define FIELD_INIT_msg_self_mult_digit {\
    SELF_FIELD_INITIALIZER, \
    SELF_FIELD_INITIALIZER \
}

struct msg_product {
    CHAN_FIELD_ARRAY(digit_t, product, NUM_DIGITS * 2);
};

struct msg_self_product {
    SELF_CHAN_FIELD_ARRAY(digit_t, product, NUM_DIGITS * 2);
};
#define FIELD_INIT_msg_self_product {\
    SELF_FIELD_ARRAY_INITIALIZER(32)\
}
//instead of NUM_DIGITS*2
struct msg_base {
    CHAN_FIELD_ARRAY(digit_t, base, NUM_DIGITS * 2);
};

struct msg_block {
    CHAN_FIELD_ARRAY(digit_t, block, NUM_DIGITS * 2);
};

struct msg_base_block {
    CHAN_FIELD_ARRAY(digit_t, base, NUM_DIGITS * 2);
    CHAN_FIELD_ARRAY(digit_t, block, NUM_DIGITS * 2);
};

struct msg_cyphertext_len {
    CHAN_FIELD(unsigned, cyphertext_len);
};

struct msg_self_cyphertext_len {
    SELF_CHAN_FIELD(unsigned, cyphertext_len);
};
#define FIELD_INIT_msg_self_cyphertext_len {\
    SELF_FIELD_INITIALIZER \
}

struct msg_cyphertext {
    CHAN_FIELD_ARRAY(digit_t, cyphertext, CYPHERTEXT_SIZE);
    CHAN_FIELD(unsigned, cyphertext_len);
};

struct msg_divisor {
    //CHAN_FIELD(unsigned, digit);
    CHAN_FIELD(digit_t, n_div);
};

struct msg_digit {
    CHAN_FIELD(unsigned, digit);
};

struct msg_self_digit {
    SELF_CHAN_FIELD(unsigned, digit);
};
#define FIELD_INIT_msg_self_digit {\
    SELF_FIELD_INITIALIZER \
}

struct msg_offset {
    CHAN_FIELD(unsigned, offset);
};

struct msg_block_offset {
    CHAN_FIELD(unsigned, block_offset);
};

struct msg_self_block_offset {
    SELF_CHAN_FIELD(unsigned, block_offset);
};
#define FIELD_INIT_msg_self_block_offset {\
    SELF_FIELD_INITIALIZER \
}

struct msg_message_info {
    CHAN_FIELD(unsigned, message_length);
    CHAN_FIELD(unsigned, block_offset);
    CHAN_FIELD(digit_t, E);
};

struct msg_quotient {
    CHAN_FIELD(digit_t, quotient);
};

struct msg_print {
    CHAN_FIELD_ARRAY(digit_t, product, NUM_DIGITS * 2);
    CHAN_FIELD(task_t*, next_task);
};

TASK(1,  task_init)
TASK(2,  task_pad)
TASK(3,  task_exp)
TASK(4,  task_mult_block)
TASK(5,  task_mult_block_get_result)
TASK(6,  task_square_base)
TASK(7,  task_square_base_get_result)
TASK(8,  task_print_cyphertext)
TASK(9,  task_mult_mod)
TASK(10,  task_mult)
TASK(11, task_reduce_digits)
TASK(12, task_reduce_normalizable)
TASK(13, task_reduce_normalize)
TASK(14, task_reduce_n_divisor)
TASK(15, task_reduce_quotient)
TASK(16, task_reduce_multiply)
TASK(17, task_reduce_compare)
TASK(18, task_reduce_add)
TASK(19, task_reduce_subtract)
TASK(20, task_print_product)

MULTICAST_CHANNEL(msg_base, ch_base, task_init, task_square_base, task_mult_block);
CHANNEL(task_init, task_pad, msg_message_info);
CHANNEL(task_init, task_mult_block_get_result, msg_cyphertext_len);
CHANNEL(task_pad, task_exp, msg_exponent);
CHANNEL(task_pad, task_mult_block, msg_block);
SELF_CHANNEL(task_pad, msg_self_block_offset);
MULTICAST_CHANNEL(msg_base, ch_base, task_pad, task_mult_block, task_square_base);
SELF_CHANNEL(task_exp, msg_self_exponent);
CHANNEL(task_exp, task_mult_block_get_result, msg_exponent);
CHANNEL(task_mult_block_get_result, task_mult_block, msg_block);
SELF_CHANNEL(task_mult_block_get_result, msg_self_cyphertext_len);
CHANNEL(task_mult_block_get_result, task_print_cyphertext, msg_cyphertext);
MULTICAST_CHANNEL(msg_base, ch_square_base, task_square_base_get_result,
                  task_square_base, task_mult_block);
CALL_CHANNEL(ch_mult_mod, msg_mult_mod_args);
RET_CHANNEL(ch_mult_mod, msg_product);
CHANNEL(task_mult_mod, task_mult, msg_mult);
MULTICAST_CHANNEL(msg_modulus, ch_modulus, task_init,
                  task_reduce_normalizable, task_reduce_normalize,
                  task_reduce_n_divisor, task_reduce_quotient, task_reduce_multiply);
SELF_CHANNEL(task_mult, msg_self_mult_digit);
MULTICAST_CHANNEL(msg_product, ch_mult_product, task_mult,
                  task_reduce_normalizable, task_reduce_normalize,
                  task_reduce_quotient, task_reduce_compare,
                  task_reduce_add, task_reduce_subtract);
MULTICAST_CHANNEL(msg_digit, ch_digit, task_reduce_digits,
                  task_reduce_normalizable, task_reduce_quotient);
CHANNEL(task_reduce_normalizable, task_reduce_normalize, msg_offset);
// TODO: rename 'product' to 'block' or something
MULTICAST_CHANNEL(msg_product, ch_product, task_mult,
                  task_reduce_digits, task_reduce_n_divisor,
                  task_reduce_normalizable, task_reduce_normalize,
                  task_reduce_quotient, task_reduce_compare,
                  task_reduce_add, task_reduce_subtract);
MULTICAST_CHANNEL(msg_product, ch_normalized_product, task_reduce_normalize,
                  task_reduce_quotient, task_reduce_compare,
                  task_reduce_add, task_reduce_subtract);
CHANNEL(task_reduce_add, task_reduce_subtract, msg_product);
MULTICAST_CHANNEL(msg_product, ch_reduce_subtract_product, task_reduce_subtract,
                  task_reduce_quotient, task_reduce_compare, task_reduce_add);
SELF_CHANNEL(task_reduce_subtract, msg_self_product);
CHANNEL(task_reduce_n_divisor, task_reduce_quotient, msg_divisor);
SELF_CHANNEL(task_reduce_quotient, msg_self_digit);
MULTICAST_CHANNEL(msg_digit, ch_reduce_digit, task_reduce_quotient,
                  task_reduce_multiply, task_reduce_compare,
                  task_reduce_add, task_reduce_subtract);
CHANNEL(task_reduce_quotient, task_reduce_multiply, msg_quotient);
MULTICAST_CHANNEL(msg_product, ch_qn, task_reduce_multiply,
                  task_reduce_compare, task_reduce_subtract);
CALL_CHANNEL(ch_print_product, msg_print);

static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

void init()
{
#if BOARD == mspts430
	TBCTL &= 0xE6FF; //set 12,11 bit to zero (16bit) also 8 to zero (SMCLK)
	TBCTL |= 0x0200; //set 9 to one (SMCLK)
	TBCTL |= 0x00C0; //set 7-6 bit to 11 (divider = 8);
	TBCTL &= 0xFFEF; //set bit 4 to zero
	TBCTL |= 0x0020; //set bit 5 to one (5-4=10: continuous mode)
	TBCTL |= 0x0002; //interrupt enable
#endif
	init_hw();

#ifdef CONFIG_EDB
	edb_init();
#endif
	INIT_CONSOLE();

    __enable_interrupt();


    PRINTF(".%u.\r\n", curctx->task->idx);
}


static void print_hex_ascii(const uint8_t *m, unsigned len)
{
    int i, j;

    for (i = 0; i < len; i += PRINT_HEX_ASCII_COLS) {
        for (j = 0; j < PRINT_HEX_ASCII_COLS && i + j < len; ++j)
            printf("%02x ", m[i + j]);
        for (; j < PRINT_HEX_ASCII_COLS; ++j)
            printf("   ");
        printf(" ");
        for (j = 0; j < PRINT_HEX_ASCII_COLS && i + j < len; ++j) {
            char c = m[i + j];
            if (!(32 <= c && c <= 127)) // not printable
                c = '.';
            printf("%c", c);
        }
        printf("\r\n");
    }
}

void task_init()
{
    int i;
    digit_t tmp;
    unsigned message_length = sizeof(PLAINTEXT) - 1; // skip the terminating null byte

    LOG("init\r\n");
    LOG("digit: %u\r\n", sizeof(digit_t));
    LOG("unsigned: %u\r\n",sizeof(unsigned));


    //ENERGY_GUARD_BEGIN();
   // printf("Message:\r\n"); print_hex_ascii(PLAINTEXT, message_length);
   // printf("Public key: exp = 0x%x  N = \r\n", pubkey.e);
   // print_hex_ascii(pubkey.n, NUM_DIGITS);
    //ENERGY_GUARD_END();

    LOG("init: out modulus\r\n");

    // TODO: consider passing pubkey as a structure type
    for (i = 0; i < NUM_DIGITS; ++i) {
	    tmp = pubkey.n[i];
        CHAN_OUT1(digit_t, NN[i], tmp, MC_OUT_CH(ch_modulus, task_init,
        //CHAN_OUT1(digit_t, N[i], pubkey.n[i], MC_OUT_CH(ch_modulus, task_init,
                 task_reduce_normalizable, task_reduce_normalize,
                 task_reduce_m_divisor, task_reduce_quotient,
                 task_reduce_multiply, task_reduce_add));
    }

    LOG("init: out exp\r\n");

    unsigned zero = 0;
    CHAN_OUT1(digit_t, E, pubkey.e, CH(task_init, task_pad));
    CHAN_OUT1(unsigned, message_length, message_length, CH(task_init, task_pad));
    CHAN_OUT1(unsigned, block_offset, zero, CH(task_init, task_pad));
    CHAN_OUT1(unsigned, cyphertext_len, zero, CH(task_init, task_mult_block_get_result));

    LOG("init: done\r\n");

    TRANSITION_TO(task_pad);
}

void task_pad()
{
    int i;
    unsigned block_offset, message_length;
    digit_t m, e;

    block_offset = *CHAN_IN2(unsigned, block_offset, CH(task_init, task_pad),
                                           SELF_IN_CH(task_pad));

    message_length = *CHAN_IN1(unsigned, message_length, CH(task_init, task_pad));

    LOG("pad: len=%u offset=%u\r\n", message_length, block_offset);

    if (block_offset >= message_length) {
        LOG("pad: message done\r\n");
        TRANSITION_TO(task_print_cyphertext);
    }

    LOG("process block: padded block at offset=%u: ", block_offset);
    for (i = 0; i < NUM_PAD_DIGITS; ++i)
        LOG("%x ", PAD_DIGITS[i]);
    LOG("'");
    for (i = NUM_DIGITS - NUM_PAD_DIGITS - 1; i >= 0; --i)
        LOG("%x ", PLAINTEXT[block_offset + i]);
    LOG("\r\n");

    digit_t one = 1;
    digit_t zero = 0;
    for (i = 0; i < NUM_DIGITS - NUM_PAD_DIGITS; ++i) {
        m = (block_offset + i < message_length) ? PLAINTEXT[block_offset + i] : 0xFF;
        CHAN_OUT1(digit_t, base[i], m, MC_OUT_CH(ch_base, task_pad, task_mult_block, task_square_base));
    }
    for (i = NUM_DIGITS - NUM_PAD_DIGITS; i < NUM_DIGITS; ++i) {
     //   CHAN_OUT1(digit_t, base[i], PAD_DIGITS[i],
        CHAN_OUT1(digit_t, base[i], one,
                 MC_OUT_CH(ch_base, task_pad, task_mult_block, task_square_base));
    }

    CHAN_OUT1(digit_t, block[0], one, CH(task_pad, task_mult_block));
    for (i = 1; i < NUM_DIGITS; ++i)
        CHAN_OUT1(digit_t, block[i], zero, CH(task_pad, task_mult_block));

    e = *CHAN_IN1(digit_t, E, CH(task_init, task_pad));
    CHAN_OUT1(digit_t, E, e, CH(task_pad, task_exp));

    block_offset += NUM_DIGITS - NUM_PAD_DIGITS;
    CHAN_OUT1(unsigned, block_offset, block_offset, SELF_OUT_CH(task_pad));

    TRANSITION_TO(task_exp);
}

void task_exp()
{
    digit_t e;
    bool multiply;

    e = *CHAN_IN2(digit_t, E, CH(task_pad, task_exp), SELF_IN_CH(task_exp));
    LOG("exp: e=%x\r\n", e);

    // ASSERT: e > 0

    multiply = e & 0x1;

    e >>= 1;
    CHAN_OUT1(digit_t, E, e, SELF_OUT_CH(task_exp));
    CHAN_OUT1(digit_t, E, e, CH(task_exp, task_mult_block_get_result));

    if (multiply) {
        TRANSITION_TO(task_mult_block);
    } else {
        TRANSITION_TO(task_square_base);
    }
}

// TODO: is this task strictly necessary? it only makes a call. Can this call
// be rolled into task_exp?
void task_mult_block()
{
    int i;
    digit_t b, m;

    LOG("mult block\r\n");

    // TODO: pass args to mult: message * base
    for (i = 0; i < NUM_DIGITS; ++i) {
        b = *CHAN_IN2(digit_t, base[i], MC_IN_CH(ch_base, task_pad, task_mult_block),
                               MC_IN_CH(ch_square_base, task_square_base_get_result, task_mult_block));
        CHAN_OUT1(digit_t, A[i], b, CALL_CH(ch_mult_mod));

        m = *CHAN_IN2(digit_t, block[i], CH(task_pad, task_mult_block),
                                CH(task_mult_block_get_result, task_mult_block));
        CHAN_OUT1(digit_t, B[i], m, CALL_CH(ch_mult_mod));

        LOG("mult block: a[%u]=%x b[%u]=%x\r\n", i, b, i, m);
    }
    task_t* next_task=TASK_REF(task_mult_block_get_result);
    CHAN_OUT1(task_t*, next_task,next_task , CALL_CH(ch_mult_mod));
    TRANSITION_TO(task_mult_mod);
}

void task_mult_block_get_result()
{
    int i;
    digit_t m, e;
    unsigned cyphertext_len;

    LOG("mult block get result: block: ");
    for (i = NUM_DIGITS - 1; i >= 0; --i) { // reverse for printing
        m = *CHAN_IN1(digit_t, product[i], RET_CH(ch_mult_mod));
        LOG("%x ", m);
        CHAN_OUT1(digit_t, block[i], m, CH(task_mult_block_get_result, task_mult_block));
    }
    LOG("\r\n");

    e = *CHAN_IN1(digit_t, E, CH(task_exp, task_mult_block_get_result));

    // On last iteration we don't need to square base
    if (e > 0) {

        // TODO: current implementation restricts us to send only to the next instantiation
        // of self, so for now, as a workaround, we proxy the value in every instantiation
        cyphertext_len = *CHAN_IN2(unsigned, cyphertext_len,
                                   CH(task_init, task_mult_block_get_result),
                                   SELF_IN_CH(task_mult_block_get_result));
        CHAN_OUT1(unsigned, cyphertext_len, cyphertext_len, SELF_OUT_CH(task_mult_block_get_result));

        TRANSITION_TO(task_square_base);

    } else { // block is finished, save it

        cyphertext_len = *CHAN_IN2(unsigned, cyphertext_len,
                                   CH(task_init, task_mult_block_get_result),
                                   SELF_IN_CH(task_mult_block_get_result));
        LOG("mult block get result: cyphertext len=%u\r\n", cyphertext_len);

        if (cyphertext_len + NUM_DIGITS <= CYPHERTEXT_SIZE) {

            for (i = 0; i < NUM_DIGITS; ++i) { // reverse for printing
                // TODO: we could save this read by rolling this loop into the
                // above loop, by paying with an extra conditional in the
                // above-loop.
                m = *CHAN_IN1(digit_t, product[i], RET_CH(ch_mult_mod));
                CHAN_OUT1(digit_t, cyphertext[cyphertext_len], m,
                         CH(task_mult_block_get_result, task_print_cyphertext));
                cyphertext_len++;
            }

        } else {
            printf("WARN: block dropped: cyphertext overlow [%u > %u]\r\n",
                   cyphertext_len + NUM_DIGITS, CYPHERTEXT_SIZE);
            // carry on encoding, though
        }

        // TODO: implementation limitation: cannot multicast and send to self
        // in the same macro
        CHAN_OUT1(unsigned, cyphertext_len, cyphertext_len, SELF_OUT_CH(task_mult_block_get_result));
        CHAN_OUT1(unsigned, cyphertext_len, cyphertext_len,
                 CH(task_mult_block_get_result, task_print_cyphertext));

        LOG("mult block get results: block done, cyphertext_len=%u\r\n", cyphertext_len);
        TRANSITION_TO(task_pad);
    }

}

// TODO: is this task necessary? it seems to act as nothing but a proxy
// TODO: is there opportunity for special zero-copy optimization here
void task_square_base()
{
    int i;
    digit_t b;

    LOG("square base\r\n");

    for (i = 0; i < NUM_DIGITS; ++i) {
        b = *CHAN_IN2(digit_t, base[i], MC_IN_CH(ch_base, task_pad, task_square_base),
                               MC_IN_CH(ch_square_base, task_square_base_get_result, task_square_base));
        CHAN_OUT1(digit_t, A[i], b, CALL_CH(ch_mult_mod));
        CHAN_OUT1(digit_t, B[i], b, CALL_CH(ch_mult_mod));

        LOG("square base: b[%u]=%x\r\n", i, b);
    }
    task_t* next_task=TASK_REF(task_square_base_get_result);
    CHAN_OUT1(task_t*, next_task, next_task, CALL_CH(ch_mult_mod));
    TRANSITION_TO(task_mult_mod);
}

// TODO: is there opportunity for special zero-copy optimization here
void task_square_base_get_result()
{
    int i;
    digit_t b;

    LOG("square base get result\r\n");

    for (i = 0; i < NUM_DIGITS; ++i) {
        b = *CHAN_IN1(digit_t,product[i], RET_CH(ch_mult_mod));
        LOG("suqare base get result: base[%u]=%x\r\n", i, b);
        CHAN_OUT1(digit_t, base[i], b, MC_OUT_CH(ch_square_base, task_square_base_get_result,
                                       task_square_base, task_mult_block));
    }

    TRANSITION_TO(task_exp);
}

void task_print_cyphertext()
{
    int i, j = 0;
    unsigned cyphertext_len;
    digit_t c;
    char line[PRINT_HEX_ASCII_COLS];

    cyphertext_len = *CHAN_IN1(unsigned, cyphertext_len,
                               CH(task_mult_block_get_result, task_print_cyphertext));
    LOG("print cyphertext: len=%u\r\n", cyphertext_len);

	PRINTF("TIME end is 65536*%u+%u\r\n",overflow,(unsigned)TBR);
    //ENERGY_GUARD_BEGIN();
    printf("Cyphertext:\r\n");
    for (i = 0; i < cyphertext_len; ++i) {
        c = *CHAN_IN1(digit_t, cyphertext[i], CH(task_mult_block_get_result, task_print_cyphertext));
        printf("%02x ", c);
        if ((i + 1) % PRINT_HEX_ASCII_COLS == 0) {
            printf(" ");
            j = 0;
            printf("\r\n");
        }
    }
    printf("\r\n");
    //ENERGY_GUARD_END();
    while(1);
    TRANSITION_TO(task_print_cyphertext);
}

// TODO: this task also looks like a proxy: is it avoidable?
void task_mult_mod()
{
    int i;
    digit_t a, b;

    LOG("mult mod\r\n");

    for (i = 0; i < NUM_DIGITS; ++i) {
        a = *CHAN_IN1(digit_t, A[i], CALL_CH(ch_mult_mod));
        b = *CHAN_IN1(digit_t, B[i], CALL_CH(ch_mult_mod));

        LOG("mult mod: i=%u a=%x b=%x\r\n", i, a, b);

        CHAN_OUT1(digit_t, A[i], a, CH(task_mult_mod, task_mult));
        CHAN_OUT1(digit_t, B[i], b, CH(task_mult_mod, task_mult));
    }
	unsigned zero = 0;
    CHAN_OUT1(unsigned, digit, zero, CH(task_mult_mod, task_mult));
    CHAN_OUT1(unsigned, carry, zero, CH(task_mult_mod, task_mult));

    TRANSITION_TO(task_mult);
}

void task_mult()
{
    int i;
    digit_t a, b, c;
    digit_t dp, p, carry;
    int digit;

    digit = *CHAN_IN2(unsigned, digit, CH(task_mult_mod, task_mult), SELF_IN_CH(task_mult));
    carry = *CHAN_IN2(unsigned, carry, CH(task_mult_mod, task_mult), SELF_IN_CH(task_mult));

    LOG("mult: digit=%u carry=%x\r\n", digit, carry);

    p = carry;
    c = 0;
    for (i = 0; i < NUM_DIGITS; ++i) {
        if (digit - i >= 0 && digit - i < NUM_DIGITS) {
            a = *CHAN_IN1(digit_t, A[digit - i], CH(task_mult_mod, task_mult));
            b = *CHAN_IN1(digit_t, B[i], CH(task_mult_mod, task_mult));
            dp = a * b;

            c += dp >> DIGIT_BITS;
            p += dp & DIGIT_MASK;

            LOG("mult: i=%u a=%x b=%x p=%x\r\n", i, a, b, p);
        }
    }

    c += p >> DIGIT_BITS;
    p &= DIGIT_MASK;

    LOG("mult: c=%x p=%x\r\n", c, p);

    CHAN_OUT1(digit_t, product[digit], p, MC_OUT_CH(ch_product, task_mult,
             task_reduce_digits,
             task_reduce_n_divisor, task_reduce_normalizable, task_reduce_normalize));

    CHAN_OUT1(digit_t, product[digit], p, CALL_CH(ch_print_product));

    digit++;

    if (digit < NUM_DIGITS * 2) {
        CHAN_OUT1(unsigned, carry, c, SELF_OUT_CH(task_mult));
        CHAN_OUT1(unsigned, digit, digit, SELF_OUT_CH(task_mult));
        TRANSITION_TO(task_mult);
    } else {
	task_t* next_task= TASK_REF(task_reduce_digits);
        CHAN_OUT1(task_t*, next_task,next_task, CALL_CH(ch_print_product));
        TRANSITION_TO(task_print_product);
    }
}

void task_reduce_digits()
{
    int d;
    digit_t m;

    LOG("reduce: digits\r\n");

    // Start reduction loop at most significant non-zero digit
    d = 2 * NUM_DIGITS;
    do {
        d--;
        m = *CHAN_IN1(digit_t, product[d], MC_IN_CH(ch_product, task_mult, task_reduce_digits));
        LOG("reduce digits: p[%u]=%x\r\n", d, m);
    } while (m == 0 && d > 0);

    if (m == 0) {
        LOG("reduce: digits: all digits of message are zero\r\n");
        TRANSITION_TO(task_init);
    }
    LOG("reduce: digits: d = %u\r\n", d);

    CHAN_OUT1(unsigned, digit, d, MC_OUT_CH(ch_digit, task_reduce_digits,
                                 task_reduce_normalizable, task_reduce_normalize,
                                 task_reduce_quotient));

    TRANSITION_TO(task_reduce_normalizable);
}

void task_reduce_normalizable()
{
    int i;
    unsigned m, n, d, offset;
    bool normalizable = true;

    LOG("reduce: normalizable\r\n");

    // Variables:
    //   m: message
    //   n: modulus
    //   b: digit base (2**8)
    //   l: number of digits in the product (2 * NUM_DIGITS)
    //   k: number of digits in the modulus (NUM_DIGITS)
    //
    // if (m > n b^(l-k)
    //     m = m - n b^(l-k)
    //
    // NOTE: It's temptimg to do the subtraction opportunistically, and if
    // the result is negative, then the condition must have been false.
    // However, we can't do that because under this approach, we must
    // write to the output channel zero digits for digits that turn
    // out to be equal, but if a later digit pair is such that condition
    // is false (p < m), then those rights are invalid, but we have no
    // good way of exluding them from being picked up by the later
    // task. One possiblity is to transmit a flag to that task that
    // tells it whether to include our output channel into its input sync
    // statement. However, this seems less elegant than splitting the
    // normalization into two tasks: the condition and the subtraction.
    //
    // Multiplication by a power of radix (b) is a shift, so when we do the
    // comparison/subtraction of the digits, we offset the index into the
    // product digits by (l-k) = NUM_DIGITS.

    d = *CHAN_IN1(unsigned, digit, MC_IN_CH(ch_digit, task_reduce_digits, task_reduce_noramlizable));

    offset = d + 1 - NUM_DIGITS; // TODO: can this go below zero
    LOG("reduce: normalizable: d=%u offset=%u\r\n", d, offset);

    CHAN_OUT1(unsigned, offset, offset, CH(task_reduce_normalizable, task_reduce_normalize));

    for (i = d; i >= 0; --i) {
        m = *CHAN_IN1(digit_t, product[i],
                      MC_IN_CH(ch_product, task_mult, task_reduce_normalizable));
        n = *CHAN_IN1(digit_t, NN[i - offset], MC_IN_CH(ch_modulus, task_init,
                                              task_reduce_normalizable));

        LOG("normalizable: m[%u]=%x n[%u]=%x\r\n", i, m, i - offset, n);

        if (m > n) {
            break;
        } else if (m < n) {
            normalizable = false;
            break;
        }
    }

    if (!normalizable && d == NUM_DIGITS - 1) {
        LOG("reduce: normalizable: reduction done: message < modulus\r\n");

        // TODO: is this copy avoidable? a 'mult mod done' task doesn't help
        // because we need to ship the data to it.
        for (i = 0; i < NUM_DIGITS; ++i) {
            m = *CHAN_IN1(digit_t, product[i],
                          MC_IN_CH(ch_product, task_mult, task_reduce_normalizable));
            CHAN_OUT1(digit_t, product[i], m, RET_CH(ch_mult_mod));
        }

        const task_t *next_task = *CHAN_IN1(task_t*,next_task, CALL_CH(ch_mult_mod));
        transition_to(next_task);
    }

    LOG("normalizable: %u\r\n", normalizable);

    if (normalizable) {
        TRANSITION_TO(task_reduce_normalize);
    } else {
        TRANSITION_TO(task_reduce_n_divisor);
    }
}

// TODO: consider decomposing into subtasks
void task_reduce_normalize()
{
    int i;
    digit_t m, n, d, s;
    unsigned borrow, offset;
    const task_t *next_task;

    LOG("normalize\r\n");

    offset = *CHAN_IN1(unsigned, offset, CH(task_reduce_normalizable, task_reduce_normalize));

    // To call the print task, we need to proxy the values we don't touch
    for (i = 0; i < offset; ++i) {
        m = *CHAN_IN1(digit_t, product[i], MC_IN_CH(ch_product, task_mult, task_reduce_normalize));
        CHAN_OUT1(digit_t, product[i], m, CALL_CH(ch_print_product));
    }

    borrow = 0;
    for (i = 0; i < NUM_DIGITS; ++i) {
        m = *CHAN_IN1(digit_t, product[i + offset],
                      MC_IN_CH(ch_product, task_mult, task_reduce_normalize));
        n = *CHAN_IN1(digit_t, NN[i], MC_IN_CH(ch_modulus, task_init, task_reduce_normalize));

        s = n + borrow;
        if (m < s) {
            m += 1 << DIGIT_BITS;
            borrow = 1;
        } else {
            borrow = 0;
        }
        d = m - s;

        LOG("normalize: m[%u]=%x n[%u]=%x b=%u d=%x\r\n",
                i + offset, m, i, n, borrow, d);

        CHAN_OUT1(digit_t, product[i + offset], d,
                 MC_OUT_CH(ch_normalized_product, task_reduce_normalize,
                           task_reduce_quotient, task_reduce_compare,
                           task_reduce_add, task_reduce_subtract));

        CHAN_OUT1(digit_t, product[i + offset], d, CALL_CH(ch_print_product));
    }

    // To call the print task, we need to proxy the values we don't touch
    for (i = offset + NUM_DIGITS; i < NUM_DIGITS * 2; ++i) {
	    unsigned zero = 0;
        CHAN_OUT1(digit_t, product[i], zero, CALL_CH(ch_print_product));
    }

    if (offset > 0) { // l-1 > k-1 (loop bounds), where offset=l-k, where l=|m|,k=|n|
        next_task = TASK_REF(task_reduce_n_divisor);
    } else {
        LOG("reduce: normalize: reduction done: no digits to reduce\r\n");
        // TODO: is this copy avoidable?
        for (i = 0; i < NUM_DIGITS; ++i) {
            m = *CHAN_IN1(digit_t, product[i],
                          MC_IN_CH(ch_product, task_mult, task_reduce_normalize));
            CHAN_OUT1(digit_t, product[i], m, RET_CH(ch_mult_mod));
        }
        next_task = *CHAN_IN1(task_t*, next_task, CALL_CH(ch_mult_mod));
    }

    CHAN_OUT1(task_t*, next_task, next_task, CALL_CH(ch_print_product));
    TRANSITION_TO(task_print_product);
}

void task_reduce_n_divisor()
{
    digit_t n[2]; // [1]=N[msd], [0]=N[msd-1]
    digit_t n_div;

    LOG("reduce: n divisor\r\n");

    n[1]  = *CHAN_IN1(digit_t, NN[NUM_DIGITS - 1],
                      MC_IN_CH(ch_modulus, task_init, task_reduce_n_divisor));
    n[0] = *CHAN_IN1(digit_t, NN[NUM_DIGITS - 2], MC_IN_CH(ch_modulus, task_init, task_n_divisor));

    // Divisor, derived from modulus, for refining quotient guess into exact value
    n_div = ((n[1]<< DIGIT_BITS) + n[0]);

    LOG("reduce: n divisor: n[1]=%x n[0]=%x n_div=%x\r\n", n[1], n[0], n_div);

    CHAN_OUT1(digit_t, n_div, n_div, CH(task_reduce_n_divisor, task_reduce_quotient));

    TRANSITION_TO(task_reduce_quotient);
}

void task_reduce_quotient()
{
    unsigned d;
    digit_t m[3]; // [2]=m[d], [1]=m[d-1], [0]=m[d-2]
    digit_t m_n, n_div, q;
    uint32_t qn, n_q; // must hold at least 3 digits

    d = *CHAN_IN2(unsigned, digit, MC_IN_CH(ch_digit, task_reduce_digits, task_reduce_quotient),
                         SELF_IN_CH(task_reduce_quotient));

    LOG("reduce: quotient: d=%u\r\n", d);

    m[2] = *CHAN_IN3(digit_t, product[d],
                     MC_IN_CH(ch_product, task_mult, task_reduce_quotient),
                     MC_IN_CH(ch_normalized_product, task_reduce_normalize, task_reduce_quotient),
                     MC_IN_CH(ch_reduce_subtract_product, task_reduce_subtract,
                              task_reduce_quotient));

    m[1] = *CHAN_IN3(digit_t, product[d - 1],
                     MC_IN_CH(ch_product, task_mult, task_reduce_quotient),
                     MC_IN_CH(ch_normalized_product, task_reduce_normalize, task_reduce_quotient),
                     MC_IN_CH(ch_reduce_subtract_product, task_reduce_subtract,
                              task_reduce_quotient));
    m[0] = *CHAN_IN3(digit_t, product[d - 2],
                     MC_IN_CH(ch_product, task_mult, task_reduce_quotient),
                     MC_IN_CH(ch_normalized_product, task_reduce_normalize, task_reduce_quotient),
                     MC_IN_CH(ch_reduce_subtract_product, task_reduce_subtract,
                              task_reduce_quotient));
    // NOTE: we asserted that NUM_DIGITS >= 2, so p[d-2] is safe

    m_n = *CHAN_IN1(digit_t, NN[NUM_DIGITS - 1],
                    MC_IN_CH(ch_modulus, task_init, task_reduce_quotient));

    LOG("reduce: quotient: m_n=%x m[d]=%x\r\n", m_n, m[2]);

    // Choose an initial guess for quotient
    if (m[2] == m_n) {
        q = (1 << DIGIT_BITS) - 1;
    } else {
        q = ((m[2] << DIGIT_BITS) + m[1]) / m_n;
    }

    LOG("reduce: quotient: q0=%x\r\n", q);

    // Refine quotient guess

    // NOTE: An alternative to composing the digits into one variable, is to
    // have a loop that does the comparison digit by digit to implement the
    // condition of the while loop below.
    n_q = ((uint32_t)m[2] << (2 * DIGIT_BITS)) + (m[1] << DIGIT_BITS) + m[0];

    LOG("reduce: quotient: m[d]=%x m[d-1]=%x m[d-2]=%x n_q=%x%x\r\n",
           m[2], m[1], m[0], (uint16_t)((n_q >> 16) & 0xffff), (uint16_t)(n_q & 0xffff));

    n_div = *CHAN_IN1(digit_t, n_div, CH(task_reduce_n_divisor, task_reduce_quotient));

    LOG("reduce: quotient: n_div=%x q0=%x\r\n", n_div, q);

    q++;
    do {
        q--;
        qn = mult16(n_div, q);
        LOG("reduce: quotient: q=%x qn=%x%x\r\n", q,
              (uint16_t)((qn >> 16) & 0xffff), (uint16_t)(qn & 0xffff));
    } while (qn > n_q);

    // This is still not the final quotient, it may be off by one,
    // which we determine and fix in the 'compare' and 'add' steps.
    LOG("reduce: quotient: q=%x\r\n", q);

    CHAN_OUT1(digit_t, quotient, q, CH(task_reduce_quotient, task_reduce_multiply));

    CHAN_OUT1(unsigned, digit, d, MC_OUT_CH(ch_reduce_digit, task_reduce_quotient,
                                 task_reduce_multiply, task_reduce_add,
                                 task_reduce_subtract));

    d--;
    CHAN_OUT1(unsigned, digit, d, SELF_OUT_CH(task_reduce_quotient));

    TRANSITION_TO(task_reduce_multiply);
}

// NOTE: this is multiplication by one digit, hence not re-using mult task
void task_reduce_multiply()
{
    int i;
    digit_t m, q, n;
    unsigned c, d, offset;

    d = *CHAN_IN1(unsigned, digit, MC_IN_CH(ch_reduce_digit,
                                  task_reduce_quotient, task_reduce_multiply));
    q = *CHAN_IN1(digit_t, quotient, CH(task_reduce_quotient, task_reduce_multiply));

    LOG("reduce: multiply: d=%x q=%x\r\n", d, q);

    // As part of this task, we also perform the left-shifting of the q*m
    // product by radix^(digit-NUM_DIGITS), where NUM_DIGITS is the number
    // of digits in the modulus. We implement this by fetching the digits
    // of number being reduced at that offset.
    offset = d - NUM_DIGITS;
    LOG("reduce: multiply: offset=%u\r\n", offset);

    // For calling the print task we need to proxy to it values that
    // we do not modify
    for (i = 0; i < offset; ++i) {
	    unsigned zero = 0;
        CHAN_OUT1(digit_t, product[i], zero, CALL_CH(ch_print_product));
    }

    // TODO: could convert the loop into a self-edge
    c = 0;
    for (i = offset; i < 2 * NUM_DIGITS; ++i) {

        // This condition creates the left-shifted zeros.
        // TODO: consider adding number of digits to go along with the 'product' field,
        // then we would not have to zero out the MSDs
        m = c;
        if (i < offset + NUM_DIGITS) {
            n = *CHAN_IN1(digit_t, NN[i - offset],
                          MC_IN_CH(ch_modulus, task_init, task_reduce_multiply));
            m += q * n;
        } else {
            n = 0;
            // TODO: could break out of the loop  in this case (after CHAN_OUT)
        }

        LOG("reduce: multiply: n[%u]=%x q=%x c=%x m[%u]=%x\r\n",
               i - offset, n, q, c, i, m);

        c = m >> DIGIT_BITS;
        m &= DIGIT_MASK;

        CHAN_OUT1(digit_t, product[i], m, MC_OUT_CH(ch_qn, task_reduce_multiply,
                                          task_reduce_compare, task_reduce_subtract));

        CHAN_OUT1(digit_t, product[i], m, CALL_CH(ch_print_product));
    }
	task_t* next_task = TASK_REF(task_reduce_compare);
    CHAN_OUT1(task_t*,next_task, next_task, CALL_CH(ch_print_product));
    TRANSITION_TO(task_print_product);
}

void task_reduce_compare()
{
    int i;
    digit_t m, qn;
    char relation = '=';

    LOG("reduce: compare\r\n");

    // TODO: could transform this loop into a self-edge
    // TODO: this loop might not have to go down to zero, but to NUM_DIGITS
    // TODO: consider adding number of digits to go along with the 'product' field
    for (i = NUM_DIGITS * 2 - 1; i >= 0; --i) {
        m = *CHAN_IN3(digit_t, product[i],
                      MC_IN_CH(ch_product, task_mult, task_reduce_compare),
                      MC_IN_CH(ch_normalized_product, task_reduce_normalize, task_reduce_compare),
                      // TODO: do we need 'ch_reduce_add_product' here? We do not if
                      // the 'task_reduce_subtract' overwrites all values written by
                      // 'task_reduce_add', which, I think, is the case.
                      MC_IN_CH(ch_reduce_subtract_product, task_reduce_subtract,
                               task_reduce_compare));
        qn = *CHAN_IN1(digit_t, product[i],
                       MC_IN_CH(ch_qn, task_reduce_multiply, task_reduce_compare));

        LOG("reduce: compare: m[%u]=%x qn[%u]=%x\r\n", i, m, i, qn);

        if (m > qn) {
            relation = '>';
            break;
        } else if (m < qn) {
            relation = '<';
            break;
        }
    }

    LOG("reduce: compare: relation %c\r\n", relation);

    if (relation == '<') {
        TRANSITION_TO(task_reduce_add);
    } else {
        TRANSITION_TO(task_reduce_subtract);
    }
}

// TODO: this addition and subtraction can probably be collapsed
// into one loop that always subtracts the digits, but, conditionally, also
// adds depending on the result from the 'compare' task. For now,
// we keep them separate for clarity.

void task_reduce_add()
{
    int i, j;
    digit_t m, n, c, r;
    unsigned d, offset;

    d = *CHAN_IN1(unsigned, digit, MC_IN_CH(ch_reduce_digit,
                                  task_reduce_quotient, task_reduce_compare));

    // Part of this task is to shift modulus by radix^(digit - NUM_DIGITS)
    offset = d - NUM_DIGITS;

    LOG("reduce: add: d=%u offset=%u\r\n", d, offset);

    // For calling the print task we need to proxy to it values that
    // we do not modify
    for (i = 0; i < offset; ++i) {
	    unsigned zero = 0;
        CHAN_OUT1(digit_t, product[i], zero, CALL_CH(ch_print_product));
    }

    // For calling the print task we need to proxy to it values that
    // we do not modify
   /* for (i = 0; i < offset; ++i) {
	    unsigned zero = 0;
        CHAN_OUT1(digit_t, product[i], zero, CALL_CH(ch_print_product));
    }*/ //KWMAENG: if error, look here!!

    // TODO: coult transform this loop into a self-edge
    c = 0;
    for (i = offset; i < 2 * NUM_DIGITS; ++i) {
        m = *CHAN_IN3(digit_t, product[i],
                      MC_IN_CH(ch_product, task_mult, task_reduce_add),
                      MC_IN_CH(ch_normalized_product, task_reduce_normalize, task_reduce_add),
                      MC_IN_CH(ch_reduce_subtract_product,
                               task_reduce_subtract, task_reduce_add));

        // Shifted index of the modulus digit
        j = i - offset;

        if (i < offset + NUM_DIGITS) {
            n = *CHAN_IN1(digit_t, NN[j], MC_IN_CH(ch_modulus, task_init, task_reduce_add));
        } else {
            n = 0;
            j = 0; // a bit ugly, we want 'nan', but ok, since for output only
            // TODO: could break out of the loop in this case (after CHAN_OUT)
        }

        r = c + m + n;

        LOG("reduce: add: m[%u]=%x n[%u]=%x c=%x r=%x\r\n", i, m, j, n, c, r);

        c = r >> DIGIT_BITS;
        r &= DIGIT_MASK;

        CHAN_OUT1(digit_t, product[i], r, CH(task_reduce_add, task_reduce_subtract));
        CHAN_OUT1(digit_t, product[i], r, CALL_CH(ch_print_product));
    }
	task_t* next_task = TASK_REF(task_reduce_subtract);
    CHAN_OUT1(task_t*, next_task, next_task, CALL_CH(ch_print_product));
    TRANSITION_TO(task_print_product);
}

// TODO: re-use task_reduce_normalize?
void task_reduce_subtract()
{
    int i;
    digit_t m, s, r, qn;
    unsigned d, borrow, offset;

    d = *CHAN_IN1(unsigned, digit, MC_IN_CH(ch_reduce_digit, task_reduce_quotient,
                                  task_reduce_subtract));

    // The qn product had been shifted by this offset, no need to subtract the zeros
    offset = d - NUM_DIGITS;

    LOG("reduce: subtract: d=%u offset=%u\r\n", d, offset);

    // For calling the print task we need to proxy to it values that
    // we do not modify
    for (i = 0; i < offset; ++i) {
        m = *CHAN_IN4(digit_t, product[i],
                      MC_IN_CH(ch_product, task_mult, task_reduce_subtract),
                      MC_IN_CH(ch_normalized_product, task_reduce_normalize, task_reduce_subtract),
                      CH(task_reduce_add, task_reduce_subtract),
                      SELF_IN_CH(task_reduce_subtract));
	    unsigned zero = 0;
        CHAN_OUT1(digit_t, product[i], zero, CALL_CH(ch_print_product));
    }

    // TODO: could transform this loop into a self-edge
    borrow = 0;
    for (i = 0; i < 2 * NUM_DIGITS; ++i) {
        m = *CHAN_IN4(digit_t, product[i],
                      MC_IN_CH(ch_product, task_mult, task_reduce_subtract),
                      MC_IN_CH(ch_normalized_product, task_reduce_normalize, task_reduce_subtract),
                      CH(task_reduce_add, task_reduce_subtract),
                      SELF_IN_CH(task_reduce_subtract));

        // For calling the print task we need to proxy to it values that we do not modify
        if (i >= offset) {
            qn = *CHAN_IN1(digit_t, product[i],
                           MC_IN_CH(ch_qn, task_reduce_multiply, task_reduce_subtract));

            s = qn + borrow;
            if (m < s) {
                m += 1 << DIGIT_BITS;
                borrow = 1;
            } else {
                borrow = 0;
            }
            r = m - s;

            LOG("reduce: subtract: m[%u]=%x qn[%u]=%x b=%u r=%x\r\n",
                   i, m, i, qn, borrow, r);

            CHAN_OUT1(digit_t, product[i], r, MC_OUT_CH(ch_reduce_subtract_product, task_reduce_subtract,
                                              task_reduce_quotient, task_reduce_compare));
            CHAN_OUT1(digit_t, product[i], r, SELF_OUT_CH(task_reduce_subtract));
        } else {
            r = m;
        }
        CHAN_OUT1(digit_t, product[i], r, CALL_CH(ch_print_product));

        if (d == NUM_DIGITS) // reduction done
            CHAN_OUT1(digit_t, product[i], r, RET_CH(ch_mult_mod));
    }

    if (d > NUM_DIGITS) {
	    task_t* next_task=TASK_REF(task_reduce_quotient);
        CHAN_OUT1(task_t*, next_task, next_task, CALL_CH(ch_print_product));
    } else { // reduction finished: exit from the reduce hypertask (after print)
        LOG("reduce: subtract: reduction done\r\n");

        // TODO: Is it ok to get the next task directly from call channel?
        //       If not, all we have to do is have reduce task proxy it.
        //       Also, do we need a dedicated epilogue task?
        const task_t *next_task = *CHAN_IN1(task_t*, next_task, CALL_CH(ch_mult_mod));
        CHAN_OUT1(task_t*, next_task, next_task, CALL_CH(ch_print_product));
    }

    TRANSITION_TO(task_print_product);
}

// TODO: eliminate from control graph when not verbose
void task_print_product()
{
    const task_t* next_task;
#ifdef VERBOSE
    int i;
    digit_t m;

    LOG("print: P=");
    for (i = (NUM_DIGITS * 2) - 1; i >= 0; --i) {
        m = *CHAN_IN1(digit_t, product[i], CALL_CH(ch_print_product));
        LOG("%x ", m);
    }
    LOG("\r\n");
#endif

    next_task = *CHAN_IN1(task_t*, next_task, CALL_CH(ch_print_product));
    transition_to(next_task);
}

ENTRY_TASK(task_init)
INIT_FUNC(init)
