#ifndef AVRX_H
#define AVRX_H

// AVR linux defines
//
#define __SFR_OFFSET 0

// AVR processor-specific file
// containing the I/O port
// definitions  for the device
#include <avr/io.h>
#include <avr/interrupt.h>

// Directives
#define CSEG .text
#define DSEG .data
#define DB .byte
#define BYTE .space
#define ORG .org

// Operators
#define LOW(x) lo8(x)
#define HIGH(x) hi8(x)

#endif // AVRX_H
