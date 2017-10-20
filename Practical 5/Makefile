main.elf: main.o
	arm-none-eabi-ld -Ttext 0x08000000 -o main.elf main.o

main.o: main.s
	arm-none-eabi-as -g -o main.o main.s
