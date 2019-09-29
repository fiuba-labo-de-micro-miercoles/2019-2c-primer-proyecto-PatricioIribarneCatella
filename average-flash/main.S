#include "avrx.h"
#include "defs.h"

DSEG
V: BYTE SIZE
M: BYTE 1

CSEG
ORG _VECTORS_SIZE
	rjmp main

DATA: DB 'H','e','l','l','o',' ','W','o','r','l','d','\0'

.global main
main:
	ldi XH, HIGH(V)
	ldi XL, LOW(V)

	ldi ZH, HIGH(DATA)
	ldi ZL, LOW(DATA)

	call load

	ldi XH, HIGH(V)
	ldi XL, LOW(V)

	call average

finish:	ldi YH, HIGH(M)
	ldi YL, LOW(M)

	st Y, ACUM2

here: rjmp here

