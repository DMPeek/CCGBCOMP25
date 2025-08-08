#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h> // allows use of printf


void main(void)
{

    uint8_t pButtons;

    printf("Press any button...");
    
    while(1) {

        pButtons = joypad();

        if (pButtons & J_A) {
            printf("A");
        }
        if (pButtons & J_B) {
            printf("B");
        }
        if (pButtons & J_UP) {
            printf("U");
        }
        if (pButtons & J_DOWN) {
            printf("D");
        }
        if (pButtons & J_LEFT) {
            printf("L");
        }
        if (pButtons & J_RIGHT) {
            printf("R");
        }
        if (pButtons & J_START) {
            printf("Start");
        }
        if (pButtons & J_SELECT) {
            printf("Select");
        }

        printf("\n");

        while (pButtons == joypad()); // this allows you to only have one input per button press. not efficient.

		// Game main loop processing goes here
        wait_vbl_done();

		// Done processing, yield CPU and wait for start of next frame
        vsync();
    }
}
