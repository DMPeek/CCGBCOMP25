#include <gb/gb.h>
#include <stdint.h>
#include "tiletest.h"
#include "testmap.h"
#include "sprite.h"
#include "structures/characters.h"

Character player1;
Character player2;

#define SCREEN_W 20
#define SCREEN_H 18
#define TILE_COUNT (SCREEN_W * SCREEN_H)

void main(void)
{
    // fill bank 0 with character sprite
    set_sprite_data(0, viking_tileset_size, viking_tileset);

    // setup character
    setupCharacter(&player1, 0, 2, 2, 0, 1, viking_tilemap);
    setupCharacter(&player2, 4, 2, 2, 0, 1, viking_tilemap);

    // places character on map
    moveCharacter(&player1, 64, 112);
    moveCharacter(&player2, 88, 112);

    // fills bank 2 with bkg tiles and sets the map
    set_bkg_data(0,7,TileTest);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,TestTileMap);

    // turns on bkg, sprites, and display
    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    // Loop forever
    while(1) {
  
      moveCharacterWithLR(&player1);
      moveCharacterWithAB(&player2);

		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
