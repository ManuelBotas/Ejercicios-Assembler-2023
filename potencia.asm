org 100h

.data 
   
    base db 2
    exp db 3   
    
.code           

    mov cl,exp
    mov ax,1
pot:mul base
    loop pot
    hlt
    end
    