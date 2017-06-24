#include $(MEMENTOS_ROOT)/Makefile.flags



override SRC_ROOT = ../../src

LIB = libchain

OBJECTS = \
	chain.o \

DEPS += \
	libio \
	libmsp \

# NOTE: requiring DINO flag to build libdino is not very nice. The flag is
# meant for apps to build with/without DINO support. The reason is that dino.h
# is used both by the app and internally by the lib. For the app purposes,
# dino.h is a no-op when DINO flag is not set. However, since then, the
# conditional dependency mechanism has been implemented differently (using a
# wrapper header in target/dino.h that does a conditional include and no-ops
# otherwise. So, perhaps we should remove the conditional logic based on DINO
# flag from dino.h.
override CFLAGS += \
	-DCHAIN \
	-I$(SRC_ROOT)/include \
	-I$(SRC_ROOT)/include/libchain \

#override DEPS += libmementos
#DEP_ROOT_libmementos ?= $(MEMENTOS_ROOT)


##This three line is for printing log

#CONFIG_PRINTF_LIB = libmspconsole
#include $(MAKER_ROOT)/Makefile.console
