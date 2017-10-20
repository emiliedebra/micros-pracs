// WDXEMI001 RCHCHA006
// Prac7

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
// include library header file(s) here if appropriate.
uint8_t patterns0[] = {0x7b, 0x18, 0x3f, 0x21, 0x02, 0x70, 0x06, 0x0c, 0x7d, 0x31, 0x4d, 0x73};
uint8_t patterns1[] = {0x00, 0x01, 0x02, 0x05, 0x0A, 0x15, 0x2A, 0x55};
int32_t outOfOrder[] = {0x26d, 0x309, 0xc73, 0xc42, 0xe1f, 0x235, 0x166, 0x2ef, 0xcf5};
// declare variables
uint32_t RCC_AHBENR_IOPBEN = 0x60000;
uint32_t GPIOB_MODER_OUTPUT = 0x5555;
uint32_t PORTA_PUPDR = 0x55;
uint32_t PORTA_MODERIN = 0x28000000;
// change this function prototype to take appropriate arguments.
void find_best_pair(uint8_t patterns0[], int length1, uint8_t patterns1[], int length2, uint8_t **largest, uint8_t **smallest);
int8_t get_switch(void);
void delay(uint32_t length);
void freeze(void);

// DO NOT CHANGE THESE ARRAYS. The marker will change the values *AND LENGTH* at compile time.

//int32_t outOfOrder[] = {0x05, 0x02, 0x00};

int main(void) {
// Initialisations //
  	// enable RCC for leds and switches
    RCC->AHBENR |= RCC_AHBENR_IOPBEN;
    // set lower byte of GPIOB to outputs
    GPIOB->MODER |= GPIOB_MODER_OUTPUT;
    // configure switches
    GPIOA->PUPDR|= PORTA_PUPDR;
    GPIOA->MODER |= PORTA_MODERIN;

    // enable clock for ADC
    RCC->APB2ENR |= (0b1000000000);
    // enable ADC
    ADC1->CR |= 0b1;
    // wait for ADC ready
    while( (ADC1->ISR & (1 << 0)) == 0);
    // set ADC channel for POT 0
    ADC1->CHSELR = 0b100000;
    // set resolution to 8 bit
    ADC1->CFGR1 |= 0b010000;
  	// Allocate two pointers. These pointers should be set to point to the largest
  	// and smallest element in either array.
  	// At marking time, it is possible that the smallest element is in pattens0 and
  	// the largest in patterns1 (or vice versa). It is also possible that the smallest
  	// and largest elements are in one array.
		//uint8_t max = 0;
		//uint8_t min = 0x7FFFFFFF;
    static uint8_t *largest_of_the_two_ptr = patterns0;
    static uint8_t *smallest_of_the_two_ptr = patterns0;


// Code //
    // Part 1
    find_best_pair(patterns0, sizeof(patterns0), patterns1, sizeof(patterns1), &largest_of_the_two_ptr, &smallest_of_the_two_ptr);

    // Part 2
    int i = 0;
    int j = 0;
    int32_t temp = 0;
    while (i < sizeof(outOfOrder)/4) {
      j = i;
      while (j < sizeof(outOfOrder)/4) {
        if (outOfOrder[i] > outOfOrder[j]) {
          temp = outOfOrder[i];
          outOfOrder[i] = outOfOrder[j];
          outOfOrder[j] = temp;
        }
        j++;
      }
      i++;
    }

    // Part 3 and 4
    i = 0;
    j = 0;
    uint8_t current_state = 1; // state0
    uint8_t previous_state = 0; // state 1
    uint8_t current_state1 = 1; // state 2
    uint8_t previous_state1 = 0; // state 3
    while(1) {
      uint32_t input = GPIOA->IDR;
      previous_state = input&0b1;
      previous_state1 = input&0b10;
      // check switch 0
      if ((previous_state == 0b0) && (current_state == 1)) {
        if (i == sizeof(patterns0)) {
          i = 0;
        }
        GPIOB->ODR = patterns0[i];
        i++;
      }
      current_state = previous_state;

      // check switch 1
      if ((previous_state1 == 0b00) && (current_state1 == 0b10)) {
        if (j == sizeof(patterns1)) {
          j = 0;
        }
        GPIOB->ODR = patterns1[j];
        j++;
      }
      current_state1 = previous_state1;
      int k = 0;
      for(k = 0; k <= 14545; k++) {
      };

      // check switch 2
      if (get_switch() == 0) {
        // kick off conversion
        ADC1->CR |= (1 << 2);
        // wait for conversion complete.
        while( (ADC1->ISR & (1 << 2)) == 0) {
          // do nothing
        };
        GPIOB->ODR = 0xFF - ADC1->DR;
    }

    }
    return 0;  // keep compiler happy with a return code.

}

// Used to check switch 2
int8_t get_switch(void) {
  // checks for switch 2 by ANDing the result with 0x4, if result = 0, button is pressed
  uint8_t result = 0;
  result = GPIOA->IDR&0b100;
  return result;
}

// Part 1 Definition
void find_best_pair(uint8_t *patterns0, int length1, uint8_t *patterns1, int length2, uint8_t **largest, uint8_t **smallest) {
  // check max in patterns0
  *largest = patterns0;
  *smallest = patterns0;

  int i = 0;
  while(i < length1) {
    if (**largest < patterns0[i]) {
      *largest = &patterns0[i];
    }
    i++;
  }

  // check max in patterns1
  i = 0;
  while(i < length2) {
    if (**largest < patterns1[i]) {
      *largest = &patterns1[i];
    }
    i++;
  }

  // check min in patterns0
  i = 0;
  while(i < length1) {
    if (**smallest > patterns0[i]) {
      *smallest = &patterns0[i];
    }
    i++;
  }

  // check min in patterns1
  i = 0;
  while(i < length2) {
    if (**smallest > patterns1[i]) {
      *smallest = &patterns1[i];
    }
    i++;
  }
}

void delay(uint32_t length) {
  uint32_t i;
  length = length*120; // scaling to get 1ms input parameter
  // loop to waste time and continuously check for button presses
  for (i = 0 ; i <= length;) {
    i++;
  }
}

void freeze(void) {
  // checks switch and keeps looping while it is pressed
}
