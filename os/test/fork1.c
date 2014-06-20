#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>

void doit(){
	fork();
	fork();
	printf("Hello World!\n");
	return;
}

int main(void){
	doit();	
	printf("Hello World!\n");
	exit(0);
}

