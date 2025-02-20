DATA SEGMENT
        
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE,DS:DATA
START:
    MOV AX,1000H
    MOV DS,AX
    MOV ES,AX
    MOV CX,0100H
    MOV SI,3000H
    MOV AX,00H
    
AGAIN:
    MOV [SI],AX
    INC AX
    INC SI
    LOOP AGAIN
    
    MOV SI,3000H
    MOV DI,6000H
    MOV CX,0100H
    REP MOVSB
    
    MOV SI,3000H
    MOV DI,6000H
    MOV CX,0100H
    REPE CMPSB
    JZ RIGHT
    JNZ ERROR
RIGHT:
    MOV BX,01H
    JMP FINALLY
ERROR:
    MOV BX,00H
    JMP FINALLY
    
FINALLY:       
    MOV AH,4CH
    INT 21H
CODE ENDS
END START
