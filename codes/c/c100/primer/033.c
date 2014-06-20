#include<stdio.h>

int main(void){
	extern int multiply();
	extern int sum();
	int a, b;

	int result;
	printf("Please input a & b: ");
	scanf("%d %d", &a, &b);
	result = multiply(a, b);
	printf("The result of multiply is: %d", result);
	
	result = sum(a, b);
	printf("\n The result of sum is: %d\n", result);
}
