#include<stdio.h>
#include<stdlib.h>
#include<time.h>

int main(void){
	long time1;
	int i, time2;

	time1 = time(NULL);
	printf("%ld\n", time1);

	time2 = (unsigned)time1 / 2;
	printf("%ld\n", time2);

	srand(time2);

	for(i = 0; i < 10; i++){
		printf("%d ", rand());
	} 
	printf("\n");

	return 0;
	
}
