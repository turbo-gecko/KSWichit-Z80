         .ORG 1800H

PSTRING   .EQU 0852H
CIN       .EQU 08B9H
COUT      .EQU 0861H
OUT2X     .EQU 0875H
NEWLINE   .EQU 088CH
DELAY     .EQU 0CE1H
 

START	  CALL INIT ; SET UART AT MARK LEVEL

MAIN      CALL NEWLINE
          LD IX,HELLO
	  CALL PSTRING
	  JP MAIN

INIT      LD A,0FFH
          CALL COUT
	  CALL DELAY
	  RET

HELLO     .BYTE "Hello worlds",0
          
         .END
                    
