#include <gb/gb.h>
#include <stdint.h>
#include "tiletest.h"
#include "testmap.h"
#include "sprite.h"

#define SCREEN_W 20
#define SCREEN_H 18
#define TILE_COUNT (SCREEN_W * SCREEN_H)

void main(void)
{
    // fill bank 0 with character sprite
    set_sprite_data(0, viking_tileset_size, viking_tileset);

    // sets sprites for character. called a metasprite since it is made up of multiple sprites
    set_sprite_tile(0, viking_tilemap[0]);
    set_sprite_tile(1, viking_tilemap[1]);
    set_sprite_tile(2, viking_tilemap[2]);
    set_sprite_tile(3, viking_tilemap[3]);

    //put sprite on screen
    move_sprite(0, 8, 16);
    move_sprite(1, 16, 16);
    move_sprite(2, 8, 24);
    move_sprite(3, 16, 24);





    // fills bank 2 with bkg tiles and sets the map
    set_bkg_data(0,7,TileTest);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,TestTileMap);

    // turns on bkg, sprites, and display
    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    // Loop forever
    while(1) {
    
      uint8_t buttons = joypad();  

      uint8_t moveX = 0;
      uint8_t moveY = 0;

      if (buttons & J_LEFT){
        moveX = -1;
      }
      else if (buttons & J_RIGHT){
        moveX = 1;
      }
      if (buttons & J_UP){
        moveY = -1;
      }
      else if (buttons & J_DOWN){
        moveY = 1;
      }

      scroll_sprite(0, moveX, moveY);
      scroll_sprite(1, moveX, moveY);
      scroll_sprite(2, moveX, moveY);
      scroll_sprite(3, moveX, moveY);



		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
