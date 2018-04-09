#include <msp430.h>
#include <param.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>

//#include <libwispbase/accel.h>
typedef struct {
    uint8_t x;
    uint8_t y;
    uint8_t z;
#ifdef __clang__
    uint8_t padding; // clang crashes with type size mismatch assert failure
#endif
} threeAxis_t_8;
#include <libalpaca/alpaca.h>
#include <libmspbuiltins/builtins.h>
#ifdef LOGIC
#define LOG(...)
#define PRINTF(...)
#define BLOCK_PRINTF(...)
#define BLOCK_PRINTF_BEGIN(...)
#define BLOCK_PRINTF_END(...)
#define INIT_CONSOLE(...)
#else
#include <libio/log.h>
#endif
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

// Number of samples to discard before recording training set
#define NUM_WARMUP_SAMPLES 3

#define ACCEL_WINDOW_SIZE 3
//#define ACCEL_WINDOW_SIZE 30
#define MODEL_SIZE 16
#define SAMPLE_NOISE_FLOOR 10 // TODO: made up value

// Number of classifications to complete in one experiment
#define SAMPLES_TO_COLLECT 8
//#define SAMPLES_TO_COLLECT 128

typedef threeAxis_t_8 accelReading;
typedef accelReading accelWindow[ACCEL_WINDOW_SIZE];

typedef struct {
	unsigned meanmag;
	unsigned stddevmag;
} features_t;

typedef enum {
	CLASS_STATIONARY,
	CLASS_MOVING,
} class_t;

typedef enum {
	MODE_IDLE = 3,
	MODE_TRAIN_STATIONARY = 2,
	MODE_TRAIN_MOVING = 1,
	MODE_RECOGNIZE = 0, // default
} run_mode_t;

TASK(1, task_init)
TASK(2, task_selectMode)
TASK(3, task_resetStats)
TASK(4, task_sample)
TASK(5, task_transform)
TASK(6, task_featurize)
TASK(7, task_classify)
TASK(8, task_stats)
TASK(9, task_warmup)
TASK(10, task_train)
TASK(11, task_idle)

/* This is originally done by the compiler */
__nv uint8_t* data_src[3];
__nv uint8_t* data_dest[3];
__nv unsigned data_size[3];
GLOBAL_SB(unsigned, seed_bak);
GLOBAL_SB(uint16_t, pinState_bak);
GLOBAL_SB(unsigned, count_bak);
GLOBAL_SB(unsigned, discardedSamplesCount_bak);
GLOBAL_SB(unsigned, samplesInWindow_bak);
GLOBAL_SB(unsigned, movingCount_bak);
GLOBAL_SB(unsigned, stationaryCount_bak);
GLOBAL_SB(unsigned, totalCount_bak);
GLOBAL_SB(accelReading, window_bak, ACCEL_WINDOW_SIZE);
GLOBAL_SB(unsigned, window_isDirty, ACCEL_WINDOW_SIZE);
GLOBAL_SB(unsigned, trainingSetSize_bak);
void clear_isDirty() {
	PRINTF("clear\r\n");
	memset(&GV(window_isDirty, 0), 0, sizeof(_global_window_isDirty));
}
/* end */

GLOBAL_SB(uint16_t, pinState);
GLOBAL_SB(unsigned, discardedSamplesCount);
GLOBAL_SB(run_mode_t, class);
GLOBAL_SB(unsigned, totalCount);
GLOBAL_SB(unsigned, movingCount);
GLOBAL_SB(unsigned, stationaryCount);
GLOBAL_SB(accelReading, window, ACCEL_WINDOW_SIZE);
GLOBAL_SB(features_t, features);
GLOBAL_SB(features_t, model_stationary, MODEL_SIZE);
GLOBAL_SB(features_t, model_moving, MODEL_SIZE);
GLOBAL_SB(unsigned, trainingSetSize);
GLOBAL_SB(unsigned, samplesInWindow);
GLOBAL_SB(run_mode_t, mode);
GLOBAL_SB(unsigned, seed);
GLOBAL_SB(unsigned, count);

void ACCEL_singleSample_(threeAxis_t_8* result){
	result->x = (GV(seed_bak)*17)%85;
	result->y = (GV(seed_bak)*17*17)%85;
	result->z = (GV(seed_bak)*17*17*17)%85;
	++GV(seed_bak);
}

static void init_hw()
{
	msp_watchdog_disable();
	msp_gpio_unlock();
	msp_clock_setup();
}

void initializeHardware()
{
	init_hw();

#ifdef CONFIG_EDB
	edb_init();
#endif

	INIT_CONSOLE();

	__enable_interrupt();

	LOG("init: initializing accel\r\n");

	PRINTF(".%u.\r\n", curctx->task->idx);
#ifdef LOGIC
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_2);

	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
	GPIO(PORT_AUX3, OUT) &= ~BIT(PIN_AUX_3);
	// Output enabled
	GPIO(PORT_AUX, DIR) |= BIT(PIN_AUX_1);
	GPIO(PORT_AUX, DIR) |= BIT(PIN_AUX_2);
	GPIO(PORT_AUX3, DIR) |= BIT(PIN_AUX_3);
	//
	// Out high
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_2);
	// Out low
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_2);
#endif
}

void task_init()
{
	PRINTF("start\r\n");
	LOG("init\r\n");
#ifdef LOGIC
	// Out high
	GPIO(PORT_AUX, OUT) |= BIT(PIN_AUX_1);
	// Out low
	GPIO(PORT_AUX, OUT) &= ~BIT(PIN_AUX_1);
#endif
	GV(pinState) = MODE_IDLE;

	GV(count) = 0;
	GV(seed) = 1;
	TRANSITION_TO(task_selectMode);

}

void task_selectMode()
{
	PRIV(count);
	PRIV(pinState);

	uint16_t pin_state=1;
	++GV(count_bak);
	LOG("count: %u\r\n", GV(count_bak));
	//	if(GV(count_bak) >= 3) pin_state=2;
	//	if(GV(count_bak)>=5) pin_state=0;
	//	if (GV(count_bak) >= 7) {
	if(GV(count_bak) >= 2) pin_state=2;
	if(GV(count_bak)>=3) pin_state=0;
	if (GV(count_bak) >= 4) {
		//PRINTF("TIME end is 65536*%u+%u\r\n",overflow,(unsigned)TBR);
		//while(1);
		PRINTF("done\r\n");

		COMMIT(count);
		COMMIT(pinState);
		TRANSITION_TO(task_init);
	}
	run_mode_t mode;
	class_t class;

	// Don't re-launch training after finishing training
	if ((pin_state == MODE_TRAIN_STATIONARY ||
				pin_state == MODE_TRAIN_MOVING) &&
			pin_state == GV(pinState_bak)) {
		pin_state = MODE_IDLE;
	} else {
		GV(pinState_bak) = pin_state;
	}

	LOG("selectMode: 0x%x\r\n", pin_state);

	switch(pin_state) {
		case MODE_TRAIN_STATIONARY:
			GV(discardedSamplesCount) = 0;
			GV(mode) = MODE_TRAIN_STATIONARY;
			GV(class) = CLASS_STATIONARY;
			GV(samplesInWindow) = 0;

			COMMIT(count);
			COMMIT(pinState);
			TRANSITION_TO(task_warmup);
			break;

		case MODE_TRAIN_MOVING:
			GV(discardedSamplesCount) = 0;
			GV(mode) = MODE_TRAIN_MOVING;
			GV(class) = CLASS_MOVING;
			GV(samplesInWindow) = 0;

			COMMIT(count);
			COMMIT(pinState);
			TRANSITION_TO(task_warmup);
			break;

		case MODE_RECOGNIZE:
			GV(mode) = MODE_RECOGNIZE;

			COMMIT(count);
			COMMIT(pinState);
			TRANSITION_TO(task_resetStats);
			break;

		default:
			COMMIT(count);
			COMMIT(pinState);
			TRANSITION_TO(task_idle);
	}
}

void task_resetStats()
{
	// NOTE: could roll this into selectMode task, but no compelling reason
	LOG("resetStats\r\n");

	// NOTE: not combined into one struct because not all code paths use both
	GV(movingCount) = 0;
	GV(stationaryCount) = 0;
	GV(totalCount) = 0;

	GV(samplesInWindow) = 0;

	TRANSITION_TO(task_sample);
}

void task_sample()
{
	PRIV(samplesInWindow);
	PRIV(seed);
	LOG("sample\r\n");

	accelReading sample;
	ACCEL_singleSample_(&sample);
	GV(window, _global_samplesInWindow_bak) = sample;
	++GV(samplesInWindow_bak);
	LOG("sample: sample %u %u %u window %u\r\n",
			sample.x, sample.y, sample.z, GV(samplesInWindow_bak));


	if (GV(samplesInWindow_bak) < ACCEL_WINDOW_SIZE) {
		COMMIT(samplesInWindow);
		COMMIT(seed);
		TRANSITION_TO(task_sample);
	} else {
		GV(samplesInWindow_bak) = 0;
		COMMIT(samplesInWindow);
		COMMIT(seed);
		TRANSITION_TO(task_transform);
	}
}

void task_transform()
{
	unsigned i;

	LOG("transform\r\n");
	accelReading *sample;
	accelReading transformedSample;

	for (i = 0; i < ACCEL_WINDOW_SIZE; i++) {
		// To mimic stupid comiler behavior,
		// we write a less optimal code..
		DY_PRIV(window, i);
		if (GV(window_bak, i).x < SAMPLE_NOISE_FLOOR) {
			DY_PRIV(window, i);
			if (GV(window_bak, i).x > SAMPLE_NOISE_FLOOR) {
				DY_PRIV(window, i);
				GV(window_bak, i).x = GV(window_bak, i).x;
			}
			else {
				GV(window_bak, i).x = 0;
			}
			DY_COMMIT(window, i);

			DY_PRIV(window, i);
			if (GV(window_bak, i).y > SAMPLE_NOISE_FLOOR) {
				DY_PRIV(window, i);
				GV(window_bak, i).y = GV(window_bak, i).y;
			}
			else {
				GV(window_bak, i).y = 0;
			}
			DY_COMMIT(window, i);

			DY_PRIV(window, i);
			if (GV(window_bak, i).z > SAMPLE_NOISE_FLOOR) {
				DY_PRIV(window, i);
				GV(window_bak, i).z = GV(window_bak, i).z;
			}
			else {
				GV(window_bak, i).z = 0;
			}
			DY_COMMIT(window, i);
		}
		else {
			DY_PRIV(window, i);
			if (GV(window_bak, i).y < SAMPLE_NOISE_FLOOR) {
				DY_PRIV(window, i);
				if (GV(window_bak, i).x > SAMPLE_NOISE_FLOOR) {
					DY_PRIV(window, i);
					GV(window_bak, i).x = GV(window_bak, i).x;
				}
				else {
					GV(window_bak, i).x = 0;
				}
				DY_COMMIT(window, i);

				DY_PRIV(window, i);
				if (GV(window_bak, i).y > SAMPLE_NOISE_FLOOR) {
					DY_PRIV(window, i);
					GV(window_bak, i).y = GV(window_bak, i).y;
				}
				else {
					GV(window_bak, i).y = 0;
				}
				DY_COMMIT(window, i);

				DY_PRIV(window, i);
				if (GV(window_bak, i).z > SAMPLE_NOISE_FLOOR) {
					DY_PRIV(window, i);
					GV(window_bak, i).z = GV(window_bak, i).z;
				}
				else {
					GV(window_bak, i).z = 0;
				}
				DY_COMMIT(window, i);
			}
			else {
				DY_PRIV(window, i);
				if (GV(window_bak, i).z < SAMPLE_NOISE_FLOOR) {
					DY_PRIV(window, i);
					if (GV(window_bak, i).x > SAMPLE_NOISE_FLOOR) {
						DY_PRIV(window, i);
						GV(window_bak, i).x = GV(window_bak, i).x;
					}
					else {
						GV(window_bak, i).x = 0;
					}
					DY_COMMIT(window, i);

					DY_PRIV(window, i);
					if (GV(window_bak, i).y > SAMPLE_NOISE_FLOOR) {
						DY_PRIV(window, i);
						GV(window_bak, i).y = GV(window_bak, i).y;
					}
					else {
						GV(window_bak, i).y = 0;
					}
					DY_COMMIT(window, i);

					DY_PRIV(window, i);
					if (GV(window_bak, i).z > SAMPLE_NOISE_FLOOR) {
						DY_PRIV(window, i);
						GV(window_bak, i).z = GV(window_bak, i).z;
					}
					else {
						GV(window_bak, i).z = 0;
					}
					DY_COMMIT(window, i);
				}
			}
		}
	}
	TRANSITION_TO(task_featurize);
}

void task_featurize()
{
	accelReading mean, stddev;
	mean.x = mean.y = mean.z = 0;
	stddev.x = stddev.y = stddev.z = 0;
	features_t features;

	LOG("featurize\r\n");

	int i;
	for (i = 0; i < ACCEL_WINDOW_SIZE; i++) {
		LOG("featurize: features: x %u y %u z %u \r\n", GV(window, i).x,GV(window, i).y,GV(window, i).z);
		mean.x += GV(window, i).x;
		mean.y += GV(window, i).y;
		mean.z += GV(window, i).z;
	}
	mean.x >>= 2;
	mean.y >>= 2;
	mean.z >>= 2;

	LOG("featurize: features: mx %u my %u mz %u \r\n", mean.x,mean.y,mean.z);
	for (i = 0; i < ACCEL_WINDOW_SIZE; i++) {
		stddev.x += GV(window, i).x > mean.x ? GV(window, i).x - mean.x
			: mean.x - GV(window, i).x;
		stddev.y += GV(window, i).y > mean.y ? GV(window, i).y - mean.y
			: mean.y - GV(window, i).y;
		stddev.z += GV(window, i).z > mean.z ? GV(window, i).z - mean.z
			: mean.z - GV(window, i).z;
	}
	stddev.x >>= 2;
	stddev.y >>= 2;
	stddev.z >>= 2;

	unsigned meanmag = mean.x*mean.x + mean.y*mean.y + mean.z*mean.z;
	unsigned stddevmag = stddev.x*stddev.x + stddev.y*stddev.y + stddev.z*stddev.z;
	LOG("sqrt start\r\n");
	features.meanmag   = sqrt16(meanmag);
	features.stddevmag = sqrt16(stddevmag);
	LOG("featurize: features: mean %u stddev %u\r\n",
			features.meanmag, features.stddevmag);

	switch (GV(mode)) {
		case MODE_TRAIN_STATIONARY:
		case MODE_TRAIN_MOVING:
			GV(features) = features;
			TRANSITION_TO(task_train);
			break;
		case MODE_RECOGNIZE:
			GV(features) = features;
			TRANSITION_TO(task_classify);
			break;
		default:
			// TODO: abort
			break;
	}
}

void task_classify() {
	int move_less_error = 0;
	int stat_less_error = 0;
	int i;
	class_t class;
	long int meanmag;
	long int stddevmag;
	LOG("classify\r\n");
	meanmag = GV(features).meanmag;
	stddevmag = GV(features).stddevmag;
	LOG("classify: mean: %u\r\n", meanmag);
	LOG("classify: stddev: %u\r\n", stddevmag);

	for (i = 0; i < MODEL_SIZE; ++i) {
		long int stat_mean_err = (GV(model_stationary, i).meanmag > meanmag)
			? (GV(model_stationary, i).meanmag - meanmag)
			: (meanmag - GV(model_stationary, i).meanmag);

		long int stat_sd_err = (GV(model_stationary, i).stddevmag > stddevmag)
			? (GV(model_stationary, i).stddevmag - stddevmag)
			: (stddevmag - GV(model_stationary, i).stddevmag);
		LOG("classify: model_mean: %u\r\n", GV(model_stationary, i).meanmag);
		LOG("classify: model_stddev: %u\r\n", GV(model_stationary, i).stddevmag);
		LOG("classify: stat_mean_err: %u\r\n", stat_mean_err);
		LOG("classify: stat_stddev_err: %u\r\n", stat_sd_err);

		long int move_mean_err = (GV(model_moving, i).meanmag > meanmag)
			? (GV(model_moving, i).meanmag - meanmag)
			: (meanmag - GV(model_moving, i).meanmag);

		long int move_sd_err = (GV(model_moving, i).stddevmag > stddevmag)
			? (GV(model_moving, i).stddevmag - stddevmag)
			: (stddevmag - GV(model_moving, i).stddevmag);
		LOG("classify: model_mean: %u\r\n", GV(model_moving, i).meanmag);
		LOG("classify: model_stddev: %u\r\n", GV(model_moving, i).stddevmag);
		LOG("classify: move_mean_err: %u\r\n", move_mean_err);
		LOG("classify: move_stddev_err: %u\r\n", move_sd_err);
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

	GV(class) = (move_less_error > stat_less_error) ? CLASS_MOVING : CLASS_STATIONARY;

	LOG("classify: class 0x%x\r\n", GV(class));

	TRANSITION_TO(task_stats);
}

void task_stats()
{
	PRIV(totalCount);
	PRIV(movingCount);
	PRIV(stationaryCount);

	unsigned movingCount = 0, stationaryCount = 0;

	LOG("stats\r\n");

	++GV(totalCount_bak);
	LOG("stats: total %u\r\n", GV(totalCount_bak));

	switch (GV(class)) {
		case CLASS_MOVING:

			++GV(movingCount_bak);
			LOG("stats: moving %u\r\n", GV(movingCount_bak));
			break;
		case CLASS_STATIONARY:

			++GV(stationaryCount_bak);
			LOG("stats: stationary %u\r\n", GV(stationaryCount_bak));
			break;
	}

	if (GV(totalCount_bak) == SAMPLES_TO_COLLECT) {

		unsigned resultStationaryPct = GV(stationaryCount_bak) * 100 / GV(totalCount_bak);
		unsigned resultMovingPct = GV(movingCount_bak) * 100 / GV(totalCount_bak);

		unsigned sum = GV(stationaryCount_bak) + GV(movingCount_bak);
		PRINTF("stats: s %u (%u%%) m %u (%u%%) sum/tot %u/%u: %c\r\n",
				GV(stationaryCount_bak), resultStationaryPct,
				GV(movingCount_bak), resultMovingPct,
				GV(totalCount_bak), sum, sum == GV(totalCount_bak) ? 'V' : 'X');
		COMMIT(totalCount);
		COMMIT(stationaryCount);
		COMMIT(movingCount);
		TRANSITION_TO(task_idle);
	} else {
		COMMIT(totalCount);
		COMMIT(stationaryCount);
		COMMIT(movingCount);
		TRANSITION_TO(task_sample);
	}
}

void task_warmup()
{
	PRIV(discardedSamplesCount);
	PRIV(seed);

	threeAxis_t_8 sample;
	LOG("warmup\r\n");

	if (GV(discardedSamplesCount_bak) < NUM_WARMUP_SAMPLES) {

		ACCEL_singleSample_(&sample);
		++GV(discardedSamplesCount_bak);
		COMMIT(seed);
		COMMIT(discardedSamplesCount);
		TRANSITION_TO(task_warmup);
	} else {
		GV(trainingSetSize) = 0;
		COMMIT(seed);
		COMMIT(discardedSamplesCount);
		TRANSITION_TO(task_sample);
	}
}

void task_train()
{
	PRIV(trainingSetSize);

	LOG("train\r\n");
	unsigned trainingSetSize;
	unsigned class;

	switch (GV(class)) {
		case CLASS_STATIONARY:
			GV(model_stationary, _global_trainingSetSize_bak) = GV(features);
			break;
		case CLASS_MOVING:
			GV(model_moving, _global_trainingSetSize_bak) = GV(features);
			break;
	}

	++GV(trainingSetSize_bak);
	LOG("train: class %u count %u/%u\r\n", GV(class),
			GV(trainingSetSize_bak), MODEL_SIZE);

	if (GV(trainingSetSize_bak) < MODEL_SIZE) {
		COMMIT(trainingSetSize);
		TRANSITION_TO(task_sample);
	} else {
		COMMIT(trainingSetSize);
		TRANSITION_TO(task_idle);
	}
}

void task_idle() {
	LOG("idle\r\n");

	TRANSITION_TO(task_selectMode);
}

	INIT_FUNC(initializeHardware)
ENTRY_TASK(task_init)
