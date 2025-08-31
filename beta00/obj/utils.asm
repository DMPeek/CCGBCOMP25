;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module utils
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _rand
	.globl _initrand
	.globl _fill_bkg_rect
	.globl _get_bkg_tile_xy
	.globl _set_bkg_tile_xy
	.globl _set_bkg_data
	.globl _get_bkg_xy_addr
	.globl _set_vram_byte
	.globl _vsync
	.globl _joypad
	.globl _IN_JoyOld
	.globl _IN_JoyNow
	.globl _pSrc
	.globl _LSeed
	.globl _pTile
	.globl _ErrorTrap
	.globl _BoolToString
	.globl _TickTimer_Init
	.globl _TickTimer_Update
	.globl _TickTimer_Reset
	.globl _SetTileData
	.globl _ClrScreen
	.globl _TilePut
	.globl _TilePut2
	.globl _TilePut2X2
	.globl _InitRand
	.globl _Rnd
	.globl _ClrStripX
	.globl _ClrStripY
	.globl _TileGet
	.globl _IsBitSet
	.globl _IN_Update
	.globl _IN_IsKeyDown
	.globl _IN_WasKeyPressed
	.globl _Print
	.globl _PrintCentre
	.globl _PrintNum8
	.globl _PrintNum8Hex
	.globl _PrintNum16
	.globl _InRange8
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_pTile::
	.ds 2
_LSeed::
	.ds 2
_pSrc::
	.ds 2
_IN_JoyNow::
	.ds 1
_IN_JoyOld::
	.ds 1
_PrintNum8Hex_hexL_10000_228:
	.ds 1
_PrintNum8Hex_hexR_10000_228:
	.ds 1
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
;audio/utils.c:9: void ErrorTrap(const char* errMsg)
;	---------------------------------
; Function ErrorTrap
; ---------------------------------
_ErrorTrap::
;audio/utils.c:11: ClrStripX(0,1,20);
	push	de
	ld	a, #0x14
	push	af
	inc	sp
	ld	e, #0x01
	xor	a, a
	call	_ClrStripX
;audio/utils.c:12: Print(0,1,errMsg);
	ld	e, #0x01
	xor	a, a
	call	_Print
;audio/utils.c:13: while(1)
00102$:
;audio/utils.c:15: vsync();
	call	_vsync
;audio/utils.c:17: }
	jr	00102$
;audio/utils.c:19: const char* BoolToString(bool result)
;	---------------------------------
; Function BoolToString
; ---------------------------------
_BoolToString::
;audio/utils.c:21: if(result)
	bit	0,a
	jr	Z, 00102$
;audio/utils.c:23: return "TRUE";
	ld	bc, #___str_0
	ret
00102$:
;audio/utils.c:27: return "FALSE";
	ld	bc, #___str_1
;audio/utils.c:29: }
	ret
___str_0:
	.ascii "TRUE"
	.db 0x00
___str_1:
	.ascii "FALSE"
	.db 0x00
;audio/utils.c:32: void TickTimer_Init(tTickTimer *pTT,u8 myDelay)
;	---------------------------------
; Function TickTimer_Init
; ---------------------------------
_TickTimer_Init::
;audio/utils.c:34: pTT->bHasTimeElapsed=false;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl), #0x00
;audio/utils.c:35: pTT->nCountDown=myDelay;
	ld	c, e
	ld	b, d
	inc	bc
	ld	(bc), a
;audio/utils.c:36: pTT->nTimeVal=myDelay;
	ld	(de), a
;audio/utils.c:37: }
	ret
;audio/utils.c:39: bool TickTimer_Update(tTickTimer *pTT)
;	---------------------------------
; Function TickTimer_Update
; ---------------------------------
_TickTimer_Update::
;audio/utils.c:41: if(pTT->bHasTimeElapsed==false)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	bit	0, (hl)
	jr	NZ, 00104$
;audio/utils.c:43: --pTT->nCountDown;
	inc	de
	ld	a, (de)
	dec	a
	ld	(de), a
;audio/utils.c:44: if(pTT->nCountDown==0xFF)
	inc	a
	jr	NZ, 00104$
;audio/utils.c:45: pTT->bHasTimeElapsed=true;
	ld	(hl), #0x01
00104$:
;audio/utils.c:48: return pTT->bHasTimeElapsed;
	ld	a, (hl)
;audio/utils.c:49: }
	ret
;audio/utils.c:51: void TickTimer_Reset(tTickTimer *pTT)
;	---------------------------------
; Function TickTimer_Reset
; ---------------------------------
_TickTimer_Reset::
;audio/utils.c:53: pTT->nCountDown=pTT->nTimeVal;
	ld	c, e
	ld	b, d
	inc	bc
	ld	a, (de)
	ld	(bc), a
;audio/utils.c:54: pTT->bHasTimeElapsed=false;
	inc	de
	inc	de
	xor	a, a
	ld	(de), a
;audio/utils.c:55: }
	ret
;audio/utils.c:57: void SetTileData(u8 nTileStart,u8 nTileCount,const u8 const *pTileData)
;	---------------------------------
; Function SetTileData
; ---------------------------------
_SetTileData::
	ld	b, e
;audio/utils.c:59: set_bkg_2bpp_data(nTileStart,nTileCount,pTileData);
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;audio/utils.c:60: }
	pop	hl
	pop	af
	jp	(hl)
;audio/utils.c:62: void ClrScreen(void)
;	---------------------------------
; Function ClrScreen
; ---------------------------------
_ClrScreen::
;audio/utils.c:64: fill_bkg_rect(0,0,32,32,0);
	xor	a, a
	ld	h, a
	ld	l, #0x20
	push	hl
	ld	a, #0x20
	push	af
	inc	sp
	xor	a, a
	rrca
	push	af
	call	_fill_bkg_rect
	add	sp, #5
;audio/utils.c:65: }
	ret
;audio/utils.c:67: void TilePut(u8 x,u8 y,u8 nTile)
;	---------------------------------
; Function TilePut
; ---------------------------------
_TilePut::
;audio/utils.c:69: set_tile_xy(x,y,nTile);
	ldhl	sp,	#2
	ld	h, (hl)
	push	hl
	inc	sp
	call	_set_bkg_tile_xy
;audio/utils.c:70: }
	pop	hl
	inc	sp
	jp	(hl)
;audio/utils.c:72: void TilePut2(u8 x,u8 y,u8 nTile)
;	---------------------------------
; Function TilePut2
; ---------------------------------
_TilePut2::
	ld	b, e
;audio/utils.c:74: pTile=get_bkg_xy_addr(x,y);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	pop	hl
	ld	hl, #_pTile
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;audio/utils.c:75: set_vram_byte(pTile,nTile);
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:76: ++nTile;
	ldhl	sp,	#2
	inc	(hl)
;audio/utils.c:77: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00103$
	inc	hl
	inc	(hl)
00103$:
;audio/utils.c:78: set_vram_byte(pTile,nTile);
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:79: }
	pop	hl
	inc	sp
	jp	(hl)
;audio/utils.c:81: void TilePut2X2(u8 x,u8 y,u8 nTileStart)
;	---------------------------------
; Function TilePut2X2
; ---------------------------------
_TilePut2X2::
	ld	b, e
;audio/utils.c:83: pTile=get_bkg_xy_addr(x,y);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	pop	hl
	ld	hl, #_pTile
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;audio/utils.c:84: set_vram_byte(pTile,nTileStart);
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:85: ++nTileStart;
	ldhl	sp,	#2
	inc	(hl)
;audio/utils.c:86: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00103$
	inc	hl
	inc	(hl)
00103$:
;audio/utils.c:87: set_vram_byte(pTile,nTileStart);
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:88: ++nTileStart; //skip to next line down on screen
	ldhl	sp,	#2
	inc	(hl)
;audio/utils.c:89: pTile+=31;
	ld	hl, #_pTile
	ld	a, (hl)
	add	a, #0x1f
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;audio/utils.c:90: set_vram_byte(pTile,nTileStart);
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:91: ++nTileStart;
	ldhl	sp,	#2
	inc	(hl)
;audio/utils.c:92: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00104$
	inc	hl
	inc	(hl)
00104$:
;audio/utils.c:93: set_vram_byte(pTile,nTileStart);
	ldhl	sp,	#2
	ld	a, (hl)
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:94: }
	pop	hl
	inc	sp
	jp	(hl)
;audio/utils.c:97: void InitRand(void)
;	---------------------------------
; Function InitRand
; ---------------------------------
_InitRand::
;audio/utils.c:99: LSeed|=DIV_REG;
	ldh	a, (_DIV_REG + 0)
	ld	hl, #_LSeed
	or	a, (hl)
	ld	(hl), a
;audio/utils.c:100: initrand(LSeed);
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_initrand
	pop	hl
;audio/utils.c:101: }
	ret
;audio/utils.c:103: u8 Rnd(u8 maxNum)
;	---------------------------------
; Function Rnd
; ---------------------------------
_Rnd::
	ld	c, a
;audio/utils.c:106: tv=rand();
	call	_rand
	ld	a, e
;audio/utils.c:107: tv=tv%maxNum;
	ld	e, c
;audio/utils.c:108: return tv;
	call	__moduchar
	ld	a, c
;audio/utils.c:109: }
	ret
;audio/utils.c:111: void ClrStripX(u8 x,u8 y,u8 width)
;	---------------------------------
; Function ClrStripX
; ---------------------------------
_ClrStripX::
	ld	b, e
;audio/utils.c:113: pTile=get_bkg_xy_addr(x,y);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	pop	hl
	ld	hl, #_pTile
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;audio/utils.c:114: while(width)
	ldhl	sp,	#2
	ld	c, (hl)
00101$:
	ld	a, c
	or	a, a
	jr	Z, 00104$
;audio/utils.c:116: set_vram_byte(pTile,0);
	xor	a, a
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:117: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00121$
	inc	hl
	inc	(hl)
00121$:
;audio/utils.c:118: --width;
	dec	c
	jr	00101$
00104$:
;audio/utils.c:120: }
	pop	hl
	inc	sp
	jp	(hl)
;audio/utils.c:122: void ClrStripY(u8 x,u8 y,u8 height)
;	---------------------------------
; Function ClrStripY
; ---------------------------------
_ClrStripY::
	ld	b, e
;audio/utils.c:124: pTile=get_bkg_xy_addr(x,y);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	pop	hl
	ld	hl, #_pTile
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;audio/utils.c:125: while(height)
	ldhl	sp,	#2
	ld	c, (hl)
00101$:
	ld	a, c
	or	a, a
	jr	Z, 00104$
;audio/utils.c:127: set_vram_byte(pTile,0);
	xor	a, a
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:128: pTile+=32;
	ld	hl, #_pTile
	ld	a, (hl)
	add	a, #0x20
	ld	(hl+), a
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;audio/utils.c:129: --height;
	dec	c
	jr	00101$
00104$:
;audio/utils.c:131: }
	pop	hl
	inc	sp
	jp	(hl)
;audio/utils.c:133: u8 TileGet(u8 x, u8 y)
;	---------------------------------
; Function TileGet
; ---------------------------------
_TileGet::
	ld	b, e
;audio/utils.c:135: return get_bkg_tile_xy(x,y);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_tile_xy
	pop	hl
	ld	a, e
;audio/utils.c:136: }
	ret
;audio/utils.c:138: bool IsBitSet(u8 var,u8 bit)
;	---------------------------------
; Function IsBitSet
; ---------------------------------
_IsBitSet::
;audio/utils.c:140: if((var & bit)==bit)
	and	a, e
	sub	a, e
;audio/utils.c:142: return true;
;audio/utils.c:145: return false;
	ld	a, #0x01
	ret	Z
	xor	a, a
;audio/utils.c:146: }
	ret
;audio/utils.c:148: void IN_Update()
;	---------------------------------
; Function IN_Update
; ---------------------------------
_IN_Update::
;audio/utils.c:150: IN_JoyOld=IN_JoyNow;
	ld	a, (#_IN_JoyNow)
	ld	(#_IN_JoyOld),a
;audio/utils.c:151: IN_JoyNow=joypad();
	call	_joypad
	ld	(#_IN_JoyNow),a
;audio/utils.c:152: }
	ret
;audio/utils.c:154: bool IN_IsKeyDown(u8 keyID)
;	---------------------------------
; Function IN_IsKeyDown
; ---------------------------------
_IN_IsKeyDown::
;audio/utils.c:156: if(IsBitSet(IN_JoyNow,keyID)==true)
	ld	e, a
	ld	a, (_IN_JoyNow)
	call	_IsBitSet
	bit	0,a
;audio/utils.c:158: return true;
;audio/utils.c:161: return false;
	ld	a, #0x01
	ret	NZ
	xor	a, a
;audio/utils.c:162: }
	ret
;audio/utils.c:164: bool IN_WasKeyPressed(u8 keyID)
;	---------------------------------
; Function IN_WasKeyPressed
; ---------------------------------
_IN_WasKeyPressed::
	ld	e, a
;audio/utils.c:166: if(IsBitSet(IN_JoyOld,keyID))
	push	de
	ld	a, (_IN_JoyOld)
	call	_IsBitSet
	ld	c, a
	pop	de
	bit	0, c
	jr	Z, 00104$
;audio/utils.c:168: if(!IsBitSet(IN_JoyNow,keyID))
	ld	a, (_IN_JoyNow)
	call	_IsBitSet
	bit	0,a
	jr	NZ, 00104$
;audio/utils.c:170: IN_JoyOld=0;
	xor	a, a
	ld	(#_IN_JoyOld),a
;audio/utils.c:171: return true;
	ld	a, #0x01
	ret
00104$:
;audio/utils.c:174: return false;
	xor	a, a
;audio/utils.c:175: }
	ret
;audio/utils.c:177: void Print(u8 x,u8 y,const char* msg)
;	---------------------------------
; Function Print
; ---------------------------------
_Print::
	ld	b, e
;audio/utils.c:179: pTile=get_bkg_xy_addr(x,y);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	pop	hl
	ld	hl, #_pTile
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;audio/utils.c:180: x=*msg;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
;audio/utils.c:181: ++msg;
	ld	a, (hl-)
	ld	b, a
	ld	a, (bc)
	ld	e, a
	inc	bc
	ld	a, c
	ld	(hl+), a
;audio/utils.c:182: while(x)
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
00101$:
	ld	a, e
	or	a, a
	jr	Z, 00104$
;audio/utils.c:184: set_vram_byte(pTile,x);
	ld	a, e
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:185: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00121$
	inc	hl
	inc	(hl)
00121$:
;audio/utils.c:186: x=*msg;
	ld	a, (bc)
	ld	e, a
;audio/utils.c:187: ++msg;
	inc	bc
	jr	00101$
00104$:
;audio/utils.c:189: }
	pop	hl
	pop	af
	jp	(hl)
;audio/utils.c:191: void PrintCentre(u8 y,const char* msg)
;	---------------------------------
; Function PrintCentre
; ---------------------------------
_PrintCentre::
	dec	sp
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
	ld	b, d
;audio/utils.c:195: pTile=&msg[0];
	ld	hl, #_pTile
	ld	a, c
	ld	(hl+), a
;audio/utils.c:197: x=*pTile;
	ld	a, b
	ld	(hl-), a
	ld	l, (hl)
	ld	a, (_pTile + 1)
	ld	h, a
	ld	d, (hl)
;audio/utils.c:198: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00157$
	inc	hl
	inc	(hl)
00157$:
;audio/utils.c:199: while(x)
	ld	e, #0x00
00101$:
	ld	a, d
	or	a, a
	jr	Z, 00119$
;audio/utils.c:201: ++l;
	inc	e
;audio/utils.c:202: x=*pTile;
	ld	a, (_pTile)
	ld	l, a
	ld	a, (_pTile + 1)
	ld	h, a
	ld	d, (hl)
;audio/utils.c:203: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00101$
	inc	hl
	inc	(hl)
	jr	00101$
00119$:
	ld	d, e
;audio/utils.c:206: if(l>20)
	ld	a, #0x14
	sub	a, e
	jr	NC, 00105$
;audio/utils.c:207: l=20;
	ld	d, #0x14
00105$:
;audio/utils.c:209: x=(l>>1);
	ld	a, d
	srl	a
;audio/utils.c:210: if(x>10)
	cp	a, #0x0b
	jr	C, 00107$
;audio/utils.c:211: x=10;
	ld	a, #0x0a
00107$:
;audio/utils.c:212: x=10-x;
	ld	e, a
	ld	a, #0x0a
	sub	a, e
;audio/utils.c:213: pTile=get_bkg_xy_addr(x,y);
	push	de
	ldhl	sp,	#2
	ld	h, (hl)
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	pop	hl
	ld	l, d
	pop	af
	ld	d, a
	ld	a, e
	ld	(_pTile), a
	ld	a, l
	ld	(_pTile + 1), a
;audio/utils.c:214: while(l)
00108$:
	ld	a, d
	or	a, a
	jr	Z, 00111$
;audio/utils.c:216: x=*msg;
	ld	a, (bc)
;audio/utils.c:217: ++msg;
	inc	bc
;audio/utils.c:218: set_vram_byte(pTile,x);
	push	de
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
	pop	de
;audio/utils.c:219: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00159$
	inc	hl
	inc	(hl)
00159$:
;audio/utils.c:220: --l;
	dec	d
	jr	00108$
00111$:
;audio/utils.c:222: }
	inc	sp
	ret
;audio/utils.c:224: void PrintNum8(u8 x,u8 y,u8 val8)
;	---------------------------------
; Function PrintNum8
; ---------------------------------
_PrintNum8::
	ld	b, e
;audio/utils.c:228: pTile=get_bkg_xy_addr(x,y);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	pop	hl
	ld	hl, #_pTile
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;audio/utils.c:230: while(val8>=100)
	ld	c, #0x00
00101$:
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x64
	jr	C, 00120$
;audio/utils.c:232: ++h;
	inc	c
;audio/utils.c:233: val8-=100;
	ld	a, (hl)
	add	a, #0x9c
	ld	(hl), a
	jr	00101$
;audio/utils.c:236: while(val8>=10)
00120$:
	ld	e, #0x00
00104$:
;audio/utils.c:233: val8-=100;
	ldhl	sp,	#2
;audio/utils.c:236: while(val8>=10)
	ld	a,(hl)
	ld	b,a
	sub	a, #0x0a
	jr	C, 00121$
;audio/utils.c:238: ++t;
	inc	e
;audio/utils.c:239: val8-=10;
	ld	a, b
	add	a, #0xf6
	ld	(hl), a
	jr	00104$
00121$:
;audio/utils.c:243: if(h>0)
	ld	a, c
	or	a, a
	jr	Z, 00108$
;audio/utils.c:245: c='0'+h;
	ld	a, c
	add	a, #0x30
;audio/utils.c:246: h=1;
	ld	c, #0x01
;audio/utils.c:248: set_vram_byte(pTile,c);
	push	de
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
	pop	de
;audio/utils.c:249: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00158$
	inc	hl
	inc	(hl)
00158$:
00108$:
;audio/utils.c:252: if((t>0) || (h>0))
	ld	a, e
	or	a, a
	jr	NZ, 00109$
	or	a, c
	jr	Z, 00110$
00109$:
;audio/utils.c:254: c='0'+t;
	ld	a, e
	add	a, #0x30
;audio/utils.c:255: set_vram_byte(pTile,c);
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:256: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00159$
	inc	hl
	inc	(hl)
00159$:
00110$:
;audio/utils.c:259: c='0'+val8;
	ld	a, b
	add	a, #0x30
;audio/utils.c:260: set_vram_byte(pTile,c);
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:261: }
	pop	hl
	inc	sp
	jp	(hl)
;audio/utils.c:263: void PrintNum8Hex(u8 x,u8 y,u8 var)
;	---------------------------------
; Function PrintNum8Hex
; ---------------------------------
_PrintNum8Hex::
	ld	d, a
;audio/utils.c:268: hexR=var & 15u;
	ldhl	sp,	#2
	ld	c, (hl)
	ld	a, c
	and	a, #0x0f
	ld	(#_PrintNum8Hex_hexR_10000_228),a
;audio/utils.c:269: hexL=var;
	ld	hl, #_PrintNum8Hex_hexL_10000_228
	ld	(hl), c
;audio/utils.c:270: hexL>>=4;
	ld	a, (hl)
	swap	a
	and	a, #0x0f
	ld	(hl), a
;audio/utils.c:273: hexL-=10;
	ld	c, (hl)
;audio/utils.c:271: if(hexL>9)
	ld	a, #0x09
	sub	a, (hl)
	jr	NC, 00102$
;audio/utils.c:273: hexL-=10;
	ld	a, c
	add	a, #0xf6
;audio/utils.c:274: hexL+='A';
	ld	(hl), a
	add	a, #0x41
	ld	(hl), a
	jr	00103$
00102$:
;audio/utils.c:278: hexL+='0';
	ld	a, c
	add	a, #0x30
	ld	(#_PrintNum8Hex_hexL_10000_228),a
00103$:
;audio/utils.c:283: hexR-=10;
	ld	a, (_PrintNum8Hex_hexR_10000_228)
	ld	c, a
;audio/utils.c:281: if(hexR>9)
	ld	a, #0x09
	ld	hl, #_PrintNum8Hex_hexR_10000_228
	sub	a, (hl)
	jr	NC, 00105$
;audio/utils.c:283: hexR-=10;
	ld	a, c
	add	a, #0xf6
;audio/utils.c:284: hexR+='A';
	ld	(hl), a
	add	a, #0x41
	ld	(hl), a
	jr	00106$
00105$:
;audio/utils.c:288: hexR+='0';
	ld	a, c
	add	a, #0x30
	ld	(#_PrintNum8Hex_hexR_10000_228),a
00106$:
;audio/utils.c:291: TilePut(x,y,hexL);
	push	de
	ld	a, (_PrintNum8Hex_hexL_10000_228)
	push	af
	inc	sp
	ld	a, d
	call	_TilePut
	pop	de
;audio/utils.c:292: ++x;
	inc	d
;audio/utils.c:293: TilePut(x,y,hexR);
	ld	a, (_PrintNum8Hex_hexR_10000_228)
	push	af
	inc	sp
	ld	a, d
	call	_TilePut
;audio/utils.c:294: }
	pop	hl
	inc	sp
	jp	(hl)
;audio/utils.c:296: void PrintNum16(u8 x,u8 y,u16 val16)
;	---------------------------------
; Function PrintNum16
; ---------------------------------
_PrintNum16::
	add	sp, #-3
	ld	b, e
;audio/utils.c:300: pTile=get_bkg_xy_addr(x,y);
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_get_bkg_xy_addr
	pop	hl
	ld	hl, #_pTile
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;audio/utils.c:302: while(val16>=10000)
	ld	c, #0x00
00101$:
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, #0x10
	ld	a, d
	sbc	a, #0x27
	jr	C, 00138$
;audio/utils.c:304: ++a;
;audio/utils.c:305: val16-=10000;
	dec	hl
	inc	c
	ld	a, e
	add	a, #0xf0
	ld	b, a
	ld	a, d
	adc	a, #0xd8
	ld	(hl), b
	inc	hl
	ld	(hl), a
	jr	00101$
;audio/utils.c:308: while(val16>=1000)
00138$:
	ld	b, #0x00
00104$:
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, #0xe8
	ld	a, d
	sbc	a, #0x03
	jr	C, 00139$
;audio/utils.c:310: ++b;
;audio/utils.c:311: val16-=1000;
	dec	hl
	inc	b
	ld	a, e
	add	a, #0x18
	ld	e, a
	ld	a, d
	adc	a, #0xfc
	ld	(hl), e
	inc	hl
	ld	(hl), a
	jr	00104$
;audio/utils.c:314: while(val16>=100)
00139$:
	ldhl	sp,	#0
	ld	(hl), b
	ld	b, #0x00
00107$:
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, #0x64
	ld	a, d
	sbc	a, #0x00
	jr	C, 00140$
;audio/utils.c:316: ++h;
;audio/utils.c:317: val16-=100;
	dec	hl
	inc	b
	ld	a, e
	add	a, #0x9c
	ld	e, a
	ld	a, d
	adc	a, #0xff
	ld	(hl), e
	inc	hl
	ld	(hl), a
	jr	00107$
00140$:
	ldhl	sp,	#1
	ld	(hl), b
;audio/utils.c:319: u=(u8)val16;
	ldhl	sp,	#5
	ld	a, (hl)
;audio/utils.c:321: while(u>=10)
	ld	e, #0x00
00110$:
;audio/utils.c:324: u-=10;
	ldhl	sp,	#2
	ld	(hl), a
;audio/utils.c:321: while(u>=10)
	sub	a, #0x0a
	jr	C, 00141$
;audio/utils.c:323: ++t;
	inc	e
;audio/utils.c:324: u-=10;
	ld	a, (hl)
	add	a, #0xf6
	jr	00110$
00141$:
	ld	b, e
;audio/utils.c:327: if(a>0)
	ld	a, c
	or	a, a
	jr	Z, 00114$
;audio/utils.c:329: c='0'+a;
	ld	a, c
	add	a, #0x30
;audio/utils.c:330: a=1;
	ld	c, #0x01
;audio/utils.c:332: set_vram_byte(pTile,c);
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:333: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00214$
	inc	hl
	inc	(hl)
00214$:
00114$:
;audio/utils.c:336: if((a>0) || (b>0))
	ld	a, c
	or	a, a
	jr	NZ, 00115$
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	Z, 00116$
00115$:
;audio/utils.c:338: c='0'+b;
	ldhl	sp,	#0
	ld	a, (hl)
	add	a, #0x30
;audio/utils.c:339: a=1;
	ld	c, #0x01
;audio/utils.c:341: set_vram_byte(pTile,c);
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:342: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00215$
	inc	hl
	inc	(hl)
00215$:
00116$:
;audio/utils.c:345: if((h>0) || (a>0))
	ldhl	sp,	#1
	ld	a, (hl)
	or	a, a
	jr	NZ, 00118$
	or	a, c
	jr	Z, 00119$
00118$:
;audio/utils.c:347: c='0'+h;
	ldhl	sp,	#1
	ld	a, (hl)
	add	a, #0x30
;audio/utils.c:348: a=1;
	ld	c, #0x01
;audio/utils.c:350: set_vram_byte(pTile,c);
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:351: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00216$
	inc	hl
	inc	(hl)
00216$:
00119$:
;audio/utils.c:354: if((t>0) || (a>0))
	ld	a, b
	or	a, a
	jr	NZ, 00121$
	or	a, c
	jr	Z, 00122$
00121$:
;audio/utils.c:356: c='0'+t;
	ld	a, b
	add	a, #0x30
;audio/utils.c:357: set_vram_byte(pTile,c);
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:358: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00217$
	inc	hl
	inc	(hl)
00217$:
00122$:
;audio/utils.c:361: c='0'+u;
	ldhl	sp,	#2
	ld	a, (hl)
	add	a, #0x30
;audio/utils.c:362: set_vram_byte(pTile,c);
	ld	hl, #_pTile
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	call	_set_vram_byte
;audio/utils.c:363: }
	add	sp, #3
	pop	hl
	pop	af
	jp	(hl)
;audio/utils.c:365: bool InRange8(u8 varIn,u8 rangeMin,u8 rangeMax)
;	---------------------------------
; Function InRange8
; ---------------------------------
_InRange8::
	ld	c, a
;audio/utils.c:368: return ((varIn<=rangeMax) && (rangeMin<=varIn));
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, c
	jr	C, 00103$
	ld	a, c
	sub	a, e
	jr	NC, 00104$
00103$:
	xor	a, a
	jr	00105$
00104$:
	ld	a, #0x01
00105$:
;audio/utils.c:369: }
	pop	hl
	inc	sp
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
