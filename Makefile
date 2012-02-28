# Makefile for building Prima Luce

# == CHANGE THE SETTINGS BELOW TO SUIT YOUR NEEDS =============================

DEVICE = GalaxyS

# == Android Debug Bridge (ADB) options
ADBFLAGS = 

# == Compiler options
INCLUDE = -I./include
CC = arm-none-linux-gnueabi-gcc
AR = arm-none-linux-gnueabi-ar rcu
RANLIB = arm-none-linux-gnueabi-ranlib
CFLAGS = -O2 -Wall
LIBS = -lm 

# == Commands 
RM = rm -fR
MD = mkdir -p
CP = cp -r

# == Device install directory
INSTALL_TOP = /data/PrimaLuce
INSTALL_SAMPLES = $(INSTALL_TOP)/usr/samples/

# == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======

# PrimaLuce version and release
V = 0.1
R = $V.0

# == Lua
LUA = deps/lua-5.1.4

LUA_BIN = 	$(LUA)/bin/lua $(LUA)/bin/luac

LUA_LIB = 	$(LUA)/lib/liblua.a

LUA_INC = 	$(LUA)/src/src/lua.h \
			$(LUA)/src/src/luaconf.h \
			$(LUA)/src/src/lualib.h \
			$(LUA)/src/src/lauxlib.h \
			$(LUA)/src/src/lua.hpp

# == SDL
SDL = deps/SDL-1.2.15

SDL_LIB = $(SDL)/libSDL.a

SDL_INC = $(SDL)/include/


# String begin/end color
C0 = \x1b[0m # no color
C1 = \x1b[32;01m
C2 = \x1b[31;01m
C3 = \x1b[33;01m

# == Build directory
BUILD_TOP 		= ./build
BUILD_LIB 		= $(BUILD_TOP)/lib
BUILD_BIN 		= $(BUILD_TOP)/bin
BUILD_INC 		= $(BUILD_TOP)/usr/include
BUILD_SCRIPTS 	= $(BUILD_TOP)/usr/scripts/

TARGET = $(BUILD_LIB)/libPL.a

SOURCES = src/*.c 
		  
OBJECTS = $(shell echo $(SOURCES) | sed -e 's,\.c,\.o,g')


# == TARGETS START FROM HERE ==================================================

all: | prepare $(TARGET) post samples end

$(TARGET): $(OBJECTS)
	$(AR) $@ $?
	$(RANLIB) $@

prepare:
	@echo ""
	@echo -e "$(C1)Prepare...$(C0)"
	@echo "Creating directories ..."
	$(MD) $(BUILD_TOP) $(BUILD_LIB) $(BUILD_BIN) $(BUILD_INC) $(BUILD_SCRIPTS)
	@echo ""
	@echo "Copying header files ..."
	$(CP) src/*.h $(BUILD_INC)
	@echo "" 
	@echo -e "$(C1)Build ...$(C0)"

post:
	@echo ""
	@echo "Copying scripts ..."
	$(CP) platform/$(DEVICE)/scripts/* $(BUILD_SCRIPTS)
	@echo ""
	@echo "Copying Lua ..."
	$(CP) $(LUA_BIN) $(BUILD_BIN)
	$(CP) $(LUA_LIB) $(BUILD_LIB)
	$(CP) $(LUA_INC) $(BUILD_INC)
	@echo ""
	@echo "Copying SDL ..."
	$(CP) $(SDL_LIB) $(BUILD_LIB)
	$(CP) $(SDL_INC) $(BUILD_INC)

end:
	@echo ""
	@echo -e "  PrimaLuce successfully built for $(C1)$(DEVICE)$(C0)!"
	@echo -e "  Now type $(C1)'make install'$(C0)to install on device."
	@echo ""
	
samples: dummy
	@echo ""
	@echo -e "$(C1)Building samples ...$(C0)"
	cd samples && $(MAKE)
	@echo ""

clean:
	@echo ""
	@echo -e "$(C1)Cleaning...$(C0)"
	@echo ""
	@echo "Cleaning all builds..."
	@echo "----------------------------------"
	$(RM) $(BUILD_TOP) $(OBJECTS) 
	cd samples && $(MAKE) $@
	@echo ""

install: dummy
	@if test -d $(BUILD_TOP); then echo ""; else echo ""; echo -e "$(C2)Please build first !!!$(C0)"; exit 2; fi
	@echo ""
	@echo ""   
	@echo -e "$(C1)===========================================================================$(C0)"
	@echo ""
	@echo -e "      PrimaLuce $(C2)$V$(C0)"
	@echo -e "      Installation on $(DEVICE) device using ADB."
	@echo ""
	@echo "      Copyright (C)2012 Vlad Paloş (vlad@palos.ro)."
	@echo "      All rights reserved!"
	@echo ""
	@echo -e "$(C1)===========================================================================$(C0)"
	@echo ""
	@echo ""
	adb kill-server
	adb $(ADBFLAGS) push $(BUILD_TOP) $(INSTALL_TOP)   
	@echo ""
	$(MAKE) install_samples
	@echo ""
	@echo -e "$(C1)PrimaLuce Installed successfully ! \nEnjoy !!!$(C0)"
	@echo ""

install_samples: dummy
	@echo ""
	@echo "Installing samples..."
	@echo "----------------------------------"
	adb $(ADBFLAGS) push samples/bin $(INSTALL_TOP)/usr/samples/bin/
	@echo ""

remove:
	@echo ""
	@echo -e "$(C1)Remove ...$(C0)"
	@echo ""
	@echo "Removing PrimaLuce from $(DEVICE) !" 
	@echo "----------------------------------"
	adb shell rm -Rf $(INSTALL_TOP)	
	@echo ""
	@echo -e "$(C1)PrimaLuce removed successfully!$(C0)" 
	@echo ""


# make may get confused with samples/ and install/
dummy:

# list targets that do not create files (but not all makes understand .PHONY)
.PHONY: all default clean install dummy test remove



 
