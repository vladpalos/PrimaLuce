/*
** 
**  PrimaLuce System 
** 
**  file: plSystem.h
**  created: 21-Feb-2012
**    
**  Copyright (C)2012 Vlad Paloş (vlad@palos.ro).All rights reserved!
** 
*/

#ifndef __PL_SYSTEM_H__
#define __PL_SYSTEM_H__

#define PL_STATUS_OFF 0
#define PL_STATUS_ON 1
#define PL_STATUS_STANDBY 2

#define MAX_OBJECTS 100

#define FRAME_VALUES 10

#include <stdlib.h>
#include <lua.h>

#include "plGraphics.h"

struct plSystemStruct {

    int status;
    lua_State *L;   
    struct plVideo *video; 
    
    int oCount;
    struct plSurface *objects[100];    
    
    int fps;
    int fcount;
    int *ftimes;
    int lframe; 
  
};

struct plSystemStruct *plSystem;

extern int plLuaCall( char *function);

extern int plFPSInit();
extern int computeFPS();

#endif
