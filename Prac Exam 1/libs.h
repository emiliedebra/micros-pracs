#ifndef __LIBS_H_
#define __LIBS_H_

#include <stdint.h>

//Prototypes
void init_LEDPB(void);
void init_ADC(void);
void init_timer(uint16_t userARR, uint16_t userPSC);

void display(int);
int8_t get_switch(int switch_number);
void switch_function(void);

void find_min_max(uint8_t *array, int length, uint8_t **max, uint8_t **min);

uint8_t getPOT(uint8_t POT);

void reset_timer(void);
uint16_t getPSC(void);
void setPSC(uint16_t value);
uint16_t getARR(void);
void setARR(uint16_t value);
#endif
