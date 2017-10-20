//STDNUM001 STDNUM002

#include <stdint.h>
#include "stm32f0xx.h"

#define EVER ;;

int main(void) {
    uint16_t prev_state, curr_state;
    uint32_t deb_cnt;

    // enable clock for GPIOA
    RCC->AHBENR |= (1 << 17);
    // configure GPIOA pull-ups
    GPIOA->PUPDR = 0b01010101;
    // set pin connected to **POT1** (PA6) to be in analogue mode
    //GPIOA->MODER |= (0b11 << 12);

    // enable clock for GPIOB
    RCC->AHBENR |= (1 << 18);
    // set GPIOB[0-7] as outputs
    GPIOB->MODER = 0b0101010101010101;

    // enable clock for ADC
    RCC->APB2ENR |= (1 << 9);
    // enable ADC
    ADC1->CR |= (1 << 0);
    // wait for ADC ready
    while( (ADC1->ISR & (1 << 0)) == 0);
    // set ADC channel for **POT0** = PA5 = channel 5
    ADC1->CHSELR = (1 << 5);
    ADC1->CFGR1 |= (0b10 << 3); //8-bit mode

    RCC->APB1ENR |= (1 << 4);
    TIM6->PSC = 11764;
    TIM6->ARR = 340;
    TIM6->DIER |= (1 << 0);     // set UIE: update interrupt enable on overflow
    TIM6->CR1 |= (1 << 0);      // set CEN: start counter counting
          
    NVIC->ISER[0] |= (1 << 17); // unmask TIM6_DAC IRQ
    
    prev_state = GPIOA->IDR & (1 << 2);

    GPIOB->ODR = 0xF0;
    
    for(EVER) {
        if ( (GPIOA->IDR & (1<<0)) == 0) {
            // set ADC channel for **POT0** = PA5 = channel 5
            ADC1->CHSELR = (1 << 5); //pot 0
            ADC1->CR |= (1 << 2);  // start conversion
            while ( (ADC1->ISR & (1 << 2)) == 0);
            GPIOB->ODR = ADC1->DR;
        }

        if ((GPIOA->IDR & (1 << 3)) == 0) {
            uint8_t pot0, pot1;
            ADC1->CHSELR = (1 << 5); //pot 0
            ADC1->CR |= (1 << 2);  // start conversion
            while ( (ADC1->ISR & (1 << 2)) == 0);
            pot0 = ADC1->DR;
            ADC1->CHSELR = (1 << 6); //pot 0
            ADC1->CR |= (1 << 2);  // start conversion
            while ( (ADC1->ISR & (1 << 2)) == 0);
            pot1 = ADC1->DR;
            if (pot0 > pot1) {
                GPIOB->ODR = pot0 - pot1;
            } else {
                GPIOB->ODR = pot1 - pot0;
            }
        }

        curr_state = GPIOA->IDR & (1 << 2);
        if (curr_state == 0 && prev_state != 0) {
            GPIOB->ODR += 2;
        }
        prev_state = curr_state;
        for(deb_cnt = 0; deb_cnt < 15000; ++deb_cnt);

    }
    return 0;  // keep compiler happy. 
}

void TIM6_DAC_IRQHandler(void) {
    TIM6->SR &= ~(1 << 0);      // acknowledge IRQ by clearing 'Update interrupt flag'

    if ( (GPIOA->IDR & (1 << 1)) == 0) {
        GPIOB->ODR -= 1;  
    }

    ADC1->CHSELR = (1 << 5); //pot 0
    ADC1->CR |= (1 << 2);  // start conversion
    while ( (ADC1->ISR & (1 << 2)) == 0);
    TIM6->ARR =  85 + ADC1->DR;

}
