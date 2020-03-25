bits 16
org 0x7c00
boot:
	mov si, hello       ;
	mov ah,0x0e         ;
    jmp print

print:
    .loop:              ; this is our loop
        lodsb
        
        or al, al       ;|
        jz input        ;| jump to input if al is zero
        int 0x10
        jmp .loop

input:             ;|
    mov ah, 00h     ;|
    int 16h         ;| Getting input
    jmp inputcheck

inputcheck:
    cmp al, 49      
    je opt1        
    cmp al, 50
    je opt2
    cmp al, 51
    je opt3

    jmp input

halt:               ;|
	cli             ;|
	hlt             ;| Halting program

hello: 
	db "Welcome to WeebOS^TM press 1,2 or 3",13,10,0

opt1:
    mov si, pressed1
    mov ah,0x0e
    jmp print

pressed1:
    db "1, yes just 1",13,10,0

opt2:
    mov si, pressed2
    mov ah,0x0e
    jmp print

pressed2:
    db "now, we play. 2222222222222222222222222222222222222222222222",13,10,0

opt3:
    mov si, pressed3
    mov ah,0x0e
    jmp print

pressed3:
    db "UwU 3 has been pressed, EwE Nuzzles x3",13,10,0

times 510 - ($-$$) db 0
dw 0xaa55
