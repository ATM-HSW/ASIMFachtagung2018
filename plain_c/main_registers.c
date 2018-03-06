#include "stm32f072xb.h" 

int main(void)
{
  uint32_t counter = 0;

  RCC->AHBENR |= RCC_AHBENR_GPIOAEN ;  // enable clock for GPIOA
  GPIOA->MODER |= GPIO_MODER_MODER5_0; // configure pin as general purpose output

	while(1) {   
    GPIOA->BSRR = GPIO_BSRR_BS_5;      // set high state of the GPIO PA5
    counter = 200000;
    while(counter--) ;

    GPIOA->BSRR = GPIO_BSRR_BR_5;      // set low state of the GPIO PA5
    counter = 200000;
    while(counter--) ;
  }
}
