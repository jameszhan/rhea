#include<stdio.h>

int main(void){

	int sex, weight, cubage;
	printf("please input sex and weight:\n");
	scanf("%d, %d", &sex, &weight);
	
	if(sex >= 0){
		if(weight >= 120){
			cubage = 200;
			printf("This man should transfuse %d ml\n", cubage);
		}else{			
			cubage = 180;
			printf("This man should transfuse %d ml\n", cubage);
		}
	}else{
		if(weight >= 100){
			cubage = 150;
			printf("This woman should transfuse %d ml\n", cubage);
		}else{			
			cubage = 120;
			printf("This woman should transfuse %d ml\n", cubage);
		}
	}

	return 0;
}
