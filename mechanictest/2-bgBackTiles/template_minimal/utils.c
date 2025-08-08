#include "utils.h"

u8 *pTile;

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
