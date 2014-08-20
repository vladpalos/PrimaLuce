/*
** 
**  PrimaLuce Video 
** 
**  file: plVideo.h
**  created: 21-Feb-2012
**    
**  Copyright (C)2012 Vlad Paloş (vlad@palos.ro). All rights reserved!
** 
*/

#include "plVideo.h"

#include <SDL/SDL.h>


int plInitVideo() {
    
    if (plSystem == NULL) {
        plLogE("System not initalized!");
        return 1;
    }
        
    if (plSystem->video == NULL ) {
        plSystem->video = (struct plVideo *) malloc(sizeof(struct plVideo));
    }
    
    if (plSystem->video->state == PL_VIDEO_ON) {
        plLogW("Video already initalized! Should not initalize again!");        
        return 0;
    }

        
    if(SDL_Init(SDL_INIT_VIDEO) < 0) {
        plLogE("Failed SDL_Init: %s", SDL_GetError());
        return 1;
    }         
     
    plSystem->video->screen = SDL_SetVideoMode(480, 800, 32, SDL_HWSURFACE | SDL_DOUBLEBUF | SDL_FULLSCREEN );
    if(plSystem->video->screen == NULL) {
        plLogE("Failed SDL_Init: %s", SDL_GetError());
        return 1;
    }   
        
    return 0;
}

int plDeinitVideo() {    
    
    if (plSystem == NULL) {
        plLogE("System not initalized!");
        return 1;
    }
    
    if (plSystem->video != NULL) {
        SDL_FreeSurface(plSystem->video->screen);
        SDL_Quit();
    }  
    return 0;
}
