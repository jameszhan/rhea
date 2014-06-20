#include<stdio.h>


void avsco(float*, float*);
void avcour5(char*, float*);
void fail2(char*, int*, float*, float*);
void excellence(char*, int*, float*, float*);

int main(void){
	int i, j, data, *pnum, num[4]={
		1001,
		1002,
		1003,
		1004
	};
	float score[4][5], aver[4], *psco, *pave;
	char course[5][10] = {
		"Chinese",
		"Math",
		"English",
		"Physics",
		"Chemstry"
	}, *pcou;
	pcou = course[0];
	printf("StudentId");
	for(i = 0; i < 5; i++){
		printf(", %s", pcou + 10 * i);	
	}
	
	printf("\n");
	
	psco = &score[0][0];
	pnum = num;
	data = 98;
	for(i = 0; i < 4; i++){
		for(j = 0; j < 5; j++){
			do{
				data *= (i + j + 11);
				data++;
				data *= data;
				data++;
				data /= 13;
				data %= 100;
				if(data++ < 47){
					data += 5;
				}else{
					data += 2;
				}
			}while(data < 55);
			*(psco + 5 * i + j) = data;
		}
	}	
	for(i = 0; i < 4; i++){
		printf("%-8d", num[i]);
		for(j = 0; j < 5; j++){
			printf(" %8.2f", score[i][j]);
		}
		printf("\n");
	}
	printf("\n\n");
	pave = &aver[0];
	printf("\n\n");

	avsco(psco, pave);
	avcour5(pcou, psco);
	printf("\n\n");

	fail2(pcou, pnum, psco, pave);
	printf("\n\n");

	excellence(pcou, pnum, psco, pave);
	
	return 0;
}


void avsco(float* psco, float* pave){
	int i, j;
	float sum, average;
	for(i = 0; i < 4; i++){
		sum = 0.0;
		for(j = 0; j < 5; j++){
			sum += *(psco + 5 * i + j);
		}
		average = sum / 5;
		*(pave + i) = average;
	}
}

void avcour5(char* pcou, float* psco){
	int i;
	float sum, average5;
	sum = 0.0;
	for(i = 0; i < 4; i++){
		sum += *(psco + 5*i + 4);
	}
	average5 = sum / 4;
	printf("the 5th course %s average is %5.2f.\n", pcou, average5);
}


void fail2(char* pcou, int* pnum, float* psco, float* pave){
	int i, j, k, label;
	printf("Student who has more than 2 coure failed. \n");
	printf(" SID ");
	for(i = 0; i < 5; i++){
		printf("%-8s", pcou + 10 * i);
	}

	printf("  Average:\n");
	for(i = 0; i < 4; i++){
		label = 0;
		for(j = 0; j < 5; j++){
			if(*(psco + 5 * i + j) < 60.0){
				label++;
			}
		}
		if(label >= 2){
			printf("%-8d", *(pnum + i));
			for(k = 0; k < 5; k++){
				printf("  %-8.2f\n", *(pave + i));
			}
		}
	
	}
}


void excellence(char* pcou, int* pnum, float* psco, float* pave){
	int i, j, k, label;
	printf("   Execllence Student\n");
	printf("Student No");

	for(i = 0; i < 5; i++){
		printf(" %-8s", pcou + 10 * i);
	}
	printf("  Avg: \n");
	for(i = 0; i < 4; i++){
		label = 0;
		for(j = 0; j < 5; j++){
			if(*(psco + 5*i +j) > 85.0){
				label++;
			}
		}
		if((label >=5) || (*(pnum + i) >= 90)){
			printf("%-8d", *(pnum + i));
			for(k = 0; k < 5; k++){
				printf("  %-8.2f", *(psco + 5*i + k));
			}
			printf("  %8.2f\n", *(pave + i));
		}
	}
}
