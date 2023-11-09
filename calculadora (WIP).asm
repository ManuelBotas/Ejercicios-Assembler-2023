org 100h

.data
    num1 db ?
    num2 db ?
    resultado db ?
    unidades db ?
    decenas db ?
    opcion db ?
    msgInput db "Ingrese un numero: ",24h
    msgMenu db "Calculadora: ",24h
    msgOpSum db "1. Sumar",24h
    msgOpRes db "2. Restar",24h
    msgOpProd db "3. Multiplicar",24h
    msgOpDiv db "4. Dividir",24h
    msgOpExit db "Elija otro numero para salir",24h
    msgOp db "Que desea hacer?",24h
    msgSuma db "La suma de los numeros ingresados es: ",24h
    msgResta db "La resta de los numeros ingresados es: ",24h
    msgProducto db "El producto de los numeros ingresados es: ",24h
    msgDivision db "La division de los numeros ingresados es: ",24h
    msgDivError db "No se puede dividir por cero",24h
    msgPause db "Presione una tecla para continuar...",24h
    CRLF db 0dh,0ah,24h
.code
    mov ax,@data
    mov ds,ax
looop:
    call newline

    call pause

    call cls

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
    jmp fin

fin:ret

suma:
    mov al,num1
    add al,num2
    mov resultado,al
    call newline
    mov dx,offset msgSuma
    call printstr
    mov ax,resultado
    cmp resultado,10
    jge bigresult
    mov dl,resultado
    call printnum
    jmp looop

resta:
    mov al,num1
    sub al,num2
    mov resultado,al
    mov dx,offset msgResta
    call printstr
    ;WIP

producto:
    mov al,num1
    mul num2
    mov resultado,al
    mov dx,offset msgProducto
    call printstr
    ;WIP

division:
    mov al,num1
    mov bl,num2
    ;cmp bl,0
    ;je diverror
    div bl
    mov resultado,al
    mov dx,offset msgDivision
    call printstr
    ;WIP

diverror:
    ;WIP

bigresult:
    call printbignum
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
        mov dx,offset msgOpExit
        call printstr
        call newline
        call newline
        mov dx,offset msgOp
        call printstr
        call newline
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