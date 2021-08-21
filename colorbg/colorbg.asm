  processor 6502
  include "vcs.h"
  include "macro.h"

  SEG CODE
  ORG $F000     ; defines the origin on ROM at $F000

START:
  CLEAN_START   ; macro that clears the stack, TIA, and RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Set background luminosity color to yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  LDA #$1E      ; load color into the A register
  STA COLUBK    ; store the value of a to the background color address

  JMP START     ; repeat from START
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Fill ROM size to exactly 4KB
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ORG $FFFC   ; sets origin to $FFFC
  .word START ; reset array
  .word START ; interrupt array
