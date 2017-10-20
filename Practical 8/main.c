// WDXEMI001 RCHCHA006
// Prac8

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"
#include "libs.h"

int main(void) {
  // initialise all inputs and outputs
  initialise();
  // display initial value
  display(0x0A);
  // increment on button press
  switch_function();
  // safety while loop
  while(1);
}
void TIM6_IRQ(void) {

}
