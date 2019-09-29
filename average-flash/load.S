#include "defs.h"

.global load
; loads into V the numbers
; stored in flash memory
; in DATA address
load:
	ldi r19, SIZE

loop:	lpm r18, Z+
	st X+, r18
	dec r19
	brne loop

	ret

