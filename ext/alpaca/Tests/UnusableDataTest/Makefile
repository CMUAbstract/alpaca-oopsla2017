CC=msp430-gcc
OC=msp430-objcopy


MCU=msp430fr5969
MEMENTOSDIR=../../Mementos
MEMENTOSLIB=mementos_fram

DINODIR=../../DinoRuntime
DINOLIB=dino


CFLAGS=-O0 -g -mmcu=$(MCU) -fomit-frame-pointer
LDFLAGS=-L$(MEMENTOSDIR) -l$(MEMENTOSLIB) -L$(DINODIR) -l$(DINOLIB) -fomit-frame-pointer
LDFLAGS+=-mmcu=$(MCU) -Wl,-T $(DINODIR)/ldscripts/msp430.x

.PRECIOUS: %.elf

all: unusableTest.a43

%.o: %.c
	$(CC) $(CFLAGS) $^ -o $@ -c

%.a43: %.elf
	msp430-objcopy -O ihex $^ $@

unusableTest.elf: unusableTest.o
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)

clean:
	-rm unusableTest.o unusableTest.obj unusableTest.elf unusableTest.a43


