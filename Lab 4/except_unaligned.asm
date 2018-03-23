/* A file holding an LC-3b system program that will be loaded into memory starting at 
 * memory location x1A00. This will be the unaligned access exception handler.
 */
.ORIG x1A00
TRAP x25
.END

