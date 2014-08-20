/*
** 
**  PrimaLuce LuaApi 
** 
**  file: plLuaApi.h
**  created: 11-JUN-2012
**    
**  Copyright (C)2012 Vlad Paloş (vlad@palos.ro). All rights 
*/

#ifndef __PL_LUA_API_H__
#define __PL_LUA_API_H__

#include "plSystem.h"

static int plLuaImage (lua_State *L);
static int plLuaLabel (lua_State *L);
static int plLuaButton (lua_State *L);

static int plLuaDraw (lua_State *L);

int plRegisterAllLua();

#endif
