#include <gb/gb.h>
#include <stdint.h>
#include "tiletest.h"
#include "testmap.h"
#include "sprite.h"
#include "structures/characters.h"
#include "maps/screens.h"
#include "maps/letters.h"
#include "loadingFunctions.h"

const uint8_t SCROLL_DELAY = 5;

void hideCharacterSprites(Character *character) {
    uint8_t spriteCount = character->spriteTileWidth * character->spriteTileHeight;
    for (uint8_t i = 0; i < spriteCount; i++) {
        move_sprite(character->spriteId + i, 0, 0); // Move offscreen
    }
}

void moveStarDown(Character *star) {
    scrollCharacter(star, 0, 1);
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

        static uint8_t star_frame_counter = 0;
        star_frame_counter++;
        if (star_frame_counter >= SCROLL_DELAY && STAGE == 1) {
            moveStarDown(&star);
            star_frame_counter = 0;
        }

        
        //start screen to menu screen
        if ((buttons & J_START) && (STARTSCREEN == 1)) {
            loadMenu();
            STARTSCREEN = 0;
        };

        //menu screen to transition screen or back to start screen
        if ((buttons & J_B) && (MENUSCREEN == 1)) {
            loadStart();
            MENUSCREEN = 0;
            STAGEPICK = 0;
            hideCharacterSprites(&pointer);
        } else if ((buttons & J_A) && (STAGEPICK == 1)) {
            loadTransition();
            MENUSCREEN = 0;
            STAGEPICK = 0;
            hideCharacterSprites(&pointer);
        } else if ((buttons & J_A) && (STAGEPICK == 2)) {
            loadTransition();
            MENUSCREEN = 0;
            STAGEPICK = 0;
            hideCharacterSprites(&pointer);
        } else if ((buttons & J_A) && (STAGEPICK == 3)) {
            loadTransition();
            MENUSCREEN = 0;
            STAGEPICK = 0;
            hideCharacterSprites(&pointer);
        }

        //transition screen to stage screen
        if (TRANSITIONSCREEN == 1) {
            TRANSITIONCOUNTER++;
            if (TRANSITIONCOUNTER >= 120) { // 2 seconds at 60 FPS
                loadStage();
                TRANSITIONSCREEN = 0;
                TRANSITIONCOUNTER = 0;
            }
        }
        
        // stage screen to win screen or lose screen
        // if statement for loadwin checks if star touches sprite of viking at all
        if (STAGE == 1 &&
            star.x_pos < player1.x_pos + 16 &&
            star.x_pos + 16 > player1.x_pos &&
            star.y_pos < player1.y_pos + 16 &&
            star.y_pos + 16 > player1.y_pos) {

            loadWin();
            STAGE = 0;
            GAMEPLAY = 0;
            hideCharacterSprites(&player1);
            hideCharacterSprites(&player2);
            hideCharacterSprites(&star);
        } else if (star.y_pos >= 14 * 8 && STAGE == 1) {
            loadLoss();
            STAGE = 0;
            GAMEPLAY = 0;
            hideCharacterSprites(&player1);
            hideCharacterSprites(&player2);
            hideCharacterSprites(&star);
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
        pointerControl();
      

		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
