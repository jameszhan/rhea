#include<stdio.h>

void swap(int*, int*);
void exchange(int*, int*, int*);

int main(void){
	int x, y, z;
	printf("Please input 3 number: ");
	scanf("%d, %d, %d", &x, &y, &z);
	exchange(&x, &y, &z);
	printf("%d, %d, %d\n", x, y, z);
	
	return 0;
}

void swap(int* pt1, int* pt2){
	int t;
	t = *pt1;
	*pt1 = *pt2;
	*pt2 = t;
}


void exchange(int* q1, int* q2, int* q3){
	if(*q1 < *q2){
		swap(q1, q2);
	}
	if(*q1 < *q3){
		swap(q1, q3);
	}
	if(*q2 < *q3){
		swap(q2, q3);
	}
}
