main.elf: main.o stm32f0_startup.o
	arm-none-eabi-ld -T stm32f051.ld -o main.elf main.o stm32f0_startup.o

stm32f0_startup.o: stm32f0_startup.s
	arm-none-eabi-as -mthumb -mcpu=cortex-m0 -g -o stm32f0_startup.o stm32f0_startup.s

main.o: main.s
	arm-none-eabi-as -mthumb -mcpu=cortex-m0 -g -o main.o main.s

main.s: main.c
	arm-none-eabi-gcc -g -mthumb -mcpu=cortex-m0 -S -o main.s main.c
