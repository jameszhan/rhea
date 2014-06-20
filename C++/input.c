#include<stdio.h>
#include<string.h>


int main(void){
	char answer[100], *p;
	printf("Type something:\n");
	fgets(answer, sizeof answer, stdin);
	if((p = strchr(answer, '\n')) != NULL){
		*p = '\n';
	}
	printf("You typed '%s'\n", answer);
	return 0;
}