#include "SoundManager.h"
#include "SndGBNotes.h"
//play sequence from before was note on, pause, note rest, note pause

uu16 SndInWFrequency;
u8 SndInBVar0;
u8 SndInBVar1;
u8 SndInBVar2;
u8 SndInBVar3;
u8 SndInBVar4;
///Speaker volumes are split into 4 bits (Left) 4 bits (Right)
///Volumes can be 0-15 (0x0f) left or right
///which must be combined back into the byte put into NR51
u8 SndVoiceOnLeft; //used for sounds vol control on left speaker
u8 SndVoiceOnRight; //used for sounds vol control on right speaker

tSndChannel SndChan;
tSndChannel SndDrums;

void zSnd_SetVolume(void)
{
	SndInBVar0=SndVoiceOnRight<<4;
	SndInBVar0|=SndVoiceOnLeft;
	NR51_REG=SndInBVar0;
}

void Snd_Init(void)
{
	NR52_REG=0x80; //Turn On Sound
	NR50_REG=0x77; //Sets Volume for Left and Right Speakers
	//NR51_REG=0xFF; //Turns on All Channels to use speakers
	SndVoiceOnLeft=0x0F;
	SndVoiceOnRight=0x0f;
	zSnd_SetVolume();
	SndChan.bIsActive=false;
	SndChan.pMusicData=NULL;
	SndDrums.bIsActive=false;
}

void Snd_Sound_V1(u8 b0,u8 b1,u8 b2,u8 b3,u8 b4)
{
	NR10_REG=b0;
	NR11_REG=b1;
	NR12_REG=b2;
	NR13_REG=b3;
	NR14_REG=b4;
}

void Snd_Sound_V2(u8 b1,u8 b2,u8 b3,u8 b4)
{
	NR21_REG=b1;
	NR22_REG=b2;
	NR23_REG=b3;
	NR24_REG=b4;
}

void Snd_Sound_V3(u8 b0,u8 b1,u8 b2,u8 b3,u8 b4)
{
	NR30_REG=b0;
	NR31_REG=b1;
	NR32_REG=b2;
	NR33_REG=b3;
	NR34_REG=b4;
}

void Snd_Sound_V4(u8 b1,u8 b2,u8 b3,u8 b4)
{
	NR41_REG=b1;
	NR42_REG=b2;
	NR43_REG=b3;
	NR44_REG=b4;
}

void Snd_Voice4()
{
	NR41_REG=SndInBVar0;
	NR42_REG=SndInBVar1;
	NR43_REG=SndInBVar2;
	NR44_REG=SndInBVar3;
	SndVoiceOnLeft|=SND_VOL_ON_4;
	SndVoiceOnRight|=SND_VOL_ON_4;
	zSnd_SetVolume();
}

void Snd_Voice2()
{
	NR21_REG=SndInBVar0;
	NR22_REG=SndInBVar1;
	NR23_REG=SndInBVar2;
	NR24_REG=SndInBVar3;
	SndVoiceOnLeft|=SND_VOL_ON_2;
	SndVoiceOnRight|=SND_VOL_ON_2;
	zSnd_SetVolume();
}

void Snd_Voice3()
{
	NR30_REG=SndInBVar0;
	NR31_REG=SndInBVar1;
	NR32_REG=SndInBVar2;
	NR33_REG=SndInBVar3;
	NR34_REG=SndInBVar4;


	SndVoiceOnLeft|=SND_VOL_ON_3;
	SndVoiceOnRight|=SND_VOL_ON_3;
	zSnd_SetVolume();
}

void zSnd_MusicAdvance(tSndChannel* pSnd)
{
	SndInBVar4=pSnd->musicOffset;
	SndInBVar0=pSnd->pMusicData[SndInBVar4];
	++SndInBVar4;
	SndInBVar1=pSnd->pMusicData[SndInBVar4];
	++SndInBVar4;
	SndInBVar2=pSnd->pMusicData[SndInBVar4];
	++SndInBVar4;
	pSnd->musicOffset=SndInBVar4;
}

void Snd_Play2()
{
	SndInBVar0=ZSND_V2_DEF_V1;
	SndInBVar1=ZSND_V2_DEF_V2;
	SndInBVar3=ZSND_CHAN2_ALWAYS_OFF;

	SndInBVar2=SndInWFrequency.hiByte;
	SndInBVar3|=SndInWFrequency.loByte;
	NR21_REG=SndInBVar0;
	NR22_REG=SndInBVar1;
	NR23_REG=SndInBVar2;
	NR24_REG=SndInBVar3;
}

void Snd_Beep()
{
	SndInBVar0=ZSND_V3_DEF_V1;
	SndInBVar1=ZSND_V3_DEF_V2;
	SndInBVar2=ZSND_V3_DEF_V3;
	SndInBVar3=SndInWFrequency.hiByte;
	SndInBVar4=(SndInWFrequency.loByte|ZSND_CHAN3_FREQ_ON_VAL);
	NR31_REG=SndInBVar1;
	NR32_REG=SndInBVar2;
	NR33_REG=SndInBVar3;
	NR34_REG=SndInBVar4;
	NR30_REG=SndInBVar0;
}

void zSnd_C4_Play()
{
	SndInBVar0=SndDrums.playState;
	if(SndInBVar0==SND_PLAY_DELAY_ON)
	{
		--SndDrums.PlayTimer;
		if(SndDrums.PlayTimer==0)
		{
			SndDrums.playState=SND_REST_DELAY_ON;
			SndVoiceOnLeft-=SND_VOL_ON_4;
			SndVoiceOnRight-=SND_VOL_ON_4;
			zSnd_SetVolume();
		}
		return;
	}

	if(SndInBVar0==SND_REST_DELAY_ON)
	{
		--SndDrums.RestTimer;
		if(SndDrums.RestTimer==0)
		{
			SndDrums.playState=SND_NEXT_NOTE;
		}
		return;
	}

	zSnd_MusicAdvance(&SndDrums);

	if(SndInBVar0==END)
	{
		SndDrums.bIsActive=false;
		return;
	}

	SndDrums.PlayTimer=zSndDelays[SndInBVar0];
	SndDrums.RestTimer=zSndDelays[SndInBVar1];

	SndInBVar4=SndInBVar2*4;
	pTile=&zSndV4_Drums[SndInBVar4];
	SndInBVar0=*pTile;
	++pTile;
	SndInBVar1=*pTile;
	++pTile;
	SndInBVar2=*pTile;
	++pTile;
	SndInBVar3=*pTile;
	Snd_Voice4();

	SndDrums.playState=SND_PLAY_DELAY_ON;
}

void zSnd_Music_Play()
{
	SndInBVar0=SndChan.playState;
	if(SndInBVar0==SND_PLAY_DELAY_ON)
	{
		--SndChan.PlayTimer;
		if(SndChan.PlayTimer==0)
		{
			SndChan.playState=SND_REST_DELAY_ON;
			if(SndChan.voiceID==2)
			{
				SndVoiceOnLeft-=SND_VOL_ON_2;
				SndVoiceOnRight-=SND_VOL_ON_2;
			}
			else if(SndChan.voiceID==3)
			{
				SndVoiceOnLeft-=SND_VOL_ON_3;
				SndVoiceOnRight-=SND_VOL_ON_3;
			}
			zSnd_SetVolume();
		}
		return;
	}

	if(SndInBVar0==SND_REST_DELAY_ON)
	{
		--SndChan.RestTimer;
		if(SndChan.RestTimer==0)
		{
			SndChan.playState=SND_NEXT_NOTE;
		}
		return;
	}

	zSnd_MusicAdvance(&SndChan);

	if(SndInBVar0==END)
	{
		SndChan.bIsActive=false;
		return;
	}

	SndChan.PlayTimer=zSndDelays[SndInBVar0];
	SndChan.RestTimer=zSndDelays[SndInBVar1];
	SndInWFrequency.var16=zSndNotes[SndInBVar2];

	SndChan.playState=SND_PLAY_DELAY_ON;
	if(SndChan.voiceID==2)
	{
		SndInBVar0=ZSND_V2_DEF_V1;
		SndInBVar1=ZSND_V2_DEF_V2;
		SndInBVar2=SndInWFrequency.hiByte;
		SndInBVar3=SndInWFrequency.loByte|ZSND_CHAN2_ALWAYS_ON;

		Snd_Voice2();
		return;
	}

	SndInBVar0=ZSND_V3_DEF_V1;
	SndInBVar1=ZSND_V3_DEF_V2;
	SndInBVar2=ZSND_V3_DEF_V3;
	SndInBVar3=SndInWFrequency.hiByte;
	SndInBVar4=(SndInWFrequency.loByte|ZSND_CHAN3_FREQ_ON_VAL);
	Snd_Voice3();
}

void Snd_Update()
{
	if(SndChan.bIsActive)
	{
		zSnd_Music_Play();
	}

	if(SndDrums.bIsActive)
	{
		zSnd_C4_Play();
	}
}

void Snd_PlayMusic_V2(const char* const pData)
{
	SndChan.bIsActive=true;
	SndChan.musicOffset=0; ///expects first 3 bytes to be (R|P),(R|P),Note
	SndChan.pMusicData=pData;
	SndChan.playState=SND_PLAY_DELAY_ON;
	SndChan.voiceID=2;
	///load playtime,resttime and note into b0,b1,b2
	zSnd_MusicAdvance(&SndChan);

	SndChan.PlayTimer=zSndDelays[SndInBVar0];
	SndChan.RestTimer=zSndDelays[SndInBVar1];
	SndInWFrequency.var16=zSndNotes[SndInBVar2];

	SndInBVar0=ZSND_V2_DEF_V1;
	SndInBVar1=ZSND_V2_DEF_V2;
	SndInBVar2=SndInWFrequency.hiByte;
	SndInBVar3=SndInWFrequency.loByte|ZSND_CHAN2_ALWAYS_ON;

	Snd_Voice2();

}

void Snd_PlayMusic_V3(const char* const pData)
{
	SndChan.bIsActive=true;
	SndChan.musicOffset=0; ///expects first 3 bytes to be (R|P),(R|P),Note
	SndChan.pMusicData=pData;
	SndChan.playState=SND_PLAY_DELAY_ON;
	SndChan.voiceID=3;
	///load playtime,resttime and note into b0,b1,b2
	zSnd_MusicAdvance(&SndChan);

	SndChan.PlayTimer=zSndDelays[SndInBVar0];
	SndChan.RestTimer=zSndDelays[SndInBVar1];
	SndInWFrequency.var16=zSndNotes[SndInBVar2];

	SndInBVar0=ZSND_V3_DEF_V1;
	SndInBVar1=ZSND_V3_DEF_V2;
	SndInBVar2=ZSND_V3_DEF_V3;

	SndInBVar3=SndInWFrequency.hiByte;
	SndInBVar4=SndInWFrequency.loByte|ZSND_CHAN2_ALWAYS_ON;

	Snd_Voice3();

}

void Snd_PlayDrums(const char* const pDrums)
{
	SndDrums.bIsActive=true;
	SndDrums.musicOffset=0;
	SndDrums.pMusicData=pDrums;
	SndDrums.playState=SND_PLAY_DELAY_ON;

		///load playtime,resttime and note into b0,b1,b2
	zSnd_MusicAdvance(&SndDrums);
	SndDrums.PlayTimer=zSndDelays[SndInBVar0];
	SndDrums.RestTimer=zSndDelays[SndInBVar1];
	SndInBVar4=SndInBVar2*4;
	pTile=&zSndV4_Drums[SndInBVar4];
	SndInBVar0=*pTile;
	++pTile;
	SndInBVar1=*pTile;
	++pTile;
	SndInBVar2=*pTile;
	++pTile;
	SndInBVar3=*pTile;
	Snd_Voice4();
}

void Snd_Drum(u8 soundID)
{
	SndInBVar4=soundID*4;
	pTile=&zSndV4_Drums[SndInBVar4];
	SndInBVar0=*pTile;
	++pTile;
	SndInBVar1=*pTile;
	++pTile;
	SndInBVar2=*pTile;
	++pTile;
	SndInBVar3=*pTile;
	Snd_Voice4();
}
