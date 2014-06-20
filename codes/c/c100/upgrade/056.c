#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(void){
	FILE *fp;
	char str[100];
	int i;

	if((fp = fopen("file.txt", "w")) == NULL){
		printf("Cannot open the file.\n");
		exit(0);
	}
	
	printf("Please enter a string: \n");
	gets(str);

	for(i = 0; str[i] != '.'; i++){
		if(str[i] >= 'a' && str[i] <= 'z'){
			str[i] = str[i] - 32;
		}
		fputc(str[i], fp);
	}

	fclose(fp);

	fp = fopen("file.txt", "r");
	for(i = 0; str[i] != '.'; i++){
		str[i] = fgetc(fp);
	}	
	printf("%s\n", str);

	fclose(fp);

	return 0;
}
