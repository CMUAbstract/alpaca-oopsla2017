CFLAGS = -I../../../../DinoRuntime
PPCFLAGS = -I../../../../DinoRuntime

include ../../../Experiment.mk

ASSEMBLY := $(SOURCES:.c=.s)
CFLAGS += -DBREADBOARD

.DEFAULT_GOAL :=
midi.elf: $(ASSEMBLY)
	$(MSPGCC) $(FRAMSECTION) -O0 -mmcu=msp430fr5969 -o $@ $^ $(LDFLAGS)
