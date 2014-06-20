#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>

int main(void){
	fork();
	fork();
	fork();
	
	printf("Hello World!\n");
	exit(0);
}

