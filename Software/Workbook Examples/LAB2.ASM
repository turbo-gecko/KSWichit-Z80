         .ORG 1800H

 
MAIN      LD B,16
          LD HL,2000H
	  LD A,0
LOOP	  LD (HL),A
	  INC HL
	  DJNZ LOOP
	  RST 38H

	 .END
                    
