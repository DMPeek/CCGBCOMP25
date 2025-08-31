#include <gb/gb.h>
#include <stdint.h>

extern int GAMEPLAY;
extern int STAGE;
extern int STARTSCREEN;
extern int MENUSCREEN;
extern int STAGEPICK;
extern int TRANSITIONSCREEN;
extern int WINSCREEN;
extern int LOSESCREEN;
extern int TRANSITIONCOUNTER;

void loadStage(void);
void playerControl(void);
void pointerControl(void);
void loadStart(void);
void loadMenu(void);
void loadTransition(void);
void loadWin(void);
void loadLoss(void);