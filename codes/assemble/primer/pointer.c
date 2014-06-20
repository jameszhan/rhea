#include<stdio.h>

int (*opp(char))(int, int);

typedef int OP(int, int);
OP* fun(char c);

int add(int a, int b){
	return (a + b);
}

int product(int a, int b){
	return (a * b);
}

int (*opp(char c))(int a, int b){
	if(c == 'a'){
		return add;
	}else{
		return product;
	}
}
int main(void){
	int a = 2, b = 23;
	
	printf("Hello World:%d, %d\n", opp('a')(a, b), opp('b')(a, b));
	printf("Hello World:%d, %d\n", fun('a')(a, b), fun('b')(a, b));
}


OP* fun(char c){
	if(c == 'a'){
		return add;
	}else{
		return product;
	}
}


