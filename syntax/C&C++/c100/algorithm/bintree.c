#include<stdio.h>
#include<stdlib.h>


struct tree{
	char info;
	struct tree *left;
	struct tree *right;
};

struct tree* root;

struct tree* build(struct tree* root, char info);
struct tree* construct(struct tree* root, struct tree* r, char info);
void print(struct tree* r, int l);

int main(void){
	char s[10];
	root = NULL;
	do{
		printf("please input a char:");
		gets(s);
		root = build(root, *s);
	}while(*s);

	print(root, 0);

	return 0;
}

struct tree* build(struct tree* root, char info){
	struct tree* t;
	if(root){
		if(info < root->info){
			root->left = build(root->left, info);
		}else{
			root->right = build(root->right, info);
		}		
	}else{
		t = (struct tree*)malloc(sizeof(struct tree));
		if(!t){
			printf("memory allocate failure!\n");
			exit(1);
		}
		t->info = info;
		t->left = NULL;
		t->right = NULL;
		root = t;
	}
	return root;
}


struct tree* construct(struct tree* root, struct tree* r, char info){
	if(!r){
		r = (struct tree*)malloc(sizeof(struct tree));
		if(!r){
			printf("memory allocate failure!");
			exit(0);
		}
		r->info = info;
		r->left = NULL;
		r->right = NULL;
		if(!root){
			return r;
		}
		if(info < root->info){
			root->left = r;
		}else{
			root->right = r;
		}
		return root;
	}
	if(info < root->info){
		construct(r, r->left, info);
	}else{
		construct(r, r->right, info);
	}
	return root;
	
}

void print(struct tree* r, int l){
	int i;
	if(!r) return;
	print(r->left, l + 1);
	
	for(i = 0; i < l; i++){
		printf("--");
	}
	printf("%c\n", r->info);
	print(r->right, l + 1);
}
