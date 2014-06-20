#include<stdio.h>
#include<stdarg.h>

double sum_series(int num, ...);

int main(void){
	double d;
	d = sum_series(4, 0.5, 0.25, 0.125, 0.0625);
	printf("Sum of series is %f.\n", d);
	return 0;
}

double sum_series(int num, ...){
	double sum = 0.0, t;
	va_list argptr;
	va_start(argptr, num);

	for(; num; num--){
		t = va_arg(argptr, double);
		sum = sum + t;
	}

	va_end(argptr);
	return sum;
}
