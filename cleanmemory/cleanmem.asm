  processor 6502
  SEG code
  ORG $F000   ; define the code origin at $F000

START:
  SEI         ; disable interrupts
  CLD         ; disable BCD math mode
  LDX #$FF    ; loads the X register with #$FF
  TXS         ; transfer X register to stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Zero Page region ($00 to $FF)
; In other words—the entire TIA space and RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  LDA #0      ; A = 0
  LDX #$FF    ; SX = #$FF
  STA $FF     ; zero before the loop starts
MEMLOOP:
  DEX         ; X--
  STA $0,X    ;store A register at address $0 + X (store 0 at $0 + X)
  BNE MEMLOOP ; loop until X = 0 (when Z flag is set)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Fill ROM size to 4KB
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  org $FFFC
  .word START ; reset to point where program starts
  .word START ; interrupt vector at $FFFE (unused in VCS)
