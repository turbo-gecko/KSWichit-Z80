         .ORG 1800H
             
SCANDISP .EQU 0624H
DATADISP .EQU 0671H  ; A=nn           
ADDRDISP .EQU 0665H  ; DE=nnnn
DISPLAYBUF .EQU 1FB6H

; main code

MAIN     LD A,(2000H)
         CALL DATADISP
	 
	 LD DE,(2001H)
	 CALL ADDRDISP

         LD IX,DISPLAYBUF
LOOP     CALL SCANDISP
	 JR LOOP

         .END
                    
