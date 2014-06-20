#include<stdio.h>

int main(void){
	int num;
	void average(float*, int);
	void search(float (*)[4], int);
	
	static float score[4][4] = {
		{76, 90, 92, 87},
		{68, 78, 69, 94},
		{89, 82, 81, 60},
		{81, 68, 60, 97}
	};

	printf("total average:");
	average(*score, 16);
	printf("please input student id(0-3): ");
	scanf("%d", &num);
	search(score, num);
	
	return 0;
}

void average(float* point, int n){
	float* p_end;
	float aver;
	float sum = 0;
	p_end = point + n - 1;
	while(point < p_end){
		sum += *point++;
	}
	aver = sum/n;
	printf("%5.2f\n", aver);
}

void search(float (*point)[4], int n){
	int i;
	for(i = 0; i < 4; i++){
		printf("%5.2f ", *(*(point + n) + i));
	}
	printf("\n");
}
