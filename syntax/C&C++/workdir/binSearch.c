#include<stdio.h>

int binSearch(int* a, int v, int l, int r){
	if(l > r) return -1;
	int mid = (l + r)/2;
	if(a[mid] == v){
		return mid;
	}else if(a[mid] < v) {
		return binSearch(a, v, l + 1, r);
	}else {
		return binSearch(a, v, l, r - 1);
	}		
}

int main(){
	int a[9] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
	int v;
	printf("please type a number:");
	scanf("%d", &v);
	printf("the %d index is %d\n", v, binSearch(a, v, 0, 8));
}
