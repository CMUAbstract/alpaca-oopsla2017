TOOLS = \
	dino \
	mementos \
	alpaca \

TOOLCHAINS = \
	gcc \
	clang \
	dino \
	mementos \
	alpaca \

#OPTED ?= 0
#GBUF ?= 1
#SBUF ?= 0
#TIME ?= 1
#VERBOSE = 1

#CFLAGS += \
#	-DOPTED=$(OPTED) \
#	-DGBUF=$(GBUF) \
#	-DSBUF=$(SBUF) \
#	-DTIME=$(TIME) \
#	-DVERBOSE=$(VERBOSE) \

export BOARD ?= wisp
#export BOARD = mspts430

include ext/maker/Makefile

# Paths to toolchains here if not in or different from defaults in Makefile.env
export TEST_WATCHPOINTS = 1

export MEMENTOS_ROOT = $(LIB_ROOT)/mementos
export DINO_ROOT = $(LIB_ROOT)/dino
export ALPACA_ROOT = $(LIB_ROOT)/alpaca
