#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>

int main(void){
	if(fork() == 0){
		if(execl("/bin/ps", "ps", "-ef", NULL) < 0){
			perror("execl error!");
		}
	}
	return 0;

}
