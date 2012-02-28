#include "input.h"

static int input;


void input_open() {
	// Opens /dev/input/event0, which should be the keypad.
	// Uses non-blocking mode since we don't want andkeys_get to wait until there
	// is any data available.
	char str[256];
	printf("Input file: ");
	scanf("%s", str);
		
	input = open(str, O_RDONLY|O_NONBLOCK);
}


int input_get(input_event *ie) {
	ie->code = 0;

	// Read 16 bytes from /dev/input/event0
	read(input, ie, sizeof(input_event));

	if (ie->code) {
		return 1;
	}

	return 0;
}
