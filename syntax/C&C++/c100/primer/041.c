#include<stdlib.h>
#include<stdio.h>
#include<string.h>


int main(void){
	int binary(char* [], char*, int);
	void insert(char* [], char*, int, int);

	char* temp;
	char* ptr1[6];
	
	int i;
	printf("Initialize....\n");
	for(i = 0; i < 5; i++){
		ptr1[i] = (char*)malloc(20);
		gets(ptr1[i]);
	}
	
	ptr1[5] = (char*)malloc(20);
	printf("\n");
	printf("original string:\n");
	for(i = 0; i < 5; i++){
		printf("%s\n", ptr1[i]);
	}

	printf("\ninput search string:\n");
	temp = (char*)malloc(20);
	gets(temp);
	i = binary(ptr1, temp, 5);
	printf("i = %d\n", i);
	
	insert(ptr1, temp, 5, i);
	printf("output strings:\n");
	
	for(i = 0; i < 6; i++){
		printf("%s\n", ptr1[i]);
	}
		
}


int binary(char* ptr[], char* str, int n){
	int h, l, m;
	l = 0;
	h = n - 1;
	if(strcmp(str, ptr[l]) < 0){
		return 0;
	}
	if(strcmp(str, ptr[h]) > 0){
		return n;
	}
	while(l <= h){
		m = (l + h) / 2;
		if(strcmp(str, ptr[m]) < 0){
			h = m - 1;
		}else if(strcmp(str, ptr[m]) > 0){
			l = m + 1;
		}else{
			return m;
		}
	}
	return l;
}


void insert(char* ptr[], char* str, int n, int i){
	int j;
	for(j = n; j > i; j--){
		strcpy(ptr[j], ptr[j - 1]);
	}
	strcpy(ptr[i], str);
}
