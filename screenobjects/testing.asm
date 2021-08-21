  PROCESSOR 6502

  INCLUDE "MACRO.H"
  INCLUDE "VCS.H"


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Start ROM code segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  SEG Code
  ORG $F000

Start:
  CLEAN_START


  LDA $24

Subtractify:
  STA $FF
  SEC
  SBC #3
  BNE Subtractify


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Start ROM code segment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ORG $FFFC
  .word Start
  .word Start
