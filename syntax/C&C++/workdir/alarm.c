#include<unistd.h>
#include<stdio.h>
#include<stdlib.h>

int main(void){
	int ret;
	ret = alarm(5);
	pause();
	printf("I have been wakeup. ret=%d\n", ret);	
	alarm(1);
}
