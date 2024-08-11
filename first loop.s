.global _start
.equ endlist, 0xaaaaaaaa    @constant

_start:

@get rid of shit.
  MOV R0,#0
  MOV R1,#0
  MOV R2,#0
  MOV R3,#0
  MOV R4,#0
  MOV R5,#0
  MOV R6,#0
  MOV R7,#0
  
  LDR R0,=list @put list into stack, record pointer into R0
  LDR R3,=endlist 
  LDR R1,[R0]
  ADD R2,R2,R1
 
loop:
 	LDR R1,[R0,#4]! @walk stack
	CMP R1,R3
	BEQ exit
	ADD R2,R2,R1
    BAL loop
 
exit:
  
 .data  @data section, put data on the stack
 @declare data here, with label.
 @declare name, type, and actual data.
 
list:
	.word 1,2,3,4,5,6,7,8,9,10
	
	