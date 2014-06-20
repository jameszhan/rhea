#include<stdio.h>

int main(void){
	int a[] = {1, 2, 3, 4};
	int i = 0;
	printf("%d", i);
	i++ && i++;
	i = i++;
	printf("%d", i);
	a[i] = i++;
	return 0;
}