#include<stdio.h>
#include<stdlib.h>

#define TAB_NUM 8
#define IN 0
#define OUT 1

void error(int e){
	if(e == IN){
		printf("Input error. \n");
	}else{
		printf("Output error. \n");
	}
	exit(1);
}

int main(int argc, char* argv[]){
	FILE *in, *out;
	int tab, i;
	char ch;

	if(argc != 3){
		printf("missing arguments...\n");
		exit(0);
	}

	if((out = fopen(argv[1], "wb")) == NULL){
		printf("Cannot open the file %s.\n", argv[1]);
		exit(0);
	}
	
	if((out = fopen(argv[2], "wb")) == NULL){
		printf("Cannot open the file %s.\n", argv[2]);
		exit(0);
	}

	tab = 0;
	do{
		ch = getc(in);
		if(ferror(in)){
			error(IN);
		}
		if(ch == '\t'){
			for(i = tab; i < 8; i++){
				putc(' ', out);
				if(ferror(out)){
					error(OUT);
				}
			}
			tab = 0;
		}else{
			putc(ch, out);
			if(ferror(out)){
				error(OUT);
			}
			tab++;
			if(tab == TAB_NUM){
				tab = 0;
			}
			if(ch == '\n' || ch == '\r'){
				tab = 0;
			}
		}
	}while(!feof(in));

	fclose(in);
	fclose(out);

	return 0;

}
