#include <8051.h>
#include "preemptive.h"

__data __at (0x3A) char buffer;
__data __at (0x3B) char prod;
__data __at (0x3C) char full;


void Producer(void) {

        prod = 'A';
        while(1) {

            while(full){
                //ThreadYield();
            }
            __critical{
            buffer = prod;
            if(prod == 'Z') prod = 'A';
            else prod = prod + 1;
            full++;
            }
        }
}

void Consumer(void) {
        
        EA = 0;
        TMOD |= 0x20; // TMOD is also assigned by the (modified) Bootstrap code to set up the timer interrupt in timer-0 for preemption 
        TH1 = (char)-6;
        SCON = 0x50;
        TR1 = 1;
        EA = 1;
        TI = 1;
        while (1) {
                while( !full ){
                    //ThreadYield();
                }
                EA = 0;
                SBUF = buffer;
		full = 0;
                EA = 1;
                while(!TI){}
                TI = 0;
        }
}


void main(void) {
        full = 0;
        ThreadCreate(Producer);
        Consumer();
}

void _sdcc_gsinit_startup(void) {
        __asm
                ljmp  _Bootstrap
        __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1) {
        __asm
            ljmp _myTimer0Handler
        __endasm;
}


