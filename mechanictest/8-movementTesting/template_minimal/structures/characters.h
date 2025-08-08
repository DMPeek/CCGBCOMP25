#include <gb/gb.h>
#include <stdint.h>

typedef struct Character
{
    uint8_t spriteId;

    uint8_t spriteTileWidth;
    
    uint8_t spriteTileHeight;

    uint8_t spriteFrames; // for animation

    uint8_t spriteCurrentFrame; // used for animation as well

    uint8_t tileSetStart;

    uint8_t x_pos;

    uint8_t y_pos;

    uint8_t x_vel;
    
    uint8_t y_vel;

    const unsigned char *tilemap;


} Character;

void loadSpriteFrame(Character *character,uint8_t frame) 
{
    character->spriteCurrentFrame = frame;

    uint8_t spriteCount = character->spriteTileWidth * character->spriteTileHeight;

    for (uint8_t i=0; i != spriteCount; i++) 
    {
        // sets sprites for character. called a metasprite since it is made up of multiple sprites.
        // that starts at sprite start to make sure it hits all sprites for char
        set_sprite_tile(character->spriteId + i, character->tilemap[character->tileSetStart + i + (frame * spriteCount)]);
    }

}

void moveCharacter(Character *character, uint8_t x, uint8_t y)
{
    character->x_pos = x;
    character->y_pos = y;

    for(uint8_t iy = 0; iy != character->spriteTileHeight; iy++){
        for(uint8_t ix = 0; ix != character->spriteTileWidth; ix++){

            uint8_t index = character->spriteId + ix + (iy * character->spriteTileWidth);

            move_sprite(index, x + (ix * 8), y + (iy * 8));
        }
    }
}

// technically a velocity function
void scrollCharacter(Character *character, uint8_t x, uint8_t y) 
{
    character->x_pos += x;
    character->y_pos += y;

    moveCharacter(character, character->x_pos, character->y_pos);
}

void moveCharacterWithLR(Character *character) 
{
    uint8_t buttons = joypad();  

    uint8_t moveX = 0;
    uint8_t moveY = 0;

    if (buttons & J_LEFT){
        moveX = -1;
    }
    else if (buttons & J_RIGHT){
        moveX = 1;
    }
      scrollCharacter(character, moveX, moveY);
}

void moveCharacterWithAB(Character *character) 
{
    uint8_t buttons = joypad();  

    uint8_t moveX = 0;
    uint8_t moveY = 0;

    if (buttons & J_A){
        moveX = -1;
    }
    else if (buttons & J_B){
        moveX = 1;
    }
      scrollCharacter(character, moveX, moveY);
}

void setupCharacter (Character *character, uint8_t spriteId, uint8_t tileWidth, uint8_t tileHeight, uint8_t tileSetStart, uint8_t totalFrames, const unsigned char *tilemap) 
{
    character->tilemap = tilemap;

    character->tileSetStart = tileSetStart;

    character->spriteId = spriteId;

    character->spriteTileWidth = tileWidth;
    character->spriteTileHeight = tileHeight;

    character->spriteFrames = totalFrames;

    loadSpriteFrame(character, 0);
}