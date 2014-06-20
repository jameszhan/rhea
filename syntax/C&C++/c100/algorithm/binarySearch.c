#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define NUM 10

struct chain{
	char name[20];
	char school[20];
	char city[20];
	char province[20];
};

struct chain* create();
int binarySearch(struct chain*, char*, int);
void print_data(struct chain*);


struct chain datas[NUM] = {
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

int comp(const void* a, const void* b){
	struct chain *p, *q;
	p = (struct chain*)a;
	q = (struct chain*)b;
	return strcmp(p->name, q->name);
}

int main(void){
	char name[30];
	int i;
	printf("Sort the datas\n");
	qsort(datas, NUM, sizeof(struct chain), comp);

	printf("Please input a search name:\n");
	scanf("%s", name);

	i = binarySearch(datas, name, NUM);
	printf("the result is:\n");
	if(i != -1){
		print_data(&datas[i]);
	}else{
		printf("There is no data.\n");
	}
	return 0;
}

int binarySearch(struct chain* head, char* name, int n){
	int low = 0, high = n - 1, mid, result;
	while(low <= high){
		mid = (low + high) / 2;
		result = strcmp(head[mid].name, name);
		if(result == 0){
			return mid;
		}else if(result > 0){
			high = mid - 1;
		}else{
			low = mid + 1;
		}
	}
	return -1;
	
}


void print_data(struct chain* p){
	printf("name: %s\n", p->name);
	printf("school: %s\n", p->school);
	printf("city: %s\n", p->city);
	printf("province: %s\n", p->province);
}
