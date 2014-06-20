#include<stdio.h>
#include<stdlib.h>

int main(void){
	FILE *fp;
	char ch, filename[10];
	
	printf("Please input the name of file: ");
	scanf("%s", filename);

	if((fp = fopen(filename, "r")) == NULL){
		printf("Cannot open the file.\n");
		exit(0);
	}

	fclose(fp);

}
