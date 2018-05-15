EXEC = $(SRC)
OBJECTS = \
    main_$(SRC)_$(TOOL).o 

DEPS += \
	libmsp \
	libmspmath \

# Relative from toolchain build dir (one down from this file's dir)
#ifeq ($(TOOLCHIAN), alpaca)
#SRC_ROOT = ../../src_alpaca
#endif
#ifeq ($(TOOLCHAIN), chain)
#SRC_ROOT = ../../src_chain
#endif
#ifeq ($(TOOLCHAIN), dino)
#SRC_ROOT = ../../src_dino
#endif
#ifeq ($(TOOLCHAIN), clang)
#SRC_ROOT = ../../src_dino
#endif
SRC_ROOT = ../../src

include $(LIB_ROOT)/libmspbuiltins/bld/Makefile.target

#ifeq ($(BOARD), mspts430)
CONFIG_PRINTF_LIB = libmspconsole
#endif
#ifeq ($(BOARD), wisp)
#CONFIG_PRINTF_LIB = libedb
#CONFIG_EDB = 1
#endif
LOGIC = 1
ifeq ($(LOGIC), 1)
override CFLAGS += \
	-DLOGIC=1
endif

OVERHEAD = 0
ifeq ($(OVERHEAD), 1)
override CFLAGS += \
	-DOVERHEAD=1
endif

include ../Makefile.config
include $(LIB_ROOT)/maker/Makefile.console

export LIBMSP_CLOCK_SOURCE = DCO
export LIBMSP_DCO_FREQ = 8000000ull
export LIBEDB_BOARD_VERSION_MAJOR=1
export LIBEDB_BOARD_VERSION_MINOR=1
