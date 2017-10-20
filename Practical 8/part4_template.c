// WDXEMI001 RCHCHA006
// Prac Exam 1 Part 4 Solution 2015-10-16

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
// include library header file(s) here if appropriate.
#include "libs.h"
// DO NOT CHANGE THIS ARRAY. The marker will change the values but *not* the length at compile time.
static uint8_t led_patterns[] = {0x00, 0x81, 0xC3, 0xE7, 0xFF, 0x7E, 0x3C, 0x18, 0x00};

int main(void) {
    // initialisations here
    initialise();
    initialise_ADC();
    // hang in an infinite loop
    while(1) {
      uint8_t result = getPOT(0);
      if (0 <= result && result < 28) {
        GPIOB->ODR = led_patterns[0];
      }
      else if (28 <= result && result < 57) {
        GPIOB->ODR = led_patterns[1];
      }
      else if (57 <= result && result < 85) {
        GPIOB->ODR = led_patterns[2];
      }
      else if (85 <= result && result < 114) {
        GPIOB->ODR = led_patterns[3];
      }
      else if (114 <= result && result < 142) {
        GPIOB->ODR = led_patterns[4];
      }
      else if (142 <= result && result < 171) {
        GPIOB->ODR = led_patterns[5];
      }
      else if (171 <= result && result < 199) {
        GPIOB->ODR = led_patterns[6];
      }
      else if (199 <= result && result < 228) {
        GPIOB->ODR = led_patterns[7];
      }
      else if (228 <= result && result < 256) {
        GPIOB->ODR = led_patterns[8];
      }

    }
    return 0;  // keep compiler happy with a return code.

}
