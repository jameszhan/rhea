#include<stdio.h>


short abs1(int x){
	int  v = 1 << 16;
	printf("long = %x\n", sizeof(long));
	printf("int = %x\n", sizeof(int));
	printf("short = %x\n", sizeof(short));
	printf("%x\n", v);
	return v + x;
}

int main(void){
	int x;
	do{
		printf("please type a number:");
		scanf("%d", &x);
		printf("abs(%d)=%d\n", x, abs1(x));
	}while(x!=101);
}
