         .ORG 1800H

GPIO1     .EQU 40H
NUMBER1   .EQU 2000H
NUMBER2   .EQU 2001H
 
MAIN      
          LD A,(NUMBER1)
          LD HL,NUMBER2
	  CP (HL)
          JP C,LT

	  JP Z,LTEQ

GT        LD A,3
	  OUT (GPIO1),A ; CASE 3
	  RST 38H

LT       LD A,1
	 OUT (GPIO1),A ; CASE 1
         RST 38H

LTEQ     LD A,2
         OUT (GPIO1),A ; CASE 2
	 RST 38H
	
	 .END
                    
