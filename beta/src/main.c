#include "main.h"
#include <stdio.h>


void main()
{
    uint8_t mButtons;

    printf("Hello");

     // Show background
     SHOW_BKG;
     DISPLAY_ON;

     while (1)
     {
        
        mButtons = joypad();

        if (mButtons & J_A)
            printf("A");//splashscreen();
        if (mButtons & J_B)
            printf("B");//testscreen();
        //   wait_vbl_done();
        
     }
}
