#include<stdio.h>


int main(void){

	int x, y, z, mid, dec;

	printf("please input 3 integer:\n");
	scanf("%d %d %d", &x, &y, &z);

	if(x < y){
		mid = x; x = y; y = mid;
	}
	if(x < z){
		mid = x; x = z; z = mid;
	}
	if(y < z){
		mid = y; y = z; z = mid;
	}

	printf("please input a integer, Positive for max and Negative for mid: \n");
	scanf("%d", &dec);
	if(dec >= 0){
		printf("Max is %d\n", x);
	}else{
		printf("Min is %d\n", z);
	}

	return 0;
}
