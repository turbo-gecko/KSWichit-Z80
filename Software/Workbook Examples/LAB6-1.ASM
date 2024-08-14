         .ORG 1800H

BUFFER    .EQU 2000H
SCAN1     .EQU 0624H
HEX7SEG   .EQU 0678H
 
MAIN      LD IX,BUFFER
	  LD DE,0

LOOP      CALL SCAN1
          JR C, SKIP
          CP 18H ; KEY CBR
	  JR NZ,LOOP

	  LD DE,0
	  LD A,0
	  JR SKIP2

SKIP	  LD A,E
	  ADD A,1
	  DAA
	  LD E,A
	  LD A,D
	  ADC A,0
	  DAA

SKIP2	  LD D,A
	  LD A,E

	  LD HL,BUFFER
	  CALL HEX7SEG
	  LD (HL),2
	  INC HL
	  LD A,D
	  CALL HEX7SEG
	  LD (HL),0

	  JP LOOP
        
	  .END
                    
