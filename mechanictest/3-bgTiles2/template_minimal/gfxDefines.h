#ifndef GFXDEFINES_H_INCLUDED
#define GFXDEFINES_H_INCLUDED

#include "utils.h"

#define GFX_TS_FONT 0
#define GFX_TC_FONT 45 // can change these numbers based on # of tiles available

#define GT_FLOOR 1
#define GT_WALL 2
#define GT_SMILEY 3
#define GT_INVADER 4
#define GT_HEART 5

#define GT16_FISH_F1 6
#define GT16_FISH_F2 GT16_FISH_F1+4

#define GT16_BAT_F1 GT16_FISH_F2+4
#define GT16_BAT_F2 GT16_BAT_F1+4

#define GT16_STAR_F1 GT16_BAT_F2+4
#define GT16_STAR_F2 GT16_STAR_F1+4

#define GT16_SUE 33
#define GT16_VIK GT16_SUE+4
#define GT16_CRATE GT16_VIK+4

extern const u8 const myTiles[]; // need to add source file of tiles here. use gfxTiles.c

#endif //GFXDEFINES_H_INCLUDED