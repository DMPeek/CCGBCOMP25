#ifndef UTILS_H_INCLUDED
#define UTILS_H_INCLUDED

#include <gb/gb.h>
// #include <stdbool.h>
#include <rand.h>

typedef unsigned char bool;
#define true 1
#define false 0

typedef unsigned char u8;
typedef unsigned short u16;

#define ACTOR_MAX 50

typedef struct 
{
    u8 nTimeval;
    u8 nCountdown;
    bool bHasTileElapsed;

} tTickTimer;


extern u8 *ptile;
extern u16 LSeed; // used for random number generators

// enum functions assign numeric values to words for use in other files
// this one hold movetypes
enum {
    eACTOR_MOVE_TYPE_BOUNCE_Y=0,
    eACTOR_MOVE_TYPE_BOUNCE_X,
    eACTOR_MOVE_TYPE_BOUNCE_ALL
};

// this one holds bittypes for flags
enum {
    eFACING_UP=1,
    eFACING_RIGHT=2,
    eFACING_DOWN=4,
    eFACING_LEFT=8
};

// this one holds animation types
enum {
    eACTOR_ANIM_TYPE_STATIC=0,
    eACTOR_ANIM_TYPE_LOOP
};

//this struct will hold all the values of our actors to use later
typedef struct{
    u8 pos_x[ACTOR_MAX]; // current x position
    u8 pos_y[ACTOR_MAX]; // current y position
    u8 tileStart[ACTOR_MAX]; // where the actor starts
    u8 facing[ACTOR_MAX]; // where the actor is facing
    u8 Movetype[ACTOR_MAX]; // the enum above shows the movetypes in bounce
    u8 AnimType[ACTOR_MAX]; // shows the actor animations whether they be static or looping
    u8 nCount;
    u8 nFrameID;
} tActorGroup;

extern void TickTimer_init(tTickTimer *pTT, u8 myDelay);
extern bool TickTimer_Update(tTickTimer *pTT);
extern void TickTimer_Reset(tTickTimer *pTT);

extern void SetTileData(u8 nTileStart, u8 nTileCount, const u8 *pTileData);

extern void ClrScreen(void);

extern void TilePut(u8 x, u8 y, u8 nTile);
extern void TilePut2x2(u8 x, u8 y, u8 nTileStart);

extern void InitRand(void); // initializes random number generator
extern u8 Rnd(u8 maxNum); // returns a number value between 0 and maxNum that is passed in

extern void TileClrStripX(u8 x, u8 y, u8 width);
extern void TileClrStripY(u8 x, u8 y, u8 height);

#endif // UTILS_H_INCLUDED