#include<stdio.h>
#include<math.h>

int main(void){
	int x, z;
	unsigned int y;
	printf("please type a number: x = ");
	scanf("%d", &x);
	printf("\n");
	y = (unsigned int)(x + 0x8000);
	z = abs(x);	
	printf("x=%lx, -x=%lx, re=%x\n", x, y, z);	
}
