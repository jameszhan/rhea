#include<stdio.h>

#define M 5
#define N 10

float score[N][M];
float a_stu[N], a_cor[M];

void input_stu();
void avr_stu();
void avr_cor();
float highest(int*, int*);
float s_diff();

int main(void){
	int i, j, r, c;
	float h;
	r = 0;
	c = 1;
	input_stu();
	avr_stu();
	avr_cor();
	printf("\nNum\tC1\tC2\tC3\tC4\tC5\tAVG");
	for(i = 0; i < N; i++){
		printf("\nNO%2d\t", i + 1);
		for(j = 0; j < M; j++){
			printf("%8.2f\t", score[i][j]);
		}
		printf("%8.2f", a_stu[i]);
	}
	printf("\nCource Avg:");
	for(j = 0; j < M; j++){
		printf("%8.2f", a_cor[j]);
	}
	h = highest(&r, &c);
	printf("\n\nThe best score is %8.2f[student id is %d, course id is %d]\n", h, r, c);
	printf("Variance is %8.2f\n", s_diff());
	
	return 0;
}


void input_stu(){
	int i, j;
	int s = 75;
	for(i = 0; i < N; i++){
		for(j = 0; j < M; j++){
			do{
				s *= 13;
				s += 12;
				s %= 100;
			}while(s < 30);
			score[i][j] = s;
		}
	}
}

void avr_stu(){
	int i, j;
	float s;
	for(i = 0; i < N; i++){
		s = 0;
		for(j = 0; j < M; j++){
			s = s + score[i][j];
		}
		a_stu[i] = s/M;
	}
}

void avr_cor(){
	int i, j;
	float s;
	for(j = 0; j < M; j++){
		s = 0;
		for(i = 0; i < N; i++){
			s += score[i][j];
		}
		a_cor[j] = s / (float)N;
	}
}


float highest(int* r, int* c){
	float high;
	int i, j;
	high = score[0][0];
	for(i = 0; i < N; i++){
		for(j = 0; j < M; j++){
			if(score[i][j] > high){
				high = score[i][j];
				*r = i + 1;
				*c = j + 1;
			}
		}
	}
	return high;
}

float s_diff(){
	int i;
	float sumx, sumxn;
	sumx = 0.0;
	sumxn = 0.0;
	for(i = 0; i < N; i++){
		sumx  += a_stu[i] * a_stu[i];
		sumxn += a_stu[i];
	}
	return (sumx/N - (sumxn/N) * (sumxn/N));
}
