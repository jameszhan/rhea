#include<stdio.h>

int main(void){
	enum color{blue, red, yellow, purple, black};
	enum color i, j, k, pri;
	int n, loop;
	n = 0;

	for(i = blue; i <= black; i++){
		for(j = blue; j <= black; j++){
			if(i !=j){
				for(k = blue; k <= black; k++){
					if(k != i && k != j){
						n++;
						printf("%-6d", n);
						for(loop = 1; loop <= 3; loop++){
							switch(loop){
								case 1:
									pri = i;
									break;
								case 2:
									pri = j;
									break;
								case 3:
									pri = k;
									break;
								default:
									break;
							}
							switch(pri){
								case blue:
									printf("%-10s", "blue");
									break;
								case red:
									printf("%-10s", "red");
									break;
								case yellow:
									printf("%-10s", "yellow");
									break;
								case purple:
									printf("%-10s", "purple");
									break;
								case black:
									printf("%-10s", "black");
									break;
								default:
									break;
							}
						}
						printf("\n");
					}
				}
			}
		}
	}
	printf("total: %5d\n", n);
}	
