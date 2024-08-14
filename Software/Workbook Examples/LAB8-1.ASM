         .ORG 1800H
             
SCANDISP .EQU 0624H

; main code

MAIN     LD IX,DISPLAYBUF
LOOP     CALL SCANDISP
	 JR LOOP

         
	 .ORG 2000H
	 
DISPLAYBUF .BLOCK 6

        .END
                    
