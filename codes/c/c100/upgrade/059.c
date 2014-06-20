#include<stdio.h>
#include<stdlib.h>

int main(void){
	FILE *fp;
	char str[80];
	int i;

	if((fp = fopen("test", "w")) == NULL){
		printf("Cannot open the file.\n");
		exit(0);
	}
	printf("Please enter a string and a number: \n");
	
	fscanf(stdin, "%s %d", str, &i);
	fprintf(fp, "%s %d", str, i);
	
	fclose(fp);
	
	if((fp = fopen("test", "r")) == NULL){
		printf("Cannot open the file.\n");
		exit(0);
	}
	
	fscanf(fp, "%s %d", str, &i);
	fprintf(stdout, "%s %d", str, i);
	fclose(fp);
	
	return 0;
}
