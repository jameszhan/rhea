	msg: db 'Program Loaded Succeed! Hello, myos!', $0

	org 0x7c00

	mov ax, cs
	mov ds, ax
	mov es, ax

	call DispStr
	
	mov si, msg
print:
	loadsb
	cmp al, 0
	je hang

	mov ah, 0Eh
	mov bx, 7
	int 10h
	
	jmp print

hang:
	jmp hang

	jmp $

DispStr:
	mov ax, BootMessage
	mov bp, ax		; es:bp = string:addr
	mov cx, 16		; cx = string:length
	mov ax, 0x01301		; ah=13, al=01
	mov bx, 0x000c		; page:0, black background red text
	mov dl, 0
	int 0x0010
	ret

BootMessage: 	db "Hello, OS world!"
times 510-($-$$) db 0

dw 0xaa55



