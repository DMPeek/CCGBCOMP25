#include <gb/gb.h>
#include <stdint.h>
#include "tilemap.h"
#include "tiles.h"
#include "../sprites/characters.h"
#include "../scenes/letters.h"
#include "../scenes/screens.h"
#include "../sprites/sprite.h"


extern int GAMEPLAY;
extern int STAGE;
extern int STARTSCREEN;
extern int MENUSCREEN;
extern int TRANSITIONSCREEN;
extern int WINSCREEN;
extern int LOSESCREEN;

void loadStage(void);
void playerControl(void);
void loadStart(void);
void loadMenu(void);
void loadTransition(void);
void loadWin(void);
void loadLoss(void);
void hideCharacterSprites(Character *character);
