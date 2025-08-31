;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module characters
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _joypad
	.globl _player1
	.globl _loadSpriteFrame
	.globl _moveCharacter
	.globl _scrollCharacter
	.globl _moveCharacterWithLR
	.globl _moveCharacterWithAB
	.globl _setupCharacter
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_player1::
	.ds 12
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
;sprites/characters.c:5: void loadSpriteFrame(Character *character,uint8_t frame) 
;	---------------------------------
; Function loadSpriteFrame
; ---------------------------------
_loadSpriteFrame::
	add	sp, #-12
	ld	c, e
	ld	b, d
	ld	d, a
;sprites/characters.c:7: character->spriteCurrentFrame = frame;
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), d
;sprites/characters.c:9: uint8_t spriteCount = character->spriteTileWidth * character->spriteTileHeight;
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
	push	de
;sprites/characters.c:11: for (uint8_t i=0; i != spriteCount; i++) 
	call	__muluchar
	ldhl	sp,	#4
	ld	(hl), c
	pop	de
	pop	bc
	ld	hl, #0x000a
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl), a
	ld	hl, #0x0005
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	push	bc
	ldhl	sp,	#2
	ld	e, (hl)
	ld	a, d
	call	__muluchar
	ldhl	sp,	#7
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	bc
	ldhl	sp,	#11
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#11
	sub	a, (hl)
	jr	Z, 00106$
;sprites/characters.c:15: set_sprite_tile(character->spriteId + i, character->tilemap[character->tileSetStart + i + (frame * spriteCount)]);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	a, (hl-)
	ld	e, a
	ld	d, #0x00
	ld	a, (hl-)
	ld	l, (hl)
	ld	h, a
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	e, a
	ld	a, (bc)
	ldhl	sp,	#11
	add	a, (hl)
	ld	d, a
;/home/dij/d/c/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	xor	a, a
	ld	l, d
	ld	h, a
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;sprites/characters.c:11: for (uint8_t i=0; i != spriteCount; i++) 
	ldhl	sp,	#11
	inc	(hl)
	jr	00104$
00106$:
;sprites/characters.c:18: }
	add	sp, #12
	ret
;sprites/characters.c:20: void moveCharacter(Character *character, uint8_t x, uint8_t y)
;	---------------------------------
; Function moveCharacter
; ---------------------------------
_moveCharacter::
	add	sp, #-9
	ld	c, e
	ld	b, d
	ldhl	sp,	#6
	ld	(hl), a
;sprites/characters.c:22: character->x_pos = x;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (hl)
	ld	(de), a
;sprites/characters.c:23: character->y_pos = y;
	ld	hl, #0x0007
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(de), a
;sprites/characters.c:25: for(uint8_t iy = 0; iy != character->spriteTileHeight; iy++){
	ld	l, c
	ld	h, b
	inc	hl
	inc	sp
	inc	sp
	push	hl
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#7
	ld	(hl), #0x00
00108$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	sub	a, (hl)
	jr	Z, 00110$
;sprites/characters.c:26: for(uint8_t ix = 0; ix != character->spriteTileWidth; ix++){
	ldhl	sp,	#8
	ld	(hl), #0x00
00105$:
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl)
	ldhl	sp,	#5
	sub	a, (hl)
	jr	Z, 00109$
;sprites/characters.c:28: uint8_t index = character->spriteId + ix + (iy * character->spriteTileWidth);
	ld	a, (bc)
	ldhl	sp,	#8
	add	a, (hl)
	ld	d, a
	push	bc
	push	de
	ldhl	sp,	#9
	ld	a, (hl+)
	inc	hl
	ld	e, a
	ld	a, (hl)
	call	__muluchar
	ld	a, c
	pop	de
	pop	bc
	add	a, d
	ld	e, a
;sprites/characters.c:30: move_sprite(index, x + (ix * 8), y + (iy * 8));
	ldhl	sp,	#7
	ld	a, (hl)
	add	a, a
	add	a, a
	add	a, a
	ldhl	sp,	#11
	ld	d, (hl)
	add	a, d
	ldhl	sp,	#4
	ld	(hl), a
	ldhl	sp,	#8
	ld	a, (hl-)
	dec	hl
	add	a, a
	add	a, a
	add	a, a
	ld	d, (hl)
	dec	hl
	add	a, d
	ld	(hl), a
;/home/dij/d/c/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	xor	a, a
	ld	l, e
	ld	h, a
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	e, l
	ld	d, h
;/home/dij/d/c/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites/characters.c:26: for(uint8_t ix = 0; ix != character->spriteTileWidth; ix++){
	ldhl	sp,	#8
	inc	(hl)
	jr	00105$
00109$:
;sprites/characters.c:25: for(uint8_t iy = 0; iy != character->spriteTileHeight; iy++){
	ldhl	sp,	#7
	inc	(hl)
	jr	00108$
00110$:
;sprites/characters.c:33: }
	add	sp, #9
	pop	hl
	inc	sp
	jp	(hl)
;sprites/characters.c:36: void scrollCharacter(Character *character, uint8_t x, uint8_t y) 
;	---------------------------------
; Function scrollCharacter
; ---------------------------------
_scrollCharacter::
	push	de
	ld	e, a
;sprites/characters.c:38: character->x_pos += x;
	push	de
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0006
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	add	a, e
	ld	(bc), a
;sprites/characters.c:39: character->y_pos += y;
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#4
	add	a, (hl)
	ld	(de), a
;sprites/characters.c:41: moveCharacter(character, character->x_pos, character->y_pos);
	push	af
	ld	a, (bc)
	ld	c, a
	inc	sp
	ld	a, c
	ldhl	sp,	#1
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;sprites/characters.c:42: }
	call	_moveCharacter
	pop	hl
	pop	hl
	inc	sp
	jp	(hl)
;sprites/characters.c:44: void moveCharacterWithLR(Character *character) 
;	---------------------------------
; Function moveCharacterWithLR
; ---------------------------------
_moveCharacterWithLR::
;sprites/characters.c:46: uint8_t buttons = joypad();
	push	de
	call	_joypad
	pop	de
;sprites/characters.c:48: uint8_t moveX = 0;
	ld	c, #0x00
;sprites/characters.c:51: if (buttons & J_LEFT){
	bit	1, a
	jr	Z, 00104$
;sprites/characters.c:52: moveX = -1;
	ld	c, #0xff
	jr	00105$
00104$:
;sprites/characters.c:54: else if (buttons & J_RIGHT){
	rrca
	jr	NC, 00105$
;sprites/characters.c:55: moveX = 1;
	ld	c, #0x01
00105$:
;sprites/characters.c:57: scrollCharacter(character, moveX, moveY);
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	call	_scrollCharacter
;sprites/characters.c:58: }
	ret
;sprites/characters.c:60: void moveCharacterWithAB(Character *character) 
;	---------------------------------
; Function moveCharacterWithAB
; ---------------------------------
_moveCharacterWithAB::
;sprites/characters.c:62: uint8_t buttons = joypad();  
	push	de
	call	_joypad
	pop	de
;sprites/characters.c:64: uint8_t moveX = 0;
	ld	c, #0x00
;sprites/characters.c:67: if (buttons & J_A){
	bit	4, a
	jr	Z, 00104$
;sprites/characters.c:68: moveX = -1;
	ld	c, #0xff
	jr	00105$
00104$:
;sprites/characters.c:70: else if (buttons & J_B){
	bit	5, a
	jr	Z, 00105$
;sprites/characters.c:71: moveX = 1;
	ld	c, #0x01
00105$:
;sprites/characters.c:73: scrollCharacter(character, moveX, moveY);
	xor	a, a
	push	af
	inc	sp
	ld	a, c
	call	_scrollCharacter
;sprites/characters.c:74: }
	ret
;sprites/characters.c:76: void setupCharacter (Character *character, uint8_t spriteId, uint8_t tileWidth, uint8_t tileHeight, uint8_t tileSetStart, uint8_t totalFrames, const unsigned char *tilemap) 
;	---------------------------------
; Function setupCharacter
; ---------------------------------
_setupCharacter::
	ld	c, a
;sprites/characters.c:78: character->tilemap = tilemap;
	ld	hl, #0x000a
	add	hl, de
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	pop	hl
	ld	(hl+), a
	push	hl
	ldhl	sp,	#9
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;sprites/characters.c:80: character->tileSetStart = tileSetStart;
	ld	hl, #0x0005
	add	hl, de
	push	hl
	ldhl	sp,	#6
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;sprites/characters.c:82: character->spriteId = spriteId;
	ld	a, c
	ld	(de), a
;sprites/characters.c:84: character->spriteTileWidth = tileWidth;
	ld	c, e
	ld	b, d
	inc	bc
	ldhl	sp,	#2
;sprites/characters.c:85: character->spriteTileHeight = tileHeight;
	ld	a, (hl+)
	ld	(bc), a
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
;sprites/characters.c:87: character->spriteFrames = totalFrames;
	ld	a, (hl+)
	inc	hl
	ld	(bc), a
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sprites/characters.c:89: loadSpriteFrame(character, 0);
	xor	a, a
	call	_loadSpriteFrame
;sprites/characters.c:90: }
	pop	hl
	add	sp, #6
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
