#include<stdio.h>

#define getSegByte(seg, addr) \
({ \
	register char _res; \
	__asm__("push %%fs; \
		mov %%ax, %%fs; \
		movb %%fs:%2, %%al; \
		pop %%fs" \
		:"=a"(_res) \
		:"0"(seg),"m"(*(addr)));\
_res;})
