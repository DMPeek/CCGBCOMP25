;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _loadStart
	.globl _playerControl
	.globl _loadStage
	.globl _setupCharacter
	.globl _moveCharacterWithLR
	.globl _moveCharacter
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _vsync
	.globl _joypad
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
;src/main.c:8: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:12: set_sprite_data(0, viking_tileset_size, viking_tileset);
	ld	de, #_viking_tileset
	push	de
	ld	hl, #0x500
	push	hl
	call	_set_sprite_data
	add	sp, #4
;src/main.c:15: setupCharacter(&player1, 0, 2, 2, 0, 1, viking_tilemap);
	ld	bc, #_viking_tilemap+0
	ld	de, #_player1
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
;src/main.c:18: moveCharacter(&player1, 64, 112);
	ld	a, #0x70
	push	af
	inc	sp
	ld	a, #0x40
	call	_moveCharacter
;src/main.c:21: set_bkg_data(0,7,Tiles);
	ld	de, #_Tiles
	push	de
	ld	hl, #0x700
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:22: set_bkg_tiles(0,0,SCREEN_W,SCREEN_H,TileMap);
	ld	de, #_TileMap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:27: loadStart();
	call	_loadStart
;src/main.c:29: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:30: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;src/main.c:31: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:33: while (1)
00105$:
;src/main.c:35: moveCharacterWithLR(&player1);
	ld	de, #_player1
	call	_moveCharacterWithLR
;src/main.c:36: buttons = joypad();
	call	_joypad
;src/main.c:65: if ((buttons & J_START) && (TRANSITIONSCREEN == 1)) {
	rlca
	jr	NC, 00102$
	ld	hl, #_TRANSITIONSCREEN
	ld	a, (hl+)
	dec	a
	or	a, (hl)
	jr	NZ, 00102$
;src/main.c:66: loadStage();
	call	_loadStage
;src/main.c:67: TRANSITIONSCREEN = 0;
	xor	a, a
	ld	hl, #_TRANSITIONSCREEN
	ld	(hl+), a
	ld	(hl), a
00102$:
;src/main.c:96: playerControl();
	call	_playerControl
;src/main.c:99: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:102: vsync();
	call	_vsync
;src/main.c:104: }
	jr	00105$
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
