org 100h

.data
    num1 db ?
    num2 db ?
    resultado db ?
    resto db ?
    cociente db ?
    unidades db ?
    decenas db ?
    centenas db ?
    opcion db ?
    msgInput db "Ingrese un numero: ",24h
    msgMenu db "Calculadora: ",24h
    msgOpSum db "1. Sumar",24h
    msgOpRes db "2. Restar",24h
    msgOpProd db "3. Multiplicar",24h
    msgOpDiv db "4. Dividir",24h
    msgOpPot db "5. Potencia",24h
    msgOpExit db "Elija otro numero para salir",24h
    msgOp db "Que desea hacer?",24h
    msgSuma db "La suma de los numeros ingresados es: ",24h
    msgResta db "La resta de los numeros ingresados es: ",24h
    msgProducto db "El producto de los numeros ingresados es: ",24h
    msgDivCociente db "El cociente de la division es: ",24h
    msgDivResto db "El resto de la division es: ",24h
    msgDivError db "No se puede dividir por cero",24h
    msgPotencia1 db " elevado a la ",24h
    msgPotencia2 db " es: ",24h
    msgPause db "Presione una tecla para continuar...",24h
    CRLF db 0dh,0ah,24h
.code
    mov ax,@data
    mov ds,ax
looop:
    call newline

    call pause

    call cls

    call menu
    call readnum
    mov opcion,al
    
    call cls

    cmp opcion,1
    je suma
    cmp opcion,2
    je resta
    cmp opcion,3
    je producto
    cmp opcion,4
    je division
    cmp opcion,5
    je potencia
    jmp fin

fin:ret

suma:
    call input2
    mov al,num1
    add al,num2
    mov resultado,al
    call newline
    mov dx,offset msgSuma
    call printstr
    cmp resultado,10
    jge result2
    mov dl,resultado
    call printnum
    jmp looop

resta:
    call input2
    mov al,num1
    sub al,num2
    mov resultado,al
    call newline
    mov dx,offset msgResta
    call printstr
    cmp resultado,0
    jl negnumber
    mov dl,resultado
    call printnum
    jmp looop

producto:
    call input2
    mov al,num1
    mul num2
    mov resultado,al
    mov dx,offset msgProducto
    call printstr
    cmp resultado,10
    jge result2
    mov dl,resultado
    call printnum
    jmp looop

division:
    call input2
    mov ax,0
    mov al,num1
    mov bl,num2
    cmp bl,0
    je diverror
    div bl
    mov cociente,al
    mov resto,ah
    mov dx,offset msgDivCociente
    call printstr
    mov dl,cociente
    call printnum
    call newline
    mov dx,offset msgDivResto
    call printstr
    mov dl,resto
    call printnum
    jmp looop

diverror:
    call newline
    mov dx,offset msgDivError
    call printstr
    jmp looop

potencia:
    call input2
    mov cl,num2
    mov ax,1
pot:mul num1
    loop pot
    mov resultado,al
    mov dl,num1
    call printnum
    mov dx,offset msgPotencia1
    call printstr
    mov dl,num2
    call printnum
    mov dx,offset msgPotencia2
    call printstr
    cmp resultado,10
    jae result2
    mov dl,resultado
    call printnum
    jmp looop

result2:
    cmp resultado,100
    jae result3
    mov ax,0
    mov al,resultado
    call print2digit
    jmp looop

result3:
    mov ax,0
    mov al,resultado
    call print3digit
    jmp looop

negnumber:
    mov dl,45
    call printchar
    mov al,resultado
    neg al
    mov dl,al
    call printnum
    jmp looop

    proc pause
        mov dx,offset msgPause
        call printstr
        mov ah,1
        int 21h
        ret
    endp

    proc cls
        mov ah,6
        mov al,0
        mov bh,7
        mov cx,0
        mov dx,1950h
        int 10h
        call newline
        ret
    endp

    proc newline
        mov dx,offset CRLF
        call printstr
        ret
    endp

    proc menu
        mov dx,offset msgMenu
        call printstr
        call newline
        mov dx,offset msgOpSum
        call printstr
        call newline
        mov dx,offset msgOpRes
        call printstr
        call newline
        mov dx,offset msgOpProd
        call printstr
        call newline
        mov dx,offset msgOpDiv
        call printstr
        call newline
        mov dx,offset msgOpPot
        call printstr
        call newline
        mov dx,offset msgOpExit
        call printstr
        call newline
        call newline
        mov dx,offset msgOp
        call printstr
        call newline
        ret
    endp
    
    proc input1
        mov dx,offset msgInput
        call printstr

        call readnum
        mov num1,al

        call cls
    endp
    
    proc input2
        mov dx,offset msgInput
        call printstr

        call readnum
        mov num1,al
        
        call newline

        mov dx,offset msgInput
        call printstr

        call readnum
        mov num2,al

        call cls
    endp

    proc split2digit
        mov bl,10
        div bl
        mov decenas,al
        mov unidades,ah
        ret
    endp

    proc split3digit
        mov bl,100
        div bl
        mov centenas,al
        mov ch,ah
        mov ax,0
        mov ax,ch
        mov bl,10
        div bl
        mov decenas,al
        mov unidades,ah
        ret
    endp
    
    proc print2digit
        call split2digit
        mov dl,decenas
        call printnum
        mov dl,unidades
        call printnum
        ret
    endp

    proc print3digit
        call split3digit
        mov dl,centenas
        call printnum
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

    proc printchar
        mov ah,2
        int 21h
        ret
    endp printchar
    
    proc readnum
        mov ah,1
        int 21h
        sub al,30h
        ret
    endp
    
    proc printnum
        add dl,30h
        call printchar
        ret
    endp