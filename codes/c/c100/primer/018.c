#include<stdio.h>
#include<math.h>

int main(void){
	int i, j, num;
	int p, q, flagp, flagq;
	printf("Please input a plus integer: ");
	scanf("%d", &num);

	if((num % 2 != 0) || (num <= 4)){
		printf("input data error!\n");
	}else{
		p = 1;
		do{
			p += 2;
			q = num - p;
			flagp = 1;
			flagq = 1;
			for(i = 3; i <= (int)(floor(sqrt((double)p))); i += 2){
				if(p % i == 0){
					flagp = 0;
					break;
				}
			}
			j = 3;
			while(j <= (int)(floor(sqrt((double)q)))){
				if(q % j == 0){
					flagq = 0;
					break;
				}
				j += 2;
			}	
		}while(flagp * flagq == 0);

		printf("%d = %d + %d \n", num, p, q);
	}

	return 0;
}

