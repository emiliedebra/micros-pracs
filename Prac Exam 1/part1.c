// WDXEMI001
// Prac Exam 1 Part 1 Template 2017-10-18

#include <stdint.h>
#include <stdlib.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
#include "libs.h"  // include library header file(s) here if appropriate.

// DO NOT CHANGE THIS ARRAY. The marker will change the values *AND LENGTH* at compile time.
int8_t myArray[] = {0x48, 0x8c, 0xb6, 0x97, 0x56, 0x8b, 0x8e, 0x9d, 0x01,
0xd9, 0x4e, 0x69, 0x20, 0x8d, 0x5a, 0xfe, 0x46, 0xea, 0xaa, 0x58};
int main(void) {
    // Initialisations
		// initialise all inputs and outputs
	  init_LEDPB();
	  //	init_ADC();
		// int PSC = 1; // change
	  // int ARR = 1; // change
    // Find max and min
		// check max in myArray
	  int8_t min;
	  int8_t max;
		int8_t add;
		int8_t absolute;
	  // check for max
	  int i = 0;
	  while(i < sizeof(myArray)) {
	    if (max < myArray[i]) {
	      max = myArray[i];
	    }
	    i++;
	  }

	  // check for min
	  i = 0;
	  while(i < sizeof(myArray)) {
	    if (min > myArray[i]) {
	      min = myArray[i];
	    }
	    i++;
	  }

		add = max + min;
		absolute = abs(add);
		int8_t current_LED = 0;
    // hang in an infinite loop
    while(1) {
			uint8_t current_state = 1;
		  uint8_t previous_state = 0;
		  while(1) {
		    uint32_t input = GPIOA->IDR;
		    previous_state = input&0b1; /*x*/
		    // check switch x
		    if ((previous_state == 0b1) && (current_state == 0 /*x*/)) { // NB: swap the switch_number and 0 if it requires when button is RELEASED
					if (current_LED == 0) {
						display(add);
						current_LED = add;
					}
					else if (current_LED == add) {
						display(absolute);
						current_LED = absolute;
					}
					else {
						display(add);
						current_LED = add;
					}
		    }
		    current_state = previous_state;

		    // delay
		    int k = 0;
		    for(k = 0; k <= 14545; k++) {
		    };
		  }
		// Toggle on SWO presses between
		// |max + min| and max + min
		// Debounce at 20ms

    }
    return 0;  // keep compiler happy with a return code.

}

void TIM6_IRQ(void) {
  // handle interrupt
  reset_timer();
}
void TIM14_IRQ(void) {
  // handle interrupt
  reset_timer();
}
