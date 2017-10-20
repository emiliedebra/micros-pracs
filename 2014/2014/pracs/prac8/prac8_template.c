#include <stdint.h>

#define EVER ;;

// declaration (ie: function prototype) for find_min_max function should be placed here.

// declaration for delay function here (if you decide to use a function)

void main(void) {
    // define and initialise an array of int8_t's called array
    // define and initialise a int8_t called min
    // define and initialsie a int8_t called max

    // call find_min_max here, thereby getting the function to modify min and max to the correct values

    // initialise pins connected to LEDs

    for(EVER) {
        // display max on the LEDs
        // delay for 1 s, possibly by calling delay function
        // display min on the LEDs
        // delay for 1 s
    }
}

// define find_min_max here. Should take arguments as specified in prac sheet.
    // for each element in the array:
        // comare the value of the element to data pointed to by max_ptr
            // if greater: set data at max_ptr to be the value in the array
        // compare the value of the element to data pointed to by min_ptr
            // is smaller: set data at min_ptr to be the value in the array
