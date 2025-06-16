#include <8051.h>
#include "preemptive.h"

//__data __at (0x38) char sharedBuffer;   
//__data __at (0x39) char bufferFull;     // 0: empty, 1 : full
__data __at (0x38) char head;
__data __at (0x39) char tail;
__data __at (0x3A) char nextChar;
__data __at (0x3B) char buffer[3];

__data __at (0x20) Semaphore mutex;     // semaphore for mutual exclusion
__data __at (0x21) Semaphore full;      // semaphore for counting full slots
__data __at (0x22) Semaphore empty;     // semaphore for counting empty slots

void initialize(){
    TMOD |= 0x20;
    SCON = 0x50;        
    TH1 = (char) -6;            
    TR1 = 1;            
    TI = 1;             
}

void Producer(void) {
    nextChar = 'A'; // 
    while (1) {
        SemaphoreWait(empty);
        SemaphoreWait(mutex);
        __critical {
            buffer[head] = nextChar;
            if (head == 2) head = 0;
            else head = (head + 1);
            nextChar = (nextChar - 'A' + 1) % 26 + 'A';
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(full);
    }
}

void Consumer(void) {
    initialize();
    while (1) {
        SemaphoreWait(full);
        SemaphoreWait(mutex);
        while (!TI); // 等待傳輸完成
        __critical {
                SBUF = buffer[tail];
                TI = 0; // mark done
                if (tail == 2) tail = 0;
                else tail = tail + 1;
                //TI = 0; // mark done
        //bufferFull = 0; // mark buffer is empty
        }
        SemaphoreSignal(mutex);
        SemaphoreSignal(empty);
    }
}

void main(void) {
    //bufferFull = 0; // initialize
        //head = tail = 0;
        //buffer[0] = buffer[1] = buffer[2] = 0;
    SemaphoreCreate(mutex, 1);
    SemaphoreCreate(full, 0);
    SemaphoreCreate(empty, 3);

    // Initialize buffer pointers
    head = tail = 0;
    ThreadCreate(Producer); // 
    Consumer(); // 
}

void _sdcc_gsinit_startup(void) {
    __asm
        LJMP _Bootstrap
    __endasm;
}
void timer0_ISR(void) __interrupt(1) {
    __asm
        LJMP _myTimer0Handler
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}
