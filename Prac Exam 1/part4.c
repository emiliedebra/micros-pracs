// WDXEMI001
// 2017 Prac Exam 1

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"
#include "libs.h"

// pattern array
uint8_t myArray[] = {0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7};
//static int i = 0;

int main(void) {
  // initialise all inputs and outputs
  init_LEDPB();
  //init_ADC();
  //init_timer(ARR, PSC);
  uint8_t sw0;
  uint8_t sw1;
  uint8_t sw2;
  uint8_t sw3;
    while(1) {
      sw0 = get_switch(1);
      sw1 = get_switch(2);
      sw2 = get_switch(4);
      sw3 = get_switch(8);
      uint8_t number = (sw0*15) + (sw1*24) + (56*sw2) + (111*sw3);
      display(number);
    }
}

void TIM6_IRQ(void) {
  // handle interrupt
  reset_timer();
}

void TIM14_IRQ(void) {
  // handle interrupt
  reset_timer();
}
