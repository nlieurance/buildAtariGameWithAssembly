  PROCESSOR 6502

  INCLUDE "macro.h"
  INCLUDE "vcs.h"

  SEG code
  ORG $F000

START:
  CLEAN_START

  LDX #2
  STX $1B

  ORG $FFFC
  .word START
  .word START
