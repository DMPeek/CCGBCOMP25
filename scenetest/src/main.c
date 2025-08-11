#include <gb/gb.h>
#include <stdio.h>
#include "../res/NumberTiles.h"
#include "../res/splashscreen_tileset.h"
#include "scaledown.c"

int test;

void main()
{
    uint8_t mButtons;

    splashscreen();

     // Show background
     SHOW_BKG;
     DISPLAY_ON;

     while (1)
     {
        
        mButtons = joypad();

        if (mButtons & J_A)
            splashscreen();
        if (mButtons & J_B)
            testscreen();
        //   wait_vbl_done();
        if (test)
            scroll_bkg(1, 0);
            delay(200);
     }
}

void splashscreen() {
    test = 0;
    move_bkg(0, 0);
    // Load tileset into GB memory
    set_bkg_data(0, splashscreen_tileset_size, splashscreen_tileset);

    // Fill screen with splashscreen map
    set_bkg_tiles(0, 0, 20, 18, splashscreen_tilemap);
}

void testscreen() {
    test = 1;
    // Load tileset into GB memory
    set_bkg_data(0, 11, NumberTiles);
    
    // Fill entire screen with 1st tile
    init_bkg(4);
     
}