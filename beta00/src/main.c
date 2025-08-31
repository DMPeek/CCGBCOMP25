#include "main.h"


// #define SCREEN_W 40
// #define SCREEN_H 30


void main()
{

    // fill bank 0 with character sprite
    set_sprite_data(0, viking_tileset_size, viking_tileset);

    // setup character
    setupCharacter(&player1, 0, 2, 2, 0, 1, viking_tilemap);

    // places character on map
    moveCharacter(&player1, 64, 112);
    
    // fills bank 2 with bkg tiles and sets the map
    set_bkg_data(0,7,Tiles);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,TileMap);

    uint8_t buttons;

    // printf("Hello");
    loadStart();
     // turns on bkg, sprites, and display
    SHOW_BKG;
    SHOW_SPRITES;
    DISPLAY_ON;

     while (1)
     {
        moveCharacterWithLR(&player1);
        buttons = joypad();
        
        // if (buttons & J_A) {
        //     moveCharacterWithLR(&player1);
        //     printf("A");//splashscreen();
        // }
        // if (buttons & J_B) {
        //     moveCharacterWithLR(&player1);
        //     printf("B");//testscreen();
        // }

        
        // //start screen to menu screen
        // if ((buttons & J_START) && (STARTSCREEN == 1)) {
        //     loadMenu();
        //     STARTSCREEN = 0;
        // };

        // //menu screen to trnaistion screen or back to start screen
        // if ((buttons & J_A) && (MENUSCREEN == 1)) {
        //     loadTransition();
        //     MENUSCREEN = 0;
        // } else if ((buttons & J_B) && (MENUSCREEN == 1)) {
        //     loadStart();
        //     MENUSCREEN = 0;
        // } else {
        // };

        //transition screen to stage screen
        if ((buttons & J_START) && (TRANSITIONSCREEN == 1)) {
            loadStage();
            TRANSITIONSCREEN = 0;
        };
        
        // // stage screen to win screen or lose screen
        // if ((buttons & J_UP) && (STAGE == 1)) {
        //     loadWin();
        //     STAGE = 0;
        //     GAMEPLAY = 0;
        //     hideCharacterSprites(&player1);
        // } else if ((buttons & J_DOWN) && (STAGE == 1)) {
        //     loadLoss();
        //     STAGE = 0;
        //     GAMEPLAY = 0;
        //     hideCharacterSprites(&player1);
        // } else {
        // };

        // //win screen to start screen
        // if ((buttons & J_A) && (WINSCREEN == 1)) {
        //     loadStart();
        //     WINSCREEN = 0;
        // }

        // //lose screen to start screen
        // if ((buttons & J_A) && (LOSESCREEN == 1)) {
        //     loadStart();
        //     LOSESCREEN = 0;
        // };

        playerControl();

        // Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
     }
}
