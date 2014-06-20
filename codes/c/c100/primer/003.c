#include<stdio.h>


int main(void){
	int logic;
	
	int a = 1;
	int b = 2;
	int c = 3;

	logic = a + b > c && b <= c;
	printf("logic = %d\n", logic);
	
	logic = a >= b + c || b == c;
	printf("logic = %d\n", logic);

	logic = !(a < c) + b != 1 && (a + c) / 2;
	printf("logic = %d\n", logic);


	return 0;
}
