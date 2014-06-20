#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>

char* alpha = "abcdefghijklmnopqrstuvwxyz";

int comp(const void*, const void*);

int main(void){
	char ch;
	char* p;
	
	printf("Enter a character: ");
	ch = getchar();
	ch = tolower(ch);
	
	p = (char*)bsearch(&ch, alpha, 26, 1, comp);
	
	if(p){
		printf("%c is in alphabet\n", *p);
	}else{
		printf("is not in alphabet\n");
	}

	return 0;
}

int comp(const void* ch, const void* s){
	return *(char*)ch - *(char*)s;
}
