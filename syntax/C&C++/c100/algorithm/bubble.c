#include<stdio.h>
#include<string.h>

void bubble(char* s, int count){
	int i, j;
	char c;
	for(i = 0 ; i < count; i++){
		for(j = count - 1; j > i; j--){
			if(s[j] < s[j - 1]){
				c = s[j - 1];
				s[j - 1] = s[j];
				s[j] = c;
			}
		}
	}	
	
}

int main(void){
	int count;
	char str[200];
	printf("Please input string: \n");
	gets(str);
	count = strlen(str);
	bubble(str, count);
	printf("The sort string is: \n");
	printf("%s.\n", str);
	return 0;
}
