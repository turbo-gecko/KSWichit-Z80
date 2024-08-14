         .ORG 1800H

GPIO1     .EQU 40H
TONE2K    .EQU 05E2H
 
MAIN      LD HL,100
          CALL TONE2K
	  CALL DELAY
	  JP MAIN

DELAY     LD DE,-1
	  LD HL,1000H
LOOP2	  ADD HL,DE
	  JR C,LOOP2
	  RET

         .END
                    
