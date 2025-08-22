#include <gb/gb.h>
#include <stdint.h>
#include "tiletest.h"
#include "testmap.h"
#include "sprite.h"
#include "structures/characters.h"
#include "maps/screens.h"
#include "maps/letters.h"
#include "loadingFunctions.h"

void hideCharacterSprites(Character *character) {
    uint8_t spriteCount = character->spriteTileWidth * character->spriteTileHeight;
    for (uint8_t i = 0; i < spriteCount; i++) {
        move_sprite(character->spriteId + i, 0, 0); // Move offscreen
    }
}

void main(void)
{
    loadStart();

    // turns on bkg, sprites, and display
    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

    // Loop forever
    while(1) {

        uint8_t buttons = joypad();

        

        playerControl();
      

		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
