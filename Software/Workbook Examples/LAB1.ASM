         .ORG 1800H

GPIO1     .EQU 40H   
 
MAIN      LD A,1

LOOP	  OUT (GPIO1),A
          CALL DELAY
	  RLC A
          JP LOOP
	  

DELAY     LD DE,-1
	  LD HL,1000H
LOOP2	  ADD HL,DE
	  JR C,LOOP2
	  RET

         .END
                    
