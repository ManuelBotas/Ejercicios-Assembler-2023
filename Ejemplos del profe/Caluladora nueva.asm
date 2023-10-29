name 'Taller 1'
 
; Escriba un programa que dado dos números calcule las 4 operaciones basicas entre ellos
 
lugar macro fila,col
mov ah,02h
mov dh,fila
mov dl,col
mov bh,0h
int 10h
endm
 
.model small
.stack 64
 
; Empezamos declarando los datos a usar
 
.data
 
    ; Delaramos las variables de cada numero y de las operaciones
 
    Num1 db 0
    Num2 db 0
    Suma db 0
    Resta db 0
    Mult db 0
    Divi db 0
 
 
    ; Pedimos al ususario que ingrese los dos numeros aplastando enter
 
    Ingreso1 db 13,10, 'Ingrese Primer Numero', 13,10, '$'
    Ingreso2 db 13,10, 'Ingrese Segundo Numero', 13,10, '$'
 
    ; Delaramos las variables cadena donde me de el resultado
 
    Rsuma db 13,10 , 'Suma: ', 13,10, '$'
    Rresta db 13,10 , 'Resta: ', 13,10, '$'
    Rmult db 13,10 , 'Multiplicacion: ', 13,10, '$'
    Rdivi db 13,10 , 'Division: ' , 13,10, '$'
    Rcero db 13,10 , 'Division:                          NO VALIDA ' , 13,10, '$'
 
; Empezamos a escribir el codigo
 
.code
 
 
        mov ax, @data   ; Cargamos datos en el acumulador
        mov ds, ax
 
        ; Pasos para ingresar primer numero
 
        lugar 0,0
 
        mov ah, 09h       ; Iniciar consola
        lea dx, Ingreso1  ; Aparece mensaje de Ingresar 1
        int 21h           ; Interrupcion
        mov ah, 01        ; Ingresar numero atravez del teclado
        int 21h           ; Interrupcion para terminar bloque de instrucciones
        sub al, 30h       ; Convierte la tecla a numero
        mov Num1, al      ; Movemos el valor ingresado a la variable Num1
 
 
        ; Repetimos para ingresar segundo numero
 
        lugar 3,0
        mov ah, 09
        lea dx, Ingreso2
        int 21h
        mov ah, 01
        int 21h
        sub al, 30h
        mov Num2, al
 
 
    ; Empezamos Operaciones
 
    ; Suma
 
    mov al, Num1     ; Traemos Num1 del registro anterior
    add al, Num2     ; Sumamos a Num1, que esta en el acumulador, el valor de Num2
    mov Suma, al     ; Movemos a variable Suma el resultado del acumulador
 
 
    ; Resta
 
    mov al, Num1     ; Traemos Num1 del registro anterior
    sub al, Num2     ; Restamos a Num1, que esta en el acumulador, el valor de Num2
    mov Resta, al    ; Movemos a variable Resta el resultado del acumulador
 
 
    ; Multiplicacion
 
    mov al, Num1     ; Traemos Num1 del registro anterior
    mul Num2         ; Multiplicamos a Num1, que esta en el acumulador, el valor de Num2
    mov Mult, al     ; Movemos a variable Multi el resultado del acumulador
 
 
    ;Division por 0
 
    sub bl, 30h
    mov bl, Num2     ; Almacenamos Num2 en registro base
 
    cmp bl, 0        ; Comparamos el valor de Num2
 
    je cero          ; Si el valor es cero
    jl positivo      ; Si el valor es positivo
 
 
    ; Mostramos el Resultado
 
    positivo:
 
    ; Suma
 
    lugar 6,0
 
    mov ah, 09       ; Iniciamos la consola
    lea dx, Rsuma    ; Leemos mensaje Rsuma
    int 21h          ; Interrupcion para terminar bloque de instrucciones
 
    lugar 7,39
 
    mov dl, Suma     ; Movemos resultado de variable Suma
    add dl, 30h      ; Transformamos resultado a letras
    mov ah, 02       ; Mostramos valor de la variable
    int 21h          ; Interrupcion para terminar bloque de instrucciones
 
 
    ; Resta
 
    lugar 9,0
 
    mov ah, 09
    lea dx, Rresta
    int 21h
 
    lugar 10,39
 
    mov dl, Resta
    add dl, 30h
    mov ah, 02
    int 21h
 
 
    ; Multiplicacion
 
    lugar 12,0
 
    mov ah, 09
    lea dx, Rmult
    int 21h
 
    lugar 13,39
 
    mov dl, Mult
    add dl, 30h
    mov ah, 02
    int 21h
 
 
    ; Division
 
    ; Division
 
    mov al, Num1     ; Traemos Num1 del registro anterior
    div Num2         ; Dividimos a Num1, que esta en el acumulador, el valor de Num2
    mov Divi, al     ; Movemos a variable Divi el resultado del acumulador
 
 
 
    lugar 15,0
 
    mov ah, 09
    lea dx, Rdivi
    int 21h
 
    lugar 16,39
 
    mov dl, Divi
    add dl, 30h
    mov ah, 02
    int 21h
 
    .exit
 
    cero:
 
    ; Suma
 
    lugar 18,0
 
    mov ah, 09       ; Iniciamos la consola
    lea dx, Rsuma    ; Leemos mensaje Rsuma
    int 21h          ; Interrupcion para terminar bloque de instrucciones
 
    lugar 19,39
 
    mov dl, Suma     ; Movemos resultado de variable Suma
    add dl, 30h      ; Transformamos resultado a letras
    mov ah, 02       ; Mostramos valor de la variable
    int 21h          ; Interrupcion para terminar bloque de instrucciones
 
 
    ; Resta
 
    lugar 21,0
 
    mov ah, 09
    lea dx, Rresta
    int 21h
 
    lugar 22,39
 
    mov dl, Resta
    add dl, 30h
    mov ah, 02
    int 21h
 
 
    ; Multiplicacion
 
    lugar 24,0
 
    mov ah, 09
    lea dx, Rmult
    int 21h
 
    lugar 25,39
 
    mov dl, Mult
    add dl, 30h
    mov ah, 02
    int 21h
 
 
    ; Division
 
    lugar 27,0
 
    mov ah, 09
    lea dx, Rcero
    int 21h
 
    .exit
 
ret