#include<stdio.h>

int main(void){
	int magic[15][15];
	int i, j, k, m, n;
	m = 0;
	while(m == 0){
		printf("please input n(0 < n <=15), n must an odd number\n");
		scanf("%d", &n);
		if(n != 0 && n <= 15 && n % 2 != 0){
			printf("Martin rank is %d\n", n);
			m = 1;
		}
	}
	for(i = 0; i < n; i++){
		for(j = 0; j < n; j++){
			magic[i][j] = 0;
		}
	}
	
	i = 0;	
	j = n/2;
	magic[i][j] = 1;
	for(k = 2; k <= n*n; k++){
		i--;
		j++;
		if(i < 0 && j >= n){
			i += 2;
			j--; 
		}else{
			if(i < 0){
				i = n - 1;
			}
			if(j >= n){
				j = 0;
			}
		}
		if(magic[i][j] == 0){
			magic[i][j] = k;
		}else{
			i += 2;
			j--;
			magic[i][j] = k;
		}		
	}
	
	for(i = 0; i < n; i++){
		for(j = 0; j < n; j++){
			printf("%5d", magic[i][j]);
		}
		printf("\n");
	}
	printf("\n");
	return 0;
}
