#include<sys/types.h>
#include<sys/stat.h>
#include<string.h>
/*#include<unistd.h>*/
#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>

int main(void){
	int fd, i = 0, size, len;
	char* buf = "Hello, I'm writing to this file.\n";
	char buf_r[10];
	len = strlen(buf);

	if((fd = open("hello.txt", O_CREAT | O_RDWR, S_IRUSR | S_IWUSR)) < 0){
		perror("open error:");
		exit(1);
	}else{
		printf("open file: hello.c %d\n", fd);
	}
	
	while(i++ < 10){
		if((size = write(fd, buf, len)) < 0){
			perror("write error:");
			exit(1);
		}else{
			printf("Write to file size=%d, content= %s\n", size, buf);
		}
	}
	
	printf("Begin read file\n");
	lseek(fd, 0, SEEK_SET);
	while((size = read(fd, buf_r, 10)) > 0){
		printf("%s", buf_r);
	}
	if(close(fd) < 0){
		perror("close:");
		exit(1);
	}else{
		printf("Close hello.txt\n");
	}
	exit(0);
	
}
