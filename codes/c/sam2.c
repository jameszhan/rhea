#include<stdio.h>

void encypt(char* s){
	char c;
	while(c = *s){
		if((c >= 'a' && c <= 'z')){
			c = 25 + 'a' + 'a' - c; 	
		}
		if(c >= 'A' && c <= 'Z'){
			c = 25 + 'A' + 'A' - c;
		}
		*s++ = c;
	}	
}

int main(void){
	char str[80];
	printf("please input a string:");
	scanf("%s", str);
	encypt(str);
	printf("%s\n", str);	
	return 0;
}
