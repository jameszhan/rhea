/**
	A simple dictonary
*/

#include <stdio.h>
#include<string.h>
#include<ctype.h>

char* dic[][40] = {
	"cluster", "A bright shine on the surface.",
	"disgrase", "Loss of honor and respect.",
	"glamour", "Strong attraction.",
	"tomb", "The place where a dead person is buried.",
	"garbage", "Unwanted or spoiled food.",
	"bliss", "Great happiness or joy.",
	"commend", "Speck favorably of.",
	"", " "
};

int main(void){
	char word[80], ch;
	char** point;
	
	do{
		puts("Please enter word: ");
		scanf("%s", word);
		point = (char**)dic;
		do{
			if(!strcmp(*point, word)){
				puts("The meaning of the word is: ");	
				puts(*(point + 1));
				break;
			}
			/*if(!strcmp(*point, word)){
				break;
			}*/
			point = point + 2;
		}while(*point);
		if(!*point){
			puts("The word is not in dictionary.");
		}
		printf("Another? (y/n):");
		scanf("%c%*c", &ch);
		printf("ch=%c", ch);
	}while(toupper(ch) != 'N');
	printf("\n");
	return 0;
}
