// WDXEMI001
// Prac Exam 1 Part 2 Template 2017-01-18

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
#include "libs.h"    // include library header file(s) here if appropriate.

// DO NOT CHANGE THIS ARRAY. The marker will change the values at compile time.
uint8_t myArray[] = {0x7b, 0x18, 0x3f, 0x21, 0x02, 0x70, 0x06, 0xff};

int main(void) {
    // initialisations here
    init_LEDPB();
    init_ADC();
    // hang in an infinite loop
    while(1) {
      uint8_t pot0 = getPOT(0);
      if (pot0 > 128) {
        display(pot0);
      }
      else if (112 < pot0 && pot0 <= 128 ) {
        display(myArray[7]);

      }
      else if (96 < pot0 && pot0 <= 112) {
        display(myArray[6]);

      }
      else if (80 < pot0 && pot0 <= 96) {
        display(myArray[5]);

      }
      else if (64 < pot0 && pot0 <= 80) {
        display(myArray[4]);

      }
      else if (48 < pot0 && pot0 <= 64) {
        display(myArray[3]);

      }
      else if (32 < pot0 && pot0 <= 48) {
        display(myArray[2]);

      }
      else if (16 < pot0 && pot0 <= 32) {
        display(myArray[1]);

      }
      else {
        display(myArray[0]);
      }

    }
    return 0;  // keep compiler happy with a return code.

}

void TIM6_IRQ(void) {
  // handle interrupt
  reset_timer();
}
void TIM14_IRQ(void) {
  // handle interrupt
  reset_timer();
}
