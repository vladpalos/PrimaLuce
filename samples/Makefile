# Makefile for building Prima Luce

# == CHANGE THE SETTINGS BELOW TO SUIT YOUR NEEDS =============================

# == Compiler options
CC = arm-none-linux-gnueabi-gcc
AR = arm-none-linux-gnueabi-ar rcu
CFLAGS = -O2 -Wall -I../build/usr/include -L../build/lib --static
LIBS = -lm -lPL

# == Commands 
RM = rm -fR
MD = mkdir -p
CP = cp 

# == END OF USER SETTINGS -- NO NEED TO CHANGE ANYTHING BELOW THIS LINE =======
BIN = ./bin

SOURCES = sample1.c 
TARGETS = $(BIN)/$(SOURCES:.c=)  
OBJECTS = $(SOURCES:.c=.o)

# == TARGETS START FROM HERE ==================================================

all: | dirs $(TARGETS)

dirs: 
	$(MD) $(BIN)

$(TARGETS): $(OBJECTS)
	$(CC) $(CFLAGS) $(SOURCES) -o $(TARGETS) $(LIBS)

clean:
	@echo ""
	@echo "Cleaning all samples..."
	@echo "----------------------------------"
	$(RM) $(OBJECTS) $(TARGETS) $(BIN)
	@echo ""

