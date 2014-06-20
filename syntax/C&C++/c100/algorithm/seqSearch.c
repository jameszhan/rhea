#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define NUM 10

struct chain{
	char name[20];
	char school[20];
	char city[20];
	char province[20];
	struct chain* next;
};

struct chain* create();
struct chain* seqSearch(struct chain*, char*);
void print_data(struct chain*);


struct chain datas[NUM] = {
	"WenHai", "BIT", "JiLin", "JiLin", NULL,
	"TongWei", "BIT", "ZhenJiang", "JiangSu", NULL,
	"SunYou", "MIT", "ShenZhen", "GuangDong", NULL,
	"XiaoMing", "PKU", "TaiYuan", "ShanXi", NULL,
	"Kitty", "PKU", "CCTV", "CCTV",NULL,
	"Money", "JXNU", "SUN", "Zhao", NULL,
	"LieHuo", "Meng", "ZZZ", "DDDD", NULL,
	"LeiFeng", "High", "Nongcun", "ZhongDi",NULL,
	"Andy", "DEAD", "CC", "XXX", NULL,
	"You", "AND", "ME", "File", NULL
};


int main(void){
	struct chain* head;
	struct chain* p;
	char name[30];
	head = create();

	printf("Please input a search name:\n");
	scanf("%s", name);
	p = seqSearch(head, name);
	printf("the result is:\n");
	if(p != NULL){
		print_data(p);
	}else{
		printf("There is no data.\n");
	}
	return 0;
}

struct chain* create(){
	struct chain* head, *tail, *p;
	int i;
	head = tail = NULL;
	for(i = 0; i < NUM; i++){
		p = (struct chain*)malloc(sizeof(struct chain));
		strcpy(p->name, datas[i].name);
		strcpy(p->school, datas[i].school);
		strcpy(p->city, datas[i].city);
		strcpy(p->province, datas[i].province);
		p->next = NULL;
		if(head == NULL){
			head = tail = p;
		}else{
			tail = tail->next;
		}
		tail->next = p;		
	}
	return head;
}

struct chain* seqSearch(struct chain* head, char* name){
	struct chain* p;
	for(p = head; p != NULL; p = p->next){
		if(strcmp(p->name, name) == 0) break;
	}
	return p;
}


void print_data(struct chain* p){
	printf("name: %s\n", p->name);
	printf("school: %s\n", p->school);
	printf("city: %s\n", p->city);
	printf("province: %s\n", p->province);
}
