DEVICE = atmega328p
PROGRAMMER = arduino
BITCLOCK = 0.5
PORT = /dev/ttyACM0
BAUD = 115200
FREQ = 16m

AVR = avr-gcc
AVRHEX = avr-objcopy
AVRDUDE = avrdude

AVRFLAGS = -mmcu=$(DEVICE) -Os -g
AVRHEXFLAGS = -O ihex
AVRDUDEFLAGS = -p $(DEVICE) -c $(PROGRAMMER) -B $(BITCLOCK) -b $(BAUD) -P $(PORT) -D

EXEC = main

BIN = $(wildcard *.S)
OBJFILES = $(BIN:.S=.o)

HEX = $(EXEC).hex

all: $(HEX)

%.o: %.S
	$(AVR) $(AVRFLAGS) -c $< -o $@

$(EXEC).elf: $(OBJFILES)
	$(AVR) $(AVRFLAGS) -o $@ $^
	avr-objdump -D -S $@ > $(EXEC).asm

%.hex: $(EXEC).elf
	$(AVRHEX) $(AVRHEXFLAGS) $^ $@

gdb: $(EXEC).elf
	avr-gdb -q -s $< -ex 'target remote 127.0.0.1:1234'

gdb-sim: $(EXEC).hex
	simavr -f $(FREQ) -m $(DEVICE) $< --gdb

upload: all
	$(AVRDUDE) $(AVRDUDEFLAGS) -U flash:w:$(HEX).hex:i

clean: 
	rm -f *.hex *.elf *.o *.asm

.PHONY: clean
