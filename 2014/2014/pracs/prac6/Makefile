prac6_sol.elf: prac6_sol.o
	arm-none-eabi-ld -Ttext=0x08000000 -o prac6_sol.elf prac6_sol.o
prac6_sol.o: prac6_sol.s
	arm-none-eabi-as -g -mcpu=cortex-m0 -mthumb -o prac6_sol.o prac6_sol.s
