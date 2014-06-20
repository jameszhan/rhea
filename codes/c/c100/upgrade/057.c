#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main(void){
	FILE *fp;
	char str[80];
	int i;

	if((fp = fopen("test.txt", "w")) == NULL){
		printf("Cannot open the file.\n");
		exit(0);
	}

	do{
		
		printf("Please enter a string: \n");
		gets(str);
		strcat(str, "\n");
		fputs(str, fp);
	}while(*str != '\n');

	rewind(fp);

	while(!feof(fp)){
		fgets(str, 79, fp);
		printf("ouput:%s.",str);
	}
	fclose(fp);

	return 0;
}
