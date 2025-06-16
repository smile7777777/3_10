#
# makefile for testing preemptive multithreading
#
# This assumes you have SDCC installed and this targets EdSim51.
# The generated .hex file should be one that can be loaded and run
# directly.
#
# Author: Pai Chou
# CS 3423 Fall 2018
#

CC = sdcc
CFLAGS = -c  --model-small
LDFLAGS = 
#--stack-after-data --stack-loc 0x39 --data-loc 0x20
LCD_OBJ = dino.rel preemptive.rel lcdlib.rel buttonlib.rel keylib.rel

all: dino.hex

dino.hex:	$(LCD_OBJ)
				$(CC) $(LDFLAGS)-o dino.hex $(LCD_OBJ)

clean:
	rm *.hex *.ihx *.lnk *.lst *.map *.mem *.rel *.rst *.sym

%.rel:  %.c    preemptive.h Makefile
	$(CC) $(CFLAGS) $<