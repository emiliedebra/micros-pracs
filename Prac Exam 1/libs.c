#include "libs.h"
#define STM32F051
#include "stm32f0xx.h"

// declare variables
uint32_t RCC_AHBENR_IOPBEN = 0x60000;
uint32_t GPIOB_MODER_OUTPUT = 0x5555;
uint32_t PORTA_PUPDR = 0x55;
uint32_t PORTA_MODERIN = 0x28000000;

// ========== Initialisations ============= //

void init_LEDPB(void) {
  // enable RCC for leds and switches
  RCC->AHBENR |= RCC_AHBENR_IOPBEN;
  // set lower byte of GPIOB to outputs
  GPIOB->MODER |= GPIOB_MODER_OUTPUT;
  // configure switches
  GPIOA->PUPDR|= PORTA_PUPDR;
  GPIOA->MODER |= PORTA_MODERIN;
}

// If there is a delay required, make variables and pass these through the initiliasation
// Add POT input to the actual variable and reset the PSC
void init_timer(uint16_t userARR, uint16_t userPSC) { // Initialise the TIM6 given ARR and PSC
  RCC->APB1ENR |= RCC_APB1ENR_TIM14EN;
  TIM14->ARR = userARR;
  TIM14->PSC = userPSC;
  TIM14->DIER |= 0b1;     // set UIE: update interrupt enable on overflow
  *(uint32_t*)(0xE000E100) |= 0b10000000000000000000; // Enable the TIM6 interrupt handling in the NVIC                              // NEED TO CHECK THIS WORKS!
  TIM14->CR1 |= (1 << 7); // Enable the timer!
  TIM14->CR1 |= 0b1; // Enable the timer!
}

void init_ADC(void) { //== Initialise the ADC for Potentiometers (PA5 and PA6) [POT, NUMBER OF BITS]
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN;  // Enable clock for GPIOA
  RCC->APB2ENR |= RCC_APB2ENR_ADCEN;  // Enable the clock for ADC1
  GPIOA->MODER |= (GPIO_MODER_MODER5 + GPIO_MODER_MODER6);  // Set PA5 and PA6 to ANALOG MODE
  ADC1->CFGR1 |= (ADC_CFGR1_RES_1);
  ADC1->CR |= ADC_CR_ADEN;  // Enable the ADC1
  while (!(ADC1->ISR && ADC_ISR_ADRDY));  // Wait for ADC to become ready

}

// ================= LED, PB Functions ================ //

void display(int number) {
  GPIOB->ODR = number;
}

// Used to check switch HELD
// NB: switch_number should hold the decimal equivalent to the binary pin of the switch
// ie, switch 2 is 0b100 = 4
int8_t get_switch(int switch_number) {
  uint8_t result = 0;
  result = GPIOA->IDR&switch_number;
  if (result == 0) {
    return 1;
  }
  else {
    return 0;
  }
}

// Used to check if switch PRESSED
// NB: this is a template function, don't import from libs, rather copy and paste and remember to change where marked x
// currently checking sw0
void switch_function(void) {
  uint8_t current_state = 1;
  uint8_t previous_state = 0;
  while(1) {
    uint32_t input = GPIOA->IDR;
    previous_state = input&0b1; /*x*/
    // check switch x
    if ((previous_state == 0b0) && (current_state == 1 /*x*/)) { // NB: swap the switch_number and 0 if it requires when button is RELEASED
      // do something
    }
    current_state = previous_state;

    // delay
    int k = 0;
    for(k = 0; k <= 14545; k++) {
    };
  }
}

// =============== Data Handling =============== //

// takes in two double pointers, sets original pointers defined outside main
void find_min_max(uint8_t *array, int length, uint8_t **max, uint8_t **min) {
  // check max in array
  *max = array;
  *min = array;

  // check for max
  int i = 0;
  while(i < length) {
    if (**max < array[i]) {
      *max = &array[i];
    }
    i++;
  }

  // check for min
  i = 0;
  while(i < length) {
    if (**min > array[i]) {
      *min = &array[i];
    }
    i++;
  }
}

// ================ POT Handling ============== //

uint8_t getPOT(uint8_t POT) {
  uint8_t result = 0;
  ADC1->CR &= ~ADC_CR_ADEN;  // Disable the ADC for channel selection change
  if (POT == 0) {
    ADC1->CHSELR &= ~ADC_CHSELR_CHSEL6;  // Make sure channel is not on CHANNEL 6
    ADC1->CHSELR |= ADC_CHSELR_CHSEL5;  // Select ADC channel as CHANNEL 5

  } else if (POT == 1) {
    ADC1->CHSELR &= ~ADC_CHSELR_CHSEL5;  // Make sure channel is not on CHANNEL 5
    ADC1->CHSELR |= ADC_CHSELR_CHSEL6;  // Select ADC channel as CHANNEL 6

  }
  ADC1->CR |= ADC_CR_ADEN;  // Enable the ADC1
  while (!(ADC1->ISR && ADC_ISR_ADRDY));  // Wait for ADC to become ready
  ADC1->CR |= ADC_CR_ADSTART; // Start a conversion
  while (ADC1->IER && ADC_IER_EOCIE); // Wait for end of conversion
  result = ADC1->DR;  // Collect the input!

  return result;
}

// =============== Timer Handling =============== //
void reset_timer(void) {
  TIM14 -> SR &= ~(1 << 0); // Clear the interrupt flag bit
}

uint16_t getPSC(void) {
  return TIM14->PSC;
}
void setPSC(uint16_t value) {
  TIM14->PSC = value;
}

uint16_t getARR(void) {
  return TIM14->ARR;
}
void setARR(uint16_t value) {
  TIM14->ARR = value;
}
