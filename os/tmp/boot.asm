; boot.asm

[ORG 0]
	jmp 0x07c0: start
	
start:
	mov ax, cs
	mov ds, ax
	mov es, ax

reset:
	mov ax, 0
	mov dl, 0	;Drive=0(=A)
	int 13h
	jc reset	; ERROR ==> reset again

read:
	mov ax, 0x1000
	mov es, ax	; ES:BX = 1000:0000
	mov bx, 0

	mov ah, 2	; read data to es:bx
	mov al, 5	; read 5 sectors
	mov ch, 0	; Cylinder = 0
	mov cl, 2	; Sector = 2
	mov dh, 0	; Head = 0
	mov dl, 0	; Drive = 0
	int 13h		; Read!



	jc read		;ERROR ==> Try again

	jmp 1000h:0000	; jmp to es:bx, execute:

	times 510-($-$$) db 0
	dw 0xAA55


