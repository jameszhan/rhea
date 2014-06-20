#include<stdio.h>

int square(int);
int cube(int);

int main(void){
	int m = 12;
	int n = 4;
	
	printf("%d, %d\n", square(m), m);
	printf("%d, %d\n", cube(n), n);
	
	return 0;
}

int square(int x){
	return x * x;
}

int cube(int x){
	return x * x * x;
}
