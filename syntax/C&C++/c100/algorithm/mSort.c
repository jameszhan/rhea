#include<stdio.h>
#include<stdlib.h>

void merge(int a[], int l, int m, int r){
	int* t;
	int i = l, j = m + 1, k = 0;
	if((t = malloc(sizeof(int) * (r - l + 1))) == NULL){
		printf("Allocate memory failure!");
		exit(1);
	}
	while(i <= m && j <= r){
		if(a[i] > a[j]){
			t[k++] = a[j++]; 
		}else{
			t[k++] = a[i++];
		}
	}
	if(i > m){
		while(j <= r){
			t[k++] = a[j++];
		}
	}else{
		while(i <= m){
			t[k++] = a[i++];
		}
	}
	for(i = l, k = 0; i <= r; i++, k++){
		a[i] = t[k];
	}
	free(t);
}
void sort(int a[], int l, int r){
	int m;
	if(l < r){
		m = (l + r) / 2;	
		sort(a, l, m);
		sort(a, m + 1, r);
		merge(a, l, m, r);
	}
}

void mergeSort(int a[], int n){

	sort(a, 0, n-1);
}

int main(void){
	int a[] = {3, 5, 6, 8, 1, 3, 7, 9, 4, 2};
	int i;
	for(i = 0; i < 10; i++){
		printf("%4d", a[i]);
	}
	printf("\n");
	mergeSort(a, 10);
	for(i = 0; i < 10; i++){
		printf("%4d", a[i]);
	}
	printf("\n");
}
