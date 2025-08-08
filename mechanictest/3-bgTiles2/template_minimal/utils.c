#include "utils.h"

u8 *pTile;
u16 LSeed;

void TickTimer_init(tTickTimer *pTT, u8 myDelay){
    pTT->bHasTileElapsed=false;
    pTT->nCountdown=myDelay;
    pTT->nTimeval=myDelay;
}

extern bool TickTimer_Update(tTickTimer *pTT){
    if(pTT->bHasTileElapsed==false){
        --pTT->nCountdown;
        if(pTT->nCountdown==0xFF){
            pTT->bHasTileElapsed=true;
        }
    }

    return pTT->bHasTileElapsed;
}

extern void TickTimer_Reset(tTickTimer *pTT){
    pTT->nCountdown=pTT->nTimeval;
    pTT->bHasTileElapsed=false;
}

extern void SetTileData(u8 nTileStart, u8 nTileCount, const u8 *pTileData){
    set_bkg_2bpp_data(nTileStart,nTileCount,pTileData);
}

extern void ClrScreen(void){
    fill_bkg_rect(0,0,32,32,0); //left, top, width, height, tile number
}

extern void TilePut(u8 x, u8 y, u8 nTile){
    set_tile_xy(x,y,nTile);
}

extern void TilePut2x2(u8 x, u8 y, u8 nTileStart){
    pTile=get_bkg_xy_addr(x,y);
    set_vram_byte(pTile, nTileStart);
    ++nTileStart;
    ++pTile;
    set_vram_byte(pTile, nTileStart);
    ++nTileStart;
    pTile+=31;
    set_vram_byte(pTile, nTileStart);
    ++nTileStart;
    ++pTile;
    set_vram_byte(pTile, nTileStart);
}

void InitRand(void){
    LSeed^=(u16)(TIMA_REG>>2); // takes value from one of the timer registers and use it to seen generator
    initrand(LSeed); // takes 16bit number
}

u8 Rnd(u8 maxNum){
    u8 tv;
    tv=rand(); // picks number between 0-255
    tv=tv%maxNum;
    return tv;
}


// the following functions are for quick use, and could go outside the usual 20/18 range
void TileClrStripX(u8 x, u8 y, u8 width) {
    pTile=get_bkg_xy_addr(x,y);
    while(width)
    {
        set_vram_byte(pTile,0);
        ++pTile;
        --width;
    }
}

void TileClrStripY(u8 x, u8 y, u8 height) {
    pTile=get_bkg_xy_addr(x,y);
    while(height)
    {
        set_vram_byte(pTile,0);
        pTile+=32;
        --height;
    }
}