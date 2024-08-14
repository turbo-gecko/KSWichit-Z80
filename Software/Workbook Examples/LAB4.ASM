         .ORG 1800H

NUMBER1   .EQU 2000H
NUMBER2   .EQU 2002H
 
MAIN      
          LD HL,NUMBER1
          LD DE,NUMBER2
	  
	  LD B,2
	  XOR A 

LOOP	  LD A,(DE)
	  ADC A,(HL)
	  DAA
	  LD (HL),A

	  INC DE
	  INC HL

	  DJNZ LOOP

	  RST 38H

	 .END
                    
