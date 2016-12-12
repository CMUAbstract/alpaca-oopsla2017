MEMENTOSDIR := ../../../../Mementos
DINODIR := ../../../../DinoRuntime
ACCELDIR ?= ../../../../Hardware/Accelerometer
ACCELLIB ?= -ladxl362z
ARDIR := ../../../../Tests/AR

MSPGCC := msp430-gcc
AR := msp430-ar
RANLIB := msp430-ranlib
MSPGCCINCLUDES := $(foreach I, \
	$(shell msp430-cpp -Wp,-v </dev/null 2>&1 | grep /include | \
		sed -e 's/^ *//'), \
	-I$(I))
MSPGCCINCLUDES += -I$(ACCELDIR) -I$(ARDIR)

CC := clang
CFLAGS   += -I$(MEMENTOSDIR)/include -Wall -O0 -fno-stack-protector -target msp430-elf -g -D__MSP430FR5969__ $(MSPGCCINCLUDES)
PPCFLAGS += -I$(MEMENTOSDIR)/include -I/opt/local/msp430/include -I$(ACCELDIR) -I$(ARDIR) -mmcu=msp430fr5969 -g
LDFLAGS  += -L$(MEMENTOSDIR) -lmementos_fram -L$(DINODIR) -ldino -L$(ACCELDIR) $(ACCELLIB) -lm -g -Wl,--section-start -Wl,FRAMVARS=0xD000

.PRECIOUS: %.bc %.s

OS=$(shell uname -s)
ifeq ($(OS),Darwin)
  LIBEXT=dylib
else
  LIBEXT=so
endif
DINOLIB := ../../../../LLVM/DINO/DINO.$(LIBEXT)

LOADPASS ?= -Xclang -load -Xclang $(DINOLIB)

SOURCES := $(wildcard *.c)
OBJECTS := $(SOURCES:.c=.elf)


%.lo: %.s
	$(MSPGCC) -mmcu=msp430fr5969 -c -o $@ $^

%.a: %.lo
	$(AR) r $@ $^
	$(RANLIB) $@

%.bc: %.c
	$(CC) $(CFLAGS) -emit-llvm -c -o $@ $(LOADPASS) $^

%.s: %.bc
	llc -O0 -march=msp430 -msp430-hwmult-mode=no -o $@ $^
#llc -O0 -regalloc=fast -march=msp430 -msp430-hwmult-mode=no -o $@ $^

ifdef SKIPCLANG
%.elf: %.c
	$(MSPGCC) $(PPCFLAGS) -O0 -mmcu=msp430fr5969 -o $@ $^ $(LDFLAGS)
else
%.elf: %.s
	$(MSPGCC) -O0 -mmcu=msp430fr5969 -o $@ $^ $(LDFLAGS)
endif

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
