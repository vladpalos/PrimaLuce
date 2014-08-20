/*
** 
**  PrimaLuce LuaApi 
** 
**  file: plLuaApi.c
**  created: 11-JUN-2012
**    
**  Copyright (C)2012 Vlad Paloş (vlad@palos.ro). All rights reserved!
** 
*/

#include "plLuaApi.h"

#include "plMain.h"
#include "plSystem.h"
#include "plGraphics.h"

#include <lua.h>
#include <lualib.h>
#include <lauxlib.h>


#include <SDL/SDL.h>
#include <SDL/SDL_image.h>



static int plLuaImage (lua_State *L) {

    char *path = lua_tostring(L, 1);
 
    int id = plImage(path);
 
    lua_newtable(plSystem->L);
    int table = lua_gettop(plSystem->L);

    lua_pushstring(plSystem->L, "id");
    lua_pushstring(plSystem->L, id);
    lua_settable(plSystem->L, table);

    lua_pushstring(plSystem->L, "draw");
    lua_pushcfunction(plSystem->L, plLuaDraw);
    lua_settable(plSystem->L, table);

    return 1;
}

static int plLuaDraw (lua_State *L) {

    lua_pushstring(L, "id");
    lua_gettable(L, 1);
    int id = lua_tonumber(L, -1);  
    lua_pop(L, 1);
    
    SDL_Rect pos;
    pos.x = lua_tonumber(L, 2);
    pos.y = lua_tonumber(L, 3);    
        
    SDL_BlitSurface(plSystem->objects[id]->surface, NULL, plSystem->video->screen, &pos);

    return 0;
}


static int plLuaLabel (lua_State *L) {

    char *path = lua_tostring(L, 1);
   // plSurface *image = plImage(path);
    
    
    return 0;
}


static int plLuaButton(lua_State *L) {

    char *path = lua_tostring(L, 1);
    //plSurface *image = plImage(path);
    
    
    return 0;
}


int plRegisterAllLua() {

    lua_register(plSystem->L, "plImage", plLuaImage);
    lua_register(plSystem->L, "plLabel", plLuaLabel);
    lua_register(plSystem->L, "plButton", plLuaButton);
    lua_register(plSystem->L, "plDraw", plLuaDraw);
    
    return 0;
}

