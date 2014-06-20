#include<stdio.h>

int* closure(int a)(int b){
	return func(int b){
		return a + b;
	}
}

