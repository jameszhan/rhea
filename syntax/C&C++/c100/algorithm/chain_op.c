#include<stdio.h>
#include<stdlib.h>


struct chain{
	int value;
	struct chain *next;
};

struct chain* create(){
	struct chain *head, *tail, *p;
	int x, i;
	head = tail = NULL;
	printf("Input data.\n");

	for(i= 0; i < 4; i++){
		scanf("%d", &x);
		p = (struct chain*)malloc(sizeof(struct chain));
		p->value = x;
		p->next = NULL;
		if(head == NULL){
			head = tail = p;
		}else{
			tail = tail->next = p;
		}
	}
	return head;
}

struct chain* inlink(head, a, b)
struct chain *head;
int a, b;
{
	struct chain *p, *q, *s;
	s = (struct chain*)malloc(sizeof(struct chain));
	s->value = b;
	if(head == NULL){
		head = s;
		s->next = NULL;
	}
	if(head->value == a){
		s->next = head;
		head = s;
	}else{
		p = head;
		while((p->value != a) && (p->next != NULL)){
			q = p;
			p = p->next;
		}
		if(p->value == a){
			q->next = s;
			s->next = p;
		}else{
			p->next = s;
			s->next = NULL;	
		}
	}
	return head;
}

struct chain* dellink(head, a)
struct chain *head;
int a;
{
	struct chain *p, *q;
	if(head == NULL){
		printf("Empty List\n");
	}else if(head->value == a){
		p = head;
		head = head->next;
		free(p);
	}else{
		p = head;
		while((p->value != a) && (p->next != NULL)){
			q = p;
			p = p->next;
		}
		if(p->value != a){
			printf("There is no %d need to delete\n", a);
		}else{
			q->next = p->next;
			free(p);
		}
	}
	return head;
}

int main(void){
	struct chain *q, *head;
	int a, b;
	
	q = create();
	
	head = q;
	while(q){
		printf("%d -> ", q->value);
		q = q->next;
	}
	printf("\n");
	printf("Input a data need to insert before:\n");
	scanf("%d", &a);
	printf("Input a data need to insert:\n");
	scanf("%d", &b);
	
	q = inlink(head, a, b);
	head = q;

	while(q){
		printf("%d -> ", q->value);
		q=q->next;
	}
	printf("\n");
	printf("Input a data need to delete:\n");
	scanf("%d", &a);
	
	q = dellink(head, a, b);
	head = q;

	while(q){
		printf("%d -> ", q->value);
		q=q->next;
	}
	printf("\n");
	
	return 0;		

	
}
