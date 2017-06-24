include $(MEMENTOS_ROOT)/Makefile.flags

override SRC_ROOT = ../../src

LIB = libmementos

OBJECTS = \
	mementos.o \

ifeq ($(MEMENTOS_IGNORE_GLOBALS),1)
OBJECTS += mementos_gsize.o
endif

ifeq ($(MEMENTOS_USER_MAIN),0)
OBJECTS += mementos_main.o
endif

ifeq ($(MEMENTOS_HARDWARE),1)
OBJECTS += mementos_hw.o
endif

ifeq ($(MEMENTOS_LOGGING),1)
OBJECTS += mementos_logging.o
endif

ifeq ($(MEMENTOS_NVMEM_TYPE),fram)
OBJECTS += mementos_fram.o
else ifeq ($(MEMENTOS_NVMEM_TYPE),flash)
OBJECTS += mementos_flash.o
else
$(error Unrecognized MEMENTOS_NVMEM_TYPE: "$(MEMENTOS_NVMEM_TYPE)")
endif

ifneq ($(MEMENTOS_STUCK_PATH_WATCHPOINT),)
override CFLAGS += -DMEMENTOS_STUCK_PATH_WATCHPOINT=$(MEMENTOS_STUCK_PATH_WATCHPOINT)
override DEPS += libedb libmsp libmspbuiltins
endif # MEMENTOS_STUCK_PATH_WATCHPOINT

override CFLAGS += \
	-I$(SRC_ROOT)/include \
	-I$(SRC_ROOT)/include/libmementos \
