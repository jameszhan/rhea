#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>

int main(void){
	char* arg[] = {"env", NULL};
	char* env[] = {"PATH=/tmp", "USER=root", NULL};
	if(fork() == 0){
		if(execve("/bin/env", arg, env) < 0){
			perror("execle error!");
		}
	}
	return 0;
}

