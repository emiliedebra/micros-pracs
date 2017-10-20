// WDXEMI001
// Prac Exam 1 Part 3 2017-01-18

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"
#include "libs.h"


static uint8_t ledValue = 0;

int main(void) {
  // initialise all inputs and outputs
  init_LEDPB();
  init_ADC();
  int PSC = 50; // change
  int ARR = 62744; // change
  init_timer(ARR, PSC);
  display(0);
    while(1) {
      uint8_t pot1 = getPOT(1);
      setPSC(PSC+pot1);
    }
}

void TIM6_IRQ(void) {
  ledValue++;
  display(ledValue);
  reset_timer();
}

void TIM14_IRQ(void) {
  ledValue++;
  display(ledValue);
  reset_timer();
}
