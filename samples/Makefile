# Makefile for building Prima Luce

# == CHANGE THE SETTINGS BELOW TO SUIT YOUR NEEDS =============================

# == Compiler options
CC = arm-none-linux-gnueabi-gcc
CFLAGS = -w  -I../build/usr/include/ -L../build/lib --static
LIBS = -lPL -lSDL_image -lSDL_ttf -lfreetype -lpng -lz -lev  -llua  -lm -lSDL  -ldl -lpthread -lc

# == Commands 
RM = rm -fR
MD = mkdir -p
CP = cp 

# == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======

SOURCES = sample1.c 
TARGETS = $(SOURCES:.c=)  
OBJECTS = $(SOURCES:.c=.o)

# == TARGETS START FROM HERE ==================================================

all: $(TARGETS)

$(TARGETS): $(OBJECTS)
	$(CC) $(CFLAGS) $(SOURCES) -o $(TARGETS) $(LIBS)

clean:
	@echo ""
	@echo "Cleaning all samples..."
	@echo "----------------------------------"
	$(RM) $(OBJECTS) $(TARGETS)
	@echo ""

