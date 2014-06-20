#include<stdio.h>

int main(void){
	char a[] = "C Language Program";
	int i, len = 0;
	for(i = 0; a[i] != '\0'; i++){
		len++;
	}
	printf("%s,%d", a, len);
}
