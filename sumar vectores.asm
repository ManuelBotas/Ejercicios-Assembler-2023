org 100h

.data
    
    tab1 dw 1,6,4,3,9,7
    tab2 dw 6,4,8,5,2,1
    tab3 dw 6 dup(1)
    
.code
    
    mov ax,@data
    mov ds,ax
    
    mov si,offset tab1
    mov bx,offset tab2
    mov di,offset tab3
    
    mov cx,6
    
sum:mov ax,[si]
    add ax,[bx]
    mov [di],ax
    
    add si,2
    add bx,2
    add di,2
    loop sum
    
    ret