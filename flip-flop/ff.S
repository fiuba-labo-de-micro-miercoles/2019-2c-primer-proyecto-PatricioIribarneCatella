#include "avrx.h"
#include "ff.h"

.global ffjk

ffjk:
	; read PINB
	in INPUT, _SFR_IO_ADDR(PINB)

	; copy PINB value
	mov JVALUE, INPUT
	mov KVALUE, INPUT

	andi JVALUE, (1<<J)

	ldi AUX, J
loop_j:
	lsr JVALUE
	dec AUX
	brne loop_j

	; complements the register
	; and then put zeros in all
	; the bits except the K bit
	com KVALUE
	andi KVALUE, (1<<K)
	
	ldi AUX, K
loop_k:
	lsr KVALUE
	dec AUX
	brne loop_k

	; negates QVALUE
	mov QVALUENEG, QVALUE
	com QVALUENEG

	; do the jk algorithm
	and JVALUE, QVALUENEG
	and QVALUE, KVALUE

	or QVALUE, JVALUE
	
	; out the result
	mov OUTPUT, QVALUE

	ldi AUX, Q
loop_q:
	lsl OUTPUT
	dec AUX
	brne loop_q
	
	; put zeros in all
	; the others bits except
	; in the Q value
	andi OUTPUT, (1<<Q)

	out _SFR_IO_ADDR(PORTB), OUTPUT

	ret

