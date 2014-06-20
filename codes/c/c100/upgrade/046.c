#include<stdio.h>

struct student{
	char 	number[6];
	char 	name[6];
	int 	score[3];
} stu[2];


void output(struct student [2]);

int main(void){
	int i, j;
	for(i=0; i < 2; i++){
		printf("Please input %d student's score:\n", i+1);
		printf("Student NO: ");
		scanf("%s", stu[i].number);
		printf("Name:");
		scanf("%s", stu[i].name);
		for(j = 0; j < 3; j++){
			printf("score %d.  ", j+1);
			scanf("%d", &stu[i].score[j]);
		}
		printf("\n");
	}
	output(stu);
	return 0;
}

void output(struct student stu[2]){
	int i, j;
	printf("SID\tName\tSC1\tSC2\tSC3\n");
	for(i = 0; i < 2; i++){
		printf("%-8s%-8s", stu[i].number, stu[i].name);
		for(j = 0; j < 3; j++){
			printf("%-8d", stu[i].score[j]);
		}
		printf("\n");
	}
}

