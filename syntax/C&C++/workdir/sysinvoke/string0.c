#include<stdio.h>

static inline void* __memcpy(void* dest, const void* src, size_t n){
	int d0, d1, d2;
	__asm__ __volatile__(
		"rep movsl\n\t"
		"testb $2, %b4\n\t"
		"je 1f\n\t"
		"movsw\n"
		"1:\ttestb $1, %b4\n\t"
		"je 2f\n\t"
		"movsb\n"
		"2:"
		: "=&c"(d0), "=&D"(d1), "=&S"(d2)
		:"0"(n/4), "q"(n), "1"((long)dest), "2" ((long)src)
		: "memory"
	);
	return dest;
}


int main(void){
	char* s1 = "Hello World", s2;
	__memcpy((void*)s2, (void*)s1, 4);
	printf("%s\n", s1);
	printf("%s\n", s2);
	
}

