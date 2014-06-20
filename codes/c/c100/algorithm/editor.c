#include<stdio.h>
#include<stdlib.h>

#define MAX 100

typedef struct node{
	char data[80];
	struct node *next;
} nodetype;

typedef struct{
	int num;
	int len;
	nodetype* next;
} headtype;

headtype head[MAX];

void initial();
int menu_select();
void enter_data();
void delete_line();
void list();
void clear_buffer();

int main(void){
	char choice;
	initial();
	while(1){
		choice = menu_select();
		switch(choice){
			case 1: enter_data(); break;
			case 2: delete_line(); break;
			case 3: list(); break;
			case 4: exit(0);
		}
	}
}

void clear_buffer(){
	while(getchar() != '\n');
}

void initial(){
	int i;
	for(i = 0; i < MAX; i++){
		head[i].len = 0;
	}
}

int menu_select(){
	int i = 0;
	printf(" 1. Enter\n");
	printf(" 2. Delete\n");
	printf(" 3. List\n");
	printf(" 4. Exit\n");

	while(i <= 0 || i > 4){
		printf("please select an menu\n");
		scanf("%d", &i);
		clear_buffer();
	}
	return i;
}

void enter_data(){
	nodetype *p;
	int i, m, ln, k;
	char buffer[100];

	while(1){
		printf("Please input insert line number(0~100):\n");
		scanf("%d", &ln);
	
		clear_buffer();
		if(ln < 0 || ln >= MAX){
			return;
		}

		printf("Please insert data, end with @\n");
		head[ln].num = ln;
		head[ln].next = (nodetype*)malloc(sizeof(nodetype));
		p = head[ln].next;
		m = 1;
		i = -1;
		buffer[0] = 0;
		k = 0;
		do{
			i++;
			if(!buffer[k]){
				scanf("%s", buffer);
				k = 0;
			}
			if(i >= 80 * m){
				m++;
				p = p->next = (nodetype*)malloc(sizeof(nodetype));
			}
			p->data[i % 80] = buffer[k++];
		}while(p->data[i % 80] != '@');
		head[ln].len = i;
	}
}

void delete_line(){
	nodetype *p, *q;
	int i, j, m, ln;
	while(1){
		printf("Input the line number need to be delete(0~100): \n");
		scanf("%d", &ln);
		if(ln < 0 || ln >= MAX){
			return;
		}
	
		i = ln;
		p = head[i].next;
		m = 0;
		if(head[i].len > 0){
			m = (head[i].len - 1) / 80 + 1;
		}
		for(j = 0; j < m; j++){
			q = p->next;
			free(p);
			p = q;
		}
		head[i].len = 0;
		head[i].num = 0;
	}
}

void list(){
	nodetype *p;
	int i, j, m, n;
	for(i = 0; i < MAX; i++){
		if(head[i].len > 0){
			printf("the %dth line, there is:\n", head[i].num);
			n = head[i].len;
			m = 1;
			p = head[i].next;
			for(j = 0; j < n; j++){
				if(j >= 80 * m){
					p = p->next;
					m++;
				}else{
					printf("%c", p->data[j%80]);
				}
			}
			printf("\n");
		}
	}
	printf("\n");
}
