

void swap(int* a, int* b){
	int c = *a;
	*a = *b;
	*b = c;	
}

int main(void){
	int a = 32, b = 24;
	swap(&a, &b);
	return (a - b);
}
