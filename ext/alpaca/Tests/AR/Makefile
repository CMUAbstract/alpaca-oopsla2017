# Run "make MSP430=1" to build with mspgcc
MEMENTOSDIR=../../Mementos
MEMENTOSLIB=mementos_fram

DINODIR=../../DinoRuntime
DINOLIB=dino

ACCELDIR=../../Hardware/Accelerometer
ACCELLIB=adxl362z

CFLAGS=-g -O0 -fomit-frame-pointer 
LDFLAGS=-lm -fomit-frame-pointer

ifdef NOMSP430
  CC=gcc
  CFLAGS+=-I../../Runtime
else
  CC=msp430-gcc
  CFLAGS+=-mmcu=msp430fr5969 -I$(ACCELDIR)
  LDFLAGS+=-L$(MEMENTOSDIR) -l$(MEMENTOSLIB) -L$(DINODIR) -l$(DINOLIB) -L$(ACCELDIR) -l$(ACCELLIB)
endif

all: AR.cue.elf 

.PRECIOUS: %.elf

%.o: %.c
	$(CC) $(CFLAGS) $^ -o $@ -c

%.a43: %.elf
	msp430-objcopy -O ihex $^ $@

AR_train.cue.elf: Accelerometer.o NormalDistributionModel.o vec3.o FeatureVector.o CUEAR_featurizer.o AR_train.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

AR.cue.elf: Accelerometer.o CUEAR_binnednaivebayes.o vec3.o FeatureVector.o CUEAR_featurizer.o AR.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

AR.lp.elf: lowpower_ar.o 
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

TEMP.cue.elf: Thermometer.o VarianceDetector.o FeatureVector.o THERM_featurizer.o AR.o adc_sensor.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

AR.dino.cue: AR.dino.cue.elf AR.recov.cue.so 

AR.dino.cue.elf: Accelerometer.o NormalDistributionModel.o vec3.o FeatureVector.o CUEAR_featurizer.o AR_DINO.o ../../Runtime/HarvSimRuntime.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

AR_DINO_recovery.o: AR_DINO_recovery.c
	$(CC) -c -fPIC $(CFLAGS) $^ -o $@ $(LDFLAGS)

AR.recov.cue.so: AR_DINO_recovery.o
	$(CC) -shared -fPIC $(CFLAGS) $^ -o $@ $(LDFLAGS)

person.elf: Person.o NormalDistributionModel.o vec3.o FeatureVector.o PERSON_featurizer.o AR.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

.cpp.o:
	$(CC) $(CFLAGS) -x c -c $^ -o $@

clean:
	$(RM) *.o *.elf
