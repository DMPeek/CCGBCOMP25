#ifndef UTILS_H_INCLUDED
#define UTILS_H_INCLUDED

#include <gb/gb.h>
// #include <stdbool.h>

typedef unsigned char bool;
#define true 1
#define false 0

typedef unsigned char u8;


typedef struct 
{
    u8 nTimeval;
    u8 nCountdown;
    bool bHasTileElapsed;

} tTickTimer;


extern u8 *ptile;

extern void TickTimer_init(tTickTimer *pTT, u8 myDelay);
extern bool TickTimer_Update(tTickTimer *pTT);
extern void TickTimer_Reset(tTickTimer *pTT);

extern void SetTileData(u8 nTileStart, u8 nTileCount, const u8 *pTileData);

extern void ClrScreen(void);

extern void TilePut(u8 x, u8 y, u8 nTile);
extern void TilePut2x2(u8 x, u8 y, u8 nTileStart);

#endif // UTILS_H_INCLUDED