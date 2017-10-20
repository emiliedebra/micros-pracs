AS = arm-none-eabi-as
ASFLAGS = -mcpu=cortex-m0 -mthumb -g

LD = arm-none-eabi-ld
LDFLAGS = -Ttext=0x08000000

OBJS = prac5_sol.o

prac5_sol.elf: $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $<
%.o: %.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f *.o *.elf
