; A file holding an LC-3b user program that will be loaded into memory starting at memory 
; location x3000.

      .ORIG x3000
      LEA R0, PNTR1
      LDW R0, R0, #0 ; R0 is pointer to x4000 location.
      AND R1, R1, #0
      ADD R1, R1, #1
      STW R1, R0, #0 ; Store 1 at x4000. 

      ; Calculate the sum of the first 20 bytes beginning at xC000.  
      LEA R0, PNTR2
      LDW R0, R0, #0 ; R0 is pointer (xC000). 
      AND R1, R1, #0 ; R1 is the sum of the locations. 
      AND R2, R2, #0 
      ADD R2, R2, #15; R2 is the counter. 
      ADD R2, R2, #5

LOOP  LDB R3, R0, #0 ; R3 is the value from the current location. 
      ADD R1, R1, R3
      ADD R0, R0, #1 ; Increment pointer. 
      ADD R2, R2, #-1; Decrement counter. 
      BRp LOOP

      LEA R0, PNTR3
      LDW R0, R0, #0
      STW R3, R0, #0 ; Store the sum at xC017. 

      TRAP x25

PNTR1 .FILL x4000
PNTR2 .FILL xC000
PNTR3 .FILL xC017
      .END

