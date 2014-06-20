#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>

int main(void){
	char* env[] = {"PATH=/tmp", "USER=root", NULL};
	if(fork() == 0){
		if(execle("/bin/env", "env", NULL, env) < 0){
			perror("execle error!");
		}
	}
	return 0;

}
