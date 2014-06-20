#include<stdio.h>

int swap(int*, int*);


int main(void){
	int i = 12;
	int j = 4;
	
	printf("\ni=%d, j=%d", i, j);
	swap(&i, &j);
	printf("\ni=%d, j=%d\n", i, j);
	
	return 0;
}

int swap(int* x, int* y){
	int temp;
	temp = *x;
	*x = *y;
	*y = temp;
}
