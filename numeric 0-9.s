.equ SWITCH, 0xFF200040
.equ LED, 0xFF200000
.equ SEVENSEG, 0xff200020 

.equ ZERO, 0x3F
.equ ONE, 0x06
.equ TWO, 0x5B
.equ THREE,0x4F
.equ FOUR,0x66
.equ FIVE,0x6D
.equ SIX,0x7D
.equ SEVEN,0x07
.equ EIGHT,0x7F
.equ NINE,0x67

.global _start
_start:

@get rid of shit.
  @clean out LED
  LDR R0, =LED
  MOV R1,#0
  STR R1,[R0]
  
  @clean out Seven Seg
  LDR R0, =SEVENSEG
  MOV R1,#0
  STR R1,[R0]
  
  
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
  
  MOV R2, #NINE
  
  LDR R3,=SEVENSEG  
  STR R2,[R3]  @put value in R2 to location of R3.
  @MOV R2,R2,LSL #8
  @STR R2,[R3]  @put value in R2 to location of R3.
  
  
  
 .data  @data section, put data on the stack
 @declare data here, with label.
 @declare name, type, and actual data.
 
	
	
	 