CFLAGS=-g -c -mmcu=msp430fr5969
LDFLAGS=-g -mmcu=msp430fr5969
  
MEMENTOSDIR=../../../Mementos
MEMENTOSLIB=mementos_fram

DINODIR=../../../DinoRuntime
DINOLIB=dino

CFLAGS+=-I$(DINODIR) -O0
LDFLAGS+=-L$(MEMENTOSDIR) -l$(MEMENTOSLIB) -L$(DINODIR) -l$(DINOLIB)


ifdef ARR_LEN
CFLAGS += -DARR_LEN=$(ARR_LEN)
endif

%.o: %.c
	msp430-gcc.exe $(CFLAGS) -o $@ $<

%.elf: %.o
	msp430-gcc.exe -o $@ $< $(LDFLAGS) 



all: multiword.elf

clean: 
	-rm *.o *.a43 *.elf
