#ifndef SNDGBNOTES_H_INCLUDED
#define SNDGBNOTES_H_INCLUDED

#define SND_DL_THIRTYSEC 0u
#define SND_DL_SIXTEENTH 1u
#define SND_DL_EIGTH 2u
#define SND_DL_QUATER 3u
#define SND_DL_HALF 4u
#define SND_DL_WHOLE 5u

///P0-P5 == play time of note
#define PT SND_DL_THIRTYSEC
#define PS SND_DL_SIXTEENTH
#define PE SND_DL_EIGTH
#define PQ SND_DL_QUATER
#define PH SND_DL_HALF
#define PW SND_DL_WHOLE

///R0-R5 == rest After Note
#define RT SND_DL_THIRTYSEC
#define RS SND_DL_SIXTEENTH
#define RE SND_DL_EIGTH
#define RQ SND_DL_QUATER
#define RH SND_DL_HALF
#define RW SND_DL_WHOLE

enum Snd_Drums
{
  eSD_D1=0,
  eSD_D2,
  eSD_SNARE,
  eSD_KNOCK1,
  eSD_CLAP,
  eSD_CLAP2,
  eSD_GUITBAS1A,
  eSD_GUITBAS1B,
  eSD_GUITBAS1C,
  eSD_GUITBAS1D,
  eSD_GUITBAS1E,
  eSD_MAX_DRUMSOUND
};

enum eSndNotes
{
  C3, Cs3, D3, Ds3, E3, F3, Fs3, G3, Gs3, A3, As3, B3,
  C4, Cs4, D4, Ds4, E4, F4, Fs4, G4, Gs4, A4, As4, B4,
  C5, Cs5, D5, Ds5, E5, F5, Fs5, G5, Gs5, A5, As5, B5,
  C6, Cs6, D6, Ds6, E6, F6, Fs6, G6, Gs6, A6, As6, B6,
  C7, Cs7, D7, Ds7, E7, F7, Fs7, G7, Gs7, A7, As7, B7,
  C8, Cs8, D8, Ds8, E8, F8, Fs8, G8, Gs8, A8, As8, B8,
  END
};

#endif // SNDGBNOTES_H_INCLUDED
