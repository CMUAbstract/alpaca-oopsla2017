#include <msp430.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

//#include <libwispbase/wisp-base.h>
//#include <wisp-base.h>
#include <libalpaca/alpaca.h>
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

//#include "../data/keysize.h"

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

	//GLOBAL_SB(digit_t, product, NUM_DIGITS * 2);
	GLOBAL_SB(digit_t, product, 32);
	GLOBAL_SB(digit_t, exponent);
	GLOBAL_SB(digit_t, exponent_next);
	GLOBAL_SB(unsigned, block_offset);
	GLOBAL_SB(unsigned, message_length);
	GLOBAL_SB(unsigned, cyphertext_len);
	//GLOBAL_SB(digit_t, base, NUM_DIGITS * 2);
	GLOBAL_SB(digit_t, base, 32);
	GLOBAL_SB(digit_t, modulus, NUM_DIGITS);
	GLOBAL_SB(digit_t, digit);
	GLOBAL_SB(digit_t, carry);
	GLOBAL_SB(unsigned, reduce);
	GLOBAL_SB(digit_t, cyphertext, CYPHERTEXT_SIZE);
	GLOBAL_SB(unsigned, offset);
	GLOBAL_SB(digit_t, n_div);
	GLOBAL_SB(task_t*, next_task);
	//GLOBAL_SB(digit_t, product2, NUM_DIGITS * 2);
	GLOBAL_SB(digit_t, product2, 32);
	GLOBAL_SB(task_t*, next_task_print);
	GLOBAL_SB(digit_t, block, 32);
	//GLOBAL_SB(digit_t, block, NUM_DIGITS * 2);
	GLOBAL_SB(unsigned, quotient);
	GLOBAL_SB(bool, print_which);

static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}
void init()
{
	init_hw();

#ifdef CONFIG_EDB
	edb_init();
#endif

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
	unsigned message_length = sizeof(PLAINTEXT) - 1; // skip the terminating null byte

	LOG("init\r\n");
	LOG("digit: %u\r\n", sizeof(digit_t));
	LOG("unsigned: %u\r\n",sizeof(unsigned));

	LOG("init: out modulus\r\n");

	// TODO: consider passing pubkey as a structure type
	for (i = 0; i < NUM_DIGITS; ++i) {
		GV(modulus, i) = pubkey.n[i];
	}

	LOG("init: out exp\r\n");

	GV(message_length) = message_length;
	GV(block_offset) = 0;
	GV(cyphertext_len) = 0;

	LOG("init: done\r\n");

	TRANSITION_TO(task_pad);
}

void task_pad()
{
	int i;

	LOG("pad: len=%u offset=%u\r\n", GV(message_length), GV(block_offset));

	if (GV(block_offset) >= GV(message_length)) {
		LOG("pad: message done\r\n");
		TRANSITION_TO(task_print_cyphertext);
	}

	LOG("process block: padded block at offset=%u: ", GV(block_offset));
	for (i = 0; i < NUM_PAD_DIGITS; ++i)
		LOG("%x ", PAD_DIGITS[i]);
	LOG("'");
	for (i = NUM_DIGITS - NUM_PAD_DIGITS - 1; i >= 0; --i)
		LOG("%x ", PLAINTEXT[GV(block_offset) + i]);
	LOG("\r\n");

	digit_t zero = 0;
	for (i = 0; i < NUM_DIGITS - NUM_PAD_DIGITS; ++i) {
		GV(base, i) = (GV(block_offset) + i < GV(message_length)) ? PLAINTEXT[GV(block_offset) + i] : 0xFF;
	}
	for (i = NUM_DIGITS - NUM_PAD_DIGITS; i < NUM_DIGITS; ++i) {
		GV(base, i) = 1;
	}
	GV(block, 0) = 1;
	for (i = 1; i < NUM_DIGITS; ++i)
		GV(block, i) = 0;

	//GV(exponent_next) = GV(exponent);
	GV(exponent) = pubkey.e;

	GV(block_offset) += NUM_DIGITS - NUM_PAD_DIGITS;

	TRANSITION_TO(task_exp);
}

void task_exp()
{
	LOG("exp: e=%x\r\n", GV(exponent));

	// ASSERT: e > 0


	if (GV(exponent) & 0x1) {
		GV(exponent) >>= 1;
		TRANSITION_TO(task_mult_block);
	} else {
		GV(exponent) >>= 1;
		TRANSITION_TO(task_square_base);
	}
}

// TODO: is this task strictly necessary? it only makes a call. Can this call
// be rolled into task_exp?
void task_mult_block()
{
	LOG("mult block\r\n");

	// TODO: pass args to mult: message * base
	GV(next_task) = TASK_REF(task_mult_block_get_result);
	TRANSITION_TO(task_mult_mod);
}

void task_mult_block_get_result()
{
	int i;

	LOG("mult block get result: block: ");
	for (i = NUM_DIGITS - 1; i >= 0; --i) { // reverse for printing
		GV(block, i) = GV(product, i);
		LOG("%x ", GV(product, i));
	}
	LOG("\r\n");

	// On last iteration we don't need to square base
	if (GV(exponent) > 0) {

		// TODO: current implementation restricts us to send only to the next instantiation
		// of self, so for now, as a workaround, we proxy the value in every instantiation

		TRANSITION_TO(task_square_base);

	} else { // block is finished, save it
		LOG("mult block get result: cyphertext len=%u\r\n", GV(cyphertext_len));

		if (GV(cyphertext_len) + NUM_DIGITS <= CYPHERTEXT_SIZE) {

			for (i = 0; i < NUM_DIGITS; ++i) { // reverse for printing
				// TODO: we could save this read by rolling this loop into the
				// above loop, by paying with an extra conditional in the
				// above-loop.
				GV(cyphertext, _global_cyphertext_len) = GV(product, i);
				++GV(cyphertext_len);
			}

		} else {
			printf("WARN: block dropped: cyphertext overlow [%u > %u]\r\n",
					GV(cyphertext_len) + NUM_DIGITS, CYPHERTEXT_SIZE);
			// carry on encoding, though
		}

		// TODO: implementation limitation: cannot multicast and send to self
		// in the same macro

		LOG("mult block get results: block done, cyphertext_len=%u\r\n", GV(cyphertext_len));
		TRANSITION_TO(task_pad);
	}

}

// TODO: is this task necessary? it seems to act as nothing but a proxy
// TODO: is there opportunity for special zero-copy optimization here
void task_square_base()
{
	LOG("square base\r\n");

	GV(next_task) = TASK_REF(task_square_base_get_result);
	TRANSITION_TO(task_mult_mod);
}

// TODO: is there opportunity for special zero-copy optimization here
void task_square_base_get_result()
{
	int i;
	digit_t b;

	LOG("square base get result\r\n");

	for (i = 0; i < NUM_DIGITS; ++i) {
		LOG("suqare base get result: base[%u]=%x\r\n", i, GV(product, i));
		GV(base, i) = GV(product, i);
	}

	TRANSITION_TO(task_exp);
}

void task_print_cyphertext()
{
	int i, j = 0;
	digit_t c;
	char line[PRINT_HEX_ASCII_COLS];

	LOG("print cyphertext: len=%u\r\n", GV(cyphertext_len));

	//ENERGY_GUARD_BEGIN();
	//printf("Cyphertext:\r\n");
	for (i = 0; i < GV(cyphertext_len); ++i) {
		c = GV(cyphertext, i);
		PRINTF("%02x ", c);
		//line[j++] = c;
		if ((i + 1) % PRINT_HEX_ASCII_COLS == 0) {
			PRINTF(" ");
			//for (j = 0; j < PRINT_HEX_ASCII_COLS; ++j) {
			//	c = line[j];
			//	if (!(32 <= c && c <= 127)) // not printable
			//		c = '.';
			//	printf("%c", c);
			//}
			//j = 0;
			PRINTF("\r\n");
		}
	}

	//TRANSITION_TO(task_init);
	TRANSITION_TO(task_print_cyphertext);
}

// TODO: this task also looks like a proxy: is it avoidable?
void task_mult_mod()
{
	LOG("mult mod\r\n");

	GV(digit) = 0;
	GV(carry) = 0;

	TRANSITION_TO(task_mult);
}

void task_mult()
{
	int i;
	digit_t a, b, c;
	digit_t dp, p;

	LOG("mult: digit=%u carry=%x\r\n", GV(digit), GV(carry));

	p = GV(carry);
	c = 0;
	for (i = 0; i < NUM_DIGITS; ++i) {
		if (GV(digit) - i >= 0 && GV(digit) - i < NUM_DIGITS) {
			a = GV(base, _global_digit-i);
			b = GV(block, i);
			dp = a * b;

			c += dp >> DIGIT_BITS;
			p += dp & DIGIT_MASK;

			LOG("mult: i=%u a=%x b=%x p=%x\r\n", i, a, b, p);
		}
	}

	c += p >> DIGIT_BITS;
	p &= DIGIT_MASK;

	LOG("mult: c=%x p=%x\r\n", c, p);
	GV(product, _global_digit) = p;
	GV(print_which) = 0;
	GV(digit)++;

	if (GV(digit) < NUM_DIGITS * 2) {
		GV(carry) = c;
		TRANSITION_TO(task_mult);
	} else {
		GV(next_task_print) = TASK_REF(task_reduce_digits);
		TRANSITION_TO(task_print_product);
	}
}

void task_reduce_digits()
{
	int d;

	LOG("reduce: digits\r\n");

	// Start reduction loop at most significant non-zero digit
	d = 2 * NUM_DIGITS;
	do {
		d--;
		LOG("reduce digits: p[%u]=%x\r\n", d, GV(product, d));
	} while (GV(product, d) == 0 && d > 0);

	if (GV(product, d) == 0) {
		LOG("reduce: digits: all digits of message are zero\r\n");
		TRANSITION_TO(task_init);
	}
	LOG("reduce: digits: d = %u\r\n", d);

	GV(reduce) = d;

	TRANSITION_TO(task_reduce_normalizable);
}

void task_reduce_normalizable()
{
	int i;
	unsigned m, n, d;
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

	d = *READ(GV(reduce));

	GV(offset) = GV(reduce) + 1 - NUM_DIGITS; // TODO: can this go below zero
	LOG("reduce: normalizable: d=%u offset=%u\r\n", GV(reduce), GV(offset));

	for (i = GV(reduce); i >= 0; --i) {

		LOG("normalizable: m[%u]=%x n[%u]=%x\r\n", i, GV(product, i), i - GV(offset), GV(modulus, i-_global_offset));

		if (GV(product, i) > GV(modulus, i-_global_offset)) {
			break;
		} else if (GV(product, i) < GV(modulus, i-_global_offset)) {
			normalizable = false;
			break;
		}
	}

	if (!normalizable && GV(reduce) == NUM_DIGITS - 1) {
		LOG("reduce: normalizable: reduction done: message < modulus\r\n");

		// TODO: is this copy avoidable? a 'mult mod done' task doesn't help
		// because we need to ship the data to it.
		transition_to(GV(next_task));
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
	digit_t m, n, d, s;
	unsigned borrow;

	LOG("normalize\r\n");

	int i;
	// To call the print task, we need to proxy the values we don't touch
	GV(print_which) = 0;

	borrow = 0;
	for (i = 0; i < NUM_DIGITS; ++i) {
		m = GV(product, i + _global_offset);
		n = GV(modulus, i);

		s = n + borrow;
		if (m < s) {
			m += 1 << DIGIT_BITS;
			borrow = 1;
		} else {
			borrow = 0;
		}
		d = m - s;

		LOG("normalize: m[%u]=%x n[%u]=%x b=%u d=%x\r\n",
				i + GV(offset), m, i, n, borrow, d);

		GV(product, i + _global_offset) = d;
	}

	// To call the print task, we need to proxy the values we don't touch

	if (GV(offset) > 0) { // l-1 > k-1 (loop bounds), where offset=l-k, where l=|m|,k=|n|
		GV(next_task_print) = TASK_REF(task_reduce_n_divisor);
	} else {
		LOG("reduce: normalize: reduction done: no digits to reduce\r\n");
		// TODO: is this copy avoidable?
		GV(next_task_print) = GV(next_task);
	}
	TRANSITION_TO(task_print_product);
}

void task_reduce_n_divisor()
{
	LOG("reduce: n divisor\r\n");

	// Divisor, derived from modulus, for refining quotient guess into exact value
	GV(n_div) = ( GV(modulus, NUM_DIGITS - 1)<< DIGIT_BITS) + GV(modulus, NUM_DIGITS -2);

	LOG("reduce: n divisor: n[1]=%x n[0]=%x n_div=%x\r\n", GV(modulus, NUM_DIGITS - 1), GV(modulus, NUM_DIGITS -2), GV(n_div));

	TRANSITION_TO(task_reduce_quotient);
}

void task_reduce_quotient()
{
	digit_t m_n, q;
	uint32_t qn, n_q; // must hold at least 3 digits

	LOG("reduce: quotient: d=%u\r\n", GV(reduce));

	// NOTE: we asserted that NUM_DIGITS >= 2, so p[d-2] is safe

	LOG("reduce: quotient: m_n=%x m[d]=%x\r\n", GV(modulus, NUM_DIGITS - 1), GV(product, _global_reduce));

	// Choose an initial guess for quotient
	if (GV(product, _global_reduce) == GV(modulus, NUM_DIGITS - 1)) {
		GV(quotient) = (1 << DIGIT_BITS) - 1;
	} else {
		GV(quotient) = ((GV(product, _global_reduce) << DIGIT_BITS) + GV(product, _global_reduce - 1)) / GV(modulus, NUM_DIGITS - 1);
	}

	LOG("reduce: quotient: q0=%x\r\n", q);

	// Refine quotient guess

	// NOTE: An alternative to composing the digits into one variable, is to
	// have a loop that does the comparison digit by digit to implement the
	// condition of the while loop below.
	n_q = ((uint32_t)GV(product, _global_reduce) << (2 * DIGIT_BITS)) + (GV(product, _global_reduce - 1) << DIGIT_BITS) + GV(product, _global_reduce - 2);

	LOG("reduce: quotient: m[d]=%x m[d-1]=%x m[d-2]=%x n_q=%x%x\r\n",
			GV(product, _global_reduce), GV(product, _global_reduce - 1), GV(product, _global_reduce - 2), (uint16_t)((n_q >> 16) & 0xffff), (uint16_t)(n_q & 0xffff));

	LOG("reduce: quotient: n_div=%x q0=%x\r\n", GV(n_div), GV(quotient));

	GV(quotient)++;
	do {
		GV(quotient)--;
		qn = mult16(GV(n_div), GV(quotient));
		//qn = GV(n_div) * GV(quotient);
		LOG("QN1 = %x\r\n", (uint16_t)((qn >> 16) & 0xffff));
		LOG("QN0 = %x\r\n", (uint16_t)(qn & 0xffff));
		LOG("reduce: quotient: q=%x qn=%x%x\r\n", GV(quotient),
				(uint16_t)((qn >> 16) & 0xffff), (uint16_t)(qn & 0xffff));
	} while (qn > n_q);

	// This is still not the final quotient, it may be off by one,
	// which we determine and fix in the 'compare' and 'add' steps.
	LOG("reduce: quotient: q=%x\r\n", GV(quotient));

	GV(reduce)--;

	TRANSITION_TO(task_reduce_multiply);
}

// NOTE: this is multiplication by one digit, hence not re-using mult task
void task_reduce_multiply()
{
	int i;
	digit_t m, n;
	unsigned c, offset;

	LOG("reduce: multiply: d=%x q=%x\r\n", GV(reduce) + 1, GV(quotient));

	// As part of this task, we also perform the left-shifting of the q*m
	// product by radix^(digit-NUM_DIGITS), where NUM_DIGITS is the number
	// of digits in the modulus. We implement this by fetching the digits
	// of number being reduced at that offset.
	offset = GV(reduce) + 1 - NUM_DIGITS;
	LOG("reduce: multiply: offset=%u\r\n", offset);

	// For calling the print task we need to proxy to it values that
	// we do not modify
	for (i = 0; i < offset; ++i) {
		GV(product2, i) = 0;
	}

	// TODO: could convert the loop into a self-edge
	c = 0;
	for (i = offset; i < 2 * NUM_DIGITS; ++i) {

		// This condition creates the left-shifted zeros.
		// TODO: consider adding number of digits to go along with the 'product' field,
		// then we would not have to zero out the MSDs
		m = c;
		if (i < offset + NUM_DIGITS) {
			n = GV(modulus, i - offset);
			//MC_IN_CH(ch_modulus, task_init, task_reduce_multiply));
			m += GV(quotient) * n;
		} else {
			n = 0;
			// TODO: could break out of the loop  in this case (after WRITE)
		}

		LOG("reduce: multiply: n[%u]=%x q=%x c=%x m[%u]=%x\r\n",
				i - offset, n, GV(quotient), c, i, m);

		c = m >> DIGIT_BITS;
		m &= DIGIT_MASK;

		GV(product2, i) = m;

	}
	GV(print_which) = 1;
	GV(next_task_print) = TASK_REF(task_reduce_compare);
	TRANSITION_TO(task_print_product);
}

void task_reduce_compare()
{
	int i;
	char relation = '=';

	LOG("reduce: compare\r\n");

	// TODO: could transform this loop into a self-edge
	// TODO: this loop might not have to go down to zero, but to NUM_DIGITS
	// TODO: consider adding number of digits to go along with the 'product' field
	for (i = NUM_DIGITS * 2 - 1; i >= 0; --i) {
		LOG("reduce: compare: m[%u]=%x qn[%u]=%x\r\n", i, GV(product, i), i, GV(product2, i));

		if (GV(product, i) > GV(product2, i)) {
			relation = '>';
			break;
		} else if (GV(product, i) < GV(product2, i)) {
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
	digit_t m, n, c;
	unsigned offset;

	// Part of this task is to shift modulus by radix^(digit - NUM_DIGITS)
	offset = GV(reduce) + 1 - NUM_DIGITS;

	LOG("reduce: add: d=%u offset=%u\r\n", GV(reduce) + 1, offset);

	// For calling the print task we need to proxy to it values that
	// we do not modify

	// TODO: coult transform this loop into a self-edge
	c = 0;
	for (i = offset; i < 2 * NUM_DIGITS; ++i) {
		m = GV(product, i);

		// Shifted index of the modulus digit
		j = i - offset;

		if (i < offset + NUM_DIGITS) {
			n = GV(modulus, j);
		} else {
			n = 0;
			j = 0; // a bit ugly, we want 'nan', but ok, since for output only
			// TODO: could break out of the loop in this case (after WRITE)
		}

		GV(product, i) = c + m + n;

		LOG("reduce: add: m[%u]=%x n[%u]=%x c=%x r=%x\r\n", i, m, j, n, c, GV(product, i));

		c = GV(product, i) >> DIGIT_BITS;
		GV(product, i) &= DIGIT_MASK;
	}
	GV(print_which) = 0;
	GV(next_task_print) = TASK_REF(task_reduce_subtract);
	TRANSITION_TO(task_print_product);
}

// TODO: re-use task_reduce_normalize?
void task_reduce_subtract()
{
	LOG("subtract entered!!");
	int i;
	digit_t m, s, qn;
	unsigned borrow, offset;

	// The qn product had been shifted by this offset, no need to subtract the zeros
	offset = GV(reduce) + 1 - NUM_DIGITS;

	LOG("reduce: subtract: d=%u offset=%u\r\n", GV(reduce) + 1, offset);

	// For calling the print task we need to proxy to it values that
	// we do not modify

	// TODO: could transform this loop into a self-edge
	borrow = 0;
	for (i = 0; i < 2 * NUM_DIGITS; ++i) {
		m = GV(product, i);

		// For calling the print task we need to proxy to it values that we do not modify
		if (i >= offset) {
			qn = GV(product2, i);

			s = qn + borrow;
			if (m < s) {
				m += 1 << DIGIT_BITS;
				borrow = 1;
			} else {
				borrow = 0;
			}
			GV(product, i) = m - s;

			LOG("reduce: subtract: m[%u]=%x qn[%u]=%x b=%u r=%x\r\n",
					i, m, i, qn, borrow, GV(product, i));

		}
	}
	GV(print_which) = 0;

	if (GV(reduce) + 1 > NUM_DIGITS) {
		GV(next_task_print) = TASK_REF(task_reduce_quotient);
	} else { // reduction finished: exit from the reduce hypertask (after print)
		LOG("reduce: subtract: reduction done\r\n");

		// TODO: Is it ok to get the next task directly from call channel?
		//       If not, all we have to do is have reduce task proxy it.
		//       Also, do we need a dedicated epilogue task?
		GV(next_task_print) = GV(next_task);
	}
	TRANSITION_TO(task_print_product);
}

// TODO: eliminate from control graph when not verbose
void task_print_product()
{
	const task_t* next_task;
#if 0
	int i;

	LOG("print: P=");
	for (i = (NUM_DIGITS * 2) - 1; i >= 0; --i) {
		if(GV(print_which)){
			LOG("%x ", GV(product2, i));
		}
		else{
			LOG("%x ", GV(product, i));
		}
	}
	LOG("\r\n");
#endif
	transition_to(GV(next_task_print));
}

	ENTRY_TASK(task_init)
INIT_FUNC(init)
