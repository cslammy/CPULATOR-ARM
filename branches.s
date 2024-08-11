.global _start
_start:

@get rid of dookie in registers
  MOV R0,#0
  MOV R1,#0
  MOV R2,#0
  MOV R3,#0
  MOV R4,#0
  MOV R5,#0
  MOV R6,#0
  MOV R7,#0
  
  
  MOV R0,#1
  MOV R1,#2
  
  CMP R1,R0  @you are subtracting R0-R1
             @if result is 0, they are equal
			 @if R0 smaller, you will get negative in CPSR
			 @change order of R1 and R0 to change branching.
			 
			 @BLT branch less than
			 @BNE  branch not equal
			 @BEQ  branch if equal
			 @there are lots more.
  
  BGT greater  @if R1 is bigger, jump to greater label otherwise just keep going
  MOV R4,#3
  BAL default  @branch always skips greater, below
  
  greater:
  	MOV R2,#1
  
  default:
    MOV R3,#4
  
 .data  @data section, put data on the stack
 @declare data here, with label.
 @declare name, type, and actual data.
 
	
	
	