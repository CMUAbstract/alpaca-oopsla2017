CC=msp430-gcc
AR=msp430-ar
OPT=-O0
DBG=-g
CFLAGS=-mmcu=msp430fr5969 $(OPT) $(DBG)

all: acctest.elf

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

libadxl362z.a: adxl362z.o
	$(AR) r $@ $^ 

acctest.elf: libadxl362z.a acctest.o
	$(CC) $(CFLAGS)  $<  -L. -ladxl362z -o $@ 
clean:
	-rm *.elf *.o *.a
