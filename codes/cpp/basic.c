#include<stdio.h>

int main(void){
	int a[6];
	int *p = a;
	char c;
	printf("a = %d, p = %d, &a = %d, &p = %d\n", a, p, &a, &p);
	c = 5["abcdefg"];
	printf("c=%c", c);
	return 0;
}