;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module SndGBNotes
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _zSndV4_Drums
	.globl _zSndDelays
	.globl _zSndNotes
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
	.area _CODE
_zSndNotes:
	.dw #0x002c
	.dw #0x009c
	.dw #0x0106
	.dw #0x016b
	.dw #0x01c9
	.dw #0x0223
	.dw #0x0277
	.dw #0x02c6
	.dw #0x0312
	.dw #0x0356
	.dw #0x039b
	.dw #0x03da
	.dw #0x0416
	.dw #0x044e
	.dw #0x0483
	.dw #0x04b5
	.dw #0x04e5
	.dw #0x0511
	.dw #0x053b
	.dw #0x0563
	.dw #0x0589
	.dw #0x05ac
	.dw #0x05ce
	.dw #0x05ed
	.dw #0x060a
	.dw #0x0627
	.dw #0x0642
	.dw #0x065b
	.dw #0x0672
	.dw #0x0689
	.dw #0x069e
	.dw #0x06b2
	.dw #0x06c4
	.dw #0x06d6
	.dw #0x06e7
	.dw #0x06f7
	.dw #0x0706
	.dw #0x0714
	.dw #0x0721
	.dw #0x072d
	.dw #0x0739
	.dw #0x0744
	.dw #0x074f
	.dw #0x0759
	.dw #0x0762
	.dw #0x076b
	.dw #0x0773
	.dw #0x077b
	.dw #0x0783
	.dw #0x078a
	.dw #0x0790
	.dw #0x0797
	.dw #0x079d
	.dw #0x07a2
	.dw #0x07a7
	.dw #0x07ac
	.dw #0x07b1
	.dw #0x07b6
	.dw #0x07ba
	.dw #0x07be
	.dw #0x07c1
	.dw #0x07c4
	.dw #0x07c8
	.dw #0x07cb
	.dw #0x07ce
	.dw #0x07d1
	.dw #0x07d4
	.dw #0x07d6
	.dw #0x07d9
	.dw #0x07db
	.dw #0x07dd
	.dw #0x07df
_zSndDelays:
	.db #0x02	; 2
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0x10	; 16
	.db #0x20	; 32
	.db #0x40	; 64
_zSndV4_Drums:
	.db #0x3a	; 58
	.db #0xf2	; 242
	.db #0x60	; 96
	.db #0x80	; 128
	.db #0x3a	; 58
	.db #0xf2	; 242
	.db #0x62	; 98	'b'
	.db #0x80	; 128
	.db #0x16	; 22
	.db #0xac	; 172
	.db #0x52	; 82	'R'
	.db #0xc0	; 192
	.db #0x3a	; 58
	.db #0xf1	; 241
	.db #0x6b	; 107	'k'
	.db #0x80	; 128
	.db #0x3a	; 58
	.db #0xf7	; 247
	.db #0x6a	; 106	'j'
	.db #0x80	; 128
	.db #0x16	; 22
	.db #0xfa	; 250
	.db #0x3f	; 63
	.db #0xc0	; 192
	.db #0x16	; 22
	.db #0xfa	; 250
	.db #0x3e	; 62
	.db #0xc0	; 192
	.db #0x16	; 22
	.db #0xfa	; 250
	.db #0x3d	; 61
	.db #0xc0	; 192
	.db #0x16	; 22
	.db #0xfa	; 250
	.db #0x3c	; 60
	.db #0xc0	; 192
	.db #0x16	; 22
	.db #0xfa	; 250
	.db #0x3b	; 59
	.db #0xc0	; 192
	.db #0x16	; 22
	.db #0xfa	; 250
	.db #0x3a	; 58
	.db #0xc0	; 192
	.area _INITIALIZER
	.area _CABS (ABS)
