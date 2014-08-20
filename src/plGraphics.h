/*
** 
**  PrimaLuce Graphics System
** 
**  file: plGraphic.h
**  created: 31-May-2012.
**    
**  Copyright (C)2012 Vlad Paloş (vlad@palos.ro).All rights reserved!
** 
*/

#ifndef __PL_GRAPHICS_H__
#define __PL_GRAPHICS_H__

#include <stdio.h>
#include <stdlib.h>

#include <SDL/SDL.h>
#include <SDL/SDL_image.h>

#include "plSystem.h"
#include "plVideo.h"
#include "plLog.h"

#define PL_SURFACE_IMAGE 0
#define PL_VIDEO 1
#define PL_BUTTON 1

#define SURFACE_ID_SIZE 80

extern struct plSurface {

    int id;
    int type;
    SDL_Surface *surface;
    
    int width;
    int height;

};

extern int plImage(char *path);
extern struct plSurface *plAdd();

extern int plAnimate (struct plSurface *sf, 
                      int sx, int sy, 
                      int fx, int fy, 
                      int rate);
                                            
//extern int plSetX (struct plSurface *sf,int x);
//extern int plSetY (struct plSurface *sf,int y);
//extern int plSetPos (struct plSurface *sf, int x, int y);
    
#endif
