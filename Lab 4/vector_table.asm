; A file holding the interrupt/exception vector table that will be loaded into memory 
; starting at memory location x0200. You should form the contents of this table based 
; on the vector of each interrupt/exception and starting address of the service routine 
; for each interrupt/exception.

  .ORIG x0200
A .FILL x0000
B .FILL x1200
C .FILL x1600
D .FILL x1A00
E .FILL x1C00
  .END

