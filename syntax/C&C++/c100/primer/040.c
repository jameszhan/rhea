#include<stdio.h>
#include<string.h>


void check(char*, char*, int (*)(const char*, const char*));

int main(void){
	char s1[80];
	char s2[80];
	
	int (*p)(const char*, const char*);

	p = strcmp;
	printf("please input 2 string:\n");
	gets(s1);
	gets(s2);
	
	check(s1, s2, p);
	return 0;
}

void check(char* a, char* b, int (*cmp)(const char*, const char*)){
	printf("test equals\n");
	if(!(*cmp)(a, b)){
		printf("result equals\n");
	}else{
		printf("result not equals\n");
	}
}
