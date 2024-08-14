         .ORG 1800H

INITLCD   .EQU 0B64H
PRINTCHAR .EQU 0CCEH
PRINTTEXT .EQU 0CC8H
GOTOXY    .EQU 0CC2H

MAIN      CALL INITLCD
          
          LD HL,HELLO
	  CALL PRINTTEXT

	  LD H,1
	  LD L,0   ; X=0, Y=1
	  CALL GOTOXY
	
	  LD L,'A'
	  CALL PRINTCHAR

	  RST 38H

HELLO    .BYTE "Hello worlds",0
	  
         .END
                    
