/*
 * file: preemptive.h
 *
 * this is the include file for the preemptive multithreading
 * package.  It is to be compiled by SDCC and targets the EdSim51 as
 * the target architecture.
 *
 * CS 3423 Fall 2018
 */

#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4 /* not including the scheduler */
/* the scheduler does not take up a thread of its own */

typedef char ThreadID; // single-byte ID for threads 0..3; -1 => invalid.
typedef void (*FunctionPtr)(void); // 2-byte (code-space) pointer to function

ThreadID ThreadCreate(FunctionPtr); //create and start a thread to run function fp
void ThreadYield(void); //current thread switches itself out, lets another thread run
void ThreadExit(void); //called by the current thread to terminate itself
void myTimer0Handler(void);

#endif // __COOPERATIVE_H__