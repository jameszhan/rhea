#include<stdio.h>
#include<string.h>

int main(void){
	struct student{
		long 	num;
		char 	name[30];
		char 	sex[10];
		float	score;
	};

	struct student stu;
	struct student* p;

	p = &stu;
	stu.num = 97032;
	p->score = 98.5;
	strcpy(p->name, "James");
	strcpy(stu.sex, "Male");

	printf("SNO: %ld\nName: %s\nSex: %s\nScore: %4.2f\n", stu.num, stu.name, stu.sex, stu.score);
	printf("\n");
	printf("SNO: %ld\nName: %s\nSex: %s\nScore: %4.2f\n", (*p).num, (*p).name, (*p).sex, (*p).score);
	printf("\n");
	return 0;
}
