;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module sprite
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _star_tilemap
	.globl _star_tileset
	.globl _viking_tilemap
	.globl _viking_tileset
	.globl _sprite_tilemap
	.globl _sprite_tileset
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
_sprite_tileset:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x47	; 71	'G'
	.db #0x68	; 104	'h'
	.db #0x6f	; 111	'o'
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0xe2	; 226
	.db #0xe2	; 226
	.db #0x16	; 22
	.db #0xf6	; 246
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x48	; 72	'H'
	.db #0x4f	; 79	'O'
	.db #0x48	; 72	'H'
	.db #0x4f	; 79	'O'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x13	; 19
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0x12	; 18
	.db #0xf2	; 242
	.db #0x12	; 18
	.db #0xf2	; 242
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0xf8	; 248
	.db #0x7a	; 122	'z'
	.db #0x82	; 130
	.db #0x3a	; 58
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0x1f	; 31
	.db #0x5e	; 94
	.db #0x41	; 65	'A'
	.db #0x5c	; 92
	.db #0x42	; 66	'B'
	.db #0x1a	; 26
	.db #0x22	; 34
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x21	; 33
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x58	; 88	'X'
	.db #0x44	; 68	'D'
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x48	; 72	'H'
	.db #0xf8	; 248
	.db #0x84	; 132
	.db #0x78	; 120	'x'
	.db #0x84	; 132
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x0c	; 12
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x0e	; 14
_sprite_tilemap:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
_viking_tileset:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x47	; 71	'G'
	.db #0x47	; 71	'G'
	.db #0x68	; 104	'h'
	.db #0x6f	; 111	'o'
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x30	; 48	'0'
	.db #0x3f	; 63
	.db #0x60	; 96
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x7f	; 127
	.db #0x52	; 82	'R'
	.db #0x52	; 82	'R'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0xe2	; 226
	.db #0xe2	; 226
	.db #0x16	; 22
	.db #0xf6	; 246
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0xfe	; 254
	.db #0x4a	; 74	'J'
	.db #0x4a	; 74	'J'
	.db #0x42	; 66	'B'
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x30	; 48	'0'
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0x33	; 51	'3'
	.db #0x3f	; 63
	.db #0x48	; 72	'H'
	.db #0x4f	; 79	'O'
	.db #0x48	; 72	'H'
	.db #0x4f	; 79	'O'
	.db #0x3f	; 63
	.db #0x3f	; 63
	.db #0x13	; 19
	.db #0x1f	; 31
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x0c	; 12
	.db #0x0c	; 12
	.db #0x18	; 24
	.db #0x18	; 24
	.db #0xcc	; 204
	.db #0xfc	; 252
	.db #0x12	; 18
	.db #0xf2	; 242
	.db #0x12	; 18
	.db #0xf2	; 242
	.db #0xfc	; 252
	.db #0xfc	; 252
	.db #0xc8	; 200
	.db #0xf8	; 248
	.db #0x78	; 120	'x'
	.db #0x78	; 120	'x'
_viking_tilemap:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
_star_tileset:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0xf8	; 248
	.db #0x7a	; 122	'z'
	.db #0x82	; 130
	.db #0x3a	; 58
	.db #0x42	; 66	'B'
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0x1f	; 31
	.db #0x5e	; 94
	.db #0x41	; 65	'A'
	.db #0x5c	; 92
	.db #0x42	; 66	'B'
	.db #0x1a	; 26
	.db #0x22	; 34
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x12	; 18
	.db #0x1f	; 31
	.db #0x21	; 33
	.db #0x1e	; 30
	.db #0x21	; 33
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x30	; 48	'0'
	.db #0x4c	; 76	'L'
	.db #0x00	; 0
	.db #0x70	; 112	'p'
	.db #0x58	; 88	'X'
	.db #0x44	; 68	'D'
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf0	; 240
	.db #0x48	; 72	'H'
	.db #0xf8	; 248
	.db #0x84	; 132
	.db #0x78	; 120	'x'
	.db #0x84	; 132
	.db #0x3c	; 60
	.db #0x42	; 66	'B'
	.db #0x0c	; 12
	.db #0x32	; 50	'2'
	.db #0x00	; 0
	.db #0x0e	; 14
_star_tilemap:
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x04	; 4
	.area _INITIALIZER
	.area _CABS (ABS)
