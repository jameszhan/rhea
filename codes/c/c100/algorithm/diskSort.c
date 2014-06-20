#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#define NUM 10

struct data{
	char name[20];
	char school[20];
	char city[20];
	char province[20];
}info;

struct data addrs[NUM] = {
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

void disk_sort(FILE*, int);
void qs_disk(FILE*, int, int);
void exchange(FILE*, int, int);
char* get_name(FILE*, long);
void print_data(struct data*);
struct data* get_data(FILE*, long);

void qs(int a[], int l, int r){
	int i, j, d, t;
	i = l;
	j = r;
	d = a[(l + r) / 2];
	while(i < j){
		while(i < r && a[i] < d) i++;
		while(j > l && a[j] > d) j--;
		if(i < j){
			t = a[i];
			a[i] = a[j];
			a[j] = t;
			i++;
			j--;
		}				
	}
	if(l < i) qs(a, l, i - 1);
	if(r > i) qs(a, i + 1, r);		
}

int main(void){
	int i;
	FILE* fp;

	if((fp = fopen("datalist.txt", "w+")) == NULL){
		printf("Open file failure!");
		exit(1);
	}
	printf("write to file\n");
	fwrite(addrs, sizeof(addrs), 1, fp);
	for(i = 0; i < NUM; i++){
		struct data* p;
		p = get_data(fp, i);
		print_data(p);
		printf("\n");
	}
	fclose(fp);

	if((fp = fopen("datalist.txt", "rb+")) == NULL){
		printf("Can't open the file with mode read and write\n");
		exit(1);
	}
	printf("Start sorting\n");
	disk_sort(fp, NUM);
	printf("End sorting\n");

	for(i = 0; i < NUM; i++){
		struct data* p;
		p = get_data(fp, i);
		print_data(p);
		printf("\n");
	}
	fclose(fp);
	
	printf("\n");
	return 0;
}

void disk_sort(FILE* fp, int count){
	qs_disk(fp, 0, count - 1);
}

void qs_disk(FILE* fp, int l, int r){
	int i, j;
	char s[30];
	i = l;
	j = r;
	
	strcpy(s, get_name(fp, (i + j) /2));
	while(i < j){
		while(i < r && strcmp(get_name(fp, i), s) < 0) i++;
		while(j > l && strcmp(get_name(fp, j), s) > 0) j--;
		printf("ok\n");
		if(i < j){
			exchange(fp, i, j);
			i++;
			j--;		
		}
	}
}

void exchange(FILE* fp, int i, int j){
	char a[sizeof(info)], b[sizeof(info)];
	fseek(fp, sizeof(info) * i, SEEK_SET);
	fread(a, sizeof(info), 1, fp);
	
	fseek(fp, sizeof(info) * j, SEEK_SET);
	fread(b, sizeof(info), 1, fp);
	
	fseek(fp, sizeof(info) * j, SEEK_SET);
	fwrite(a, sizeof(info), 1, fp);

	fseek(fp, sizeof(info) * i, SEEK_SET);
	fwrite(b, sizeof(info), 1, fp);
}

char* get_name(FILE* fp, long rec){
	struct data* p;
	p = &info;
	rewind(fp);
	fseek(fp, rec * sizeof(struct data), SEEK_SET);
	fread(p, sizeof(struct data), 1, fp);
	return p->name;
}
struct data* get_data(FILE* fp, long rec){
	struct data* p;
	p = &info;
	rewind(fp);
	fseek(fp, rec * sizeof(info), SEEK_SET);
	fread(p, sizeof(info), 1, fp);
	return p;
}

void print_data(struct data* p){
	printf("name: %s\n", p->name);
	printf("school: %s\n", p->school);
	printf("city: %s\n", p->city);
	printf("province: %s\n", p->province);
}
