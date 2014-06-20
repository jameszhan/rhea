#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>
#include<sys/shm.h>
#include<sys/ipc.h>

#define BUFSIZE 2048

int main(void){
	int shmid;
	char* shmadd;
	
	if((shmid = shmget(IPC_PRIVATE, BUFSIZE, 0666)) < 0){
		perror("shmget");
		exit(1);
	}else{
		printf("created shared-memory: %d\n", shmid);
	}
	system("ipcs -m");

	if((shmadd = shmat(shmid, 0, 0)) < (char*)0){
		perror("shmat");
		exit(1);
	}else{
		printf("attached shared-memory\n");
	}
	system("ipcs -m");
	
	if(shmdt(shmadd) < 0){
		perror("shmdt");
		exit(1);
	}else{
		printf("deleted shared-memory\n");
	}
	system("ipcs -m");

	exit(0);
}
