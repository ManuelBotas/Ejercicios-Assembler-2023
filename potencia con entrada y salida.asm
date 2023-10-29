org 100h

.data
    
    base db ?
    exp db ?
    res dw ?
    crlf db 0dh,0ah,24h
    msginput1 dw "Ingrese la base:",24h
    msginput2 dw "Ingrese el exponente:",24h
    msgoutput dw "El resultado es:",24h
    
.code    

    mov ax,@data
    mov ds,ax
    
    mov dx,offset msginput1
    mov ah,9
    int 21h
    
    call newline
    
    mov ah,1
    int 21h
    sub al,30h
    mov base,al
    
    call newline
    
    mov dx,offset msginput2
    mov ah,9
    int 21h
    
    call newline
    
    mov ah,1
    int 21h
    sub al,30h
    mov exp,al
    
    mov cl,exp
    mov ax,1
pot:mul base
    loop pot
    
    mov res,ax
    
    call newline
    
    mov dx,offset msgoutput
    mov ah,9
    int 21h
    
    call newline
    
    mov dl,res
    add dl,30h
    mov ah,2
    int 21h
    
    proc newline
        mov dx,offset crlf
        mov ah,9
        int 21h
        ret
    endp
    
    hlt
    end
    