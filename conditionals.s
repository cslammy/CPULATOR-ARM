.global _start
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
  
  MOV R0,#2
  MOV R1,#4
  CMP R0,R1
  ADDLT R2,#1 @if LT add 1 to R1.
  
           @other useful comparison opcodes
           @ADDGE  add gt equal
           @MOVGE move value gt equal
  
 .data  @data section, put data on the stack
 @declare data here, with label.
 @declare name, type, and actual data.
 
	
	
	