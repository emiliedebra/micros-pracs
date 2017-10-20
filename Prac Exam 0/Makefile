main.elf: main.o libs.o
	arm-none-eabi-ld -Ttext 0x08000000 -o main.elf main.o libs.o

main.o: prac_exam_0_template.s
	arm-none-eabi-as -g -o main.o prac_exam_0_template.s

libs.o: libs.s
	arm-none-eabi-as -g -o libs.o libs.s
