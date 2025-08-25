#include "loadingFunctions.h"
#include "sprite.h"
#include "structures/characters.h"
#include "testmap.h"
#include "tiletest.h"
#include "maps/letters.h"
#include "maps/screens.h"

int GAMEPLAY = 0;
int STAGE = 0;
int STARTSCREEN = 0;
int MENUSCREEN = 0;
int TRANSITIONSCREEN = 0;
int WINSCREEN = 0;
int LOSESCREEN = 0;
int TRANSITIONCOUNTER = 0;

void loadStage(void) {
    // fill bank 0 with character sprite
    set_sprite_data(0, viking_tileset_size, viking_tileset);
    set_sprite_data(viking_tileset_size, star_tileset_size, star_tileset);

    // setup character
    setupCharacter(&player1, 0, 2, 2, 0, 1, viking_tilemap);
    setupCharacter(&player2, 4, 2, 2, 0, 1, viking_tilemap);
    setupCharacter(&star, 8, 2, 2, 6, 1, star_tilemap);

    // places character on map
    moveCharacter(&player1, 64, 112);
    moveCharacter(&player2, 88, 112);
    moveCharacter(&star, 80, 40);


    

    // fills bank 2 with bkg tiles and sets the map
    set_bkg_data(0,7,TileTest);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,TestTileMap);

    GAMEPLAY = 1;
    STAGE = 1;
}

void playerControl(void) {
    if (GAMEPLAY == 1){
        moveCharacterWithLR(&player1);
        moveCharacterWithAB(&player2);
    };
}

void loadStart(void) {
    STARTSCREEN = 1;
    set_bkg_data(0,16,TileLabel);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,startScreen);
}

void loadMenu(void) {
    MENUSCREEN = 1;
    set_bkg_data(0,16,TileLabel);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,levelSelect);
}

void loadTransition(void) {
    TRANSITIONSCREEN = 1;
    TRANSITIONCOUNTER = 0;
    set_bkg_data(0,16,TileLabel);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,stageTransition);
}

void loadWin(void) {
    WINSCREEN = 1;
    set_bkg_data(0,16,TileLabel);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,youWin);
}

void loadLoss(void) {
    LOSESCREEN = 1;
    set_bkg_data(0,16,TileLabel);
    set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,youLose);
}

