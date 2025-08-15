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

extern Character player1;
extern Character player2;

void loadSpriteFrame(Character *character,uint8_t frame);
void moveCharacter(Character *character, uint8_t x, uint8_t y);
void scrollCharacter(Character *character, uint8_t x, uint8_t y);
void moveCharacterWithLR(Character *character);
void moveCharacterWithAB(Character *character);
void setupCharacter (Character *character, uint8_t spriteId, uint8_t tileWidth, uint8_t tileHeight, uint8_t tileSetStart, uint8_t totalFrames, const unsigned char *tilemap);



