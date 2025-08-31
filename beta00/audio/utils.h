#ifndef UTILS_H_INCLUDED
#define UTILS_H_INCLUDED

#include <gb/gb.h>
#include <stdbool.h>
///this header is to enable random number generation
///in gbdk, which is different from standard C
#include <rand.h>

typedef signed char s8;
typedef unsigned char u8;
///newly added type u16!
typedef unsigned short u16;

typedef union
{
	struct
	{
		u8 hiByte;
		u8 loByte;
	};
	u16 var16;
}uu16;
///simple countdown timer object
typedef struct
{
	u8 nTimeVal;
	u8 nCountDown;
	bool bHasTimeElapsed;
} tTickTimer;

///global vars
///All variables beginning with small p are pointer types

extern u8 *pTile;
extern const u8 *pSrc;
///used to Seed rnd and add to change seeding as
///we see fit
extern u16 LSeed;
extern u8 IN_JoyNow,IN_JoyOld;
extern void ErrorTrap(const char* errMsg);

///TickTimer functions
extern void TickTimer_Init(tTickTimer *pTT,u8 myDelay);
extern bool TickTimer_Update(tTickTimer *pTT);
extern void TickTimer_Reset(tTickTimer *pTT);

extern void SetTileData(u8 nTileStart,u8 nTileCount,const u8 const *pTileData);

extern void ClrScreen(void);

extern void TilePut(u8 x,u8 y,u8 nTile);
extern void TilePut2(u8 x,u8 y,u8 nTile);
extern void TilePut2X2(u8 x,u8 y,u8 nTileStart);

extern void InitRand(void);
extern u8 Rnd(u8 maxNum);

///clears a horizontal strip of tiles to 0
extern void ClrStripX(u8 x,u8 y,u8 width);
///clears a vertical strip of tiles to 0
extern void ClrStripY(u8 x,u8 y,u8 height);

extern void TileMap_Draw(const u8 const *pMap);
extern const char* BoolToString(bool result);
extern void Print(u8 x,u8 y,const char* msg);
extern void PrintCentre(u8 y,const char* msg);
extern void PrintNum8(u8 x,u8 y,u8 val8);
extern void PrintNum16(u8 x,u8 y,u16 val16);
extern void PrintNum8Hex(u8 x,u8 y,u8 var);
extern bool InRange8(u8 varIn,u8 rangeMin,u8 rangeMax);
extern u8 TileGet(u8 x,u8 y);
extern void IN_Update();
extern bool IN_IsKeyDown(u8 keyID);
extern bool IN_WasKeyPressed(u8 keyID);
extern bool IsBitSet(u8 var,u8 bit);
#endif // UTILS_H_INCLUDED
