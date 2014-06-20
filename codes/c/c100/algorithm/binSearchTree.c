#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define NUM 10

struct data{
	char name[20];
	char school[20];
	char city[20];
	char province[20];
};

struct treenode{
	struct data* value;
	struct treenode* left;
	struct treenode* right;
};

void insert(struct treenode** root, struct data* v){
	struct treenode* node = (struct treenode*)malloc(sizeof(struct treenode)), *p, *q;
	int result;
	node->left = NULL;
	node->right = NULL;
	node->value = v;
	if(*root == NULL){
		*root = node;
	}else{
		p = *root;
		while(p != NULL){
			q = p;
			result = strcmp(v->name,p->value->name);
			if(result > 0){
				p = p->right;	
			}else{
				p = p->left;
			}
		}
		if(result > 0){
			q->right = node;
		}else{
			q->left = node;
		}
	}
}
struct treenode* build(struct treenode* root, struct data* v){
	struct treenode* node;
	if(root == NULL){
		node = (struct treenode*)malloc(sizeof(struct treenode));
		if(node == NULL){
			printf("lack of memory!\n");
			exit(1);
		}
		node->left = NULL;
		node->right = NULL;
		node->value = v;
		root = node;
	}else{		
		if(strcmp(v->name, root->value->name) > 0){
			root->right = build(root->right, v);			
		}else{
			root->left = build(root->left, v);
		}
	}
	return root;	
}
void print_data(struct data*);

void print_tree(struct treenode* root){
	if(root != NULL){
		print_tree(root->left);
		print_data(root->value);
		print_tree(root->right);
	}
}

struct data datas[NUM] = {
	"WenHai", "BIT", "JiLin", "JiLin",
	"TongWei", "BIT", "ZhenJiang", "JiangSu",
	"SunYou", "MIT", "ShenZhen", "GuangDong",
	"XiaoMing", "PKU", "TaiYuan", "ShanXi", 
	"Kitty", "PKU", "CCTV", "CCTV",
	"Money", "JXNU", "SUN", "Zhao", 
	"LieHuo", "Meng", "ZZZ", "DDDD",
	"LeiFeng", "High", "Nongcun", "ZhongDi",
	"Andy", "DEAD", "CC", "XXX", 
	"You", "AND", "ME", "File" 
};

struct treenode* search(struct treenode* root, char* name){
	struct treenode* p;
	int result;
	if(root == NULL){
		printf("This tree is empty.\n");
	}
	p = root;
	while((p != NULL) && (result = strcmp(p->value->name, name)) != 0){
		if(result > 0){
			p = p->left;
		}else{
			p = p->right;
		}
	}	
	return p;
}



int main(void){
	char name[30];
	int i;
	//struct treenode* root = NULL, *p;
	struct treenode** root = (struct treenode**)malloc(sizeof(struct treenode*)), *p;
	for(i = 0; i < NUM; i++){
		//	root = build(root, &datas[i]);
		insert(root, &datas[i]);
	}
	printf("please input search string: \n");
	scanf("%s", name);
	//p = search(root, name);
	p = search(*root, name);
	if(p != NULL){
		print_data(p->value);
	}else{
		printf("Not found\n");
	}
	return 0;
}



void print_data(struct data* p){
	printf("name: %s\n", p->name);
	printf("school: %s\n", p->school);
	printf("city: %s\n", p->city);
	printf("province: %s\n", p->province);
}
