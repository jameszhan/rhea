#include<setjmp.h>
#include<stdio.h>

jmp_buf ebuf;
void fun(void);

int main(void){
	int i;
	printf("1 ");
	i = setjmp(ebuf);
	
	if(i == 0){
		fun();
		printf("This will not be printed.");
	}
	printf("%d\n", i);
	
	return 0;
}

void fun(void){
	printf("3 ");
	longjmp(ebuf, 5);
}

