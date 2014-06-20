#include<stdio.h>

void inv(int*, int);

int main(void){
	int i;
	int array[10] = {1, 3, 9, 11, 0, 8, 5, 6, 14, 98};
	printf("Orginal array is:\n");
	for(i = 0; i < 10; i++){
		printf("%d\t", array[i]);
	}
	printf("\n");

	inv(array, 10);
	printf("After inverse, the array is:\n");
	for(i = 0; i < 10; i++){
		printf("%d\t", array[i]);
	}
	printf("\n");

	return 0;
}

void inv(int* x, int n){
	int *i, *j;
	int t;
	i = x;
	j = x + n - 1;
/*	while(i < j){
		t = *i;
		*i = *j;
		*j = t;
		i++;
		j--;	
	}
*/
	do{
		t = *i;
		*i = *j;
		*j = t;
		printf("i=%ld, j=%ld\n", i, j);
	}while(++i < --j);

}
