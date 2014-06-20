#include<stdio.h>

int sum_day(int, int);
int leap(int);

int main(void){
	int year, month, day, days;
	printf("Please input Date(yyyy-MM-dd):");
	scanf("%d-%d-%d", &year, &month, &day);
	printf("%d-%d-%d", year, month, day);
	
	days = sum_day(month, day);

	if(leap(year) && month > 2){
		days++;
	}
	printf(" is this year's %dth days.\n", days);
	return 0;
}

static int day_tab[13] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

int sum_day(int month, int day){
	int i;
	for(i = 1; i < month; i++){
		day += day_tab[i];
	}
	return day;
}

int leap(int year){
	int leap;
	leap = (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
	return leap;
}
