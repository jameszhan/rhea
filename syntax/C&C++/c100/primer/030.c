#include<stdio.h>

void convert(int n){
	int i;
	if((i = n/10) != 0){
		convert(i);
	}
	putchar(n % 10 + '0');
}

int main(void){
	int number;
	printf("Please input a number: ");
	scanf("%d", &number);
	printf("output is:");
	if(number < 0){
		putchar('-');
		number = -number;
	}
	convert(number);
	putchar('\n');
}
