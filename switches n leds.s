.equ SWITCH, 0xFF200040
.equ LED, 0xFF200000
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
  
  @CPULATOR LED's
  LDR R0,=SWITCH @by using const, you can bypass size limits.
  
  LDR R1,[R0]  @put value in switch bank into R1.
  
  MOV R2,#3
  
  LDR R3,=LED  
  STR R2,[R3]  @put value in R2 to location of R3.
  
 .data  @data section, put data on the stack
 @declare data here, with label.
 @declare name, type, and actual data.
 
	
	
	 