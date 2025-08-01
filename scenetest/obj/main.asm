;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _testscreen
	.globl _splashscreen
	.globl _main
	.globl _init_bkg
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _joypad
	.globl _delay
	.globl _test
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_test::
	.ds 2
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
;src/main.c:12: splashscreen();
	call	_splashscreen
;src/main.c:15: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:16: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:18: while (1)
00108$:
;src/main.c:21: mButtons = joypad();
	call	_joypad
	ld	c, a
;src/main.c:23: if (mButtons & J_A)
	bit	4, c
	jr	Z, 00102$
;src/main.c:24: splashscreen();
	push	bc
	call	_splashscreen
	pop	bc
00102$:
;src/main.c:25: if (mButtons & J_B)
	bit	5, c
	jr	Z, 00104$
;src/main.c:26: testscreen();
	call	_testscreen
00104$:
;src/main.c:28: if (test)
	ld	hl, #_test + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00106$
;/home/dij/d/c/gbdk/include/gb/gb.h:1475: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	inc	a
	ldh	(_SCX_REG + 0), a
;src/main.c:29: scroll_bkg(1, 0);
00106$:
;src/main.c:30: delay(200);
	ld	de, #0x00c8
	call	_delay
;src/main.c:32: }
	jr	00108$
;src/main.c:34: void splashscreen() {
;	---------------------------------
; Function splashscreen
; ---------------------------------
_splashscreen::
;src/main.c:35: test = 0;
	xor	a, a
	ld	hl, #_test
	ld	(hl+), a
	ld	(hl), a
;/home/dij/d/c/gbdk/include/gb/gb.h:1461: SCX_REG=x, SCY_REG=y;
	xor	a, a
	ldh	(_SCX_REG + 0), a
	xor	a, a
	ldh	(_SCY_REG + 0), a
;src/main.c:38: set_bkg_data(0, splashscreen_tileset_size, splashscreen_tileset);
	ld	de, #_splashscreen_tileset
	push	de
	ld	hl, #0xe000
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:41: set_bkg_tiles(0, 0, 20, 18, splashscreen_tilemap);
	ld	de, #_splashscreen_tilemap
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;src/main.c:42: }
	ret
;src/main.c:44: void testscreen() {
;	---------------------------------
; Function testscreen
; ---------------------------------
_testscreen::
;src/main.c:45: test = 1;
	ld	hl, #_test
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;src/main.c:47: set_bkg_data(0, 11, NumberTiles);
	ld	de, #_NumberTiles
	push	de
	ld	hl, #0xb00
	push	hl
	call	_set_bkg_data
	add	sp, #4
;src/main.c:50: init_bkg(4);
	ld	a, #0x04
	push	af
	inc	sp
	call	_init_bkg
	inc	sp
;src/main.c:52: }
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
