#ifndef UTILS_H
#define UTILS_H
#include <gb/gb.h>
#include <gb/cgb.h>

typedef unsigned char u8;
typedef signed char s8;
typedef unsigned int u16;
typedef short s16;

extern const u8* const pData;
extern const u16* const pPal;

extern void SetTileData(u8 nTileStart,u8 nTileCount,const u8* pTileData);
extern void SetPalettes(u8 PalStartID,u8 palCount,const u16* pColours);
extern void TilePut(u8 x,u8 y,u16 nTile);
#endif // UTILS_H
