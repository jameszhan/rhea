#include<stdio.h>

int main(void){
	int i;
	char a[] = "I am a student."; 
	char b[20];
	char *p1, *p2;
	
	p1 = a;
	p2 = b;
	while(*p2++ = *p1++);
	
	printf("string a is: %s\n", a);
	printf("string b is: %s\n", b);
	
}
