#include<stdio.h>
#include<math.h>

float f(float x){
	float y;
	y = ((x - 8.0) * x + 12.0) * x - 30;
	return y;
}

double xpoint(double x1, double x2){
	double r, y1 = f(x1), y2 = f(x2);
	r = (x1 * y2 - x2 * y1) / (y2 - y1);
	return r;
}

double root(double x1, double x2){
	double x, y, y1;
	y1 = f(x1);
	do{
		x = xpoint(x1, x2);
		y = f(x);
		if(y*y1 > 0){
			y1 = y;
			x1 = x;
		}else{
			x2 = x;
		}
	}while(abs(y) >= 0.0001);
	return x;
}

int main(void){
	float x1, x2, f1, f2, x;
	do{
		printf("Please input x1, x2: \n");
		scanf("%f, %f", &x1, &x2);
		f1 = f(x1);
		f2 = f(x2);
		printf("f1=%f, f2=%f\n", f1, f2);
	}while(f1 * f2 > 0 );
	x = root(x1, x2);
	printf("A root of equation is %9.6f\n", x);
}
