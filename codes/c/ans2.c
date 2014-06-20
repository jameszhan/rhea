#include<stdio.h>
#include<stdlib.h>

struct node{
	int no;
	int value;
	int pos;
};
	
int arr[] = {5, 3, 4, 7, 3, 5, 6};
int comp(const void *p, const void* q){
	return ((struct node*)p)->value - ((struct node*)q)->value;
}
void mark(struct node* p, int len){
	int i, j = 0;
	for(i = 1; i < len; i++){
		if(p[i].value != p[i - 1].value){
			j++;
		}		
		p[i].pos = j;
	}	
}

int comp1(const void* i, const void* j){
	return ((struct node*)i)->value - ((struct node*)j)->value;
}
int comp2(const void* i, const void* j){
	return ((struct node*)i)->no - ((struct node*)j)->no;
}

int main(void){
	int size;
	int i, v;
	struct node* head, *p;
	printf("Please type array size:");
	scanf("%d", &size);
	head = p = (struct node*)malloc(sizeof(struct node) * size);
	for(i = 0; i < size; i++){
		scanf("%d", &v);
		p->no = i;
		p->value = v;
		p++;		
	}
	p = head;
	qsort(p, size, sizeof(struct node), comp1);
	p = head;
	mark(p, size);
	
	p = head;
	qsort(p, size, sizeof(struct node), comp2);
	printf("\n");
	for(i = 0; i < size; i++){
		printf("%d, ", head[i].pos + 1);
	}
	printf("\n");
}


