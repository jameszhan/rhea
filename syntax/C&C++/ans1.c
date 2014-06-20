#include<stdio.h>
#include<stdlib.h>

struct node{
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
	for(i = 0; i < len; i++){
		for(i = 0; )
		if(p[i].orgin = p[i])
	}
	
}
void quicksort(struct node* p, int low, int high){
	if(low >= high) return;
	int l = low, h = high;
	int tmp = p[low].value;
	do{			
		while(l < h && p[h].value > tmp){
			h--;
		}		
		if(l < h){
			p[l].value = p[h].value;
			l++;
		}
		while(l < h && p[l].value < tmp){
			l++;				
		}
		if(l < h){
			p[h].value = p[l].value;
			h--;
		}
	}while(l < h);
	p[l].value = tmp;	
	quicksort(p, low, l - 1);
	quicksort(p, l + 1, high);
}
int main(void){
	int size;
	int i, v, *q;
	struct node* head, *p;
	printf("Please type array size:");
	scanf("%d", &size);
	head = p = (struct node*)malloc(sizeof(struct node) * size);
	for(i = 0; i < size; i++){
		scanf("%d", &v);
		p->origin = v;
		p->value = v;
		p++;		
	}
	printf("\n");
	p = head;
	quicksort(p, 0, size - 1);
	p = head;
	mark(p, size);
	for(i = 0; i < size; i++){
		printf("%d,%d, %d-> ", head[i].origin, head[i].value, head[i].pos);
	}
	printf("\n");
	printf("\n");
}


