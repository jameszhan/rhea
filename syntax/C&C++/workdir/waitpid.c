#include<sys/types.h>
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<wait.h>

int main(void){
	pid_t pc, pr;
	pc = fork();
	if(pc == 0){
		printf("hello, I' m a child process, pid is %d\n", getpid());
		sleep(5);
		printf("child process is wakeup, exit now!\n");
		exit(1);
	}else if(pc > 0){
		printf("hello, I' m in parent process, pid is %d\n", getpid());
		do{
			pr = waitpid(pc, NULL, WNOHANG);
			printf("find terminated proces, pr=%d\n", pr);
			if(pr == 0){
				printf("child process is not exited!\n");
				sleep(1);
			}			
		}while(pr == 0);
		if(pr == pc){
			printf("child process is exited!\n");
		}else{
			perror("exited!");
		}	
	}else{
		perror("fork!");
	}
}
