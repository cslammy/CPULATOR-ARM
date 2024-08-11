.global _start
_start:
	@clear out the bullshit.
	MOV R0,#0
	MOV R1,#0
	MOV R2,#0
	MOV R3,#0
	MOV R4,#0
	MOV R5,#0
	
	MOV R1,#0xFF
	MOV R2,#0x01
	AND R3,R1,R2  @result 1
	
	@ANDS sets flags
	
	ORR R4,R1,R2 @OR result FF
	
	EOR R5,R1,R2 @XOR result FE
	
	MVN R1,R1  @flip all bit values in R1 to opposite. 
	
	AND R1,R1, #0x00FF0000  @mask nibbles 5 and 4, rest to zero.
	