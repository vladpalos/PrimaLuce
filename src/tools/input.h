#ifndef __INPUT_H__
#define __INPUT_H__

#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

typedef struct {
        struct timeval time;
        unsigned short type;
        unsigned short code;
        unsigned int value;
} input_event;


// Opens the Android keypad device for reading
void andkeys_open();


// Polls the Android keypad device for new data. Returns 0 if there was no new data.
// Otherwise non-zero is returned and the input_event struct pointed to by 'ie' is
// filled with the latest data.
int andkeys_get(input_event *ie);


#endif
