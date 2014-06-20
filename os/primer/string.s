.section .data
;value1:
	;.ascii "This is a test string.\n"
string1:
	.asciz "This is a test of the conversion program!\n"
length:
	.int 43
.section .bss
	;	.lcomm output, 23
	.lcomm buffer, 43

.section .text
.globl _start
_start:
	nop
	leal value1, %esi
	leal output, %edi
	;movl $23, %ecx
	;cld
	;rep movsb

	movl length, %ecx
	shrl $2, %ecx
	
	cld 
	rep movsl

	movl length, %ecx
	andl $3, %ecx
	rep movsb 

	movl $1, %eax
	movl $0, %ebx
	int $0x80	
