;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _PrintSoundChannel3
	.globl _Snd_PlayDrums
	.globl _Snd_PlayMusic_V3
	.globl _Snd_PlayMusic_V2
	.globl _Snd_Update
	.globl _Snd_Drum
	.globl _Snd_Init
	.globl _IN_WasKeyPressed
	.globl _IN_Update
	.globl _PrintNum8Hex
	.globl _PrintNum8
	.globl _PrintCentre
	.globl _Print
	.globl _ClrStripX
	.globl _ClrScreen
	.globl _SetTileData
	.globl _wait_vbl_done
	.globl _drumID
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
_drumID::
	.ds 1
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
;src/main.c:7: void PrintSoundChannel3()
;	---------------------------------
; Function PrintSoundChannel3
; ---------------------------------
_PrintSoundChannel3::
;src/main.c:10: ClrStripX(0,0,20);
	ld	a, #0x14
	push	af
	inc	sp
	xor	a, a
	ld	e, a
	call	_ClrStripX
;src/main.c:11: ClrStripX(0,1,20);
	ld	a, #0x14
	push	af
	inc	sp
	ld	e, #0x01
	xor	a, a
	call	_ClrStripX
;src/main.c:12: PrintNum8Hex(pos,0,SndInBVar0);
	ld	a, (_SndInBVar0)
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x01
	call	_PrintNum8Hex
;src/main.c:14: PrintNum8Hex(pos,0,SndInBVar1);
	ld	a, (_SndInBVar1)
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x04
	call	_PrintNum8Hex
;src/main.c:16: PrintNum8Hex(pos,0,SndInBVar2);
	ld	a, (_SndInBVar2)
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x07
	call	_PrintNum8Hex
;src/main.c:18: PrintNum8Hex(pos,0,SndInBVar3);
	ld	a, (_SndInBVar3)
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x0a
	call	_PrintNum8Hex
;src/main.c:20: PrintNum8Hex(pos,0,SndInBVar4);
	ld	a, (_SndInBVar4)
	push	af
	inc	sp
	ld	e, #0x00
	ld	a, #0x0d
	call	_PrintNum8Hex
;src/main.c:21: }
	ret
;src/main.c:23: void main(void)
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:26: SetTileData(GFX_TS_FONT,GFX_TC_FONT,gfxFont);
	ld	de, #_gfxFont
	push	de
	ld	e, #0x80
	xor	a, a
	call	_SetTileData
;src/main.c:27: Snd_Init();
	call	_Snd_Init
;src/main.c:28: ClrScreen();
	call	_ClrScreen
;src/main.c:29: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:30: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:31: Print(0,4,"Drum ID=");
	ld	de, #___str_0
	push	de
	ld	e, #0x04
	xor	a, a
	call	_Print
;src/main.c:32: PrintNum8(9,4,drumID);
	ld	a, (_drumID)
	push	af
	inc	sp
	ld	e, #0x04
	ld	a, #0x09
	call	_PrintNum8
;src/main.c:33: Print(0,5,"Press START for Drums");
	ld	de, #___str_1
	push	de
	ld	e, #0x05
	xor	a, a
	call	_Print
;src/main.c:34: Print(0,6,"Press A for tune 1");
	ld	de, #___str_2
	push	de
	ld	e, #0x06
	xor	a, a
	call	_Print
;src/main.c:35: Print(0,7,"Press B for tune 2");
	ld	de, #___str_3
	push	de
	ld	e, #0x07
	xor	a, a
	call	_Print
;src/main.c:36: Print(0,8,"Press SELECT for the");
	ld	de, #___str_4
	push	de
	ld	e, #0x08
	xor	a, a
	call	_Print
;src/main.c:37: Print(0,9,"Drum Track");
	ld	de, #___str_5
	push	de
	ld	e, #0x09
	xor	a, a
	call	_Print
;src/main.c:38: Print(0,10,"Press Up for tune 3");
	ld	de, #___str_6
	push	de
	ld	e, #0x0a
	xor	a, a
	call	_Print
;src/main.c:40: while(1)
00123$:
;src/main.c:42: IN_Update();
	call	_IN_Update
;src/main.c:43: if(IN_WasKeyPressed(J_LEFT))
	ld	a, #0x02
	call	_IN_WasKeyPressed
	bit	0,a
	jr	Z, 00108$
;src/main.c:45: if(drumID>0)
	ld	hl, #_drumID
	ld	a, (hl)
	or	a, a
	jr	Z, 00102$
;src/main.c:46: --drumID;
	dec	(hl)
00102$:
;src/main.c:47: ClrStripX(9,4,4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #0x04
	ld	a, #0x09
	call	_ClrStripX
;src/main.c:48: PrintNum8(9,4,drumID);
	ld	a, (_drumID)
	push	af
	inc	sp
	ld	e, #0x04
	ld	a, #0x09
	call	_PrintNum8
	jr	00109$
00108$:
;src/main.c:50: else if(IN_WasKeyPressed(J_RIGHT))
	ld	a, #0x01
	call	_IN_WasKeyPressed
	bit	0,a
	jr	Z, 00109$
;src/main.c:52: if(drumID<eSD_MAX_DRUMSOUND-1)
	ld	hl, #_drumID
	ld	a, (hl)
	sub	a, #0x0a
	jr	NC, 00104$
;src/main.c:53: ++drumID;
	inc	(hl)
00104$:
;src/main.c:54: ClrStripX(9,4,4);
	ld	a, #0x04
	push	af
	inc	sp
	ld	e, #0x04
	ld	a, #0x09
	call	_ClrStripX
;src/main.c:55: PrintNum8(9,4,drumID);
	ld	a, (_drumID)
	push	af
	inc	sp
	ld	e, #0x04
	ld	a, #0x09
	call	_PrintNum8
00109$:
;src/main.c:58: if(IN_WasKeyPressed(J_UP))
	ld	a, #0x04
	call	_IN_WasKeyPressed
	bit	0,a
	jr	Z, 00111$
;src/main.c:60: Snd_PlayMusic_V3(musStarWars);
	ld	de, #_musStarWars
	call	_Snd_PlayMusic_V3
00111$:
;src/main.c:63: if(IN_WasKeyPressed(J_START))
	ld	a, #0x80
	call	_IN_WasKeyPressed
	bit	0,a
	jr	Z, 00113$
;src/main.c:65: Snd_Drum(drumID);
	ld	a, (_drumID)
	call	_Snd_Drum
00113$:
;src/main.c:68: if(IN_WasKeyPressed(J_SELECT))
	ld	a, #0x40
	call	_IN_WasKeyPressed
	bit	0,a
	jr	Z, 00115$
;src/main.c:70: ClrStripX(0,2,20);
	ld	a, #0x14
	push	af
	inc	sp
	ld	e, #0x02
	xor	a, a
	call	_ClrStripX
;src/main.c:71: PrintCentre(2,"The Drums");
	ld	de, #___str_7
	ld	a, #0x02
	call	_PrintCentre
;src/main.c:72: Snd_PlayDrums(drmTwinkle2);
	ld	de, #_drmTwinkle2
	call	_Snd_PlayDrums
00115$:
;src/main.c:75: if(IN_WasKeyPressed(J_A))
	ld	a, #0x10
	call	_IN_WasKeyPressed
	bit	0,a
	jr	Z, 00117$
;src/main.c:77: ClrStripX(0,2,20);
	ld	a, #0x14
	push	af
	inc	sp
	ld	e, #0x02
	xor	a, a
	call	_ClrStripX
;src/main.c:78: Print(0,2,"Play Twinkle");
	ld	de, #___str_8
	push	de
	ld	e, #0x02
	xor	a, a
	call	_Print
;src/main.c:79: Snd_PlayMusic_V2(musTwinkle);
	ld	de, #_musTwinkle
	call	_Snd_PlayMusic_V2
00117$:
;src/main.c:82: if(IN_WasKeyPressed(J_B))
	ld	a, #0x20
	call	_IN_WasKeyPressed
	bit	0,a
	jr	Z, 00121$
;src/main.c:84: if(SndChan.bIsActive==false)
	ld	hl, #(_SndChan + 7)
	bit	0, (hl)
	jr	NZ, 00121$
;src/main.c:86: ClrStripX(0,2,20);
	ld	a, #0x14
	push	af
	inc	sp
	ld	e, #0x02
	xor	a, a
	call	_ClrStripX
;src/main.c:87: PrintCentre(2,"Track 2");
	ld	de, #___str_9
	ld	a, #0x02
	call	_PrintCentre
;src/main.c:88: Snd_PlayMusic_V3(musTrack2);
	ld	de, #_musTrack2
	call	_Snd_PlayMusic_V3
00121$:
;src/main.c:91: wait_vbl_done();
	call	_wait_vbl_done
;src/main.c:92: Snd_Update();
	call	_Snd_Update
;src/main.c:94: }
	jp	00123$
___str_0:
	.ascii "Drum ID="
	.db 0x00
___str_1:
	.ascii "Press START for Drums"
	.db 0x00
___str_2:
	.ascii "Press A for tune 1"
	.db 0x00
___str_3:
	.ascii "Press B for tune 2"
	.db 0x00
___str_4:
	.ascii "Press SELECT for the"
	.db 0x00
___str_5:
	.ascii "Drum Track"
	.db 0x00
___str_6:
	.ascii "Press Up for tune 3"
	.db 0x00
___str_7:
	.ascii "The Drums"
	.db 0x00
___str_8:
	.ascii "Play Twinkle"
	.db 0x00
___str_9:
	.ascii "Track 2"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__drumID:
	.db #0x00	; 0
	.area _CABS (ABS)
