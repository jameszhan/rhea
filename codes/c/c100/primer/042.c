#include<stdio.h>
#include<stdlib.h>

int main(void){
	int a[10], b[3][4];
	int *p1, *p2, **p3;
	int i, j;
	printf("Please input an array (10 elements): \n");
	for(i = 0; i < 10; i++){
		scanf("%d", &a[i]);
	}

	printf("please input two-dimensional array (3 rows 4 cols):\n");
	for(i = 0; i < 3; i++){
		for(j = 0; j < 4; j++){
			scanf("%d", &b[i][j]);
		}
	}
	printf("\n");
	
	for(p1 = a, p3 = &p1, i = 0; i < 10; i++){
		printf("%4d ", *(*p3 + i));
	}
	printf("\n");
	
	for(p1 = a; p1 -a < 10; p1++){
		p3 = &p1;
		printf("%4d ", **p3);
	}
	printf("\n");

	for(i = 0; i < 3; i++){
		p2 = b[i];
		p3 = &p2;
		for(j = 0; j < 4; j++){
			printf("%4d ", *(*p3 + j));
		}
		printf("\n");
	}

	for(i = 0; i < 3; i++){
		p2 = b[i];
		for(p2 = b[i]; p2 - b[i] < 4; p2++){
			p3 = &p2;
			printf("%4d ", **p3);
		}
		printf("\n");
	}
	return 0;
}
