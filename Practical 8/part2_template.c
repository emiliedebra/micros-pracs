// STDNUM001
// Prac Exam 1 Part 2 Solution 2015-10-16

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
// include library header file(s) here if appropriate.
#include "libs.h"

// DO NOT CHANGE THIS ARRAY. The marker will change the values *AND LENGTH* at compile time.
uint8_t myArray[] = {0x42, 0x69, 0x12, 0xCC, 0xBB, 0x55, 0xA1, 0x33, 0x1A, 0xDF, 0x56};

int main(void) {
    // initialisations here
    initialise();
    // suggestion: find and store the largest value and smallest value in the array here.
    static uint8_t *largest = myArray;
    static uint8_t *smallest = myArray;
    find_min_max(myArray, sizeof(myArray), &largest, &smallest);
    // hang in an infinite loop
    while(1) {
        if (get_switch() == 0) {
          display(*smallest);
        }
        else {
          display(*largest);
        }
  }
  return 0;  // keep compiler happy with a return code.
}
