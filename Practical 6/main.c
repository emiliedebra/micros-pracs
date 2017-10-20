
//WDXEMI001 RCHCHA006
// Prac 6

#include <stdint.h>                                                                           // Include the standard data types

// declare variables
uint32_t RCC_AHBENR_IOPBEN = 0x60000;
uint32_t GPIOB_MODER_OUTPUT = 0x5555;
uint32_t PORTA_PUPDR = 0x55;
uint32_t PORTA_MODERIN = 0x28000000;

// declare methods
void delay(uint32_t length);
int8_t get_switch(void);
void freeze(void);

int main(void) {
  // enable RCC for leds and switches
  *(uint32_t*)0x40021014 |= RCC_AHBENR_IOPBEN;
  // set lower byte of GPIOB to outputs
  *(uint32_t*)0x48000400 |= GPIOB_MODER_OUTPUT;
  // configure switches
  *(uint32_t*)(0x48000000 + 12) |= PORTA_PUPDR;
  *(uint32_t*)0x48000000 = PORTA_MODERIN;
  // display 0xAA
  *(uint32_t*)0x48000414 = 0xAA;
  uint32_t array[4] = {170, 255, 85, 0};

  while(1) {
    // loop through array values while checking switches and delaying
    // chucked in a couple freeze checks here - not sure if that is redundant
    *((uint32_t*)0x48000400 + 5) = array[0];
    freeze();
    delay(1000);
    *((uint32_t*)0x48000400 + 5) = array[1];
    freeze();
    delay(1000);
    *((uint32_t*)0x48000400 + 5) = array[2];
    freeze();
    delay(1000);
    *((uint32_t*)0x48000400 + 5) = array[3];
    freeze();
    delay(1000);
  }
  return 0;
}

void delay(uint32_t length) {
  uint32_t i;
  length = length*120; // scaling to get 1ms input parameter
  // loop to waste time and continuously check for button presses
  for (i = 0 ; i <= length;) {
    freeze();
    i++;
  }
}

void freeze(void) {
  // checks switch and keeps looping while it is pressed
  while (get_switch() == 0) {
  }
}

int8_t get_switch(void) {
  // checks for switch 1 by ANDing the result with 0x2, if result = 0, button is pressed
  uint8_t result = 0;
  result = *(uint32_t*)(0x48000000 + 16) & 0x2;
  return result;
}
