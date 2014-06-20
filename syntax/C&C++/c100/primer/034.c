#include<stdio.h>

void head1();
void head2();
void head3();

int count;

int main(void){
	register int index;

	head1();
	head2();
	head3();
	
	for(index = 8; index > 0; index--){
		int stuff;
		for(stuff = 0; stuff <= 6; stuff++){
			printf("%d ", stuff);
		}
		printf("index is now %d\n", index);
	}
}

int counter;

void head1(){
	int index;
	index = 23;
	printf("The hader1 value is %d\n", index);
}

void head2(){
	int count;
	count = 53;
	printf("The header2 value is %d\n", count);
	counter = 77;
}

void head3(){
	printf("The header3 value is %d\n", counter);
}
