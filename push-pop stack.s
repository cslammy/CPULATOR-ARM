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
  
  MOV R0,#1
  MOV R1,#3
  PUSH {R0,R1}  @push R0,R1 to stack
  BL get_value
  POP {R0,R1}  @get R0,R1 back after function runs.
  B end
  
get_value:
	MOV R0,#5
	MOV R1,#7
	ADD R2,R0,R1
	BX lr
	
end:
  
 .data  @data section, put data on the stack
 @declare data here, with label.
 @declare name, type, and actual data.
 
	
	
	