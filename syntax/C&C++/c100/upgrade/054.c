#include<stdio.h>

int main(void){
	int i, j, k;
	char str[80];
	char* p;

	scanf("%d %o %x", &i, &j, &k);
	printf("%d %d %d\n\n", i, j, k);
	
	printf("Enter a string: ");
	scanf("%s", str);
	printf("Here is your string: %s\n\n", str);

	printf("Enter an address: ");
	scanf("%p", &p);
	printf("Value at location %p is %c.\n", p, *p);
}
