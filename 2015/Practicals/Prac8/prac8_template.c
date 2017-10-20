include <stdint.h>

// change this function prototype to take appropriate arguments.
void find_closest_pair(void);  

int main(void) {
    uint16_t array[10];  // allocate 10 spaces on the stack
    // individually set those spaces to some values. The automarker will change these!
    array[0] =  123;
    array[1] =  234;
    array[2] =  345;
    array[3] =  400;
    array[4] =  700;
    array[5] =  899;
    array[6] = 1000; // your algorithm should find this...
    array[7] = 1024; // ... and this element. 
    array[8] = 2048;
    array[9] = 4444;

    // allocate two pointers. These pointers should be set to point to the smaller and
    // larger elements of the closest adjacent pair by the find_closest_pair function.
    uint16_t *closest_pair_smaller_ptr;
    uint16_t *closest_pair_larger_ptr;

    // change this to call find_closest_pair with the arguments you need
    // This should be the only change to main which you make!!
    find_closest_pair();

    // hang in an infinite loop doing nothing. 
    while(1) {
    }

}

// change my arguments as required, but don't change my return type!
void find_closest_pair(void) {
    // implement me!
}
