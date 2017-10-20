main.elf: main.o stm32f0_startup.o libs.o
	arm-none-eabi-ld -T stm32f051.ld -o main.elf main.o stm32f0_startup.o libs.o

main.s: main.c
	arm-none-eabi-gcc -g -Wall -mthumb -mcpu=cortex-m0 -S -o main.s main.c

main.o: main.s
	arm-none-eabi-as -mthumb -mcpu=cortex-m0 -g -o main.o main.s

libs.s: libs.c
	arm-none-eabi-gcc -g -Wall -mthumb -mcpu=cortex-m0 -S -o libs.s libs.c

libs.o: libs.s
	arm-none-eabi-as -mthumb -mcpu=cortex-m0 -g -o libs.o libs.s

stm32f0_startup.o: stm32f0_startup.s
	arm-none-eabi-as -mthumb -mcpu=cortex-m0 -g -o stm32f0_startup.o stm32f0_startup.s

.PHONY: clean
clean:
	rm -f *.o *.elf main.s
