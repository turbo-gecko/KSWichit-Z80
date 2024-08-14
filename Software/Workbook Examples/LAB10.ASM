         .ORG 1800H
             
SCAN     .EQU 05FEH
DATADISP .EQU 0671H  ; A=nn           
ADDRDISP .EQU 0665H  ; DE=nnnn
DISPLAYBUF .EQU 1FB6H

TICK     .EQU 2000H
SEC      .EQU 2001H



; main code

MAIN     LD HL,SERVICE
	 LD (18FFH),HL ; insert vector
	 LD A,18H
	 LD I,A      ; high order byte

	 IM 2
	 EI

; CLEAR DISPLAY BUFFER         
	 
	 LD HL,DISPLAYBUF
	 LD B,6
CLEAR	 LD (HL),0
	 INC HL
	 DJNZ CLEAR

	 LD IX,DISPLAYBUF
LOOP     CALL SCAN
	 JR LOOP


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

                  
	 LD A,(SEC)
	 SUB 1
	 DAA
	 LD (SEC),A

	 CALL DATADISP
	 
SKIP	 POP AF
	 POP HL
	 
	 EI
	 
	 RETI



         .END
                    
