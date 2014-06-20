#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>

int main(void){
	int fd;
	if((fd = open("./hello.c", O_CREAT | O_TRUNC | O_WRONLY, 0600)) < 0){
		perror("open");
		exit(1);
	}else{
		printf("open file: hello.c %d\n", fd);
	}
	if(close(fd) < 0){
		perror("close");
		exit(1);
	}else{
		printf("close hello, c\n");
	}
	exit(0);
}
