; output: com


org 100h

.data

    msg db "Hello, World", 24h
    crlf db 0dh, 0ah, 24h

.code

    mov ax, @data
    mov ds, ax
    
    mov cx,12
    
c:  mov dx, offset msg
    mov ah, 9
    int 21h
    mov dx, offset crlf
    mov ah, 9
    int 21h
    loop c

.exit




