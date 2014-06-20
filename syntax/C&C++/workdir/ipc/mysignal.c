#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<signal.h>

void my_fun(int sign_no){
	if(sign_no == SIGINT){
		printf("I have get SIGINT\n");
	}else if(sign_no == SIGQUIT){
		printf("I have get SIGQUIT\n");
	}
}

int main(void){
	printf("Waiting for signal SIGINT or SIGQUIT\n");
	signal(SIGINT, my_fun);
	signal(SIGQUIT, my_fun);
	pause();
	exit(0);

}
