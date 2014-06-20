#include<stdio.h>

#define SIZE 50

int primes[SIZE];


int init_array(int* p, int size){
	int i;
		
	for(i = 0; i < size; i++){
		*p++ = 0;
	}
}

int find_prime1(int* p, int size){
	int c = 0, v = 2;
	int *q;

	while(c < size){
		q = p;
		while(*q != 0){
			if((v % *q++) == 0){
				break;
			}
		}
		
		if(*q == 0){
			*q = v;
			c++;
		}
		v++;
	}
}

int find_primes(int* p, int size){
	int c = 0, v = 2;
	int* q;

	loop:	
	while(c < size){
		q = p;
		while(*q){
			if((v % *q++) == 0){
				v++;
				goto loop;
			}												
		}
		*q = v++;
		c++;
	}
}

int main(void){
	int i;
	
	init_array(primes, SIZE);
	printf("Initialize completed!\n");	
	find_prime1(primes, SIZE);
	printf("Find Primes \n");

	
	for(i = 0; i < SIZE; i++){
		printf("%8d", primes[i]);
		if((i + 1) % 10 == 0) printf("\n");
	}
	
	printf("\n");

	return 0;
}



