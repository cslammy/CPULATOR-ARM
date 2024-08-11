.global _start
_start:
    @clear out registers
	MOV R0,#0
	MOV R1,#0
	MOV R2,#0
	MOV R3,#0
	MOV R4,#0
	
	@add
	MOV R0, #5
	MOV R1, #7
	ADD R2,R0,R1 @put into R2 sum of R1 and R0.
	SUB R3,R1,R0 @simple subtraction.
	SUBS R4 ,R0,R1 @you get big hex. If it's negative set flag in CPSR (SUBS)
	
@ADC add with carry. 
	
	