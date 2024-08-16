;---------------------------------------------------------------------
; Load from SD - Example program that demonstrates loading a program
; from the SD card using the RST 20H call.
;
; A -- Disk number
; BC -- Slot number
;
; v1.0 - 16th August 2024
;---------------------------------------------------------------------

;---------------------------------------------------------------------
; Constants
;---------------------------------------------------------------------
DELAY_COUNT	.equ	2000h

PORT_1		.equ	40h
;PORT_2		.equ	0fdh

;---------------------------------------------------------------------
; Main program
;---------------------------------------------------------------------

		.org 	1800h		; Where to load the program in memory

MAIN:
	ld	a,00h			; Disk number
	ld	bc,0000h		; Slot number

	rst	20h			; Call the SD load function

	ret

		.end
