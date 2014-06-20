#include<stdio.h>

int main(void){
	int x, y, num1, num2, temp;
	printf("please type 2 number: \n");
	scanf("%d %d", &num1, &num2);
	
	x = num1;
	y = num2;
	while(y != 0){
		temp = x % y;
		x = y;
		y = temp;
	}
	printf("greatest common divisor is: %d\n", x);
	printf("least common multiple is: %d\n", num1 * num2 / x);

	return 0;
}
