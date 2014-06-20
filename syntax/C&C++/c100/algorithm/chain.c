#include<stdio.h>
#include<stdlib.h>


struct chain{
	int value;
	struct chain *next;
};

struct chain* create(){
	struct chain *head, *tail, *p;
	int x;
	head = tail = NULL;
	printf("Input data.\n");

	while(scanf("%d", &x) == 1){
		p = (struct chain*)malloc(sizeof(struct chain));
		p->value = x;
		p->next = NULL;
		if(head == NULL){
			head = tail = p;
		}else{
			tail->next = p;
			tail = tail->next;			
		}
	}
	return head;
}

int main(void){
	struct chain *p, *q;
	q = create();
	
	while(q){
		printf("%d\n", q->value);
		p = q->next;
		free(q);
		q = p;
	}
}
