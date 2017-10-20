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
  display(0);
  init_ADC();
  int PSC = 254; // change
  int ARR = 15685; // change
  init_timer(ARR, PSC);
  uint8_t current_state = 1;
  uint8_t previous_state = 0;
  while(1) {
    uint32_t input = GPIOA->IDR;
    previous_state = input&0b10;
    // check switch x
    if ((previous_state == 0b0) && (current_state == 2)) {
      if (i == sizeof(myArray)) {
        i = 0;
      }
      i++;
      GPIOB->ODR = myArray[i];
    }
    current_state = previous_state;

    // delay
    int k = 0;
    for(k = 0; k <= 14545; k++) {
    };
  }
}

void TIM6_IRQ(void) {
  uint8_t value = 0;
  if (get_switch(8) == 0) {
    setPSC(50);
    uint8_t pot1 = getPOT(1);
    value = pot1;
    if (GPIOB->ODR == 0) {
      GPIOB->ODR = value;
    }
    else {
      GPIOB->ODR = 0;
    }
  }
  if (get_switch(4) == 0) {
    if (i == 0) {
      i = sizeof(myArray);
    }
    i--;
    GPIOB->ODR = myArray[i];
  }

  if (get_switch(1) == 0) {
    if (i == sizeof(myArray)) {
      i = 0;
    }
    i++;
    GPIOB->ODR = myArray[i];
  }
  reset_timer();
}
