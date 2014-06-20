#include<setjmp.h>
#include<stdio.h>
#include<conio.h>
#include<pc.h>


#define JMPBUF_IP state[0].__eip
#define JMPBUF_SP state[0].__esp

#define NUM_TASKS 2
#define STACK_SIZE 512


typedef struct{
	jmp_buf state;
}task_t;

static task_t g_tasks[NUM_TASKS + 1];

static void schedule(void){

}

