#include "Utils.h"

const u8* const pData;

void TilePut(u8 x,u8 y,u16 nTile)
{
	set_tile_xy(x,y,nTile);
}

void SetTileData(u8 nTileStart, u8 nTileCount, const u8* pTileData)
{
	set_bkg_2bpp_data(nTileStart,nTileCount,pTileData);
}


