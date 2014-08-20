/*
** 
**  PrimaLuce System 
** 
**  file: plMain.h
**  created: 21-Feb-2012
**    
**  Copyright (C)2012 Vlad Paloş (vlad@palos.ro).All rights reserved!
** 
*/

#ifndef __PL__MAIN_H__
#define __PL__MAIN_H__

#define MAX_FILE_SIZE 10000

#define false 0
#define true 1
#define bool int

#include "plSystem.h"

extern int                 plInit();
extern int                  plDeinit();        

extern int                  plRunFile(const char *filePath);  
extern int                  plRun(const char *filePath);  

#endif
