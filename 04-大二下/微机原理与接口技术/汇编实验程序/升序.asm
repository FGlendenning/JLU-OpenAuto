DATAS SEGMENT
    DATA1 DW 2,0,2,0,0,2,1,8
DATAS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS
START:
    MOV AX,DATAS
    MOV DS,AX
    MOV CX,7
L1: 					
	MOV SI,0						
	CMP CX,0			
	JE EXIT
	DEC CX				
	MOV BX,CX
	ADD BX,CX			
						
L2:
	MOV AX,DATA1[SI]	
	CMP AX,DATA1[SI+2]	
	JLE L3				
	XCHG AX,DATA1[SI+2]	
	XCHG AX,[SI]
						
L3:
	CMP SI,BX
	JE L1
	ADD SI,2			
	JMP L2
EXIT:
    MOV AH,4CH
    INT 21H
CODES ENDS
    END START