/*
** 
**  PrimaLuce Graphics System
** 
**  file: plGraphic.c
**  created: 31-May-2012
**    
**  Copyright (C)2012 Vlad Paloş (vlad@palos.ro).All rights reserved!
** 
*/

#include "plGraphics.h"

#include <SDL/SDL.h>
#include <SDL/SDL_image.h>

//struct plSystemStruct plSystem;

int plAddSurface(struct plSurface *dest) {
    
    if (dest == NULL) {
        plLogW("Empty surface!");
        return 0;
    }
    
    return 0;    
}


int plImage(char *path) {
    
    struct plSurface *image = (struct plSurface *) malloc (sizeof(struct plSurface));
        
    image->surface = IMG_Load(path);
    if (!image->surface) {
        plLog("Could not load image %s: %s", path, IMG_GetError());
        exit(1);
    }       
    image->id = plSystem->oCount;    
     
    plSystem->objects[plSystem->oCount] = image;
    plSystem->oCount++;
    
    return image;
}

int plDraw (struct plSurface *sf, int x, int y) {

    SDL_Rect space;
    space.x = x;
    space.y = y;
    
    SDL_BlitSurface(sf->surface, NULL, plSystem->video->screen, &space);        

    return 0;
}

int plAnimate ( struct plSurface *sf, 
                int sx, int sy, 
                int fx, int fy, 
                int rate) {


    return 0;
}

