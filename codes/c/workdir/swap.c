#include<stdio.h>

void swap(int* a, int* b){
	*a = *a ^ *b;
	*b = *a ^ *b;
	*a = *a ^ *b;	
}

int main(void){
	int a, b;
	printf("Please input params:\n");
	printf("a = ");
	scanf("%d", &a);
	printf("b = ");
	scanf("%d", &b);
	swap(&a, &b);
	printf("a = %d, b = %d\n", a, b);
}

