#include <8051.h>
#include "preemptive.h"

__data __at (0x3A) char buffer;
__data __at (0x3B) char prod1;
__data __at (0x3C) char prod2;

__data __at (0x20) char mutex;
__data __at (0x21) char full;
__data __at (0x22) char empty;

__data __at (0x23) char in;
__data __at (0x24) char out;
__data __at (0x25) char ibuf[3];
__data __at (0x2A) char turn1;
__data __at (0x2B) char turn2;


void Producer1(void) {

        prod1 = 'A';
        while(1) {
            SemaphoreWait(turn1);
            SemaphoreWait(empty);
            SemaphoreWait(mutex);
            __critical{
                ibuf[in] = prod1;
                in = (in + 1) % 3;
                if(prod1 == 'Z') prod1 = 'A';
                else prod1 = prod1 + 1;
            }
            SemaphoreSignal(mutex);
            SemaphoreSignal(full);
            SemaphoreSignal(turn2);
        }
}

void Producer2(void) {

        prod2 = '0';
        while(1) {
            SemaphoreWait(turn2);
            SemaphoreWait(empty);
            SemaphoreWait(mutex);
            __critical{
                ibuf[in] = prod2;
                in = (in + 1) % 3;
                if(prod2 == '9') prod2 = '0';
                else prod2 = prod2 + 1;
            }
            SemaphoreSignal(mutex);
            SemaphoreSignal(full);
            SemaphoreSignal(turn1);
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
                SemaphoreWait(full);
                SemaphoreWait(mutex);
                while(!TI);
                __critical{
                        SBUF = ibuf[out];
                        TI = 0 ;
                        out = (out + 1) % 3;
                }
                // remove the next char from the buffer
                SemaphoreSignal(mutex);
                SemaphoreSignal(empty);

        }
}


void main(void) {
        in = out = 0;
        ibuf[0] = ibuf[1] = ibuf[2] = 0;
        SemaphoreCreate(mutex,1);
        SemaphoreCreate(full,0);
        SemaphoreCreate(empty,3);
        SemaphoreCreate(turn1,1);
        SemaphoreCreate(turn2,0);
        ThreadCreate(Producer1);
        ThreadCreate(Producer2);
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


