#include "main.h"
#include "SoundManager.h"
#include "SndGBNotes.h"

u8 drumID=0;

void PrintSoundChannel3()
{
	u8 pos=1;
	ClrStripX(0,0,20);
	ClrStripX(0,1,20);
	PrintNum8Hex(pos,0,SndInBVar0);
	pos+=3;
	PrintNum8Hex(pos,0,SndInBVar1);
	pos+=3;
	PrintNum8Hex(pos,0,SndInBVar2);
	pos+=3;
	PrintNum8Hex(pos,0,SndInBVar3);
	pos+=3;
	PrintNum8Hex(pos,0,SndInBVar4);
}

void main(void)
{

	SetTileData(GFX_TS_FONT,GFX_TC_FONT,gfxFont);
	Snd_Init();
	ClrScreen();
	DISPLAY_ON;
	SHOW_BKG;
	Print(0,4,"Drum ID=");
	PrintNum8(9,4,drumID);
	Print(0,5,"Press START for Drums");
	Print(0,6,"Press A for tune 1");
	Print(0,7,"Press B for tune 2");
	Print(0,8,"Press SELECT for the");
	Print(0,9,"Drum Track");
	Print(0,10,"Press Up for tune 3");

	while(1)
	{
		IN_Update();
		if(IN_WasKeyPressed(J_LEFT))
		{
			if(drumID>0)
				--drumID;
			ClrStripX(9,4,4);
			PrintNum8(9,4,drumID);
		}
		else if(IN_WasKeyPressed(J_RIGHT))
		{
			if(drumID<eSD_MAX_DRUMSOUND-1)
				++drumID;
			ClrStripX(9,4,4);
			PrintNum8(9,4,drumID);
		}

		if(IN_WasKeyPressed(J_UP))
		{
			Snd_PlayMusic_V3(amazingGrace);
		}

		if(IN_WasKeyPressed(J_START))
		{
			Snd_Drum(drumID);
		}

		if(IN_WasKeyPressed(J_SELECT))
		{
			ClrStripX(0,2,20);
			PrintCentre(2,"The Drums");
			Snd_PlayDrums(drmTwinkle2);
		}

		if(IN_WasKeyPressed(J_A))
		{
			ClrStripX(0,2,20);
			Print(0,2,"Play Amazing Grace");
			Snd_PlayMusic_V2(amazingGrace);
		}

		if(IN_WasKeyPressed(J_B))
		{
			if(SndChan.bIsActive==false)
			{
				ClrStripX(0,2,20);
				PrintCentre(2,"Track 2");
				Snd_PlayMusic_V3(musTrack2);
			}
		}
		wait_vbl_done();
		Snd_Update();
	}
}
