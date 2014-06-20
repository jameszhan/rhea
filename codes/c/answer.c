#include<stdio.h>
#include<stdlib.h>

#define LEN 7
/*
struct n/ode{
	int value;
	int pos;
	struct node* next;
	struct node* prev;
};



int main(void){
	int size;
	printf("Please input arry size:");	
	scanf("%d", &size);
	
	
	int value;
	int pos;
}

*/




typedef struct tn{
	int value;
	int count;
	int id;
	struct tn* link;
	struct tn* left;
	struct tn* right;
} treenode;

void mark(treenode* node, int id){
	if(node == NULL) return;
	
	mark(node->left, id);
	if(node->value != node->left->value ){
		id++;
		node->id = id;
	}	
	mark(node->right, id);	
}
treenode* build(treenode* node, int value, int id){
	treenode* t;
	if(node == NULL){
		t = (treenode*)malloc(sizeof(treenode));
		t->left = NULL;
		t->right = NULL;
		t->count = 1;
		t->value = value;
		t->id = id;
		return t;		
	}else{
		if(value > node->value){
			t = build(node->right, value, id + 1);
			t->link = node;
		}else{
			node->left = build(node->left, value, id + 1);
		}
		return node;
	}
}

void print(treenode* root){
	if(root == NULL) return;
	print(root->left);
	printf("%d : %d ", root->value, root->id);
	print(root->right);
}

int arr[] = {5, 3, 4, 7, 3, 5, 6};
int comp(const void *i, const void* j){
	return *(int*)i - *(int*)j;
}


int main(void){
	treenode* root = NULL;
	int i = 0;
	for(i = 0; i < LEN; i++){
		root = build(root, arr[i], i);
	}
	print(root);
	printf("\n");
	qsort(arr, LEN, sizeof(int), comp);
	for(i=0; i < LEN; i++){
		printf("%d ", arr[i]);
	}		
	printf("\n");
}


