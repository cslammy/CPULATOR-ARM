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
  
  
  MOV R0,#4
  LSL R0,#1 @20
  LSR R0,#1 @10 again
  MOV R0,R1,LSL #1 @shift R1 
  
  MOV R2,#15
  ROR R2,R2,#1
  
  
 .data  @data section, put data on the stack
 @declare data here, with label.
 @declare name, type, and actual data.
 
	
	
	