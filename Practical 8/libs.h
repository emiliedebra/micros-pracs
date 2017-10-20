#ifndef __LIBS_H_
#define __LIBS_H_

#include <stdint.h>

//Prototypes
void initialise(void);
uint8_t getPOT(uint8_t POT);
void initialise_ADC(void);
void reset_timer(void);
void initialise_timer(uint16_t userARR, uint16_t userPSC);
void display(int);
void switch_function(void);
int8_t get_switch(void);
void find_min_max(uint8_t *array, int length, uint8_t **max, uint8_t **min);
#endif
