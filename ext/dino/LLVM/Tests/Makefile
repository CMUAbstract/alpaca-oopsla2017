MEMENTOSDIR := ../../Mementos
DINODIR := ../../DinoRuntime
ACCELDIR := ../../Hardware/Accelerometer
ARDIR := ../../Tests/AR

MSP430 := /usr/msp430
MSPGCC := msp430-gcc
AR     := msp430-ar
RANLIB := msp430-ranlib

CC := clang
CFLAGS := -Wall -O0 -fno-stack-protector -I$(MEMENTOSDIR)/include -target msp430-elf
PPCFLAGS := -I$(MSP430)/include -I$(ACCELDIR) -I$(ARDIR) -mmcu=msp430fr5969 -I$(MEMENTOSDIR)/include 
LDFLAGS := -L$(MEMENTOSDIR) -lmementos_fram -L$(DINODIR) -ldino -L$(ACCELDIR) -ladxl362z -lm

ifeq ($(shell uname -s),Darwin)
	LIBEXT := dylib
else
	LIBEXT := so
endif

.PRECIOUS: %.bc %.s

ifneq (,$(wildcard ../DINO/Debug/DINO.$(LIBEXT)))
 DINOLIB := ../DINO/Debug/DINO.$(LIBEXT)
else
 DINOLIB := ../DINO/DINO.$(LIBEXT)
endif

LOADPASS := -Xclang -load -Xclang $(DINOLIB)

SOURCES := callchain.c nvstore.c
OBJECTS := $(SOURCES:.c=.elf)

lpa: lowpower_ar.elf

all: $(OBJECTS)

%.lo: %.s
	$(MSPGCC) -mmcu=msp430fr5969 -c -o $@ $^

%.a: %.lo
	$(AR) r $@ $^
	$(RANLIB) $@

%.p.c: %.c
	$(MSPGCC) $(PPCFLAGS) -E -o $@ $^

%.bc: %.p.c
	$(CC) $(CFLAGS) -emit-llvm -c -o $@ $(LOADPASS) $^

%.s: %.bc
	llc -O0 -regalloc=fast -march=msp430 -msp430-hwmult-mode=no -o $@ $^

%.elf: %.s
	$(MSPGCC) -O0 -mmcu=msp430fr5969 -o $@ $^ $(LDFLAGS)

%.ll: %.bc
	llvm-dis $^

.DUMMY: dot
dot: $(SOURCES:.c=.bc)
	for C in $^; do opt -dot-cfg "$$C" -o /dev/null; done
	for D in *.dot; do \
		P=`echo "$$D" | sed -e 's/\.dot$$/.pdf/'` && \
		dot -Tpdf -o "$$P" "$$D" ; \
	done

.DUMMY: clean
clean:
	$(RM) *.elf *.bc *.ll *.s *.dot *.pdf *.a *.o
