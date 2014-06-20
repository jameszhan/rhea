#include<stdio.h>

#define SIZE 4

struct person{
	int num;
	float cash;
	int sect;
} per[SIZE];

int main(void){
	int i;
	FILE *fp;
	fp = fopen("ATM.txt", "r");
	for(i = 0; i < SIZE; i++){
		fscanf(fp, "%d %f %d", &per[i].num, &per[i].cash, &per[i].sect);
		printf("%d\n", per[i].num);
	}
	fclose(fp);
}

