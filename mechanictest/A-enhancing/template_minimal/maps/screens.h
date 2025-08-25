#ifndef SCREENS_H_INCLUDED
#define SCREENS_H_INCLUDED

#include <gb/gb.h>

// extern unsigned char TestTileMap[];
extern unsigned char startScreen[];
extern unsigned char levelSelect[]; // have stages A, R, and S
extern unsigned char stageTransition[]; // use testmap for stage screen and have this show something like "starting..." for a few seconds
extern unsigned char youWin[];
extern unsigned char youLose[];

#endif