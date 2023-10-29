   TITLE ESTRUCTURA BASICA
    DATOS SEGMENT
    
    ;DECLARACION DE VARIABLES
    
    
    
    DATOS ENDS
   
   
    PILA SEGMENT
    
    DB 64 DUP(0)
    
    
    
    PILA ENDS   
   
   
   
   
   
    CODIGO SEGMENT
    
    INICIO PROC FAR ; ATRIBUTOS NEAR O FAR CUANDO SE EL LLAMADO ES DESDE EL MISMO 
                     ; SEGMENTO O NO
                     
                     
    ASSUME DS:DATOS , CS:CODIGO , SS:PILA   
    
       PUSH DS
       MOV AX,0
       PUSH AX
       
       MOV AX,DATOS
       MOV DS,AX
       MOV SS,AX   
       
         
         
   ;BYTE AX 255 WORD AX 65535 
   
    ;AX - the accumulator register (divided into AH / AL).
    ;BX - the base address register (divided into BH / BL).
    ;CX - the count register (divided into CH / CL).
    ;DX - the data register (divided into DH / DL).
    ;SI - source index register.
    ;DI - destination index register.
    ;BP - base pointer.
    ;SP - stack pointer.

       MOV AL,5
       ADD AL,7
       
   
       
       
    RET
    
    INICIO ENDP
    
    
    END INICIO 
    
    CODIGO ENDS
       
    
    