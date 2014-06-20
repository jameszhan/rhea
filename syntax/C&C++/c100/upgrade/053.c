#include<stdio.h>

int main(void){
	unsigned number;
	double item = 1.23456;
	
	for(number = 8; number < 16; number++){
		printf("%o	", number);
		printf("%x	", number);
		printf("%X\n", number);
	} 
	printf("\n");

	printf("%p\n\n", &item);
	printf("%f\n", item);
	printf("%8.2f\n", item);
	printf("%-8.2f\n", item);
	return 0;
}
