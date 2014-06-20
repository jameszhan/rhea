#include<stdio.h>

inline int parent(int i){
	return (i - 1) / 2;
}

inline int left(int i){
	return 2 * i + 1;
}
inline int right(int i){
	return 2 * i + 2;
}

void adjust(int a[], int i, int n){
	int j, k, t, swap;
	k = a[i];
	j = left(i);
	while(j < n){
		if(j < n-1){
			if(a[j+1] < a[j]){
				j++;
			}
		}
		if(k > a[j]){
			a[parent(j)] = a[j];
			j = left(j);
		}else{
			break;
		}
	}
	a[parent(j)] = k;
}
void sort(int a[], int n){
	int i, t;
	for(i = parent(n-1); i >= 0; i--){
		adjust(a, i, n);
	}
	for(i = 1; i < n; i++){
		adjust(++a, 0, n - i);
	}
}

int main(void){
	int i, len = 7;
	int a[] = {9, 8, 7, 6, 5, 4, 3};
	for(i = 0; i < len; i++){
		printf("%d, ", a[i]);
	}
	printf("\n");
	sort(a, len);
	for(i = 0; i < len; i++){
		printf("%d, ", a[i]);
	}
	printf("\n");
}

