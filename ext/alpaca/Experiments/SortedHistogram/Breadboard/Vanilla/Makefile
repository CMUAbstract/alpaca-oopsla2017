include ../../../Experiment.mk

ASSEMBLY := $(SOURCES:.c=.s)
CFLAGS += -DBREADBOARD

.DEFAULT_GOAL :=
ts.elf: $(ASSEMBLY)
	$(MSPGCC) $(FRAMSECTION) -O0 -mmcu=msp430fr5969 -o $@ $^ $(LDFLAGS)
