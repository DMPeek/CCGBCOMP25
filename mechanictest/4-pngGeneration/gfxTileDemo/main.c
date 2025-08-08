#include <gb/gb.h>
#include "Utils.h"
#include "gfxDefines.h"

#define IMG_SONIC_W 14u
#define IMG_SONIC_H 16u
#define IMG_RICK_W 8u
#define IMG_RICK_H 8u

#define IMG_W IMG_RICK_W
#define IMG_H IMG_RICK_H
#define IMG_WP (u8)(IMG_W*8)
#define IMG_HP (u8)(IMG_H*8)
#define MAX_X (u8)(160-IMG_WP)
#define MAX_Y (u8)(144-IMG_HP)
void main(void)
{
	s8 scrollX,scrollY,bounceA=1,bounceB=-1;
	u8 rangeX=MAX_X;
	u8 rangeY=MAX_Y;
	if(rangeX>127u)
    rangeX=127u;
	if(rangeY>127u)
    rangeY=127u;
	SetTileData(GFX_TS_TILES,GFX_TC_TILES,gfxTiles);
	fill_bkg_rect(0,0,32,32,0);

	DISPLAY_ON;
	SHOW_BKG;
	u8 x,y;
	u8 tid=0;
	for(y=0;y<IMG_H;y++)
	{
		for(x=0;x<IMG_W;++x)
		{
			TilePut(x,y,tid);
			++tid;
		}
	}
  scrollX=0;
  scrollY=0;
	while(1)
	{
		wait_vbl_done();
		wait_vbl_done();
		scroll_bkg(bounceA,bounceB);
		scrollX+=bounceA;
		if((scrollX>0) || (scrollX<-rangeX))
		{
			bounceA*=-1;
		}
		scrollY+=bounceB;
		if((scrollY>0) || (scrollY<-rangeY))
		{
			bounceB*=-1;
		}
	}
}
