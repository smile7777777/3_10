#include <8051.h>
#include "cooperative.h"

__data __at (0x38) char sharedBuffer;   
__data __at (0x39) char bufferFull;     // 0: empty, 1 : full
__data __at (0x3A) char nextChar;

void initialize(){
    TMOD = 0x20;
    SCON = 0x50;        
    TH1 = (char) -6;            
    TR1 = 1;            
    TI = 1;             
}

void Producer(void) {
    nextChar = 'A'; // 
    while (1) {
        if (bufferFull) { 
            ThreadYield(); // wait for buffer
            continue;
        }
        sharedBuffer = nextChar; // write for buffer
        bufferFull = 1; // mark buffer is full
        ThreadYield(); // switch 
        nextChar = (nextChar - 'A' + 1) % 26 + 'A';
    }
}

void Consumer(void) {
    initialize();
    while (1) {
        if (!bufferFull) {
            ThreadYield(); // wait for buffer
            continue;
        }
        SBUF = sharedBuffer; // write the content of buffer
        while (!TI); // wait trans
        TI = 0; // mark done
        bufferFull = 0; // mark buffer is empty
        ThreadYield(); // switch
    }
}

void main(void) {
    bufferFull = 1; // initialize
    ThreadCreate(Producer); // 
    Consumer(); // 
}

void _sdcc_gsinit_startup(void) {
    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
