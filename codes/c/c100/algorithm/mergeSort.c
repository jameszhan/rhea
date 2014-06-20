#include<stdio.h>
#include<stdlib.h>

void merge(int[], int[], int, int);
void mergeSort(int[], int);

int main(void){
	int a[] = {26, 5, 37, 1, 61, 11, 59, 15, 48, 19};
	int i, b[10];
	printf("source data is: ");
	for(i = 0; i < 10; i++){
		printf("[%2d]", a[i]);
	}
	printf("\n");
	mergeSort(a, 10);
	printf("\n");
	printf("after sort, the data is: ");
	for(i = 0; i < 10; i++){
		printf("%4d", a[i]);
	}
	printf("\n");
	return 0;	
}

void display(int a[], int k, int n){
	int i, count = 1;
	for(i = 1; i <= n; i++){
		if((i == n) && (i % (2 * k) != 0)){
			printf("%4d]", a[i - 1]);
		}else{
			if((i % (2 * k)) == 1){
				printf("[%2d", a[i - 1]);
			}else if(i % (2 * k) == 0){
				printf("%4d]", a[i -1]);
			}else{
				printf("%4d", a[i - 1]);
			}
		}	
	}
}

void mergeSort(int a[], int n){
	int *t, k = 1;
	if((t = malloc(sizeof(int) * n)) == NULL){
		printf("allocate array space failure!");
		exit(1);
	} 	
	while(k < n){
		merge(a, t, k, n);
		printf("\n");
		display(a, k, n);
		k = 2 * k;	
	}
	free(t);
}

void merge(int src[], int dest[], int k, int n){
	int i, j;
	int s1 = 0, s2 = k, e1, e2;
	int m = 0;
	while(s1 + k < n){
		e1 = s2;
		e2 = (s2 + k < n) ? s2 + k : n;
		for(i = s1, j = s2; i < e1 && j < e2; m++){
			if(src[i] <= src[j]){
				dest[m] = src[i++];
			}else{
				dest[m] = src[j++];
			}			
		}
		while(i < e1){
			dest[m++] = src[i++];
		}
		while(j < e2){
			dest[m++] = src[j++];
		}
		s1 = e2;
		s2 = s1 + k;
	}
	for(i  = 0; i < n; i++){
		src[i] = dest[i]; 
	}
}

