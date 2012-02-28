#include <stdio.h>

#include "input.h"

input_event *ie;


int main(int argc, char **argv) {

    ie = (input_event *) malloc(sizeof(input_event));
    
    input_open();     
    
    while (1) {
        printf("\nWating input key: ... \n");
        while (ie->code == 0) {   
            input_get(ie);
        }
        printf("Key presed : %d\n", ie->code);
        ie->code=0;
    }

    return 0;
}
