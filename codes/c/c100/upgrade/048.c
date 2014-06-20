#include<stdio.h>

struct student{
	long 	num;
	char	name[20];
	char	sex;
	int	age;
};


struct student stu[4] = {
	{97032, "xiao ming", 'M', 20},
	{97033, "xiao wang", 'M', 21},
	{97034, "xiao shui", 'F', 18},
	{97035, "xiao tong", 'M', 22}
};

int main(void){
	struct student* p;
	printf("SNO\tName\tSex\tAge\n");
	for(p = stu; p < stu + 4; p++){
		printf("%-8ld%-8s%-8c%-8d\n", p->num, p->name, p->sex, p->age);
	}
	return 0;
}
