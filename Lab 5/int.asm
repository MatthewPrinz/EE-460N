; A file holding an LC-3b system program that will be loaded into memory starting at 
; memory location x1200. This will be the timer interrupt service routine.

; The simulator will start executing the LC-3b program loaded at x3000. The timer 
; interrupt will occur at cycle 300. You are supposed to provide microarchitectural 
; support for interrupt handling. The interrupt handler you write should increment 
; location (word-sized access) x4000 by 1. You will also need to implement the RTI 
; instruction so that the interrupt handler can transfer control back to the user program. 

     .ORIG x1200
     ;PUSH R0        ; Save the registers used.
     ADD R6, R6, #-2
     STW R0, R6, #0
     ;PUSH R1
     ADD R6, R6, #-2
     STW R1, R6, #0
     ; PUSH R2
     ADD R6, R6, #-2
     STW R2, R6, #0

     AND R2, R2, #0 
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #15
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #8; R2 is the ptbr offset/cntr(loop determinate).
     ADD R2, R2, #15

LOOP LEA R0, PTBR
     LDW R0, R0, #0 ; R0 is base pointer to val that needs to have ref cleared. ptbr
     ADD R0, R0, R2 ; Add offset to ptbr. 
     LDW R1, R0, #0 ; R1 is val to have reference cleared. 
     AND R1, R1, #-2 ; clear reference bit.  
     STW R1, R0, #0 ; store incremented value back. 
     ADD R2, R2, #-2
     BRzp LOOP

     ;POP R2
     LDW R2, R6, #0
     ADD R6, R6, #2
     ;POP R1        ; Restore the registers used. 
     LDW R1, R6, #0
     ADD R6, R6, #2
     ;POP R0
     LDW R0, R6, #0
     ADD R6, R6, #2
     RTI            ; Return from interrupt. 

PTBR .FILL x1000 ; PTBR
     .END

