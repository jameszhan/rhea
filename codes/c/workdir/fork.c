#include<stdio.h>
#include<stdlib.h>

int main(void){
	int result = fork();
	while(1){
		printf("current pid is %d, return value is %d\n", getpid(), result);
		sleep(5);
	}
}

