CFLAGS=-g -O0 -fomit-frame-pointer
LDFLAGS=-lm -fomit-frame-pointer

CC=msp430-gcc
CFLAGS+=-mmcu=msp430fr5969

SOURCES = $(wildcard *.c)
OBJECTS = $(SOURCES:.c=.o)

all: DataLogger.elf

.PRECIOUS: %.elf

%.o: %.c
	$(CC) $(CFLAGS) $^ -o $@ -c

%.a43: %.elf
	msp430-objcopy -O ihex $^ $@

DataLogger.elf: $(OBJECTS)
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS)


.c.o:
	$(CC) $(CFLAGS) -x c -c $^ -o $@

clean:
	$(RM) *.o *.elf
