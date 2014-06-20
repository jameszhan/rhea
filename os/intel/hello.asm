section .text

global main
main:
	mov 	eax, 4
	mov	ebx, 1
	mov	ecx, msg
	mov	edx, 14
	int	0x80

exit:
	mov	eax, 1
	mov	ebx, 0
	int	0x80

msg:
	db 	"hello World!",0x0A,0x0D


