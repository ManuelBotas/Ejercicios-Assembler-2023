org 100h

.data
    
    tab1 dw 6 dup(?)
    tab2 dw 6 dup(?)
    tab3 dw 6 dup(?)
    crlf db 0dh,0ah,24h
    tab db 4 dup(20h),24h
    msginput1 db "Ingrese un numero para tab1: ",24h
    msginput2 db "Ingrese un numero para tab2: ",24h
    msgoutput db "tab1 tab2 tab3",24h
    
.code
    
    mov ax,@data
    mov ds,ax
    
    mov si,offset tab1
    mov bx,offset tab2
    mov di,offset tab3
    
    mov cx,6
input1:nop
    mov dx,offset msginput1
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov [si],al
    
    add si,2
    call newline
    loop input1

    mov cx,6
input2:nop
    mov dx,offset msginput2
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov [bx],al
    
    add bx,2
    call newline
    loop input2
    
    mov si,offset tab1
    mov bx,offset tab2
    
    mov cx,6
sum:mov ax,[si]
    add ax,[bx]
    mov [di],ax
    
    add si,2
    add bx,2
    add di,2
    loop sum
    
    ;call cls
    
    mov si,offset tab1
    mov bx,offset tab2
    mov di,offset tab3
    
    mov dx,offset msgoutput
    mov ah,9
    int 21h
    call newline
    
    mov cx,6
output:nop
    call output1
    call tabul
    call output2
    call tabul
    call output3
    call newline
    
    add si,2
    add bx,2
    add di,2
    loop output
    
    ret
    
    proc newline
        mov dx,offset crlf
        mov ah,9
        int 21h
        ret
    endp
    
    proc tabul
        mov dx,offset tab
        mov ah,9
        int 21h
        ret
    endp
    
    proc output1
        mov dl,[si]
        add dl,30h
        mov ah,2
        int 21h
        ret
    endp
    
    proc output2
        mov dl,[bx]
        add dl,30h
        mov ah,2
        int 21h
        ret
    endp
    
    proc output3
        mov dl,[di]
        add dl,30h
        mov ah,2
        int 21h
        ret
    endp
    
    proc cls
        mov al,30h
        mov ah,06h
        int 10h
        ret
    endp