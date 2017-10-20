// WDXEMI001
// 2017 Prac Exam 1

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"
#include "libs.h"

// pattern array
uint8_t myArray[] = {0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7};
static int i = 0;

int main(void) {
  // initialise all inputs and outputs
  init_LEDPB();
  init_ADC();
  int PSC = 1; // change
  int ARR = 1; // change
  init_timer(ARR, PSC);
    while(1) {
      // necessary infinite loop
    }
}

void TIM6_IRQ(void) {
  // handle interrupt
  reset_timer();
}
