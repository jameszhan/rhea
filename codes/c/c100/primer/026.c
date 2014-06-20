#include<stdio.h>

#define N 3
void convert(int element[N][N]);

int main(void){
	int array[N][N];
	int i, j;
	printf("Input array elelent: \n");
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			scanf("%d", &array[i][j]);
		}
	}
	printf("\nThe array is:\n");
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			printf("%5d", array[i][j]);
		}
		printf("\n");
	}
	convert(array);
	printf("\nAfter Convert:\n");
	for(i = 0; i < N; i++){
		for(j = 0; j < N; j++){
			printf("%5d", array[i][j]);
		}
		printf("\n");
	}
	return 0;
}

void convert(int element[N][N]){
	int i, j, t;
	for(i = 0; i < N; i++){
		for(j = i+1; j < N; j++){
			t = element[i][j];
			element[i][j] = element[j][i];
			element[j][i] = t;
		}
	}
}
