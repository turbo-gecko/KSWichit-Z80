         .ORG 1800H
             
GPIO1    .EQU 40H
TICK     .EQU 2000H
COUNTER  .EQU 2001H

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
	
	 LD HL,TICK
	 INC (HL)
	 LD A,(TICK)
	 CP 100
	 JR C,SKIP
	 LD A,0
	 LD (TICK),A

	 LD A,(COUNTER)
	 ADD A,1
	 DAA
	 LD (COUNTER),A
	 OUT (GPIO1),A

SKIP	 POP AF
	 POP HL
	 
	 EI
	 RETI

        .END
                    
