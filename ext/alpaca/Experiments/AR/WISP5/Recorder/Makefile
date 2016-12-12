ACCELDIR  = ../../../../Hardware/WISP5
ACCELLIB  = -lwisp5
SKIPCLANG = 1
PPCFLAGS  = -DUSE_LEDS -I..
#PPCFLAGS += -DTRAINING

.DEFAULT_GOAL := ar-recordtrace.elf

ACCELDIR ?= ../../../../Hardware/Accelerometer
ACCELLIB ?= -ladxl362z

MSPGCC := msp430-gcc
AR := msp430-ar
RANLIB := msp430-ranlib
MSPGCCINCLUDES := $(foreach I, \
	$(shell msp430-cpp -Wp,-v </dev/null 2>&1 | grep /include | \
		sed -e 's/^ *//'), \
	-I$(I))
MSPGCCINCLUDES += -I$(ACCELDIR)

PPCFLAGS += -I$(MEMENTOSDIR)/include -I/opt/local/msp430/include -I$(ACCELDIR) -I$(ARDIR) -mmcu=msp430fr5969 -g
LDFLAGS  += -L$(MEMENTOSDIR) -lmementos_fram -L$(DINODIR) -ldino -L$(ACCELDIR) $(ACCELLIB) -lm -g -Wl,--section-start -Wl,FRAMVARS=0x7000

SOURCES := $(wildcard *.c)
OBJECTS := $(SOURCES:.c=.elf)

%.elf: %.c
	$(MSPGCC) $(PPCFLAGS) -O0 -mmcu=msp430fr5969 -o $@ $^ $(LDFLAGS)

.DUMMY: clean
clean:
	$(RM) *.elf *.bc *.ll *.s *.dot *.pdf *.a *.o
