/*
** 
**  PrimaLuce System 
** 
**  file: plSystem.h
**  created: 21-Feb-2012
**    
**  Copyright (C)2012 Vlad Paloş (vlad@palos.ro). All rights reserved!
** 
*/
#include "plSystem.h"

#include "plLuaApi.h"
#include "plMain.h"
#include "plGraphics.h"
#include "plVideo.h"
#include "plLog.h"

#include <SDL/SDL.h>
#include <SDL/SDL_image.h>

int plLuaCall(char *function) {
    
    if (plSystem == NULL) {
        plLogE("System not initalized!");
        exit(1);
    }
	
	lua_getglobal(plSystem->L, function);
	if (lua_pcall(plSystem->L, 0, 0, 0) != 0) {
		plLogE("Error running function: %s\n", lua_tostring(plSystem->L, -1));
		exit(1);
	}    
}


int plFPSInit() {

    plSystem->ftimes = (int *) malloc(sizeof(int) * FRAME_VALUES);
    memset(plSystem->ftimes, 0, sizeof(plSystem->ftimes));
    plSystem->fcount = 0;
    plSystem->fps = 0;
    plSystem->lframe = SDL_GetTicks();

}

int computeFPS() {

        int findex;
        int getticks;
        int count;
        int i;

        findex = plSystem->fcount % FRAME_VALUES;
        getticks = SDL_GetTicks();
        plSystem->ftimes[findex] = getticks - plSystem->lframe;
        plSystem->lframe = getticks;
        plSystem->fcount++;

        if (plSystem->fcount < FRAME_VALUES) count = plSystem->fcount;
        else count = FRAME_VALUES;

        plSystem->fps = 0;

        for (i = 0; i < count; i++)  plSystem->fps += plSystem->ftimes[i];

        plSystem->fps /= count;
        plSystem->fps = 1000.f / plSystem->fps;
}

