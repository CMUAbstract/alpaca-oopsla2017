EXEC = templog

OBJECTS = \
    main.o \
#    test.o \

DEPS += \
	libmsp \
	libmspmath \
#	libio \
#	libwispbase \
#	libmspconsole \
#	libmspprintf \

# Relative from toolchain build dir (one down from this file's dir)
SRC_ROOT = ../../src

include $(LIB_ROOT)/libmspbuiltins/bld/Makefile.target
#include $(LIB_ROOT)/libio/bld/Makefile.target
#include $(LIB_ROOT)/libwispbase/bld/Makefile.target
#include $(LIB_ROOT)/libmspconsole/bld/Makefile.target
#include $(LIB_ROOT)/libmspprintf/bld/Makefile.target

#CONFIG_PRINTF_LIB = libmspconsole
CONFIG_PRINTF_LIB = libedb
CONFIG_EDB = 1
#include ../Makefile.config
include ../Makefile.config
include $(LIB_ROOT)/maker/Makefile.console
include $(LIB_ROOT)/maker/Makefile.count

#include $(LIB_ROOT)/libedb/bld/Makefile.target

export LIBMSP_CLOCK_SOURCE = DCO
export LIBMSP_DCO_FREQ = 8000000ull
