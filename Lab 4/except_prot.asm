; A file holding an LC-3b system program that will be loaded into memory starting at 
; memory location x1600. This will be the protection exception handler.

.ORIG x1600
TRAP x25
.END

