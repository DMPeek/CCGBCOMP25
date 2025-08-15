#include <gb/gb.h>
#include <stdint.h>

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