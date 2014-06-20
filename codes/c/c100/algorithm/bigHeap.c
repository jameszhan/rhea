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
	int j, k;
	k = a[i];
	j = left(i);
	while(j < n){
		if(j < n - 1){
			if(a[j + 1] > a[j]){
				j++;
			}
		}
		if(k < a[j]){
			a[parent(j)] = a[j];
		}else{
			break;
		}
		j = left(j);		
	}
	a[parent(j)] = k;	
}

void sort(int a[], int n){
	int i, t;
	for(i = parent(n - 1); i >= 0; i--){
		adjust(a, i, n);
	}
	for(i = n - 1; i > 0; i--){
		t = a[i];
		a[i] = a[0];
		a[0] = t;
		adjust(a, 0, i);
	}
}

int main(void){
	int len = 10, i;
	int a[] = {9, 1, 2, 7, 4, 6, 6, 7, 8, 9};
	
	for(i = 0; i < len; i++){
		printf("%d ", a[i]);
	}
	printf("\n");
	
	sort(a, len);
	
	for(i = 0; i < len; i++){
		printf("%d ", a[i]);
	}
	printf("\n");

}
