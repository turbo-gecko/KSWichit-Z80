         .ORG 1800H

PSTRING   .EQU 0852H
CIN       .EQU 08B9H
COUT      .EQU 0861H
OUT2X     .EQU 0875H
NEWLINE   .EQU 088CH
ONESPACE  .EQU 0897H
DELAY     .EQU 0CE1H
 

START	  CALL INIT ; SET UART AT MARK LEVEL
          LD HL,1800H
          
	  LD B,4

LOOP	  PUSH BC
	  CALL HEXDUMP
	  POP BC
	  DJNZ LOOP

	  RST 38H



HEXDUMP   CALL NEWLINE
          LD A,H
          CALL OUT2X
	  LD A,L
          CALL OUT2X
          CALL ONESPACE
         	    
          LD C,16
        
HEXDUMP2    CALL ONESPACE
          LD A,(HL)
          CALL OUT2X
          INC HL
            
          DEC C
          JR NZ,HEXDUMP2
          RET



INIT      LD A,0FFH
          CALL COUT
	  CALL DELAY
	  RET

         .END
                    
