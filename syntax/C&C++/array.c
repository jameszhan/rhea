#include<stdio.h>

int main(void){
	int* p1;
	int i;
	int a[][3] = {
		{1, 2, 3},
		{4, 5, 6},
		{7, 8, 9},
		{0, 11, 12}
	}; 	

	int (*p)[3] = a;
	printf("%lx\n", *(a+1));

	p1 = *a;
	for(i = 0; i < 12; i++){
		printf("%d\t", *p1++);
	}
	printf("\n");
	return 0;
}
