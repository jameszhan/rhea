#include<stdio.h>

int binSearch(int* a, int v, int l, int h){
	while(l <= h){
		int m = (l + h) / 2;
		if(a[m] > v){
			h = m - 1;
		} else if (a[m] < v){
			l = m + 1;
		} else{
			return m;
		}
	}
	return -1;
}

int main(){
	int a[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
	int v;
	while(1){		
		printf("please type a number:");
		scanf("%d", &v);
		if(v > 100 || v < 0){
			 break;
		}
		printf("the %d index is %d\n", v, binSearch(a, v, 0, 8));
	}
}
