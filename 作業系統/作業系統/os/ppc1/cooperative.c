#include <8051.h>

#include "cooperative.h"

/*
 * [TODO]
 * declare the static globals here using
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a bitmap for which thread ID is a valid thread;
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */
 __data __at (0x30) char saved_SP[MAXTHREADS];
 __data __at (0x34) ThreadID cur_ID;
 __data __at (0x35) char bitmap_ID;
 __data __at (0x36) char temp_SP;         // temporary save the SP
 __data __at (0x37) ThreadID new_ID;


/*
 * [TODO]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly,
 *     while 2) can be written in either assembly or C
 */
#define SAVESTATE               \
    {                           \
        __asm                   \
        /*your code here*/      \
            PUSH ACC            \
            PUSH B              \
            PUSH DPL            \
            PUSH DPH            \
            PUSH PSW            \
        __endasm;               \
        saved_SP[cur_ID] = SP;  \
    }

/*
 * [TODO]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */
#define RESTORESTATE            \
    {                           \
        SP = saved_SP[cur_ID];  \
        __asm                   \
        /*your code here*/      \
            POP PSW             \
            POP DPH             \
            POP DPL             \
            POP B               \
            POP ACC             \
        __endasm;               \
    }

/*
 * we declare main() as an extern so we can reference its symbol
 * when creating a thread for it.
 */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void)
{
    /*
     * [TODO]
     * initialize data structures for threads (e.g., mask)
     *
     * optional: move the stack pointer to some known location
     * only during bootstrapping. by default, SP is 0x07.
     *
     * [TODO]
     *     create a thread for main; be sure current thread is
     *     set to this thread ID, and restore its context,
     *     so that it starts running main().
     */
    bitmap_ID = 0b0000;
    cur_ID = 0;
    //SP = 0x07;
    cur_ID = ThreadCreate(main);
    //saved_SP[cur_ID] = SP;      // 
    RESTORESTATE;               \
}

/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadID ThreadCreate(FunctionPtr fp) {
      if (bitmap_ID == 0b1111) return -1; //check 

      temp_SP = SP; //save current SP

      if (!(bitmap_ID & 0b0001)) {
        bitmap_ID |= 0b0001;
        new_ID = 0;
    } else if (!(bitmap_ID & 0b0010)) {
        bitmap_ID |= 0b0010;
        new_ID = 1;
    } else if (!(bitmap_ID & 0b0100)) {
        bitmap_ID |= 0b0100;
        new_ID = 2;
    } else if (!(bitmap_ID & 0b1000)) {
        bitmap_ID |= 0b1000;
        new_ID = 3;
    }

    SP = 0x3F + (new_ID * 0x10); 

    __asm   
        PUSH DPL      
        PUSH DPH
    __endasm;

    __asm
        MOV A, #0         
        PUSH A //ACC
        PUSH A  // B        
        PUSH A  // DPL        
        PUSH A  // DPH        
    __endasm;

    PSW = (new_ID << 3); 

    __asm
        PUSH PSW          
    __endasm;

    saved_SP[new_ID] = SP;           
    SP = temp_SP;                    

    return new_ID;                   //
}



/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */

void ThreadYield(void) {
    SAVESTATE; 
    if (!bitmap_ID) return;
    if (cur_ID == 0) {
        if (bitmap_ID & 0b0010) cur_ID = 1;
        else if (bitmap_ID & 0b0100) cur_ID = 2;
        else if (bitmap_ID & 0b1000) cur_ID = 3;
    } else if (cur_ID == 1) {
        if (bitmap_ID & 0b0100) cur_ID = 2;
        else if (bitmap_ID & 0b1000) cur_ID = 3;
        else if (bitmap_ID & 0b0001) cur_ID = 0;
    } else if (cur_ID == 2) {
        if (bitmap_ID & 0b1000) cur_ID = 3;
        else if (bitmap_ID & 0b0001) cur_ID = 0;
        else if (bitmap_ID & 0b0010) cur_ID = 1;
    } else if (cur_ID == 3) {
        if (bitmap_ID & 0b0001) cur_ID = 0;
        else if (bitmap_ID & 0b0010) cur_ID = 1;
        else if (bitmap_ID & 0b0100) cur_ID = 2;
    }
    RESTORESTATE; 
}



/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void) {
    bitmap_ID &= ~(1 << cur_ID); // clear current thread
    if (!bitmap_ID) return;
    if (cur_ID == 0) {
        if (bitmap_ID & 0b0010) cur_ID = 1;
        else if (bitmap_ID & 0b0100) cur_ID = 2;
        else if (bitmap_ID & 0b1000) cur_ID = 3;
    } else if (cur_ID == 1) {
        if (bitmap_ID & 0b0100) cur_ID = 2;
        else if (bitmap_ID & 0b1000) cur_ID = 3;
        else if (bitmap_ID & 0b0001) cur_ID = 0;
    } else if (cur_ID == 2) {
        if (bitmap_ID & 0b1000) cur_ID = 3;
        else if (bitmap_ID & 0b0001) cur_ID = 0;
        else if (bitmap_ID & 0b0010) cur_ID = 1;
    } else if (cur_ID == 3) {
        if (bitmap_ID & 0b0001) cur_ID = 0;
        else if (bitmap_ID & 0b0010) cur_ID = 1;
        else if (bitmap_ID & 0b0100) cur_ID = 2;
    }
    RESTORESTATE;
}
