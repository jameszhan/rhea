#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>

#define BUFSIZE 1000

int main(void){
	FILE *fp;
	char* cmd = "ps -ef";
	char buf[BUFSIZE];
	buf[BUFSIZE] = '\0';
	if((fp = popen(cmd, "r")) == NULL){
		perror("popen");
		exit(1);
	}	
	while(fgets(buf, BUFSIZE, fp) != NULL){
		printf("%s", buf);
	}
	pclose(fp);
	exit(0);
}
