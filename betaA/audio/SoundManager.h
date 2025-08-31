#ifndef SOUNDMANAGER_H
#define SOUNDMANAGER_H

#include "utils.h"
#include <gb/gb.h>

///default values for non note sound parameters
#define ZSND_V3_DEF_V1 0x80u
#define ZSND_V3_DEF_V2 0x0u
#define ZSND_V3_DEF_V3 0x20u

#define ZSND_V2_DEF_V1 0x88u
#define ZSND_V2_DEF_V2 0xFCu

#define ZSND_CHAN2_ALWAYS_ON 0x80u
#define ZSND_CHAN2_ALWAYS_OFF 0xC0u

//this needs to be or'd with hibyte var on each sound channel to play note
#define ZSND_CHAN3_FREQ_ON_VAL 0x80u

///used to switch on volume speakers left and right
#define SND_VOL_ON_2 2
#define SND_VOL_ON_1 1
#define SND_VOL_ON_3 4
#define SND_VOL_ON_4 8

extern const u16 const zSndNotes[];
extern const u8 const zSndDelays[];
extern const u8 const zSndV4_Drums[];

enum Snd_ChannelPlayState
{
  SND_PLAY_DELAY_ON=0,
  SND_REST_DELAY_ON,
  SND_NEXT_NOTE
};

typedef struct
{
  u8 voiceID;
  u8 PlayTimer;
  u8 RestTimer;
  u8 musicOffset;
  u8 playState;
  const u8 const *pMusicData;
  bool bIsActive;
}tSndChannel;

extern tSndChannel SndChan;
extern tSndChannel SndDrums;
extern u8 SndVoiceOnLeft;
extern u8 SndVoiceOnRight;

extern uu16 SndInWFrequency;
extern u8 SndInBVar0;
extern u8 SndInBVar1;
extern u8 SndInBVar2;
extern u8 SndInBVar3;
extern u8 SndInBVar4;
extern void Snd_Init(void);

extern void Snd_Sound_V1(u8 b0,u8 b1,u8 b2,u8 b3,u8 b4);
extern void Snd_Sound_V2(u8 b1,u8 b2,u8 b3,u8 b4);
extern void Snd_Sound_V3(u8 b0,u8 b1,u8 b2,u8 b3,u8 b4);
extern void Snd_Sound_V4(u8 b1,u8 b2,u8 b3,u8 b4);
extern void Snd_Drum(u8 soundID);
extern void Snd_Beep();
extern void Snd_Play2();
extern void Snd_Update();
extern void Snd_PlayMusic_V2(const char* const pData);
extern void Snd_PlayMusic_V3(const char* const pData);
extern void Snd_PlayDrums(const char* const pDrums);
#endif // SOUNDMANAGER_H
