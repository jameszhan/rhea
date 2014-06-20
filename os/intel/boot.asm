	org	0x7c00
start:
	mov	ax, cs
	mov	ds, ax
	mov	es, ax
	mov	fs, ax
	
	mov	si, msg
disp:
	lodsb
	cmp	al, 0
	je	step0

	mov	ah, 0x0e
	mov	bx, 0x07
	int	0x10	
	jmp	disp

step0:

read:
	mov	ax, 0x1000	;es:bx=1000:0000
	mov	es, ax
	mov	bx, 0

	mov	ah, 2
	mov	al, 5
	mov	ch, 0
	mov	cl, 2
	mov	dh, 0
	mov	dl, 0
	int	0x13
	
	jc 	read

	
	mov	si, lst 
lisp:
	lodsb
	cmp	al, 0
	je	step1

	mov	ah, 0x0e
	mov	bx, 0x0c
	int	0x10
	jmp	lisp
	
step1:	
	jmp	$
	jmp	1000h:0000


msg:	db	"Starting System..." 
	dd	13
	dd	10
lst:	db	"Loading System..."
	dd	13
	dd	10
	times 	510-($-$$) db 0
	dw	0xaa55 


