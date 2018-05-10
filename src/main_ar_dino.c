#include <msp430.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include <libwispbase/accel.h>
#include <libmspbuiltins/builtins.h>
#include <libio/log.h>
#include <libmsp/mem.h>
#include <libmsp/periph.h>
#include <libmsp/clock.h>
#include <libmsp/watchdog.h>
#include <libmsp/gpio.h>
#include <libmspmath/msp-math.h>

#ifdef CONFIG_EDB
#include <libedb/edb.h>
#else
#define ENERGY_GUARD_BEGIN()
#define ENERGY_GUARD_END()
#endif

#ifdef DINO
#include <libdino/dino.h>
#endif

#include "pins.h"

static __nv unsigned curtask;
__nv unsigned count = 0;
__nv unsigned seed = 1;

/* This is for progress reporting only */
#define SET_CURTASK(t) curtask = t

#define TASK_MAIN                   1
#define TASK_SELECT_MODE            2
#define TASK_WARMUP                 3
#define TASK_TRAIN                  4
#define TASK_SAMPLE                 5
#define TASK_FEATURIZE              6
#define TASK_CLASSIFY               7
#define TASK_RECORD_STATS           8
#define TASK_COUNT		9

#ifdef DINO

#define TASK_BOUNDARY(t) \
        DINO_TASK_BOUNDARY(NULL); \
        SET_CURTASK(t); \

#define DINO_MANUAL_RESTORE_NONE() \
        DINO_MANUAL_REVERT_BEGIN() \
        DINO_MANUAL_REVERT_END() \

#define DINO_MANUAL_RESTORE_PTR(nm, type) \
        DINO_MANUAL_REVERT_BEGIN() \
        DINO_MANUAL_REVERT_PTR(type, nm); \
        DINO_MANUAL_REVERT_END() \

#define DINO_MANUAL_RESTORE_VAL(nm, label) \
        DINO_MANUAL_REVERT_BEGIN() \
        DINO_MANUAL_REVERT_VAL(nm, label); \
        DINO_MANUAL_REVERT_END() \

#else // !DINO

#define TASK_BOUNDARY(t) SET_CURTASK(t)

#define DINO_RESTORE_CHECK()
#define DINO_MANUAL_VERSION_PTR(...)
#define DINO_MANUAL_VERSION_VAL(...)
#define DINO_MANUAL_RESTORE_NONE()
#define DINO_MANUAL_RESTORE_PTR(...)
#define DINO_MANUAL_RESTORE_VAL(...)
#define DINO_MANUAL_REVERT_BEGIN(...)
#define DINO_MANUAL_REVERT_END(...)
#define DINO_MANUAL_REVERT_VAL(...)

#endif // !DINO

// Number of samples to discard before recording training set
#define NUM_WARMUP_SAMPLES 3

#define ACCEL_WINDOW_SIZE 3
#define MODEL_SIZE 16
#define SAMPLE_NOISE_FLOOR 10 // TODO: made up value

// Number of classifications to complete in one experiment
#define SAMPLES_TO_COLLECT 8
//#define SAMPLES_TO_COLLECT 128

typedef threeAxis_t_8 accelReading;
static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

typedef accelReading accelWindow[ACCEL_WINDOW_SIZE];

typedef struct {
    unsigned meanmag;
    unsigned stddevmag;
} features_t;

typedef enum {
    CLASS_STATIONARY,
    CLASS_MOVING,
} class_t;

typedef struct {
    features_t stationary[MODEL_SIZE];
    features_t moving[MODEL_SIZE];
} model_t;

typedef enum {
    MODE_IDLE = 3,
    MODE_TRAIN_STATIONARY = 2,
    MODE_TRAIN_MOVING = 1,
    MODE_RECOGNIZE = 0, // default
    //MODE_IDLE = (BIT(PIN_AUX_1) | BIT(PIN_AUX_2)),
    //MODE_TRAIN_STATIONARY = BIT(PIN_AUX_1),
   // MODE_TRAIN_MOVING = BIT(PIN_AUX_2),
   // MODE_RECOGNIZE = 0, // default
} run_mode_t;

typedef struct {
    unsigned totalCount;
    unsigned movingCount;
    unsigned stationaryCount;
} stats_t;


void accel_sample(unsigned seed, accelReading* result){
//void ngleSample_(unsigned seed, accelReading* result){
//void ACCEL_singleSample_(unsigned seed, threeAxis_t_8* result){
	result->x = (seed*17)%85;
	result->y = (seed*17*17)%85;
	result->z = (seed*17*17*17)%85;
//	seed++;
//	return 1;
}
void acquire_window(accelWindow window)
{
    accelReading sample;
    unsigned samplesInWindow = 0;

    DINO_MANUAL_VERSION_VAL(unsigned, seed, seed);
    TASK_BOUNDARY(TASK_SAMPLE);
    DINO_MANUAL_RESTORE_VAL(seed, seed);

    while (samplesInWindow < ACCEL_WINDOW_SIZE) {
        accel_sample(seed, &sample);
	seed++;
        LOG("acquire: sample %u %u %u\r\n", sample.x, sample.y, sample.z);

        window[samplesInWindow++] = sample;
    }
}

void transform(accelWindow window)
{
    unsigned i = 0;

    LOG("transform\r\n");

    for (i = 0; i < ACCEL_WINDOW_SIZE; i++) {
        accelReading *sample = &window[i];

        if (sample->x < SAMPLE_NOISE_FLOOR ||
            sample->y < SAMPLE_NOISE_FLOOR ||
            sample->z < SAMPLE_NOISE_FLOOR) {

            LOG("transform: sample %u %u %u\r\n",
                sample->x, sample->y, sample->z);

            sample->x = (sample->x > SAMPLE_NOISE_FLOOR) ? sample->x : 0;
            sample->y = (sample->y > SAMPLE_NOISE_FLOOR) ? sample->y : 0;
            sample->z = (sample->z > SAMPLE_NOISE_FLOOR) ? sample->z : 0;
        }
    }
}

void featurize(features_t *features, accelWindow aWin)
{
    TASK_BOUNDARY(TASK_FEATURIZE);
    DINO_MANUAL_RESTORE_NONE();

    accelReading mean;
    accelReading stddev;

    mean.x = mean.y = mean.z = 0;
    stddev.x = stddev.y = stddev.z = 0;
    int i;
    for (i = 0; i < ACCEL_WINDOW_SIZE; i++) {
        mean.x += aWin[i].x;  // x
        mean.y += aWin[i].y;  // y
        mean.z += aWin[i].z;  // z
    }
    /*
       mean.x = mean.x / ACCEL_WINDOW_SIZE;
       mean.y = mean.y / ACCEL_WINDOW_SIZE;
       mean.z = mean.z / ACCEL_WINDOW_SIZE;
       */
    mean.x >>= 2;
    mean.y >>= 2;
    mean.z >>= 2;

    for (i = 0; i < ACCEL_WINDOW_SIZE; i++) {
        stddev.x += aWin[i].x > mean.x ? aWin[i].x - mean.x
            : mean.x - aWin[i].x;  // x
        stddev.y += aWin[i].y > mean.y ? aWin[i].y - mean.y
            : mean.y - aWin[i].y;  // y
        stddev.z += aWin[i].z > mean.z ? aWin[i].z - mean.z
            : mean.z - aWin[i].z;  // z
    }
    /*
       stddev.x = stddev.x / (ACCEL_WINDOW_SIZE - 1);
       stddev.y = stddev.y / (ACCEL_WINDOW_SIZE - 1);
       stddev.z = stddev.z / (ACCEL_WINDOW_SIZE - 1);
       */
    stddev.x >>= 2;
    stddev.y >>= 2;
    stddev.z >>= 2;

    unsigned meanmag = mean.x*mean.x + mean.y*mean.y + mean.z*mean.z;
    unsigned stddevmag = stddev.x*stddev.x + stddev.y*stddev.y + stddev.z*stddev.z;

    features->meanmag   = sqrt16(meanmag);
    features->stddevmag = sqrt16(stddevmag);

    LOG("featurize: mean %u sd %u\r\n", features->meanmag, features->stddevmag);
}

class_t classify(features_t *features, model_t *model)
{
    int move_less_error = 0;
    int stat_less_error = 0;
    features_t *model_features;
    int i;

    TASK_BOUNDARY(TASK_CLASSIFY);
    DINO_MANUAL_RESTORE_NONE();

    for (i = 0; i < MODEL_SIZE; ++i) {
        model_features = &model->stationary[i];

        long int stat_mean_err = (model_features->meanmag > features->meanmag)
            ? (model_features->meanmag - features->meanmag)
            : (features->meanmag - model_features->meanmag);

        long int stat_sd_err = (model_features->stddevmag > features->stddevmag)
            ? (model_features->stddevmag - features->stddevmag)
            : (features->stddevmag - model_features->stddevmag);

        model_features = &model->moving[i];

        long int move_mean_err = (model_features->meanmag > features->meanmag)
            ? (model_features->meanmag - features->meanmag)
            : (features->meanmag - model_features->meanmag);

        long int move_sd_err = (model_features->stddevmag > features->stddevmag)
            ? (model_features->stddevmag - features->stddevmag)
            : (features->stddevmag - model_features->stddevmag);

        if (move_mean_err < stat_mean_err) {
            move_less_error++;
        } else {
            stat_less_error++;
        }

        if (move_sd_err < stat_sd_err) {
            move_less_error++;
        } else {
            stat_less_error++;
        }
    }

    class_t class = move_less_error > stat_less_error ?
                        CLASS_MOVING : CLASS_STATIONARY;
    LOG("classify: class %u\r\n", class);

    return class;
}

void record_stats(stats_t *stats, class_t class)
{
    DINO_MANUAL_VERSION_VAL(stats_t, *stats, stats);
    TASK_BOUNDARY(TASK_RECORD_STATS);
    DINO_MANUAL_RESTORE_VAL(*stats, stats);

    /* stats->totalCount, stats->movingCount, and stats->stationaryCount have an
     * nv-internal consistency requirement.  This code should be atomic. */

    stats->totalCount++;

    switch (class) {
        case CLASS_MOVING:

#if defined(SHOW_RESULT_ON_LEDS)
            blink(CLASSIFY_BLINKS, CLASSIFY_BLINK_DURATION, LED1);
#endif //SHOW_RESULT_ON_LEDS

            stats->movingCount++;
            break;

        case CLASS_STATIONARY:

#if defined(SHOW_RESULT_ON_LEDS)
            blink(CLASSIFY_BLINKS, CLASSIFY_BLINK_DURATION, LED2);
#endif //SHOW_RESULT_ON_LEDS

            stats->stationaryCount++;
            break;
    }

    LOG("stats: s %u m %u t %u\r\n",
        stats->stationaryCount, stats->movingCount, stats->totalCount);
}

void print_stats(stats_t *stats)
{
    unsigned resultStationaryPct = stats->stationaryCount * 100 / stats->totalCount;
    unsigned resultMovingPct = stats->movingCount * 100 / stats->totalCount;

    unsigned sum = stats->stationaryCount + stats->movingCount;

    PRINTF("stats: s %u (%u%%) m %u (%u%%) sum/tot %u/%u: %c\r\n",
           stats->stationaryCount, resultStationaryPct,
           stats->movingCount, resultMovingPct,
           stats->totalCount, sum,
           sum == stats->totalCount && sum == SAMPLES_TO_COLLECT ? 'V' : 'X');
}

void warmup_sensor()
{
    unsigned discardedSamplesCount = 0;
    accelReading sample;

    DINO_MANUAL_VERSION_VAL(unsigned, seed, seed);
    TASK_BOUNDARY(TASK_WARMUP);
    DINO_MANUAL_RESTORE_VAL(seed, seed);
    LOG("warmup\r\n");

    while (discardedSamplesCount++ < NUM_WARMUP_SAMPLES) {
        accel_sample(seed, &sample);
	seed++;
    }
}

void train(features_t *classModel)
{
    accelWindow sampleWindow;
    features_t features;
    unsigned i;

    warmup_sensor();

    for (i = 0; i < MODEL_SIZE; ++i) {
        acquire_window(sampleWindow);
        transform(sampleWindow);
        featurize(&features, sampleWindow);

        TASK_BOUNDARY(TASK_TRAIN);
        DINO_MANUAL_RESTORE_NONE();

        classModel[i] = features;
    }

 //   PRINTF("train: done: mn %u sd %u\r\n",
 //          features.meanmag, features.stddevmag);
}

void recognize(model_t *model)
{
#ifdef MEMENTOS_NONVOLATILE
    static __nv stats_t stats;
#else
    stats_t stats;
#endif
    accelWindow sampleWindow;
    features_t features;
    class_t class;
    unsigned i;

    stats.totalCount = 0;
    stats.stationaryCount = 0;
    stats.movingCount = 0;

    for (i = 0; i < SAMPLES_TO_COLLECT; ++i) {
        acquire_window(sampleWindow);
        transform(sampleWindow);
        featurize(&features, sampleWindow);
        class = classify(&features, model);
        record_stats(&stats, class);
    }

    print_stats(&stats);
}

run_mode_t select_mode(uint8_t *prev_pin_state)
{
	uint8_t pin_state = 1;

	DINO_MANUAL_VERSION_VAL(unsigned, count, count);
	TASK_BOUNDARY(TASK_SELECT_MODE);
	DINO_MANUAL_RESTORE_VAL(count, count);
	count++;
	LOG("count: %u\r\n", count);
	if(count >= 2) pin_state = 2;
	if(count >= 3) pin_state = 0;
	if(count >= 4) {   
		PRINTF("end\r\n");
		count = 0;
		seed = 1;
		*prev_pin_state = MODE_IDLE;
		pin_state = 99;
	}
	// Don't re-launch training after finishing training
	if ((pin_state == MODE_TRAIN_STATIONARY ||
				pin_state == MODE_TRAIN_MOVING) &&
			pin_state == *prev_pin_state) {
		pin_state = MODE_IDLE;
	} else {
		*prev_pin_state = pin_state;
	}

	LOG("selectMode: pins %04x\r\n", pin_state);

	return (run_mode_t)pin_state;
}

static void init_accel()
{
#ifdef ACCEL_16BIT_TYPE
	threeAxis_t accelID = {0};
#else
	threeAxis_t_8 accelID = {0};
#endif
}

void init()
{
	init_hw();

	INIT_CONSOLE();

	__enable_interrupt();

	PRINTF(".%u.\r\n", curtask);
}

int main()
{
	// "Globals" must be on the stack because Mementos doesn't handle real
	// globals correctly
	uint8_t prev_pin_state = MODE_IDLE;

#if defined(MEMENTOS) && !defined(MEMENTOS_NONVOLATILE)
	model_t model;
#else
	static __nv model_t model;
#endif

#ifndef MEMENTOS
	init();
#endif

	DINO_RESTORE_CHECK();

	while (1)
	{
		if (count == 0) {
			PRINTF("start\r\n");
		}
		TASK_BOUNDARY(TASK_COUNT);
		DINO_MANUAL_RESTORE_NONE();
		run_mode_t mode = select_mode(&prev_pin_state);
		switch (mode) {
			case MODE_TRAIN_STATIONARY:
				LOG("mode: stationary\r\n");
				train(model.stationary);
				break;
			case MODE_TRAIN_MOVING:
				LOG("mode: moving\r\n");
				train(model.moving);
				break;
			case MODE_RECOGNIZE:
				LOG("mode: recognize\r\n");
				recognize(&model);
				break;
			default:
				LOG("mode: idle\r\n");
				break;
		}
	}

	return 0;
}
