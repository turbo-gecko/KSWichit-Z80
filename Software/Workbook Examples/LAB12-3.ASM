         .ORG 1800H

INITLCD   .EQU 0B64H
PRINTCHAR  .EQU 0CCEH
GOTOXY    .EQU 0CC2H
CLEAR     .EQU 0B06H

CIN       .EQU 08B9H
COUT      .EQU 0861H
CR        .EQU 0DH
ESC       .EQU 1BH
 

MAIN	  CALL INITLCD

LOOP	  CALL CIN
          CP CR
	  JR NZ,SKIP1
	  LD HL,0100H
	  CALL GOTOXY
	  JR SKIP3

SKIP1	  CP ESC
          JR NZ,SKIP2
	  CALL CLEAR
	  JR SKIP3

SKIP2     LD L,A
	  CALL PRINTCHAR

SKIP3	  JR LOOP
	  
	  .END
                    
