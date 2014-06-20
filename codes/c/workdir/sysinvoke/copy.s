.section .data
string1:
	.asciz "This is a test of the conversion program!\n"
length:
	.int 43
.section .bss
	.lcomm buffer, 43

.section .text
.globl _start
_start:
	nop
	leal string1, %esi
	leal buffer, %edi
	movl length, %ecx
	shrl $2, %ecx
	
	cld 
	rep movsl
	testb $2, %al
	je 1f
	movsw

1:	testb $1, %al
	je 2f
	movsb
2:	
	movl $1, %eax
	movl $0, %ebx
	int $0x80	
