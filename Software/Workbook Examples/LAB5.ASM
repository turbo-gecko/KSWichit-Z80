         .ORG 1800H

NUMBER1   .EQU 2000H
NUMBER2   .EQU 2001H
 
MAIN      
          LD A,(NUMBER1)
          LD HL,NUMBER2
	  CP (HL)
	  RST 38H

	 .END
                    
