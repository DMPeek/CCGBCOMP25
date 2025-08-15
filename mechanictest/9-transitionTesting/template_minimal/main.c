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

        
        //start screen to menu screen
        if ((buttons & J_START) && (STARTSCREEN == 1)) {
            loadMenu();
            STARTSCREEN = 0;
        };

        //menu screen to trnaistion screen or back to start screen
        if ((buttons & J_A) && (MENUSCREEN == 1)) {
            loadTransition();
            MENUSCREEN = 0;
        } else if ((buttons & J_B) && (MENUSCREEN == 1)) {
            loadStart();
            MENUSCREEN = 0;
        } else {
        };

        //transition screen to stage screen
        if ((buttons & J_START) && (TRANSITIONSCREEN == 1)) {
            loadStage();
            TRANSITIONSCREEN = 0;
        };
        
        // stage screen to win screen or lose screen
        if ((buttons & J_UP) && (STAGE == 1)) {
            loadWin();
            STAGE = 0;
            GAMEPLAY = 0;
            hideCharacterSprites(&player1);
            hideCharacterSprites(&player2);
        } else if ((buttons & J_DOWN) && (STAGE == 1)) {
            loadLoss();
            STAGE = 0;
            GAMEPLAY = 0;
            hideCharacterSprites(&player1);
            hideCharacterSprites(&player2);
        } else {
        };

        //win screen to start screen
        if ((buttons & J_A) && (WINSCREEN == 1)) {
            loadStart();
            WINSCREEN = 0;
        }

        //lose screen to start screen
        if ((buttons & J_A) && (LOSESCREEN == 1)) {
            loadStart();
            LOSESCREEN = 0;
        };

        playerControl();
      

		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
