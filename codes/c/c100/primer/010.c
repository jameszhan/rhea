#include<stdio.h>

int main(void){

	int x, y;

	printf("please input a independent variable x:\n");
	scanf("%d", &x);
	
	if(x < 6){
		y = x - 12;
		printf("x = %d, y = %d\n", x, y);
	}else if(x < 15){
		y = 3 * x - 1;
		printf("x = %d, y = %d\n", x, y);
	}else{
		y = 5 * x + 9;
		printf("x = %d, y = %d\n", x, y);
	}

	return 0;
}
