;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module loadingFunctions
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _setupCharacter
	.globl _moveCharacterWithLR
	.globl _moveCharacter
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _LOSESCREEN
	.globl _WINSCREEN
	.globl _TRANSITIONSCREEN
	.globl _MENUSCREEN
	.globl _STARTSCREEN
	.globl _STAGE
	.globl _GAMEPLAY
	.globl _loadStage
	.globl _playerControl
	.globl _loadStart
	.globl _loadMenu
	.globl _loadTransition
	.globl _loadWin
	.globl _loadLoss
	.globl _hideCharacterSprites
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_GAMEPLAY::
	.ds 2
_STAGE::
	.ds 2
_STARTSCREEN::
	.ds 2
_MENUSCREEN::
	.ds 2
_TRANSITIONSCREEN::
	.ds 2
_WINSCREEN::
	.ds 2
_LOSESCREEN::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;scenes/loadingFunctions.c:11: void loadStage(void) {
;	---------------------------------
; Function loadStage
; ---------------------------------
_loadStage::
;scenes/loadingFunctions.c:13: set_sprite_data(0, viking_tileset_size, viking_tileset);
	ld	de, #_viking_tileset
	push	de
	ld	hl, #0x500
	push	hl
	call	_set_sprite_data
	add	sp, #4
;scenes/loadingFunctions.c:16: setupCharacter(&player1, 0, 2, 2, 0, 1, viking_tilemap);
	ld	bc, #_viking_tilemap+0
	ld	de, #_player1+0
	push	de
	push	bc
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	ld	h, a
	ld	l, #0x02
	push	hl
	ld	a, #0x02
	push	af
	inc	sp
	xor	a, a
	call	_setupCharacter
	pop	de
;scenes/loadingFunctions.c:20: moveCharacter(&player1, 64, 112);
	ld	a, #0x70
	push	af
	inc	sp
	ld	a, #0x40
	call	_moveCharacter
;scenes/loadingFunctions.c:24: set_bkg_data(0,7,Tiles);
	ld	de, #_Tiles
	push	de
	ld	hl, #0x700
	push	hl
	call	_set_bkg_data
	add	sp, #4
;scenes/loadingFunctions.c:25: set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,TileMap);
	ld	de, #_TileMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;scenes/loadingFunctions.c:27: GAMEPLAY = 1;
	ld	hl, #_GAMEPLAY
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;scenes/loadingFunctions.c:28: STAGE = 1;
	ld	hl, #_STAGE
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;scenes/loadingFunctions.c:29: }
	ret
;scenes/loadingFunctions.c:31: void playerControl(void) {
;	---------------------------------
; Function playerControl
; ---------------------------------
_playerControl::
;scenes/loadingFunctions.c:32: if (GAMEPLAY == 1){
	ld	hl, #_GAMEPLAY
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	ret	NZ
;scenes/loadingFunctions.c:33: moveCharacterWithLR(&player1);
	ld	de, #_player1
;scenes/loadingFunctions.c:36: }
	jp	_moveCharacterWithLR
;scenes/loadingFunctions.c:38: void loadStart(void) {
;	---------------------------------
; Function loadStart
; ---------------------------------
_loadStart::
;scenes/loadingFunctions.c:39: STARTSCREEN = 1;
	ld	hl, #_STARTSCREEN
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;scenes/loadingFunctions.c:40: set_bkg_data(0,16,TileLabel);
	ld	de, #_TileLabel
	push	de
	ld	hl, #0x1000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;scenes/loadingFunctions.c:41: set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,startScreen);
	ld	de, #_startScreen
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;scenes/loadingFunctions.c:42: }
	ret
;scenes/loadingFunctions.c:44: void loadMenu(void) {
;	---------------------------------
; Function loadMenu
; ---------------------------------
_loadMenu::
;scenes/loadingFunctions.c:45: MENUSCREEN = 1;
	ld	hl, #_MENUSCREEN
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;scenes/loadingFunctions.c:46: set_bkg_data(0,16,TileLabel);
	ld	de, #_TileLabel
	push	de
	ld	hl, #0x1000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;scenes/loadingFunctions.c:47: set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,levelSelect);
	ld	de, #_levelSelect
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;scenes/loadingFunctions.c:48: }
	ret
;scenes/loadingFunctions.c:50: void loadTransition(void) {
;	---------------------------------
; Function loadTransition
; ---------------------------------
_loadTransition::
;scenes/loadingFunctions.c:51: TRANSITIONSCREEN = 1;
	ld	hl, #_TRANSITIONSCREEN
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;scenes/loadingFunctions.c:52: set_bkg_data(0,16,TileLabel);
	ld	de, #_TileLabel
	push	de
	ld	hl, #0x1000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;scenes/loadingFunctions.c:53: set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,stageTransition);
	ld	de, #_stageTransition
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;scenes/loadingFunctions.c:54: }
	ret
;scenes/loadingFunctions.c:56: void loadWin(void) {
;	---------------------------------
; Function loadWin
; ---------------------------------
_loadWin::
;scenes/loadingFunctions.c:57: WINSCREEN = 1;
	ld	hl, #_WINSCREEN
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;scenes/loadingFunctions.c:58: set_bkg_data(0,16,TileLabel);
	ld	de, #_TileLabel
	push	de
	ld	hl, #0x1000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;scenes/loadingFunctions.c:59: set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,youWin);
	ld	de, #_youWin
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;scenes/loadingFunctions.c:60: }
	ret
;scenes/loadingFunctions.c:62: void loadLoss(void) {
;	---------------------------------
; Function loadLoss
; ---------------------------------
_loadLoss::
;scenes/loadingFunctions.c:63: LOSESCREEN = 1;
	ld	hl, #_LOSESCREEN
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;scenes/loadingFunctions.c:64: set_bkg_data(0,16,TileLabel);
	ld	de, #_TileLabel
	push	de
	ld	hl, #0x1000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;scenes/loadingFunctions.c:65: set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,youLose);
	ld	de, #_youLose
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;scenes/loadingFunctions.c:66: }
	ret
;scenes/loadingFunctions.c:68: void hideCharacterSprites(Character *character) {
;	---------------------------------
; Function hideCharacterSprites
; ---------------------------------
_hideCharacterSprites::
	dec	sp
	ld	c, e
	ld	b, d
;scenes/loadingFunctions.c:69: uint8_t spriteCount = character->spriteTileWidth * character->spriteTileHeight;
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	e, (hl)
	push	bc
;scenes/loadingFunctions.c:70: for (uint8_t i = 0; i < spriteCount; i++) {
	call	__muluchar
	ldhl	sp,	#2
	ld	(hl), c
	pop	bc
	ld	e, #0x00
00104$:
	ld	a, e
	ldhl	sp,	#0
	sub	a, (hl)
	jr	NC, 00106$
;scenes/loadingFunctions.c:71: move_sprite(character->spriteId + i, 0, 0); // Move offscreen
	ld	a, (bc)
	add	a, e
	ld	d, a
;/home/dij/d/c/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	pop	de
;/home/dij/d/c/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;scenes/loadingFunctions.c:70: for (uint8_t i = 0; i < spriteCount; i++) {
	inc	e
	jr	00104$
00106$:
;scenes/loadingFunctions.c:73: }
	inc	sp
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__GAMEPLAY:
	.dw #0x0000
__xinit__STAGE:
	.dw #0x0000
__xinit__STARTSCREEN:
	.dw #0x0000
__xinit__MENUSCREEN:
	.dw #0x0000
__xinit__TRANSITIONSCREEN:
	.dw #0x0000
__xinit__WINSCREEN:
	.dw #0x0000
__xinit__LOSESCREEN:
	.dw #0x0000
	.area _CABS (ABS)
