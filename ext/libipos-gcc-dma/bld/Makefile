LIB = libipos-gcc-dma

# We need the device information for later in this makefile.
# Note that normally this is included automatically by Makefile.gcc
include $(MAKER_ROOT)/Makefile.board

# TODO: copy-pasting code from mspware is not nice
OBJECTS = \
	dataProtec.o \
	pTCB.o \
	psched.o \

DEPS += libio \
		libedb

override SRC_ROOT = ../../src

override CFLAGS += \
	-I$(SRC_ROOT)/include/libipos-gcc-dma \
	-DCONFIG_LIBEDB_PRINTF \
	-DCONFIG_LIBEDB_PRINTF_EIF

include ../Makefile.config
