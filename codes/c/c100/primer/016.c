#include<stdio.h>
#include<math.h>

#define PI 3.14159

int main(void){
	int radius;
	double area;
	for(radius = 1; radius < 10; radius++){
		area = PI * radius * radius;
		if(area >= 120.0){
			break;
		}
		printf("square = %f\n", area);
	}
	printf("now radius = %d\n\n", radius - 1);
	for(radius = 1; radius < 10; radius++){
		area = PI * radius * radius;
		if(area < 120.0){
			continue;
		}
		printf("square = %f\n", area);
	}
	printf("now radius = %d\n\n", radius - 1);
	
	return 0;
}
