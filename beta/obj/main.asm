;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module main
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _printf
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
;src/main.c:5: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
;src/main.c:9: printf("Hello");
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
;src/main.c:12: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;src/main.c:13: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;src/main.c:15: while (1)
00106$:
;src/main.c:18: mButtons = joypad();
	call	_joypad
	ld	c, a
;src/main.c:20: if (mButtons & J_A)
	bit	4, c
	jr	Z, 00102$
;src/main.c:21: printf("A");//splashscreen();
	push	bc
	ld	de, #___str_1
	push	de
	call	_printf
	pop	hl
	pop	bc
00102$:
;src/main.c:22: if (mButtons & J_B)
	bit	5, c
	jr	Z, 00106$
;src/main.c:23: printf("B");//testscreen();
	ld	de, #___str_2
	push	de
	call	_printf
	pop	hl
;src/main.c:27: }
	jr	00106$
___str_0:
	.ascii "Hello"
	.db 0x00
___str_1:
	.ascii "A"
	.db 0x00
___str_2:
	.ascii "B"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
