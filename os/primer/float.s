.section .data
pi:
	.double 3.1415926

.section .text
.globl _start
_start:

	nop
	movl $1, %eax
	movl $0, %ebx
	int $0x80
