#include<stdio.h>
#include<math.h>


double equation(double);

double x_axis(double x1, double x2){
	double y1, y2, v;
	y1 = equation(x1);
	y2 = equation(x2);
	v = (x1 * y2 - x2 * y1) / (y2 - y1);
	return v;	
}

double root(double x1, double x2){
	double x, y, y1;
	y1 = equation(x1);
	do{
		x = x_axis(x1, x2);
		y = equation(x);
		if(y1 * y > 0){
			x1 = x;
			y1 = y;			
		}else{
			x2 = x;
		}
		printf("x=%lf,y=%lf,fabs(y)=%lf\n", x, y, fabs(y));		
	}while(fabs(y) > 0.000000001);

	return x;
}

int main(void){
	double x1, x2;
	
	printf("please input solution range: (x1, x2)\n");
	scanf("%lf,%lf", &x1, &x2);
	printf("%16.8lf\n", root(x1, x2));

	return 0;
}



double equation(double x){
	double v;
	v = x * x - 4.0;
	return v;
}
