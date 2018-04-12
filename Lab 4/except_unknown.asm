; A file holding an LC-3b system program that will be loaded into memory starting at 
; memory location x1C00. This will be the unknown opcode exception handler.

.ORIG x1C00
TRAP x25
.END

