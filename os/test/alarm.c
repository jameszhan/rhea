#include<unistd.h>
#include<stdlib.h>
#include<stdio.h>
#include<signal.h>
#include<sys/types.h>

void handler(int sig){
	static int beeps = 0;
	printf("BEEP\n");
	if(++beeps < 5){
		alarm(1);
	}else{
		printf("BOOM\n");
		exit(0);
	}	
}

int main(void){
	signal(SIGALRM, handler);
	alarm(1);
	
	while(1);
	
	printf("Main exit\n");
	exit(0);
	
}
