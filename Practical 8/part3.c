// WDXEMI001 RCHCHA006
// Prac8

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"
#include "libs.h"

uint16_t PSC = 69;
uint16_t ARR = 34509;

int main(void) {
  // initialise all inputs and outputs
  initialise();
  initialise_ADC();
  initialise_timer(ARR, PSC);
  // display initial value
  display(0x0);
  while(1) {
    uint16_t POT0 = getPOT(0);
    uint16_t POT1 = getPOT(1);
    uint16_t POTValue;
    if (POT0 > POT1) {
      POTValue = POT0;
    }
    else {
      POTValue = POT1;
    }
    TIM6->PSC = PSC+2*POTValue;
  };

}

void TIM6_IRQ(void) {
  reset_timer();
  uint8_t current = GPIOB->IDR;
  display((current + 1)&0xFF);
}
