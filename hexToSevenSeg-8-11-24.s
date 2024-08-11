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
.equ XA,0x77
.equ XB,0x7C
.equ XC,0x39
.equ XD,0x5E
.equ XE,0x79
.equ XF,0x71
 


@in CPULATOR, 7 segs live here
.equ SEVENSEG, 0xff200020 
.equ SEVENOFF, 0xff200030 @last two digits

.equ TESTNUM,0x4F0F60
.global _start
_start:

@get rid of register remnant dreck. 
  MOV R0,#0
  MOV R1,#0
  MOV R2,#0
  MOV R3,#0
  MOV R4,#0
  MOV R5,#0
  MOV R6,#0
  MOV R7,#0

  
LDR R2,=segs @memory array of values for 7 seg conversion

convHex2SevenSeg:
  MOV R4,#4 @constant for conversion

  @5th number
  //mask each value in register and put it into memory led_x
  //right justify each digit to get ready to convert it.
  MOV R3,#0x10  @R3 is COUNTER for matching numbers and the getting value in SEGS array.
  LDR R0,=TESTNUM  @load up R0 with number under test.
  AND R0,R0,#0xF00000  @mask 5th hex digit
  MOV R0,R0,LSR #20
  MOV LR,PC
  BAL matchnumbers  @convert R0 digit to the 7 segment via "branch always" to matchnumbers label.
  LDR R1,=mem_0 @copy value in R0 into memory location mem_0
  STR R0,[R1] 
  
  @4th number
  @MOV R3,#0x10  @R3 is COUNTER for matching numbers and the getting value in SEGS array.
  LDR R0,=TESTNUM  @load up R0 with number under test.
  AND R0,R0,#0x0F0000  @mask 5th hex digit
  ADD R1,R1,#4 @copy value in R1 into memory location R1 + 4 (next cell)
  MOV R0,R0,LSR #16
  MOV LR,PC
  BAL matchnumbers  @convert R0 digit to the 7 segment via "branch always" to matchnumbers label.
  STR R0,[R1]
  
  @3rd number
  @MOV R3,#0x10  @R3 is COUNTER for matching numbers and the getting value in SEGS array.
  LDR R0,=TESTNUM  @load up R0 with number under test.
  AND R0,R0,#0x00F000  @mask 5th hex digit
  ADD R1,R1,#4 @copy value in R1 into memory location R1 + 4 (next cell)
  MOV R0,R0,LSR #12
  MOV LR,PC
  BAL matchnumbers  @convert R0 digit to the 7 segment via "branch always" to matchnumbers label.
  STR R0,[R1] 
  
  @2nd number
  @MOV R3,#0x10  @R3 is COUNTER for matching numbers and the getting value in SEGS array.
  LDR R0,=TESTNUM  @load up R0 with number under test.
  AND R0,R0,#0x000F00  @mask 5th hex digit
  ADD R1,R1,#4 @copy value in R1 into memory location R1 + 4 (next cell)
  MOV R0,R0,LSR #8
  MOV LR,PC
  BAL matchnumbers  @convert R0 digit to the 7 segment via "branch always" to matchnumbers label.
  STR R0,[R1]
  
  @1st number
  @MOV R3,#0x10  @R3 is COUNTER for matching numbers and the getting value in SEGS array. 
  LDR R0,=TESTNUM  @load up R0 with number under test.
  AND R0,R0,#0x0000F0  @mask 5th hex digit
  ADD R1,R1,#4 @copy value in R1 into memory location R1 + 4 (next cell)
  MOV R0,R0,LSR #4
  MOV LR,PC
  BAL matchnumbers  @convert R0 digit to the 7 segment via "branch always" to matchnumbers label.
  STR R0,[R1]
  
  @0 number
  @MOV R3,#0x10  @R3 is COUNTER for matching numbers and the getting value in SEGS array.   
  LDR R0,=TESTNUM  @load up R0 with number under test.
  AND R0,R0,#0x00000F  @mask 5th hex digit
  ADD R1,R1,#4 @copy value in R1 into memory location R1 + 4 (next cell)
  MOV LR,PC
  BAL matchnumbers  @convert R0 digit to the 7 segment via "branch always" to matchnumbers label.
  STR R0,[R1]
 

  
  BAL mem2Leds @we are done matching, go to mem2Leds label
  
  matchnumbers:   
	   SUB R3,R3,#1 
	   CMP R3,R0 @Check if R3 is larger than R0
	   BEQ convert
	   BNE  matchnumbers  @Loop if not a match
	    

  
  convert:
       @convert number in r0 to 7 seg value
       @MOV R4,#4 @this throws a function clobber error. better put in the main part of program since value never changes.
	   MUL R3,R3,R4 @we need to multiply value of counter R3 by 4.
	   LDR R0,[R2,R3]! @retrieve address found in array SEGS offset by number in R3, put the value found into R0.
	   MOV R3,#0  @we have a match, reset R3 counter to zero.
	   LDR R2,=segs @we have a match, put R2 value back to first element of SEGS
	   MOV R3,#0x10  @R3 is COUNTER for matching numbers and the getting value in SEGS array.
	   BX  lr 
	   
 

  mem2Leds:
       @@@@@@@@@@@@@@@@@@@@@@@@@@@
	   
	   @the 7 seg is reached with 2 memory address, one addr for digits 4 and 5, one for 0,1,2,3.
	   @to make this work, you have to get a seven segment code and left shift it, then add in the next code that needs to appear to the right of it.
	   
	   @@@@@@@@@@@@@@@@@@@@@@@@@@@
	   
       @first, le's load leftmost 2 digs 7 seg into R0

       LDR R0,=mem_0  @put memory address of array mem_0 into R0
       
       LDR R1,=SEVENOFF @put memory location of LED's 4 and 5 into R1
 
	   @ move this value into leftmost digit of display

	   LDR R2,[R0] @load value found at mem_0[0] into R2

       LSL R2,#8   @now, offset this value by 8 positions
	 
	   LDR R3,[R0,#4] @get mem_0[1] and put in into R3
	   
	   ADD R2,R2,R3  @add value of mem_0[1] to what is already in R2, the LSL's mem_0[0]
	   STR R2,[R1]   @finally store this puppy into 7segs 5 and 4

       @that was fun, now, load rightmost 4 digs 
	   
       LDR R1,=SEVENSEG @put memory loc for 4 right 7 segs into R1.   
	   
	   @LED 3
	   LDR R2,[R0,#8]    @load value mem_0[2] array into R2
       LSL R2,#24  	   @shift left this value by 24
	   
	   @LED2
	   LDR R3,[R0,#12]    @load value mem_0[3] array into R3
       LSL R3,#16 @shift what is in R3 left by 16
	   ADD R2,R2,R3  @add value of mem_0[1] to what is already in R2, the LSL's mem_0[0]
	   
	   @LED1
	   LDR R3,[R0,#16]    @load value mem_0[3] array into R3
       LSL R3,#8 @shift what is in R3 left by 16
	   ADD R2,R2,R3  @add value of mem_0[1] to what is already in R2, the LSL's mem_0[0]
	   
	   @LED0
	   LDR R3,[R0,#20]    @load value mem_0[3] array into R3
 	   ADD R2,R2,R3  @add value of mem_0[1] to what is already in R2, the LSL's mem_0[0]
	   STR R2,[R1]   @finally store this Gembili into 7segs 3,2,1,0


 .data  @data section, put data on the stack
 segs: .word ZERO,ONE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT,NINE,XA,XB,XC,XD,XE,XF
 mem_0: .word 0
 
 
 
 @declare data here, with label.
 @declare name, type, and actual data.
 
	
	
	 