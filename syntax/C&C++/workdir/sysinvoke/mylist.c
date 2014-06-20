
#include<stdio.h>

struct mylist{
	struct mylist *next, *prev;
	char* value;
};

int main(void){
	struct mylist *p, head = {NULL, NULL, "head"}, last = {NULL, NULL, "last"};
	struct mylist els[] = {{NULL, NULL, NULL}, {NULL, NULL, NULL}, {NULL, NULL, NULL}, {NULL, NULL, NULL}, {NULL, NULL, NULL}};
	int i;
	for(i = 0; i < 5; i++){
		els[i].value = "element";
		
		if(i != 0){
			els[i].prev = &els[i - 1]; 
		}else{
			els[i].prev = &head;
			head.next = &els[i];
		}
		if(i != 5){
			els[i].next = &els[i + 1];
		}else{
			els[i].next = &last;
			last.prev = &els[i];
		}
	}
	p = &head;
	while(p != NULL){
		printf("%s\n", p->value);
		p = p->next;	
	}
	
}





