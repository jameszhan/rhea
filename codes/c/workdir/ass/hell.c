#include<stdio.h>

int func(int x){
	return (x ^ 0xFFFFFFFF) + 1;
}


int main(void){
	int i;
	scanf("%d", &i);
	printf("x = %d[%x], f = %d\n", i, i, func(i));
}

