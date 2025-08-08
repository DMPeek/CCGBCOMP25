#include <gb/gb.h>
#include <stdint.h>
#include "main.h"

typedef unsigned char u8;

tTickTimer myAnimTimer;
bool bMoved=false;

tActorGroup Actors;

void initActors(void) {
    u8 x,y,t;
    Actors.nCount=0;
    Actors.nFrameID=0;
    y=t=0;

    //init vertical moving actors
    for(x=0;x<20;x+=3){
        t=Rnd(3);
        if(t==0){
            Actors.tileStart[Actors.nCount]=GT16_BAT_F1;
        } else if (t==1){
            Actors.tileStart[Actors.nCount]=GT16_STAR_F1;
        } else {
            Actors.tileStart[Actors.nCount]=GT16_FISH_F1;
        }

        t=Actors.tileStart[Actors.nCount];
        TilePut2x2(x,y,t);
        Actors.pos_x[Actors.nCount]=x;
        Actors.pos_y[Actors.nCount]=y;
        ++y;
        Actors.facing[Actors.nCount]=eFACING_DOWN;
        Actors.Movetype[Actors.nCount]=eACTOR_MOVE_TYPE_BOUNCE_Y;

        Actors.AnimType[Actors.nCount]=eACTOR_ANIM_TYPE_LOOP;
        ++Actors.nCount;
        if (Actors.nCount >= ACTOR_MAX) break;
    }

    x=0;
    for(y=0;x<17;y+=3){
        t=Rnd(3);
        if(t==0){
            Actors.tileStart[Actors.nCount]=GT16_BAT_F1;
        } else if (t==1){
            Actors.tileStart[Actors.nCount]=GT16_STAR_F1;
        } else {
            Actors.tileStart[Actors.nCount]=GT16_FISH_F1;
        }

        t=Actors.tileStart[Actors.nCount];
        TilePut2x2(x,y,t);
        Actors.pos_x[Actors.nCount]=x;
        Actors.pos_y[Actors.nCount]=y;
        ++x;
        Actors.facing[Actors.nCount]=eFACING_RIGHT;
        Actors.Movetype[Actors.nCount]=eACTOR_MOVE_TYPE_BOUNCE_X;

        Actors.AnimType[Actors.nCount]=eACTOR_ANIM_TYPE_LOOP;
        ++Actors.nCount;
        if (Actors.nCount >= ACTOR_MAX) break;
    }
}

void move_ActorY(u8 *ypos, u8 *facing){
    if(*facing==eFACING_DOWN){
        if(*ypos==16){
            *facing=eFACING_UP;
        } else {
            ++*ypos;
            bMoved=true;
        }
    } else {
        if(*ypos==0){
            *facing=eFACING_DOWN;
        } else {
            --*ypos;
            bMoved=true;
        }
    }
}

void move_ActorX(u8 *xpos, u8 *facing){
    if(*facing==eFACING_RIGHT){
        if(*xpos==18){
            *facing=eFACING_LEFT;
        } else {
            ++*xpos;
            bMoved=true;
        }
    } else {
        if(*xpos==0){
            *facing=eFACING_RIGHT;
        } else {
            --*xpos;
            bMoved=true;
        }
    }
}

void Move_Actors(void){
    u8 n,x,y,t,c,f,g;
    c=Actors.nCount;
    for(n=0;n<c;++n){
        t=Actors.Movetype[n];
        y=Actors.pos_y[n];
        x=Actors.pos_x[n];
        f=Actors.facing[n];
        g=Actors.tileStart[n];
        
        //SET YOUR DOUBLE EQUALS BRO
        if (Actors.AnimType[n]==eACTOR_ANIM_TYPE_LOOP){
            g+=(Actors.nFrameID*4);
        }
        bMoved=false;
        switch(t){
            case eACTOR_MOVE_TYPE_BOUNCE_Y:
            move_ActorY(&y,&f);
            Actors.facing[n]=f;
            break;
            case eACTOR_MOVE_TYPE_BOUNCE_X:
            move_ActorX(&x,&f);
            Actors.facing[n]=f;
            break;
        }

        if(bMoved){
            TilePut2x2(x,y,g);
            Actors.pos_x[n]=x;
            Actors.pos_y[n]=y;
            Actors.facing[n]=f;

            switch(f){
                case eFACING_DOWN:
                TileClrStripX(x,y-1,2);
                break;
                case eFACING_UP:
                TileClrStripX(x,y+2,2);
                break;
                case eFACING_RIGHT:
                TileClrStripY(x-1,y,2);
                break;
                case eFACING_LEFT:
                TileClrStripY(x+2,y,2);
                break;
            }
        }
    }
    ++Actors.nFrameID;
    if(Actors.nFrameID==2){
        Actors.nFrameID=0;
    }
}

void main(void)
{
    InitRand();
    SetTileData(GFX_TS_FONT,GFX_TC_FONT,myTiles);
    ClrScreen();

    TickTimer_init(&myAnimTimer,ANIM_DELAY);
    DISPLAY_ON;
    SHOW_BKG;

    initActors();
    // Loop forever
    while(1) {
        if(TickTimer_Update(&myAnimTimer)){
            TickTimer_Reset(&myAnimTimer);
            Move_Actors();
        }
        wait_vbl_done;

		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
