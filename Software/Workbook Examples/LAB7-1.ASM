         .ORG 1800H
             
ADDISP   .EQU 1FDEH
PORT2    .EQU 02H
GPIO1    .EQU 40H

; main code

MAIN     LD HL,SERVICE
	 LD (18FFH),HL ; insert vector
	 LD A,18H
	 LD I,A      ; high order byte

	 IM 2
	 EI

	 RST 38H

; interrupt service subroutine

SERVICE  PUSH HL
	 PUSH AF
	 
	 XOR A
	 OUT (PORT2),A 
	 LD HL,(ADDISP) 
	 LD A,(HL)   
	 OUT (GPIO1),A 
		 
	 POP AF
	 POP HL
	 
	 EI
	 RETI

        .END
                    
