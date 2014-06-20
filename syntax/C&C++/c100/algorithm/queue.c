#include<stdio.h>

#define MAX 10

void setNull(front, rear)
int *front, *rear;
{
	*front = 0;
	*rear = 0;
}

int empty(front, rear)
int *front, *rear;
{
	if(*front == *rear){
		return 1;
	}else{
		return 0;
	}
}

int enqueue(q, x, front, rear)
int q[];
int x;
int *front, *rear;
{
	*rear = (*rear + 1) % MAX;
	if(*front == *rear){
		printf("queue is above overflow!");
		return -1;
	}else{
		q[*rear] = x;
		return 0;
	}
}

int dequeue(q, y, front, rear)
int q[];
int* y;
int *front, *rear;
{
	*front = (*front + 1) % MAX;
	if(*front == *rear){
		printf("queue is lower overflow!");
		return -1;
	}else{
		*y = q[*front];
		return 0;
	}
	
}

int main(void){
	int q[MAX];
	int f = 0, r = 0;
	int i, x, m, n;
	int a;
	
	setNull(&f, &r);
	printf("Input queue size: \n");
	scanf("%d", &m);
	printf("Input queue integer data:\n");
	for(i = 0; i < m; i++){
		scanf("%d", &x);
		a = enqueue(q, x, &f, &r);
		if(a == -1){
			break;
		}
	}
	
	printf("Input dequeue size: \n");
	scanf("%d", &n);
	printf("Print queue integer data:\n");
	for(i = 0; i < n; i++){
		if(dequeue(q, &x, &f, &r) == -1){
			break;
		}
		printf("%d\n", x);
	}
	if(empty(&f, &r) == 1){
		printf("queue is empty");
	}else{
		printf("queue has %d data", (m-n));
	}
	
	return 0;
	return 0;
}
