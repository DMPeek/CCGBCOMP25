;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module SoundManager
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _zSnd_Music_Play
	.globl _zSnd_C4_Play
	.globl _zSnd_MusicAdvance
	.globl _Snd_Voice3
	.globl _Snd_Voice2
	.globl _Snd_Voice4
	.globl _zSnd_SetVolume
	.globl _SndDrums
	.globl _SndChan
	.globl _SndVoiceOnRight
	.globl _SndVoiceOnLeft
	.globl _SndInBVar4
	.globl _SndInBVar3
	.globl _SndInBVar2
	.globl _SndInBVar1
	.globl _SndInBVar0
	.globl _SndInWFrequency
	.globl _Snd_Init
	.globl _Snd_Sound_V1
	.globl _Snd_Sound_V2
	.globl _Snd_Sound_V3
	.globl _Snd_Sound_V4
	.globl _Snd_Play2
	.globl _Snd_Beep
	.globl _Snd_Update
	.globl _Snd_PlayMusic_V2
	.globl _Snd_PlayMusic_V3
	.globl _Snd_PlayDrums
	.globl _Snd_Drum
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_SndInWFrequency::
	.ds 2
_SndInBVar0::
	.ds 1
_SndInBVar1::
	.ds 1
_SndInBVar2::
	.ds 1
_SndInBVar3::
	.ds 1
_SndInBVar4::
	.ds 1
_SndVoiceOnLeft::
	.ds 1
_SndVoiceOnRight::
	.ds 1
_SndChan::
	.ds 8
_SndDrums::
	.ds 8
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
;src/SoundManager.c:20: void zSnd_SetVolume(void)
;	---------------------------------
; Function zSnd_SetVolume
; ---------------------------------
_zSnd_SetVolume::
;src/SoundManager.c:22: SndInBVar0=SndVoiceOnRight<<4;
	ld	a, (#_SndVoiceOnRight)
	swap	a
	and	a, #0xf0
	ld	hl, #_SndInBVar0
	ld	(hl), a
;src/SoundManager.c:23: SndInBVar0|=SndVoiceOnLeft;
	ld	a, (hl)
	ld	hl, #_SndVoiceOnLeft
	or	a, (hl)
	ld	hl, #_SndInBVar0
	ld	(hl), a
;src/SoundManager.c:24: NR51_REG=SndInBVar0;
	ld	a, (hl)
	ldh	(_NR51_REG + 0), a
;src/SoundManager.c:25: }
	ret
;src/SoundManager.c:27: void Snd_Init(void)
;	---------------------------------
; Function Snd_Init
; ---------------------------------
_Snd_Init::
;src/SoundManager.c:29: NR52_REG=0x80; //Turn On Sound
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
;src/SoundManager.c:30: NR50_REG=0x77; //Sets Volume for Left and Right Speakers
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
;src/SoundManager.c:32: SndVoiceOnLeft=0x0F;
	ld	hl, #_SndVoiceOnLeft
	ld	(hl), #0x0f
;src/SoundManager.c:33: SndVoiceOnRight=0x0f;
	ld	hl, #_SndVoiceOnRight
	ld	(hl), #0x0f
;src/SoundManager.c:34: zSnd_SetVolume();
	call	_zSnd_SetVolume
;src/SoundManager.c:35: SndChan.bIsActive=false;
	ld	hl, #_SndChan + 7
	ld	(hl), #0x00
;src/SoundManager.c:36: SndChan.pMusicData=NULL;
	ld	hl, #(_SndChan + 5)
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;src/SoundManager.c:37: SndDrums.bIsActive=false;
	ld	hl, #(_SndDrums + 7)
	ld	(hl), #0x00
;src/SoundManager.c:38: }
	ret
;src/SoundManager.c:40: void Snd_Sound_V1(u8 b0,u8 b1,u8 b2,u8 b3,u8 b4)
;	---------------------------------
; Function Snd_Sound_V1
; ---------------------------------
_Snd_Sound_V1::
	ldh	(_NR10_REG + 0), a
	ld	a, e
	ldh	(_NR11_REG + 0), a
;src/SoundManager.c:44: NR12_REG=b2;
	ldhl	sp,	#2
;src/SoundManager.c:45: NR13_REG=b3;
	ld	a, (hl+)
	ldh	(_NR12_REG + 0), a
;src/SoundManager.c:46: NR14_REG=b4;
	ld	a, (hl+)
	ldh	(_NR13_REG + 0), a
	ld	a, (hl)
	ldh	(_NR14_REG + 0), a
;src/SoundManager.c:47: }
	pop	hl
	add	sp, #3
	jp	(hl)
;src/SoundManager.c:49: void Snd_Sound_V2(u8 b1,u8 b2,u8 b3,u8 b4)
;	---------------------------------
; Function Snd_Sound_V2
; ---------------------------------
_Snd_Sound_V2::
	ldh	(_NR21_REG + 0), a
	ld	a, e
	ldh	(_NR22_REG + 0), a
;src/SoundManager.c:53: NR23_REG=b3;
	ldhl	sp,	#2
;src/SoundManager.c:54: NR24_REG=b4;
	ld	a, (hl+)
	ldh	(_NR23_REG + 0), a
	ld	a, (hl)
	ldh	(_NR24_REG + 0), a
;src/SoundManager.c:55: }
	pop	hl
	pop	af
	jp	(hl)
;src/SoundManager.c:57: void Snd_Sound_V3(u8 b0,u8 b1,u8 b2,u8 b3,u8 b4)
;	---------------------------------
; Function Snd_Sound_V3
; ---------------------------------
_Snd_Sound_V3::
	ldh	(_NR30_REG + 0), a
	ld	a, e
	ldh	(_NR31_REG + 0), a
;src/SoundManager.c:61: NR32_REG=b2;
	ldhl	sp,	#2
;src/SoundManager.c:62: NR33_REG=b3;
	ld	a, (hl+)
	ldh	(_NR32_REG + 0), a
;src/SoundManager.c:63: NR34_REG=b4;
	ld	a, (hl+)
	ldh	(_NR33_REG + 0), a
	ld	a, (hl)
	ldh	(_NR34_REG + 0), a
;src/SoundManager.c:64: }
	pop	hl
	add	sp, #3
	jp	(hl)
;src/SoundManager.c:66: void Snd_Sound_V4(u8 b1,u8 b2,u8 b3,u8 b4)
;	---------------------------------
; Function Snd_Sound_V4
; ---------------------------------
_Snd_Sound_V4::
	ldh	(_NR41_REG + 0), a
	ld	a, e
	ldh	(_NR42_REG + 0), a
;src/SoundManager.c:70: NR43_REG=b3;
	ldhl	sp,	#2
;src/SoundManager.c:71: NR44_REG=b4;
	ld	a, (hl+)
	ldh	(_NR43_REG + 0), a
	ld	a, (hl)
	ldh	(_NR44_REG + 0), a
;src/SoundManager.c:72: }
	pop	hl
	pop	af
	jp	(hl)
;src/SoundManager.c:74: void Snd_Voice4()
;	---------------------------------
; Function Snd_Voice4
; ---------------------------------
_Snd_Voice4::
;src/SoundManager.c:76: NR41_REG=SndInBVar0;
	ld	a, (#_SndInBVar0)
	ldh	(_NR41_REG + 0), a
;src/SoundManager.c:77: NR42_REG=SndInBVar1;
	ld	a, (#_SndInBVar1)
	ldh	(_NR42_REG + 0), a
;src/SoundManager.c:78: NR43_REG=SndInBVar2;
	ld	a, (#_SndInBVar2)
	ldh	(_NR43_REG + 0), a
;src/SoundManager.c:79: NR44_REG=SndInBVar3;
	ld	a, (#_SndInBVar3)
	ldh	(_NR44_REG + 0), a
;src/SoundManager.c:80: SndVoiceOnLeft|=SND_VOL_ON_4;
	ld	hl, #_SndVoiceOnLeft
	ld	a, (hl)
	or	a, #0x08
	ld	(hl), a
;src/SoundManager.c:81: SndVoiceOnRight|=SND_VOL_ON_4;
	ld	hl, #_SndVoiceOnRight
	ld	a, (hl)
	or	a, #0x08
	ld	(hl), a
;src/SoundManager.c:82: zSnd_SetVolume();
;src/SoundManager.c:83: }
	jp	_zSnd_SetVolume
;src/SoundManager.c:85: void Snd_Voice2()
;	---------------------------------
; Function Snd_Voice2
; ---------------------------------
_Snd_Voice2::
;src/SoundManager.c:87: NR21_REG=SndInBVar0;
	ld	a, (#_SndInBVar0)
	ldh	(_NR21_REG + 0), a
;src/SoundManager.c:88: NR22_REG=SndInBVar1;
	ld	a, (#_SndInBVar1)
	ldh	(_NR22_REG + 0), a
;src/SoundManager.c:89: NR23_REG=SndInBVar2;
	ld	a, (#_SndInBVar2)
	ldh	(_NR23_REG + 0), a
;src/SoundManager.c:90: NR24_REG=SndInBVar3;
	ld	a, (#_SndInBVar3)
	ldh	(_NR24_REG + 0), a
;src/SoundManager.c:91: SndVoiceOnLeft|=SND_VOL_ON_2;
	ld	hl, #_SndVoiceOnLeft
	ld	a, (hl)
	or	a, #0x02
	ld	(hl), a
;src/SoundManager.c:92: SndVoiceOnRight|=SND_VOL_ON_2;
	ld	hl, #_SndVoiceOnRight
	ld	a, (hl)
	or	a, #0x02
	ld	(hl), a
;src/SoundManager.c:93: zSnd_SetVolume();
;src/SoundManager.c:94: }
	jp	_zSnd_SetVolume
;src/SoundManager.c:96: void Snd_Voice3()
;	---------------------------------
; Function Snd_Voice3
; ---------------------------------
_Snd_Voice3::
;src/SoundManager.c:98: NR30_REG=SndInBVar0;
	ld	a, (#_SndInBVar0)
	ldh	(_NR30_REG + 0), a
;src/SoundManager.c:99: NR31_REG=SndInBVar1;
	ld	a, (#_SndInBVar1)
	ldh	(_NR31_REG + 0), a
;src/SoundManager.c:100: NR32_REG=SndInBVar2;
	ld	a, (#_SndInBVar2)
	ldh	(_NR32_REG + 0), a
;src/SoundManager.c:101: NR33_REG=SndInBVar3;
	ld	a, (#_SndInBVar3)
	ldh	(_NR33_REG + 0), a
;src/SoundManager.c:102: NR34_REG=SndInBVar4;
	ld	a, (#_SndInBVar4)
	ldh	(_NR34_REG + 0), a
;src/SoundManager.c:105: SndVoiceOnLeft|=SND_VOL_ON_3;
	ld	hl, #_SndVoiceOnLeft
	ld	a, (hl)
	or	a, #0x04
	ld	(hl), a
;src/SoundManager.c:106: SndVoiceOnRight|=SND_VOL_ON_3;
	ld	hl, #_SndVoiceOnRight
	ld	a, (hl)
	or	a, #0x04
	ld	(hl), a
;src/SoundManager.c:107: zSnd_SetVolume();
;src/SoundManager.c:108: }
	jp	_zSnd_SetVolume
;src/SoundManager.c:110: void zSnd_MusicAdvance(tSndChannel* pSnd)
;	---------------------------------
; Function zSnd_MusicAdvance
; ---------------------------------
_zSnd_MusicAdvance::
	add	sp, #-4
	ld	c, e
	ld	b, d
;src/SoundManager.c:112: SndInBVar4=pSnd->musicOffset;
	ld	hl, #0x0003
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	(#_SndInBVar4),a
;src/SoundManager.c:113: SndInBVar0=pSnd->pMusicData[SndInBVar4];
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_SndInBVar4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_SndInBVar0),a
;src/SoundManager.c:114: ++SndInBVar4;
	ld	hl, #_SndInBVar4
	inc	(hl)
;src/SoundManager.c:115: SndInBVar1=pSnd->pMusicData[SndInBVar4];
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #_SndInBVar4
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(#_SndInBVar1),a
;src/SoundManager.c:116: ++SndInBVar4;
	ld	hl, #_SndInBVar4
	inc	(hl)
;src/SoundManager.c:117: SndInBVar2=pSnd->pMusicData[SndInBVar4];
	ld	l, c
	ld	h, b
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	ld	hl, #_SndInBVar4
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	a, (bc)
	ld	(#_SndInBVar2),a
;src/SoundManager.c:118: ++SndInBVar4;
	ld	hl, #_SndInBVar4
	inc	(hl)
;src/SoundManager.c:119: pSnd->musicOffset=SndInBVar4;
	pop	de
	push	de
	ld	a, (hl)
	ld	(de), a
;src/SoundManager.c:120: }
	add	sp, #4
	ret
;src/SoundManager.c:122: void Snd_Play2()
;	---------------------------------
; Function Snd_Play2
; ---------------------------------
_Snd_Play2::
;src/SoundManager.c:124: SndInBVar0=ZSND_V2_DEF_V1;
	ld	hl, #_SndInBVar0
	ld	(hl), #0x88
;src/SoundManager.c:125: SndInBVar1=ZSND_V2_DEF_V2;
	ld	hl, #_SndInBVar1
	ld	(hl), #0xfc
;src/SoundManager.c:128: SndInBVar2=SndInWFrequency.hiByte;
	ld	bc, #_SndInWFrequency+0
	ld	a, (bc)
	ld	(#_SndInBVar2),a
;src/SoundManager.c:129: SndInBVar3|=SndInWFrequency.loByte;
	inc	bc
	ld	a, (bc)
	or	a, #0xc0
	ld	(#_SndInBVar3),a
;src/SoundManager.c:130: NR21_REG=SndInBVar0;
	ld	a, #0x88
	ldh	(_NR21_REG + 0), a
;src/SoundManager.c:131: NR22_REG=SndInBVar1;
	ld	a, #0xfc
	ldh	(_NR22_REG + 0), a
;src/SoundManager.c:132: NR23_REG=SndInBVar2;
	ld	a, (#_SndInBVar2)
	ldh	(_NR23_REG + 0), a
;src/SoundManager.c:133: NR24_REG=SndInBVar3;
	ld	a, (#_SndInBVar3)
	ldh	(_NR24_REG + 0), a
;src/SoundManager.c:134: }
	ret
;src/SoundManager.c:136: void Snd_Beep()
;	---------------------------------
; Function Snd_Beep
; ---------------------------------
_Snd_Beep::
;src/SoundManager.c:138: SndInBVar0=ZSND_V3_DEF_V1;
	ld	hl, #_SndInBVar0
	ld	(hl), #0x80
;src/SoundManager.c:139: SndInBVar1=ZSND_V3_DEF_V2;
	xor	a, a
	ld	(#_SndInBVar1),a
;src/SoundManager.c:140: SndInBVar2=ZSND_V3_DEF_V3;
	ld	hl, #_SndInBVar2
	ld	(hl), #0x20
;src/SoundManager.c:141: SndInBVar3=SndInWFrequency.hiByte;
	ld	bc, #_SndInWFrequency+0
	ld	a, (bc)
	ld	(#_SndInBVar3),a
;src/SoundManager.c:142: SndInBVar4=(SndInWFrequency.loByte|ZSND_CHAN3_FREQ_ON_VAL);
	inc	bc
	ld	a, (bc)
	or	a, #0x80
	ld	(#_SndInBVar4),a
;src/SoundManager.c:143: NR31_REG=SndInBVar1;
	xor	a, a
	ldh	(_NR31_REG + 0), a
;src/SoundManager.c:144: NR32_REG=SndInBVar2;
	ld	a, #0x20
	ldh	(_NR32_REG + 0), a
;src/SoundManager.c:145: NR33_REG=SndInBVar3;
	ld	a, (#_SndInBVar3)
	ldh	(_NR33_REG + 0), a
;src/SoundManager.c:146: NR34_REG=SndInBVar4;
	ld	a, (#_SndInBVar4)
	ldh	(_NR34_REG + 0), a
;src/SoundManager.c:147: NR30_REG=SndInBVar0;
	ld	a, #0x80
	ldh	(_NR30_REG + 0), a
;src/SoundManager.c:148: }
	ret
;src/SoundManager.c:150: void zSnd_C4_Play()
;	---------------------------------
; Function zSnd_C4_Play
; ---------------------------------
_zSnd_C4_Play::
;src/SoundManager.c:152: SndInBVar0=SndDrums.playState;
	ld	a, (#(_SndDrums + 4) + 0)
	ld	(#_SndInBVar0),a
;src/SoundManager.c:155: --SndDrums.PlayTimer;
	ld	de, #_SndDrums + 1
;src/SoundManager.c:153: if(SndInBVar0==SND_PLAY_DELAY_ON)
	ld	a, (#_SndInBVar0)
	or	a, a
	jr	NZ, 00104$
;src/SoundManager.c:155: --SndDrums.PlayTimer;
	ld	a, (de)
	dec	a
	ld	(de), a
;src/SoundManager.c:156: if(SndDrums.PlayTimer==0)
	or	a, a
	ret	NZ
;src/SoundManager.c:158: SndDrums.playState=SND_REST_DELAY_ON;
	ld	hl, #(_SndDrums + 4)
	ld	(hl), #0x01
;src/SoundManager.c:159: SndVoiceOnLeft-=SND_VOL_ON_4;
	ld	a, (_SndVoiceOnLeft)
	add	a, #0xf8
	ld	(#_SndVoiceOnLeft),a
;src/SoundManager.c:160: SndVoiceOnRight-=SND_VOL_ON_4;
	ld	a, (_SndVoiceOnRight)
	add	a, #0xf8
	ld	(#_SndVoiceOnRight),a
;src/SoundManager.c:161: zSnd_SetVolume();
;src/SoundManager.c:163: return;
	jp	_zSnd_SetVolume
00104$:
;src/SoundManager.c:168: --SndDrums.RestTimer;
;src/SoundManager.c:166: if(SndInBVar0==SND_REST_DELAY_ON)
	ld	a, (#_SndInBVar0)
	dec	a
	jr	NZ, 00108$
;src/SoundManager.c:168: --SndDrums.RestTimer;
	ld	a, (#(_SndDrums + 2) + 0)
	dec	a
	ld	hl, #(_SndDrums + 2)
	ld	(hl), a
;src/SoundManager.c:169: if(SndDrums.RestTimer==0)
	or	a, a
	ret	NZ
;src/SoundManager.c:171: SndDrums.playState=SND_NEXT_NOTE;
	inc	hl
	inc	hl
	ld	(hl), #0x02
;src/SoundManager.c:173: return;
	ret
00108$:
;src/SoundManager.c:176: zSnd_MusicAdvance(&SndDrums);
	push	de
	ld	de, #_SndDrums
	call	_zSnd_MusicAdvance
	pop	de
;src/SoundManager.c:178: if(SndInBVar0==END)
	ld	a, (#_SndInBVar0)
	sub	a, #0x48
	jr	NZ, 00110$
;src/SoundManager.c:180: SndDrums.bIsActive=false;
	ld	hl, #_SndDrums + 7
	ld	(hl), #0x00
;src/SoundManager.c:181: return;
	ret
00110$:
;src/SoundManager.c:184: SndDrums.PlayTimer=zSndDelays[SndInBVar0];
	ld	a, #<(_zSndDelays)
	ld	hl, #_SndInBVar0
	add	a, (hl)
	ld	c, a
	ld	a, #>(_zSndDelays)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(de), a
;src/SoundManager.c:185: SndDrums.RestTimer=zSndDelays[SndInBVar1];
	ld	a, #<(_zSndDelays)
	ld	hl, #_SndInBVar1
	add	a, (hl)
	ld	c, a
	ld	a, #>(_zSndDelays)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(#(_SndDrums + 2)),a
;src/SoundManager.c:187: SndInBVar4=SndInBVar2*4;
	ld	a, (_SndInBVar2)
	add	a, a
	add	a, a
;src/SoundManager.c:188: pTile=&zSndV4_Drums[SndInBVar4];
	ld	(#_SndInBVar4),a
	add	a,#<(_zSndV4_Drums)
	ld	c, a
	ld	a, #>(_zSndV4_Drums)
	adc	a, #0x00
	ld	b, a
	ld	hl, #_pTile
	ld	a, c
	ld	(hl+), a
;src/SoundManager.c:189: SndInBVar0=*pTile;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar0),a
;src/SoundManager.c:190: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00152$
	inc	hl
	inc	(hl)
00152$:
;src/SoundManager.c:191: SndInBVar1=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar1),a
;src/SoundManager.c:192: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00153$
	inc	hl
	inc	(hl)
00153$:
;src/SoundManager.c:193: SndInBVar2=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar2),a
;src/SoundManager.c:194: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00154$
	inc	hl
	inc	(hl)
00154$:
;src/SoundManager.c:195: SndInBVar3=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar3),a
;src/SoundManager.c:196: Snd_Voice4();
	call	_Snd_Voice4
;src/SoundManager.c:198: SndDrums.playState=SND_PLAY_DELAY_ON;
	ld	hl, #(_SndDrums + 4)
	ld	(hl), #0x00
;src/SoundManager.c:199: }
	ret
;src/SoundManager.c:201: void zSnd_Music_Play()
;	---------------------------------
; Function zSnd_Music_Play
; ---------------------------------
_zSnd_Music_Play::
;src/SoundManager.c:203: SndInBVar0=SndChan.playState;
	ld	a, (#(_SndChan + 4) + 0)
	ld	(#_SndInBVar0),a
;src/SoundManager.c:206: --SndChan.PlayTimer;
	ld	bc, #_SndChan + 1
;src/SoundManager.c:210: if(SndChan.voiceID==2)
;src/SoundManager.c:204: if(SndInBVar0==SND_PLAY_DELAY_ON)
	ld	a, (#_SndInBVar0)
	or	a, a
	jr	NZ, 00109$
;src/SoundManager.c:206: --SndChan.PlayTimer;
	ld	a, (bc)
	dec	a
	ld	(bc), a
;src/SoundManager.c:207: if(SndChan.PlayTimer==0)
	or	a, a
	ret	NZ
;src/SoundManager.c:209: SndChan.playState=SND_REST_DELAY_ON;
	ld	hl, #(_SndChan + 4)
	ld	(hl), #0x01
;src/SoundManager.c:210: if(SndChan.voiceID==2)
	ld	a, (#_SndChan + 0)
;src/SoundManager.c:212: SndVoiceOnLeft-=SND_VOL_ON_2;
	ld	hl, #_SndVoiceOnLeft
	ld	c, (hl)
;src/SoundManager.c:213: SndVoiceOnRight-=SND_VOL_ON_2;
	ld	hl, #_SndVoiceOnRight
	ld	e, (hl)
;src/SoundManager.c:210: if(SndChan.voiceID==2)
	cp	a, #0x02
	jr	NZ, 00104$
;src/SoundManager.c:212: SndVoiceOnLeft-=SND_VOL_ON_2;
	ld	a, c
	add	a, #0xfe
	ld	(#_SndVoiceOnLeft),a
;src/SoundManager.c:213: SndVoiceOnRight-=SND_VOL_ON_2;
	ld	a, e
	add	a, #0xfe
	ld	(#_SndVoiceOnRight),a
	jp	_zSnd_SetVolume
00104$:
;src/SoundManager.c:215: else if(SndChan.voiceID==3)
	sub	a, #0x03
	jp	NZ, _zSnd_SetVolume
;src/SoundManager.c:217: SndVoiceOnLeft-=SND_VOL_ON_3;
	ld	a, c
	add	a, #0xfc
	ld	(#_SndVoiceOnLeft),a
;src/SoundManager.c:218: SndVoiceOnRight-=SND_VOL_ON_3;
	ld	a, e
	add	a, #0xfc
	ld	(#_SndVoiceOnRight),a
;src/SoundManager.c:220: zSnd_SetVolume();
;src/SoundManager.c:222: return;
	jp	_zSnd_SetVolume
00109$:
;src/SoundManager.c:227: --SndChan.RestTimer;
;src/SoundManager.c:225: if(SndInBVar0==SND_REST_DELAY_ON)
	ld	a, (#_SndInBVar0)
	dec	a
	jr	NZ, 00113$
;src/SoundManager.c:227: --SndChan.RestTimer;
	ld	a, (#(_SndChan + 2) + 0)
	dec	a
	ld	hl, #(_SndChan + 2)
	ld	(hl), a
;src/SoundManager.c:228: if(SndChan.RestTimer==0)
	or	a, a
	ret	NZ
;src/SoundManager.c:230: SndChan.playState=SND_NEXT_NOTE;
	inc	hl
	inc	hl
	ld	(hl), #0x02
;src/SoundManager.c:232: return;
	ret
00113$:
;src/SoundManager.c:235: zSnd_MusicAdvance(&SndChan);
	push	bc
	ld	de, #_SndChan
	call	_zSnd_MusicAdvance
	pop	bc
;src/SoundManager.c:237: if(SndInBVar0==END)
	ld	a, (#_SndInBVar0)
	sub	a, #0x48
	jr	NZ, 00115$
;src/SoundManager.c:239: SndChan.bIsActive=false;
	ld	hl, #_SndChan + 7
	ld	(hl), #0x00
;src/SoundManager.c:240: return;
	ret
00115$:
;src/SoundManager.c:243: SndChan.PlayTimer=zSndDelays[SndInBVar0];
	ld	a, #<(_zSndDelays)
	ld	hl, #_SndInBVar0
	add	a, (hl)
	ld	e, a
	ld	a, #>(_zSndDelays)
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(bc), a
;src/SoundManager.c:244: SndChan.RestTimer=zSndDelays[SndInBVar1];
	ld	a, #<(_zSndDelays)
	ld	hl, #_SndInBVar1
	add	a, (hl)
	ld	c, a
	ld	a, #>(_zSndDelays)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	ld	(#(_SndChan + 2)),a
;src/SoundManager.c:245: SndInWFrequency.var16=zSndNotes[SndInBVar2];
	ld	a, (_SndInBVar2)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_zSndNotes
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_SndInWFrequency
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/SoundManager.c:247: SndChan.playState=SND_PLAY_DELAY_ON;
	ld	hl, #(_SndChan + 4)
	ld	(hl), #0x00
;src/SoundManager.c:248: if(SndChan.voiceID==2)
	ld	a, (#_SndChan + 0)
;src/SoundManager.c:252: SndInBVar2=SndInWFrequency.hiByte;
	ld	hl, #_SndInWFrequency
;src/SoundManager.c:253: SndInBVar3=SndInWFrequency.loByte|ZSND_CHAN2_ALWAYS_ON;
	ld	bc, #_SndInWFrequency + 1
;src/SoundManager.c:248: if(SndChan.voiceID==2)
	sub	a, #0x02
	jr	NZ, 00117$
;src/SoundManager.c:250: SndInBVar0=ZSND_V2_DEF_V1;
	ld	a, #0x88
	ld	(_SndInBVar0), a
;src/SoundManager.c:251: SndInBVar1=ZSND_V2_DEF_V2;
	ld	a, #0xfc
	ld	(_SndInBVar1), a
;src/SoundManager.c:252: SndInBVar2=SndInWFrequency.hiByte;
	ld	a, (hl)
	ld	(#_SndInBVar2),a
;src/SoundManager.c:253: SndInBVar3=SndInWFrequency.loByte|ZSND_CHAN2_ALWAYS_ON;
	ld	a, (bc)
	or	a, #0x80
;src/SoundManager.c:255: Snd_Voice2();
;src/SoundManager.c:256: return;
	ld	(#_SndInBVar3), a
	jp	_Snd_Voice2
00117$:
;src/SoundManager.c:259: SndInBVar0=ZSND_V3_DEF_V1;
	ld	a, #0x80
	ld	(_SndInBVar0), a
;src/SoundManager.c:260: SndInBVar1=ZSND_V3_DEF_V2;
	xor	a, a
	ld	(_SndInBVar1), a
;src/SoundManager.c:261: SndInBVar2=ZSND_V3_DEF_V3;
	ld	a, #0x20
	ld	(_SndInBVar2), a
;src/SoundManager.c:262: SndInBVar3=SndInWFrequency.hiByte;
	ld	a, (hl)
	ld	(#_SndInBVar3),a
;src/SoundManager.c:263: SndInBVar4=(SndInWFrequency.loByte|ZSND_CHAN3_FREQ_ON_VAL);
	ld	a, (bc)
	or	a, #0x80
	ld	(#_SndInBVar4),a
;src/SoundManager.c:264: Snd_Voice3();
;src/SoundManager.c:265: }
	jp	_Snd_Voice3
;src/SoundManager.c:267: void Snd_Update()
;	---------------------------------
; Function Snd_Update
; ---------------------------------
_Snd_Update::
;src/SoundManager.c:269: if(SndChan.bIsActive)
	ld	hl, #(_SndChan + 7)
	bit	0, (hl)
	jr	Z, 00102$
;src/SoundManager.c:271: zSnd_Music_Play();
	call	_zSnd_Music_Play
00102$:
;src/SoundManager.c:274: if(SndDrums.bIsActive)
	ld	hl, #(_SndDrums + 7)
	bit	0, (hl)
;src/SoundManager.c:276: zSnd_C4_Play();
	jp	NZ, _zSnd_C4_Play
;src/SoundManager.c:278: }
	ret
;src/SoundManager.c:280: void Snd_PlayMusic_V2(const char* const pData)
;	---------------------------------
; Function Snd_PlayMusic_V2
; ---------------------------------
_Snd_PlayMusic_V2::
;src/SoundManager.c:282: SndChan.bIsActive=true;
	ld	hl, #_SndChan + 7
	ld	(hl), #0x01
;src/SoundManager.c:283: SndChan.musicOffset=0; ///expects first 3 bytes to be (R|P),(R|P),Note
	ld	hl, #_SndChan + 3
	ld	(hl), #0x00
;src/SoundManager.c:284: SndChan.pMusicData=pData;
	ld	hl, #_SndChan + 5
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/SoundManager.c:285: SndChan.playState=SND_PLAY_DELAY_ON;
	ld	hl, #_SndChan + 4
	ld	(hl), #0x00
;src/SoundManager.c:286: SndChan.voiceID=2;
	ld	hl, #_SndChan
	ld	(hl), #0x02
;src/SoundManager.c:288: zSnd_MusicAdvance(&SndChan);
	ld	de, #_SndChan
	call	_zSnd_MusicAdvance
;src/SoundManager.c:290: SndChan.PlayTimer=zSndDelays[SndInBVar0];
	ld	bc, #_zSndDelays+0
	ld	a, c
	ld	hl, #_SndInBVar0
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(#(_SndChan + 1)),a
;src/SoundManager.c:291: SndChan.RestTimer=zSndDelays[SndInBVar1];
	ld	a, c
	ld	hl, #_SndInBVar1
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	a, (bc)
	ld	(#(_SndChan + 2)),a
;src/SoundManager.c:292: SndInWFrequency.var16=zSndNotes[SndInBVar2];
	ld	a, (_SndInBVar2)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_zSndNotes
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_SndInWFrequency
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/SoundManager.c:294: SndInBVar0=ZSND_V2_DEF_V1;
	ld	hl, #_SndInBVar0
	ld	(hl), #0x88
;src/SoundManager.c:295: SndInBVar1=ZSND_V2_DEF_V2;
	ld	hl, #_SndInBVar1
	ld	(hl), #0xfc
;src/SoundManager.c:296: SndInBVar2=SndInWFrequency.hiByte;
	ld	a, (#_SndInWFrequency + 0)
	ld	(#_SndInBVar2),a
;src/SoundManager.c:297: SndInBVar3=SndInWFrequency.loByte|ZSND_CHAN2_ALWAYS_ON;
	ld	a, (#(_SndInWFrequency + 1) + 0)
	or	a, #0x80
	ld	(#_SndInBVar3),a
;src/SoundManager.c:299: Snd_Voice2();
;src/SoundManager.c:301: }
	jp	_Snd_Voice2
;src/SoundManager.c:303: void Snd_PlayMusic_V3(const char* const pData)
;	---------------------------------
; Function Snd_PlayMusic_V3
; ---------------------------------
_Snd_PlayMusic_V3::
;src/SoundManager.c:305: SndChan.bIsActive=true;
	ld	hl, #_SndChan + 7
	ld	(hl), #0x01
;src/SoundManager.c:306: SndChan.musicOffset=0; ///expects first 3 bytes to be (R|P),(R|P),Note
	ld	hl, #_SndChan + 3
	ld	(hl), #0x00
;src/SoundManager.c:307: SndChan.pMusicData=pData;
	ld	hl, #_SndChan + 5
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/SoundManager.c:308: SndChan.playState=SND_PLAY_DELAY_ON;
	ld	hl, #_SndChan + 4
	ld	(hl), #0x00
;src/SoundManager.c:309: SndChan.voiceID=3;
	ld	hl, #_SndChan
	ld	(hl), #0x03
;src/SoundManager.c:311: zSnd_MusicAdvance(&SndChan);
	ld	de, #_SndChan
	call	_zSnd_MusicAdvance
;src/SoundManager.c:313: SndChan.PlayTimer=zSndDelays[SndInBVar0];
	ld	bc, #_zSndDelays+0
	ld	a, c
	ld	hl, #_SndInBVar0
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(#(_SndChan + 1)),a
;src/SoundManager.c:314: SndChan.RestTimer=zSndDelays[SndInBVar1];
	ld	a, c
	ld	hl, #_SndInBVar1
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	a, (bc)
	ld	(#(_SndChan + 2)),a
;src/SoundManager.c:315: SndInWFrequency.var16=zSndNotes[SndInBVar2];
	ld	a, (_SndInBVar2)
	ld	h, #0x00
	ld	l, a
	add	hl, hl
	ld	de, #_zSndNotes
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_SndInWFrequency
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;src/SoundManager.c:317: SndInBVar0=ZSND_V3_DEF_V1;
	ld	hl, #_SndInBVar0
	ld	(hl), #0x80
;src/SoundManager.c:318: SndInBVar1=ZSND_V3_DEF_V2;
	xor	a, a
	ld	(#_SndInBVar1),a
;src/SoundManager.c:319: SndInBVar2=ZSND_V3_DEF_V3;
	ld	hl, #_SndInBVar2
	ld	(hl), #0x20
;src/SoundManager.c:321: SndInBVar3=SndInWFrequency.hiByte;
	ld	a, (#_SndInWFrequency + 0)
	ld	(#_SndInBVar3),a
;src/SoundManager.c:322: SndInBVar4=SndInWFrequency.loByte|ZSND_CHAN2_ALWAYS_ON;
	ld	a, (#(_SndInWFrequency + 1) + 0)
	or	a, #0x80
	ld	(#_SndInBVar4),a
;src/SoundManager.c:324: Snd_Voice3();
;src/SoundManager.c:326: }
	jp	_Snd_Voice3
;src/SoundManager.c:328: void Snd_PlayDrums(const char* const pDrums)
;	---------------------------------
; Function Snd_PlayDrums
; ---------------------------------
_Snd_PlayDrums::
;src/SoundManager.c:330: SndDrums.bIsActive=true;
	ld	hl, #_SndDrums + 7
	ld	(hl), #0x01
;src/SoundManager.c:331: SndDrums.musicOffset=0;
	ld	hl, #_SndDrums + 3
	ld	(hl), #0x00
;src/SoundManager.c:332: SndDrums.pMusicData=pDrums;
	ld	hl, #_SndDrums + 5
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;src/SoundManager.c:333: SndDrums.playState=SND_PLAY_DELAY_ON;
	ld	hl, #_SndDrums + 4
	ld	(hl), #0x00
;src/SoundManager.c:336: zSnd_MusicAdvance(&SndDrums);
	ld	de, #_SndDrums
	call	_zSnd_MusicAdvance
;src/SoundManager.c:337: SndDrums.PlayTimer=zSndDelays[SndInBVar0];
	ld	bc, #_zSndDelays+0
	ld	a, c
	ld	hl, #_SndInBVar0
	add	a, (hl)
	ld	e, a
	ld	a, b
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	(#(_SndDrums + 1)),a
;src/SoundManager.c:338: SndDrums.RestTimer=zSndDelays[SndInBVar1];
	ld	a, c
	ld	hl, #_SndInBVar1
	add	a, (hl)
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ld	a, (bc)
	ld	(#(_SndDrums + 2)),a
;src/SoundManager.c:339: SndInBVar4=SndInBVar2*4;
	ld	a, (_SndInBVar2)
	add	a, a
	add	a, a
;src/SoundManager.c:340: pTile=&zSndV4_Drums[SndInBVar4];
	ld	(#_SndInBVar4),a
	add	a,#<(_zSndV4_Drums)
	ld	c, a
	ld	a, #>(_zSndV4_Drums)
	adc	a, #0x00
	ld	b, a
	ld	hl, #_pTile
	ld	a, c
	ld	(hl+), a
;src/SoundManager.c:341: SndInBVar0=*pTile;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar0),a
;src/SoundManager.c:342: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00104$
	inc	hl
	inc	(hl)
00104$:
;src/SoundManager.c:343: SndInBVar1=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar1),a
;src/SoundManager.c:344: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00105$
	inc	hl
	inc	(hl)
00105$:
;src/SoundManager.c:345: SndInBVar2=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar2),a
;src/SoundManager.c:346: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00106$
	inc	hl
	inc	(hl)
00106$:
;src/SoundManager.c:347: SndInBVar3=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar3),a
;src/SoundManager.c:348: Snd_Voice4();
;src/SoundManager.c:349: }
	jp	_Snd_Voice4
;src/SoundManager.c:351: void Snd_Drum(u8 soundID)
;	---------------------------------
; Function Snd_Drum
; ---------------------------------
_Snd_Drum::
;src/SoundManager.c:353: SndInBVar4=soundID*4;
	add	a, a
	add	a, a
;src/SoundManager.c:354: pTile=&zSndV4_Drums[SndInBVar4];
	ld	(#_SndInBVar4),a
	add	a,#<(_zSndV4_Drums)
	ld	c, a
	ld	a, #>(_zSndV4_Drums)
	adc	a, #0x00
	ld	b, a
	ld	hl, #_pTile
	ld	a, c
	ld	(hl+), a
;src/SoundManager.c:355: SndInBVar0=*pTile;
	ld	a, b
	ld	(hl-), a
	ld	a, (hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar0),a
;src/SoundManager.c:356: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00103$
	inc	hl
	inc	(hl)
00103$:
;src/SoundManager.c:357: SndInBVar1=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar1),a
;src/SoundManager.c:358: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00104$
	inc	hl
	inc	(hl)
00104$:
;src/SoundManager.c:359: SndInBVar2=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar2),a
;src/SoundManager.c:360: ++pTile;
	ld	hl, #_pTile
	inc	(hl)
	jr	NZ, 00105$
	inc	hl
	inc	(hl)
00105$:
;src/SoundManager.c:361: SndInBVar3=*pTile;
	ld	a, (_pTile)
	ld	hl, #_pTile + 1
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	(#_SndInBVar3),a
;src/SoundManager.c:362: Snd_Voice4();
;src/SoundManager.c:363: }
	jp	_Snd_Voice4
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
