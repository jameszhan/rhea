#include<stdio.h>

int main(void){
	int array[10], i, j, min, tmp;
	printf("Please input 10 numbers: \n");
	for(i = 0; i < 10; i++){
		printf("array[%d] = ", i);
		scanf("%d", &array[i]);
	}	
	
	printf("\nThe array is: \n");
	for(i = 0; i < 10; i++){
		printf("%d\t", array[i]);
	}
	
	for(i = 0; i < 10; i++){
		min = i;
		for(j = i; j < 10; j++){
			if(array[min] > array[j]){
				min = j;
			}
		}
		tmp = array[i];
		array[i] = array[min];
		array[min] = tmp;
	}
	printf("\nThe result is: \n");
	for(i = 0; i < 10; i++){
		printf("%d\t", array[i]);
	}
	printf("\n");
	return 0;
}
