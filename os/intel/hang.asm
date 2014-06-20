	org	0x7c00
	jmp	start
	
msg: 	db 	"Hello, OS World!"

start:	
	mov	ax, cs
	mov	ds, ax
	mov	es, ax

display:
	mov	ax, msg
	mov	bp, ax
	mov	ax, 0x1301
	mov	bx, 0x0c
	mov	cx, 0x10
	mov	dx, 0x1005
	int	0x10

print:
	mov	si, msg
doPrint:
	lodsb			;move ds:si to al
	cmp	al, 0
	je	disp

	mov	ah, 0x0e
	mov	bx, 0x07
	int	0x10
	
	jmp	doPrint
	

	mov	cx, 0x10
	mov	al, 0x56 
disp:
	mov	ah, 0x0e
	mov	al, 0x52
	mov	bx, 0x07
	int	0x10
	
	dec	cx
	cmp	cx, 0x0
	je	hang

	jmp disp
	
hang:
	jmp	hang



	times	510-($-$$) db 0
	dw	0xaa55

