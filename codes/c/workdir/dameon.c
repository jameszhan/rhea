#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<sys/types.h>
#include<sys/wait.h>
#include<string.h>
#include<fcntl.h>

#define MAXFILE 65535

int main(void){
	pid_t pc;
	int i, fd, len;
	char* buf = "This is a Dameon\n";
	len = strlen(buf);
	pc = fork();
	if(pc < 0){
		perror("fork!");
	}else if(pc > 0){
		setsid();
		chdir("/");
		umask(0);
		printf("Hello, I' m now in parent process!\n");
		sleep(8);
		printf("parent process is exiting!\n");
		exit(0);
	}else{
		setsid();
		chdir("/");
		umask(0);
		for(i = 0; i < MAXFILE; i++){
			close(i);
		}
		printf("Hello, I 'm a dameon process!\n");
		while(1){
			printf("Hello, I 'm a dameon process!\n");
			if((fd = open("/tmp/dameon.log", O_CREAT | O_WRONLY | O_APPEND, 0600)) < 0){
				perror("open");
				exit(1);
			}
			write(fd, buf, len + 1);
			close(fd);
			sleep(10);
		}
	}		
} 
