#include "SndGBNotes.h"
#include "utils.h"

///Note need to put play delay and rest delay before note is actually played
//Music should always start with Play Time and Rest Time first before notes

const u8 const musStarWars[]=
{
  PE,PE,D4,PE,PE,D4,PE,PE,D4,PH,RE,G4,PH,RQ,D5,PE,RT,C5,PE,RT,B4,PE,RT,A4,PH,RE,G5,PE,RQ,D5,
  PE,RT,C5,PE,RT,B4,PE,RT,A4,PH,RE,G5,PE,RQ,D5,PE,RT,C5,PE,RT,B4,PE,RT,C5,PH,RH,A4,PE,RT,D4,PE,RE,D4,PH,RE,G4,PH,RE,D5,
  PE,RT,C5,PE,RT,B4,PE,RT,A4,PH,RE,G5,PE,RQ,D5,PE,RT,C5,PE,RT,B4,PE,RT,A4,PH,RE,G5,PE,RQ,D5,PE,RT,C5,PE,RT,B4,PE,RT,C5,PH,RH,A4,PE,RT,D4,PE,RE,D4,
  PE,RT,E4,PQ,RQ,E4,PQ,RS,C5,PQ,RS,B4,PE,RS,A4,PE,RS,G4,PE,RT,G4,PE,RT,A4,PE,RT,B4,PE,RS,A4,PQ,RE,E4,PE,RT,Fs4,
  END,END,END
};

const u8 const bassStarWars[]=
{
  PE,RT,D4,PE,RT,D4,PE,RT,D4,PH,RE,G4,PH,RQ,D5,PE,RT,C5,PE,RT,B4,PE,RT,A4,PH,RE,G5,PE,RQ,D5,
  PE,RT,C5,PE,RT,B4,PE,RT,A4,PH,RE,G5,PE,RQ,D5,PE,RT,C5,PE,RT,B4,PE,RT,C5,PH,RH,A4,PE,RT,D4,PE,RE,D4,PH,RE,G4,PH,RE,D5,
  PE,RT,C5,PE,RT,B4,PE,RT,A4,PH,RE,G5,PE,RQ,D5,PE,RT,C5,PE,RT,B4,PE,RT,A4,PH,RE,G5,PE,RQ,D5,PE,RT,C5,PE,RT,B4,PE,RT,C5,PH,RH,A4,PE,RT,D4,PE,RE,D4,
  PE,RT,E4,PQ,RQ,E4,PQ,RS,C5,PQ,RS,B4,PE,RS,A4,PE,RS,G4,PE,RT,G4,PE,RT,A4,PE,RT,B4,PE,RS,A4,PQ,RE,E4,PE,RT,Fs4,
  END,END,END
};

const unsigned char * song_Data[] = {
    musStarWars,
    musStarWars,
    musStarWars,
    0x0000
};

const u8 const musTwinkle[]=
{
  PQ,RT,C4,eSD_SNARE,
  PQ,RT,C4,eSD_SNARE,
  PQ,RT,G4,eSD_SNARE,
  PQ,RS,G4,
  PQ,RT,A4,
  PQ,RT,A4,
  PH,RT,G4,
  PQ,RT,F4,
  PQ,RT,F4,
  PQ,RT,E4,
  PQ,RS,E4,
  PQ,RT,D4,
  PQ,RT,D4,
  PH,RS,C4,
  PQ,RT,G4,
  PQ,RT,G4,
  PQ,RT,F4,
  PQ,RS,F4,
  PQ,RT,E4,
  PQ,RT,E4,
  PH,RS,D4,
  PQ,RT,G4,
  PQ,RT,G4,
  PQ,RT,F4,
  PQ,RS,F4,
  PQ,RT,E4,
  PQ,RT,E4,
  PH,RS,D4,
  PQ,RT,C4,
  PQ,RT,C4,
  PQ,RT,G4,
  PQ,RS,G4,
  PQ,RT,A4,
  PQ,RT,A4,
  PH,RT,G4,
  PQ,RT,F4,
  PQ,RT,F4,
  PQ,RT,E4,
  PQ,RS,E4,
  PQ,RT,D4,
  PQ,RT,D4,
  PW,RT,C4,
  END,END,END
};

const u8 const musTrack2[]=
{
  PQ,RT,C4,
  PQ,RT,E4,
  PQ,RT,D4,
  PQ,RT,F4,
  PQ,RT,E4,
  PQ,RT,G4,
  PQ,RT,F4,
  PQ,RT,A4,
  PQ,RT,G4,
  PQ,RT,B4,
  PQ,RT,A4,
  PQ,RT,C4,
  END,END,END
};

const u8 const drmTwinkle2[]=
{
  PE,RT,eSD_D1,
  PE,RS,eSD_SNARE,
  PE,RT,eSD_D2,
  PQ,RS,eSD_SNARE,
  PQ,RT,eSD_D1,
  PQ,RT,eSD_CLAP2,
  PQ,RT,eSD_D2,
  PQ,RT,eSD_CLAP,
  PT,RS,eSD_D1,
  PT,RT,eSD_SNARE,
  PT,RS,eSD_D1,
  PQ,RT,eSD_SNARE,
  PE,RE,eSD_D2,
  END,END,END
};
