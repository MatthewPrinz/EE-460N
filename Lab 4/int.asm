/* A file holding an LC-3b system program that will be loaded into memory starting at 
 * memory location x1200. This will be the timer interrupt service routine.
 */
/* The simulator will start executing the LC-3b program loaded at x3000. The timer 
 * interrupt will occur at cycle 300. You are supposed to provide microarchitectural 
 * support for interrupt handling. The interrupt handler you write should increment 
 * location (word-sized access) x4000 by 1. You will also need to implement the RTI 
 * instruction so that the interrupt handler can transfer control back to the user program. */
    .ORIG x1200
    ;PUSH R0        ; Save the registers used.
    ADD R6, R6, #-2
    STW R0, R6, #0
    ;PUSH R1
    ADD R6, R6, #-2
    STW R1, R6, #0

    LEA R0, PTR     
    LDW R0, R0, #0 ; R0 is pointer to val that needs to be incremented. 
    LDW R1, R0, #0 ; R1 is val to be incremented. 
    ADD R1, R1, #1 ; increment val. 
    STW R1, R0, #0 ; store incremented value back. 

    ;POP R1        ; Restore the registers used. 
    LDW R0, R6, #0
    ADD R6, R6, #2
    ;POP R0
    LDW R1, R6, #0
    ADD R6, R6, #2
    RTI            ; Return from interrupt. 

PTR .FILL x4000
    .END

