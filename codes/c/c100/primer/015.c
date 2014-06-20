#include<stdio.h>
#include<math.h>

int main(void){
	double s, t, x;
	int n;
	printf("please input x: ");
	scanf("%lf", &x);
	t = x;
	n = 1;
	s = x;

	do{
		n += 2;
		t = t * (-1.0 * (x * x)) / ((n - 1.0) * n);
		s += t;
	}while(abs(t) >= 1e-8);
	printf("sin(%f) = %lf\n", x, s);
	return 0;
}
