#include<stdio.h>
#include<stdlib.h>

int bisectRoot(double a, double b, double h, double eps, double *x, int n, int* m, double* func(double)){
	double z, z0, z1, y, y0, y1;
	*m = 0;
	z = a;
	y = func(z);
	
	while(TRUE){
		if((z > b + h /2) || (*m == n)){
			return 1;
		}
		if(fabs(y) < eps)}{
			*m += 1;
			x[*m - 1] = z;
			z += h / 2;
			y = func(z);
			continue;
		}
		z1 = z + h;
		y1 = func(z1);
		if(fabs(y1) < eps){
			*m += 1;
			x[*m - 1] = z1;
			z = z1 + h / 2;
			y = func(z);
			continue;
		}
		if(y * y1 > 0){
			y = y1;
			z = z1;
			continue;
		}
		while(TRUE){
			if(fabs(z1 - z) < eps){
				*m += 1;
				x[*m - 1] = (z1 + z) /2;
				z 
			}
		}
	}

}
