#include<stdio.h>
#include<stdlib.h>

int main(void){
	FILE *fp;
	int i = 156;
	long l = 9701076L;
	double d = 3.456;

	if((fp = fopen("test", "w")) == NULL){
		printf("Cannot open the file.\n");
		exit(0);
	}

	fwrite(&i, sizeof(int), 1, fp);
	fwrite(&l, sizeof(long), 1, fp);
	fwrite(&d, sizeof(double), 1, fp);

	rewind(fp);

	fread(&i, sizeof(int), 1, fp);
	fread(&l, sizeof(int), 1, fp);
	fread(&d, sizeof(int), 1, fp);
	
	printf("i = %d\n", i);	
	printf("d = %ld\n", l);	
	printf("d = %f\n", d);	
	
	fclose(fp);

	return 0;
}
