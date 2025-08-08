#include <gb/gb.h>
#include <stdint.h>


typedef unsigned char u8;
const u8 const smileyFaces[]= {
    0,60,0,126,0,219,0,255,0,219,0,231,0,126,0,60
};

//testing the 0-3 color scale in gb with invader code, rows are lightest to darkest setups
const u8 const invader[]= {
    // 60,0,126,0,90,0,90,0,126,0,36,0,36,0,66,0
    // 0,60,0,126,0,90,0,90,0,126,0,36,0,36,0,66
    60,60,126,126,90,90,90,90,126,126,36,36,36,36,66,66
};

void main(void)
{
    set_bkg_2bpp_data(1,1,smileyFaces);
    set_bkg_2bpp_data(2,1,invader);
    DISPLAY_ON;
    SHOW_BKG;

    u8 x;
    for (x=0;x<20;++x) {
        set_tile_xy(x,0,1);
    }
    for (x=0;x<20;++x) {
        set_tile_xy(x,17,2);
    }

    u8 y;
    for (y=0;y<18;++y) {
        set_tile_xy(0,y,1);
    }
    for (y=0;y<18;++y) {
        set_tile_xy(19,y,2);
    }

    u8 split = 10;
    u8 y4 = 4;
    for (x=0;x<20;++x) {
        if(x<split) {
            set_tile_xy(x,y4,1);
        } else {
            set_tile_xy(x,4,2);
        }
    }
    u8 y8 = 8;
    for (x=0;x<20;++x) {
        if (x % 2 == 0) {
            set_tile_xy(x,y8,1);
        } else {
            set_tile_xy(x,8,2);
        }
    }

    u8 y12 = 12;
    for (x=0;x<20;++x) {
        if (x < 5 || x > 14) {
            set_tile_xy(x,y12,2);
        } else {
            set_tile_xy(x,12,1);
        }
    }
    // Loop forever
    while(1) {
    

		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
