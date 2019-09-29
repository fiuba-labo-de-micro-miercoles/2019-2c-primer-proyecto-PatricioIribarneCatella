.global load
; loads into V some numbers
; to test the program
; the sum is 8, so the
; average is 1
load:
	ldi r18, 1
	st X+, r18
	ldi r18, 2
	st X+, r18
	ldi r18, 3
	st X+, r18
	ldi r18, -2
	st X+, r18
	ldi r18, 4
	st X+, r18
	ldi r18, -3
	st X+, r18
	ldi r18, 5
	st X+, r18
	ldi r18, -2
	st X+, r18
	ret


