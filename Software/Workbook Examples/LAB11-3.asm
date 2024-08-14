         .ORG 1800H

INITLCD   .EQU 0B64H
GOTOXY    .EQU 0CC2H
PRINTINT  .EQU 0CDBH
DELAY     .EQU 0CE1H

MAIN      CALL INITLCD
         	  	   
	  LD HL,0
          
LOOP	  PUSH HL
	  CALL PRINTINT
	  CALL DELAY
          
	  LD HL,0
	  CALL GOTOXY	  
		  
	  POP HL
	  INC HL
	  
	  JP LOOP
	  
         .END
                    
