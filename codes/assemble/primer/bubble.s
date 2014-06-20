.section .data
	values:
		.int 140, 215, 20, 25, 30, 935, 840, 455, 55, 60
.section .text
.globl main
main:
	nop
	movl $value, %esi
	movl $9, %ecx
	movl $9, %ebx

loop:
	movl (%esi), %eax
	cmp %eax, 4(%esi)
	jge skip
	xchg %eax, 4(%esi)
	movl %eax, (%esi)

skip:
	add $4, %esi
	dec %ebx
	jnz loop
	dec %ecx
	jz end

	movl $values, %esi
	movl %ecx, %ebx
	jmp loop

end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

