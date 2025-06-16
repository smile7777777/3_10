#include <8051.h>
#include "preemptive.h"
#include "keylib.h"
#include "buttonlib.h"
#include "lcdlib.h"

__data __at (0x39) char buffer;

__data __at (0x20) char mutex;
__data __at (0x21) char full;
__data __at (0x22) char empty;

__data __at (0x2A) char cur_but;
__data __at (0x2B) char last_but;
__data __at (0x2C) char cur_key;
__data __at (0x2D) char last_key;


void initialize(){
    TMOD |= 0x20;
    SCON = 0x50;        
    TH1 = (char) -6;            
    TR1 = 1;            
    TI = 1;             
}


void Producer1(void) {
        while(1) {
            if(AnyButtonPressed()){
                cur_but = ButtonToChar();
                if(last_but != cur_but){
                        SemaphoreWait(empty);
                        SemaphoreWait(mutex);
                        EA = 0;
                        buffer = cur_but;
                        last_but = cur_but;
                        EA = 1;
                        SemaphoreSignal(mutex);
                        SemaphoreSignal(full);
                }
            }
            else{
                last_but = 0x00;
            }
        }
}

void Producer2(void) {
        while(1) {
            if(AnyKeyPressed()){
                cur_key = KeyToChar();
                if(last_key != cur_key){
                        SemaphoreWait(empty);
                        SemaphoreWait(mutex);
                        EA = 0;
                        buffer = cur_key;
                        last_key = cur_key;
                        EA = 1;
                        SemaphoreSignal(mutex);
                        SemaphoreSignal(full);
                }
            }
            else{
                last_key = 0x00;
            }
        }
}

void Consumer(void) {
        initialize();
        while (1) {
                if(LCD_ready()){
                        SemaphoreWait(full);
                        SemaphoreWait(mutex);
                        //while(!TI) ;
                        EA = 0;
                        if(buffer != 0x00) LCD_write_char(buffer);
                        //TI = 0; // mark done
                        EA = 1;
                        SemaphoreSignal(mutex);
                        SemaphoreSignal(empty);                       
                }
        }
}


void main(void) {
        LCD_Init();
        Init_Keypad();
        SemaphoreCreate(mutex,1);
        SemaphoreCreate(full,0);
        SemaphoreCreate(empty,1);
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
