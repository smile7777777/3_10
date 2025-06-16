/*
 * file: cooperative.h
 *
 * this is the include file for the cooperative multithreading
 * package.  It is to be compiled by SDCC and targets the EdSim51 as
 * the target architecture.
 *
 * CS 3423 Fall 2018
 */

#ifndef __COOPERATIVE_H__
#define __COOPERATIVE_H__

#define MAXTHREADS 4  /* not including the scheduler */
/* the scheduler does not take up a thread of its own */
#define CNAME(s) _ ## s
#define LABEL(label) label ## $

typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);
void myTimer0Handler();

#define SemaphoreCreate(s, n) s = n

#define SemaphoreSignal(s){\
    __asm\
        INC CNAME(s)\
    __endasm;\
}\

#define SemaphoreWait(s) SemaphoreWaitBody(s, __COUNTER__)

#define SemaphoreWaitBody(S,label)\
    { __asm \
        LABEL(label):\
        MOV A, CNAME(S)\
        JZ LABEL(label)\
        JB ACC.7, LABEL(label)\
        dec  CNAME(S) \
      __endasm; }


#endif // __COOPERATIVE_H__