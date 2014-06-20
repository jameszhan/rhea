extern int printf (__const char *__restrict __format, ...);

#define PI 3.1415926

float circumf(int a){
	return 2 * a * PI;
}

float area(int a){
	return a * a * PI;
}

int main(){
	int x = 10;
	printf("Radius: %d\n", x);
	printf("Circumference: %f\n", circumf(x));
	printf("Area: %f\n", area(x));
	return 0;
}
