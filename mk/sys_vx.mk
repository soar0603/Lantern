ifeq ($(BOARD),vxworks)
CPPFLAGS = -DSDK_IN_VXWORKS
CPPFLAGS += -DSDK_WORK_ENV=0
CPPFLAGS += -DSDK_WORK_PLATFORM=0
endif

ifeq ($(BOARD),vxworks-sim)
CPPFLAGS = -DSDK_IN_VXWORKS
CPPFLAGS += -DUSE_SIM_MEM
CPPFLAGS += -DHEZC
CPPFLAGS += -DSDK_WORK_ENV=0
CPPFLAGS += -DSDK_WORK_PLATFORM=1
endif

ifneq ($(ARCH),ppc)
CPPFLAGS += -DHOST_IS_LE=1
else
CPPFLAGS += -DHOST_IS_LE=0
endif

ifneq ($(VER),r)
CPPFLAGS += -DSDK_IN_DEBUG_VER
endif

CPPFLAGS += -DHUMBER
CPPFLAGS += -I$(VX_HEADER)/

CFLAGS = -Wall -fno-strict-aliasing
ifeq ($(VER),r)
CFLAGS += -O2
else
CFLAGS += -g
endif

CFLAGS += -O2

IS_GCOV = no
