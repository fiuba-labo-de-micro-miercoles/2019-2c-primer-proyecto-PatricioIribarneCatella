#include "defs.h"

.global average
; calculates the average
; of the numbers stored in V
; num = ACUM1 | ACUM2
average:
	ldi ACUM1, 0
	ldi ACUM2, 0
	ldi I, 8
	clr r0

loop:
	ld r10, X+
	
	; test if the value
	; is negative or positive
	add r10, r0
	brmi negative

	clr SIGN
	rjmp sum

negative:
	ldi SIGN, 0xFF

sum:	
	add ACUM2, r10
	adc ACUM1, SIGN
	dec I
	breq exit
	rjmp loop

exit:
	asr ACUM1
	ror ACUM2
	asr ACUM1
	ror ACUM2
	asr ACUM1
	ror ACUM2
	
	ret

