#include<stdio.h>


int main(void){

	unsigned a, b, c, d;
	int n;

	a = 64;
	n = 2;

	b = a >> (6 - n);
	printf("b = %d\n", b);

	c = a << n;
	printf("c = %d\n", c);

	d = (a >> (n - 1)) | (a << (n + 1));
	printf("d = %d\n", d);
	
	return 0;
}
