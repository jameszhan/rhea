#include<stdio.h>
#include<stdlib.h>


int main(int argc, char* argv[]){
	FILE* fp;

	if(argc != 3){
		printf("missing arguments...\n");
		exit(0);
	}

	if((fp = fopen(argv[1], "rb")) == NULL){
		printf("Cannot open the file %s.\n", argv[1]);
		exit(0);
	}
	
	if(fseek(fp, atol(argv[2]), 0)){
		printf("seek error! \n");
		exit(0);
	}
	
	printf("At %ld position, the character is %c. \n", atol(argv[2]), getc(fp));
	fclose(fp);

	return 0;

}
