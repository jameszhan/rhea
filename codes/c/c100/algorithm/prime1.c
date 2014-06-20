#include<stdio.h>

#define SIZE 500

int primes[SIZE];


int main(void){
	int primes[SIZE];
	int i, c, v = 3;
	int* p;

	p = primes + 1;

	for(i = 0; i < SIZE; i++){
		primes[i] = 0;
	}
	
	primes[0] = 2;
	c = 1;
	while(c < SIZE){
		for(i = 0; i < c; i++){
			if(v % primes[i] == 0){
				break;
			}
		}
	
		if(i == c){
			*p++ = v;
			c++;
		}else{
			v++;
		}
	//	printf("v=%d, c=%d, i=%d\n", v, c, i);			
	}
	for(i = 0; i < SIZE; i++){
		printf("%8d,", primes[i]);
		if((i + 1) % 10 == 0){
			printf("\n");
		}
	}
		
	printf("\n");

	return 0;
}



