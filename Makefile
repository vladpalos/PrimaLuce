#Makefile for building Prima Luce

# == CHANGE THE SETTINGS BELOW TO SUIT YOUR NEEDS =============================

DEVICE = GalaxyS

# == Android Debug Bridge (ADB) options
ADBFLAGS = 

# == Toolchain LIBC path
TLIBCPATH='/opt/CodeSourcery/Sourcery_G++_Lite_Linux/arm-none-linux-gnueabi/libc/'

# == Compiler options
CC = arm-none-linux-gnueabi-gcc
AR = arm-none-linux-gnueabi-ar rcu
RANLIB = arm-none-linux-gnueabi-ranlib
CFLAGS = -O2 -w  -I./build/usr/include -L./build/lib -lSDL  -ldl -llua -lm

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
R = $(V).0

# String colors
C0 = \x1b[0m # no color
C1 = \x1b[32;01m
C2 = \x1b[31;01m
C3 = \x1b[33;01m

# == Lua =============================================

LUA = deps/lua-5.2.0/build
LUA_BIN = $(LUA)/bin/*
LUA_LIB = $(LUA)/lib/*
LUA_INC	= $(LUA)/include/*

LUA_BIN_TO = $(BUILD_BIN)
LUA_LIB_TO = $(BUILD_LIB)
LUA_INC_TO = $(BUILD_INC)

# == SDL =============================================

SDL = deps/SDL-1.2.15/build/
SDL_LIB = $(SDL)/lib/*
SDL_INC = $(SDL)/include/*

SDL_LIB_TO = $(BUILD_LIB)
SDL_INC_TO = $(BUILD_INC)


# == SDL_image =============================================

SDLI = deps/SDL_image-1.2.12/build
SDLI_LIB = $(SDLI)/lib/*
SDLI_INC = $(SDLI)/include/*

SDLI_LIB_TO = $(BUILD_LIB)
SDLI_INC_TO = $(BUILD_INC)

# == SDL_ttf =============================================

SDLTTF = deps/SDL_ttf-2.0.11/build
SDLTTF_LIB = $(SDLTTF)/lib/*
SDLTTF_INC = $(SDLTTF)/include/*

SDLTTF_LIB_TO = $(BUILD_LIB)
SDLTTF_INC_TO = $(BUILD_INC)

# == freetype =============================================

FT = deps/freetype-2.4.9/build
FT_LIB = $(FT)/lib/*
FT_INC = $(FT)/include/*

FT_LIB_TO = $(BUILD_LIB)
FT_INC_TO = $(BUILD_INC)

# == zlib =============================================

ZLIB = deps/zlib-1.2.7/build
ZLIB_LIB = $(ZLIB)/lib/*
ZLIB_INC = $(ZLIB)/include/*

ZLIB_LIB_TO = $(BUILD_LIB)
ZLIB_INC_TO = $(BUILD_INC)

# == libpng =============================================

LPNG = deps/libpng-1.2.46/build
LPNG_LIB = $(LPNG)/lib/*
LPNG_INC = $(LPNG)/include/*

LPNG_LIB_TO = $(BUILD_LIB)
LPNG_INC_TO = $(BUILD_INC)


# == libev =============================================

LIBEV = deps/libev-4.11/build
LIBEV_LIB = $(LIBEV)/lib/*
LIBEV_INC = $(LIBEV)/include/*

LIBEV_LIB_TO = $(BUILD_LIB)
LIBEV_INC_TO = $(BUILD_INC)

# == Toolchain LIBS =============================================

TLIB = $(TLIBCPATH)/lib/libgcc* \
       $(TLIBCPATH)/lib/libm*   \
       $(TLIBCPATH)/lib/libc*   \
       $(TLIBCPATH)/lib/ld-*   
TLIB_TO = $(BUILD_LIB)


# == MAIN BUILD ======================================

# == Build directory
BUILD_TOP 		= ./build
BUILD_LIB 		= $(BUILD_TOP)/lib
BUILD_BIN 		= $(BUILD_TOP)/bin
BUILD_INC 		= $(BUILD_TOP)/usr/include
BUILD_SCRIPTS 	= $(BUILD_TOP)/

TARGET = $(BUILD_LIB)/libPL.a

SOURCES = src/*.c 
		  
OBJECTS = $(shell echo $(SOURCES) | sed -e 's,\.c,\.o,g')


# == TARGETS START FROM HERE ==================================================

all: | prepare $(TARGET) samples end

$(TARGET): $(OBJECTS)  
	$(AR) $@ $? 
	$(RANLIB) $@ 

prepare:
	@echo ""
	@echo -e "$(C1)Prepare...$(C0)"
	@echo "Creating directories ..."
	$(MD) $(BUILD_TOP) \
		  $(BUILD_LIB) \
		  $(BUILD_BIN) \
		  $(BUILD_INC) \
		  $(BUILD_SCRIPTS) \
		  $(LUA_INC_TO) \
		  $(SDL_INC_TO) 
	@echo ""
	@echo "Copying header files ..."
	$(CP) src/*.h $(BUILD_INC)
	@echo ""
	@echo "Copying scripts ..."
	$(CP) platform/$(DEVICE)/scripts/* $(BUILD_SCRIPTS)
	@echo ""
	@echo "Copying Lua ..."
	$(CP) $(LUA_BIN) $(LUA_BIN_TO)
	$(CP) $(LUA_LIB) $(LUA_LIB_TO)
	$(CP) $(LUA_INC) $(LUA_INC_TO)
	@echo ""
	@echo "Copying SDL ..."
	$(CP) $(SDL_LIB) $(SDL_LIB_TO)
	$(CP) $(SDL_INC) $(SDL_INC_TO)
	@echo ""
	@echo "Copying SDL_image ..."
	$(CP) $(SDLI_LIB) $(SDLI_LIB_TO)
	$(CP) $(SDLI_INC) $(SDLI_INC_TO)
	@echo "Copying freetype2 ..."
	$(CP) $(FT_LIB) $(FT_LIB_TO)
	$(CP) $(FT_INC) $(FT_INC_TO)
	@echo ""
	@echo "Copying SDL_ttf ..."
	$(CP) $(SDLTTF_LIB) $(SDLTTF_LIB_TO)
	$(CP) $(SDLTTF_INC) $(SDLTTF_INC_TO)
	@echo ""	
	@echo "Copying zlib ..."
	$(CP) $(ZLIB_LIB) $(ZLIB_LIB_TO)
	$(CP) $(ZLIB_INC) $(ZLIB_INC_TO)
	@echo ""	
	@echo "Copying libpng ..."
	$(CP) $(LPNG_LIB) $(LPNG_LIB_TO)
	$(CP) $(LPNG_INC) $(LPNG_INC_TO)
	@echo ""			
	@echo "Copying libev ..."
	$(CP) $(LIBEV_LIB) $(LIBEV_LIB_TO)
	$(CP) $(LIBEV_INC) $(LIBEV_INC_TO)
	@echo ""
	@echo "Copying ToolChain Libs ..."
	$(CP) $(TLIB) $(TLIB_TO)
	@echo ""
	@echo "" 
	@echo -e "$(C1)Build ...$(C0)"

end:
	@echo ""
	@echo -e "  PrimaLuce successfully built for $(C1)$(DEVICE)$(C0)!"
	@echo -e "  Now type $(C1)'sudo make install'$(C0)to install on device."
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
	adb $(ADBFLAGS) push ./samples/sample1 $(INSTALL_TOP)/usr/samples/sample1
	adb $(ADBFLAGS) push ./samples/res $(INSTALL_TOP)/usr/samples/res
	adb $(ADBFLAGS) push ./samples/scripts $(INSTALL_TOP)/usr/samples/scripts
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



 
