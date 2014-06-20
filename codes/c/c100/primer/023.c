#include<stdio.h>
#include<stdlib.h>

int main(void){
	int select;
	int i, j;
	int score[5][7];
	int average = 0;
	int sum = 0;
	
	do{
		printf("This program has 4 function:\n");
		printf(" 1.Query Student score by Student ID.\n");
		printf(" 2.Count score by exam ID.\n");
		printf(" 3.Query score by student id and exam id.\n");
		printf(" 4.Input student score.\n");
		printf(" 0.Exit\n");
		printf(" Please select(0 - 4): ");
		scanf("%d", &select);
		switch(select){
			case 0:
				printf("OK\n");
				exit(0);
				break;
			case 1:
				printf("input student id: ");
				scanf("%d\n", &i);
				for(j = 0; j < 7; j++){
					printf("%dth score is %d\n", j, score[i][j]);
					sum += score[i][j];
				}
				average = sum / 6;
				printf("Average score is %d\n", average);
				break;
			case 2:
				printf("Input exam ID: ");
				scanf("%d\n", &j);
				for(i = 0; i < 5; i++){
					printf("%dth student 's score is %d\n", i, score[i][j]);
					sum += score[i][j];
				}
				average = sum/4;
				printf("Current Exam average score is %d\n", average);
				break;
			case 3:
				printf("Input student id:\n");
				scanf("%d %d\n", &i, &j);
				printf("%dth student 's %dth exam score is %d\n", i, j, score[i][j]);
				break;
			case 4:
				printf("Please Type score\n");
				for(i = 0; i < 5; i++){
					for(j = 0; j < 7; j++){
						scanf("%d\n", &score[i][j]);
					}
				}
				break;
			default:
				break;

		}	
	}while(1);
	return 0;	
}
