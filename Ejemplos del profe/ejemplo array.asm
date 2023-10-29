 .model small
.data
arreglo1 db 5,6,'A',5,9,8

arreglo2 dw 5,'#',6

arreglo3 db 10 dup (5)

arreglo4  db 'A','B','C','D'



.code

main proc                                                        
    
    
    mov ax,@data
    mov ds,ax
    
    mov al,arreglo1 +2
    
    mov ax,arreglo2 +1
    
    ;lectura de un vector
    
    lea di,arreglo3
    mov [di],0Ah
    
    inc di;
    mov [di],0Bh
    
    inc di
    mov [di],0Ch    
    
    
    ;mostrar un vector
    
    
    mov ah,2
    lea si ,arreglo4 
    
    mov dl,[si]
    int 21h
    
    inc si
    mov dl,[si]
    int 21h
     
     
    inc si
    mov dl,[si]
    int 21h
     
    inc si
    mov dl ,[si]
    int 21h
 ret
   proc  ends
   