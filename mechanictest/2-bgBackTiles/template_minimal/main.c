#include <gb/gb.h>
#include <stdint.h>
#include "main.h"

typedef unsigned char u8;

tTickTimer myAnimtimer;
u8 animFrame=0;
u8 animDelay=8;

void DrawBlocks16(void){
    u8 blockStart=animFrame*4;
    u8 ystart=1;
    for(u8 X=0; X<20; X+=3){
        ystart=1;
        TilePut2x2(X,ystart,(GT16_FISH_F1+blockStart));
        ystart+=3;
        TilePut2x2(X,ystart,(GT16_BAT_F1+blockStart));
        ystart+=3;
        TilePut2x2(X,ystart,(GT16_STAR_F1+blockStart));
        ystart+=3;
        TilePut2x2(X,ystart,(GT16_SUE));
        ystart+=3;
        TilePut2x2(X,ystart,(GT16_VIK));
        ystart+=3;
        TilePut2x2(X,ystart,(GT16_CRATE));
    }

}

void main(void)
{

    SetTileData(GFX_TS_FONT,GFX_TC_FONT,myTiles);
    ClrScreen();

    TickTimer_init(&myAnimtimer,animDelay);

    DISPLAY_ON;
    SHOW_BKG;

    u8 tile8=GT_FLOOR;

    for(u8 Y=0; Y<18; Y+=3) {
        for(u8 X=0; X<20; ++X) {
            TilePut(X,Y,tile8);
        }
        ++tile8;
        if(tile8==GT16_FISH_F1){
            tile8=GT_FLOOR;
        }  
    }

    DrawBlocks16();


    // Loop forever
    while(1) {
        if (TickTimer_Update(&myAnimtimer)){
            ++animFrame;
            if(animFrame==2){
                animFrame=0;
            }
            TickTimer_Reset(&myAnimtimer);
            DrawBlocks16();
        }
        wait_vbl_done;

		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
