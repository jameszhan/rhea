#include<stdio.h>
#include<ctype.h>

int main(void){
	char ch;
	printf("Please enter som text(input a point to quit).\n");
	do{
		ch = getchar();
		if(islower(ch)){
			ch = toupper(ch);
		}else{
			ch = tolower(ch);
		}
		putchar(ch);
	}while(ch != '.');
	printf("\n");
}
