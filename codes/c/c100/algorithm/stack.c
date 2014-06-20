#include<stdio.h>
#include<stdlib.h>

#define MAX 10 

typedef struct{
	int data[MAX];
	int top;
} stack;

int init(stack** s){
	*s = (stack*)malloc(sizeof(stack));	
}

int push(stack* s, int el){
	if(s->top < MAX){
		s->data[s->top] = el;
		s->top++;
		return s->top;
	}else{
		return -1;
	}
} 

int pop(stack* s){
	if(s->top > 0){
		s->top--;
		return s->data[s->top];
	}else{
		return -1;
	}
}

void disp(stack* s){
	int i = 0;
	do{
		printf("%d:%d->", i, s->data[i]);	
	}while(++i < MAX);
	printf("\n");
}

int main(void){
	stack* s;
	int i;
	init(&s);
	push(s, 1);
	push(s, 2);
	push(s, 3);
	push(s, 1);
	push(s, 2);
	push(s, 3);
	push(s, 1);
	push(s, 2);
	push(s, 3);
	push(s, 1);
	push(s, 2);
	push(s, 3);
	while((i = pop(s)) != -1){
		printf("%d--", i);
	}
	printf("\n");
	disp(s);
}



