AS = arm-none-eabi-as
ASFLAGS = -mcpu=cortex-m0 -mthumb -g

LD = arm-none-eabi-ld
LDFLAGS = -Ttext=0x08000000

prac4_sol.elf: prac4_sol.o
	$(LD) $(LDFLAGS) -o $@ $<
%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f *.o *.elf
