#include<stdio.h>
#include<stdlib.h>

#define NUM 10

int main(void){
	char* str[NUM];
	int t;

	for(t = 0; t < NUM; t++){
		if((str[t] = (char*)malloc(128)) == NULL){
			printf("Allocation Error.\n");
			exit(1);
		}
		printf("Enter string %d: ", t);
		gets(str[t]);
	}
	
	for(t = 0; t < NUM; t++){
		free(str[t]);
	}
	
	return 0;
}
