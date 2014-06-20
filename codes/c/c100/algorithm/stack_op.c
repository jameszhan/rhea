#include<stdio.h>
#include<stdlib.h>

#define MAX 100

int* p;
int* top;
int* bottom;

void push(int i){
	if(p > bottom){
		printf("stack is overflow!\n");
		return;
	}
	*p = i;
	p++;
}

int pop(void){
	p--;
	if(p < top){
		printf("Stack is empty\n");
		return 0;
	}
	return *p;
}

int main(void){
	int a, b;
	char s[80];
	p = (int*)malloc(MAX* sizeof(int));
	if(!p){
		printf("memory alloc failure!\n");
		exit(1);
	}
	top = p;
	bottom = p + MAX - 1;
	printf("please input the first data:\n");
	scanf("%d", &a);
	push(a);
	printf("please input the second data:\n");
	scanf("%d", &b);
	push(b);

	printf("Please input operation:\n");
	scanf("%s", s);
	switch(*s){
		case '+':
			a = pop();
			b = pop();
			printf("The result is %d\n", (a + b));
			break;
		case '-':
			a = pop();
			b = pop();
			printf("The result is %d\n", (a - b));
			break;

		case '*':
			a = pop();
			b = pop();
			printf("The result is %d\n", (a * b));
			break;
		case '/':
			a = pop();
			b = pop();
			printf("The result is %d\n", (a / b));
			break;
		default:
			printf("Please input correct operation\n");
	}
	return 0;
}
