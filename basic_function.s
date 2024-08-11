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
	  BL add2 @store location following branch to LR reg.
	  MOV R3,#4

 add2:
 	  ADD R2,R0,R1
	  BX LR  @go back to addr in LR register 
 	
  
  
 .data  @data section, put data on the stack
 @declare data here, with label.
 @declare name, type, and actual data.
 
	
	
	