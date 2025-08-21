#include "utils.h"
#include "gfxDefines.h"

u8 *pTile;
u16 LSeed;
const u8 *pSrc;
u8 IN_JoyNow,IN_JoyOld;

void ErrorTrap(const char* errMsg)
{
	ClrStripX(0,1,20);
	Print(0,1,errMsg);
	while(1)
	{
		vsync();
	};
}

const char* BoolToString(bool result)
{
	if(result)
	{
		return "TRUE";
	}
	else
	{
		return "FALSE";
	}
}

///TickTimer functions
void TickTimer_Init(tTickTimer *pTT,u8 myDelay)
{
	pTT->bHasTimeElapsed=false;
	pTT->nCountDown=myDelay;
	pTT->nTimeVal=myDelay;
}

bool TickTimer_Update(tTickTimer *pTT)
{
	if(pTT->bHasTimeElapsed==false)
	{
		--pTT->nCountDown;
		if(pTT->nCountDown==0xFF)
			pTT->bHasTimeElapsed=true;
	}

	return pTT->bHasTimeElapsed;
}

void TickTimer_Reset(tTickTimer *pTT)
{
	pTT->nCountDown=pTT->nTimeVal;
	pTT->bHasTimeElapsed=false;
}

void SetTileData(u8 nTileStart,u8 nTileCount,const u8 const *pTileData)
{
	set_bkg_2bpp_data(nTileStart,nTileCount,pTileData);
}

void ClrScreen(void)
{
	fill_bkg_rect(0,0,32,32,0);
}

void TilePut(u8 x,u8 y,u8 nTile)
{
	set_tile_xy(x,y,nTile);
}

void TilePut2(u8 x,u8 y,u8 nTile)
{
	pTile=get_bkg_xy_addr(x,y);
	set_vram_byte(pTile,nTile);
	++nTile;
	++pTile;
	set_vram_byte(pTile,nTile);
}

void TilePut2X2(u8 x,u8 y,u8 nTileStart)
{
	pTile=get_bkg_xy_addr(x,y);
	set_vram_byte(pTile,nTileStart);
	++nTileStart;
	++pTile;
	set_vram_byte(pTile,nTileStart);
	++nTileStart; //skip to next line down on screen
	pTile+=31;
	set_vram_byte(pTile,nTileStart);
	++nTileStart;
	++pTile;
	set_vram_byte(pTile,nTileStart);
}

///New Rnd funcs
void InitRand(void)
{
	LSeed|=DIV_REG;
	initrand(LSeed);
}

u8 Rnd(u8 maxNum)
{
	u8 tv;
	tv=rand();
	tv=tv%maxNum;
	return tv;
}

void ClrStripX(u8 x,u8 y,u8 width)
{
	pTile=get_bkg_xy_addr(x,y);
	while(width)
	{
		set_vram_byte(pTile,0);
		++pTile;
		--width;
	}
}

void ClrStripY(u8 x,u8 y,u8 height)
{
	pTile=get_bkg_xy_addr(x,y);
	while(height)
	{
		set_vram_byte(pTile,0);
		pTile+=32;
		--height;
	}
}

u8 TileGet(u8 x, u8 y)
{
	return get_bkg_tile_xy(x,y);
}

bool IsBitSet(u8 var,u8 bit)
{
	if((var & bit)==bit)
	{
		return true;
	}

	return false;
}

void IN_Update()
{
	IN_JoyOld=IN_JoyNow;
	IN_JoyNow=joypad();
}

bool IN_IsKeyDown(u8 keyID)
{
	if(IsBitSet(IN_JoyNow,keyID)==true)
	{
		return true;
	}

	return false;
}

bool IN_WasKeyPressed(u8 keyID)
{
	if(IsBitSet(IN_JoyOld,keyID))
	{
		if(!IsBitSet(IN_JoyNow,keyID))
		{
			IN_JoyOld=0;
			return true;
		}
	}
	return false;
}

void Print(u8 x,u8 y,const char* msg)
{
	pTile=get_bkg_xy_addr(x,y);
	x=*msg;
	++msg;
	while(x)
	{
		set_vram_byte(pTile,x);
		++pTile;
		x=*msg;
		++msg;
	};
}

void PrintCentre(u8 y,const char* msg)
{
	u8 l,x;
	l=0;
	pTile=&msg[0];
	//scan until end of line char '0'
	x=*pTile;
	++pTile;
	while(x)
	{
		++l;
		x=*pTile;
		++pTile;
	};

	if(l>20)
		l=20;

	x=(l>>1);
	if(x>10)
		x=10;
	x=10-x;
	pTile=get_bkg_xy_addr(x,y);
	while(l)
	{
		x=*msg;
		++msg;
		set_vram_byte(pTile,x);
		++pTile;
		--l;
	};
}

void PrintNum8(u8 x,u8 y,u8 val8)
{
	u8 h,t;///Hundreds Tens Units
	u8 c;
	pTile=get_bkg_xy_addr(x,y);
	h=t=0;
	while(val8>=100)
	{
		++h;
		val8-=100;
	}

	while(val8>=10)
	{
		++t;
		val8-=10;
	}

	//val8 now hold only units 0-9
	if(h>0)
	{
		c='0'+h;
		h=1;
		//h=1 we use this to now indicate that a digit is in '100 counter' so ten value must be drawn if value of 0
		set_vram_byte(pTile,c);
		++pTile;
	}

	if((t>0) || (h>0))
	{
		c='0'+t;
		set_vram_byte(pTile,c);
		++pTile;
	}

	c='0'+val8;
	set_vram_byte(pTile,c);
}

void PrintNum8Hex(u8 x,u8 y,u8 var)
{
	static u8 hexL;
	static u8 hexR;

	hexR=var & 15u;
	hexL=var;
	hexL>>=4;
	if(hexL>9)
	{
		hexL-=10;
		hexL+='A';
	}
	else
	{
		hexL+='0';
	}

	if(hexR>9)
	{
		hexR-=10;
		hexR+='A';
	}
	else
	{
		hexR+='0';
	}

	TilePut(x,y,hexL);
	++x;
	TilePut(x,y,hexR);
}

void PrintNum16(u8 x,u8 y,u16 val16)
{
	u8 a,b,h,t,u;///Hundreds Tens Units
	u8 c;
	pTile=get_bkg_xy_addr(x,y);
	a=b=h=t=0;
	while(val16>=10000)
	{
		++a;
		val16-=10000;
	}

	while(val16>=1000)
	{
		++b;
		val16-=1000;
	}

	while(val16>=100)
	{
		++h;
		val16-=100;
	}
	u=(u8)val16;

	while(u>=10)
	{
		++t;
		u-=10;
	}

	if(a>0)
	{
		c='0'+a;
		a=1;
		//h=1 we use this to now indicate that a digit is in '100 counter' so ten value must be drawn if value of 0
		set_vram_byte(pTile,c);
		++pTile;
	}

	if((a>0) || (b>0))
	{
		c='0'+b;
		a=1;
		//h=1 we use this to now indicate that a digit is in '100 counter' so ten value must be drawn if value of 0
		set_vram_byte(pTile,c);
		++pTile;
	}
	//val8 now hold only units 0-9
	if((h>0) || (a>0))
	{
		c='0'+h;
		a=1;
		//h=1 we use this to now indicate that a digit is in '100 counter' so ten value must be drawn if value of 0
		set_vram_byte(pTile,c);
		++pTile;
	}

	if((t>0) || (a>0))
	{
		c='0'+t;
		set_vram_byte(pTile,c);
		++pTile;
	}

	c='0'+u;
	set_vram_byte(pTile,c);
}

bool InRange8(u8 varIn,u8 rangeMin,u8 rangeMax)
{

	return ((varIn<=rangeMax) && (rangeMin<=varIn));
}
