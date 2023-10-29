org 100h

.data
    tab1 dw 10 dup(?)
    tab2 dw 10 dup(?)
    suma1 db ?
    suma2 db ?
    decenas db ?
    unidades db ?
    crlf db 0dh,0ah,24h
    msginput1 db "Ingrese un numero para tab1: ",24h
    msginput2 db "Ingrese un numero para tab2: ",24h
    msg1mayor db "tab1 tiene la mayor suma total de sus elementos: ",24h
    msg2mayor db "tab2 tiene la mayor suma total de sus elementos: ",24h
    msgigual db "los dos vectores tienen igual suma total de sus elementos: ",24h
.code
    mov ax,@data
    mov ds,ax
    
    
    mov si,offset tab1
    mov di,offset tab2
    
    
    mov cx,10
input1:nop
    mov dx,offset msginput1
    call printstr
    
    call readnum
    mov [si],al
    
    add si,2
    call newline
    loop input1
    
    mov cx,10
input2:nop
    mov dx,offset msginput2
    call printstr
    
    call readnum
    mov [di],al
    
    add di,2
    call newline
    loop input2
    
    
    mov si,offset tab1
    mov di,offset tab2
    
    
    mov ax,0
    mov cx,10
sum1:nop
    add ax,[si]
    
    add si,2
    loop sum1
    
    mov suma1,ax
    
    
    mov ax,0
    mov cx,10
sum2:nop
    add ax,[di]
    
    add di,2
    loop sum2
    
    mov suma2,ax
    
    mov al,suma1
    ;mov bl,suma2
    cmp al,suma2
    jg priMayor
    ;cmp al,suma2
    jl segMayor
    ;cmp al,suma2
    je igual
    jmp fin
fin:ret

priMayor:nop
    mov dx,offset msg1mayor
    call printstr
    
    mov ax,0
    mov al,suma1
    call printbignum
    jmp fin
segMayor:nop
    mov dx,offset msg2mayor
    call printstr
    
    mov ax,0
    mov al,suma2
    call printbignum
    jmp fin
igual:nop
    mov dx,offset msgigual
    call printstr
    
    mov ax,0
    mov al,suma1
    call printbignum
    jmp fin
    
    proc newline
        mov dx,offset crlf
        call printstr
        ret
    endp
    
    proc splitnum
        mov bl,10
        div bl
        mov unidades,ah
        mov decenas,al
        ret
    endp
    
    proc printbignum
        call splitnum
        mov dl,decenas
        call printnum
        mov dl,unidades
        call printnum
        ret
    endp
    
    proc printstr
        mov ah,9
        int 21h
        ret
    endp
    
    proc readnum
        mov ah,1
        int 21h
        sub al,30h
        ret
    endp
    
    proc printnum
        add dl,30h
        mov ah,2
        int 21h
        ret
    endp