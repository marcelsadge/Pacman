;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; File:    OS.ASM
;;; Purpose: serves as an LC4 operating system w/multiple traps
;;;	     
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;   OS - TRAP VECTOR TABLE   ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.OS
.CODE
.ADDR x8000
  ; TRAP vector table
  JMP TRAP_GETC           ; x00
  JMP TRAP_PUTC           ; x01
  JMP TRAP_PUTS           ; x02
  JMP TRAP_TIMER          ; x03
  JMP TRAP_GETC_TIMER     ; x04
  JMP TRAP_DRAW_PIXEL     ; x05
  JMP TRAP_DRAW_HLINE     ; x06
  JMP TRAP_DRAW_VLINE     ; x07
  JMP TRAP_DRAW_RECT      ; x08
  JMP TRAP_DRAW_SPRITE    ; x09
  JMP TRAP_RESET_VMEM	  ; x0A
  JMP TRAP_BLT_VMEM	  ; x0AB
  JMP TRAP_LFSR_SET_SEED  ; x0C
  JMP TRAP_LFSR		  ; x0D
  
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;   OS - MEMORY ADDRESSES & CONSTANTS   ;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; these handy alias' will be used in the TRAPs that follow
  USER_CODE_ADDR .UCONST x0000	; start of USER code
  OS_CODE_ADDR 	 .UCONST x8000	; start of OS code

  OS_GLOBALS_ADDR .UCONST xA001	; start of OS global mem
  OS_STACK_ADDR   .UCONST xBFFF	; start of OS stack mem

  OS_KBSR_ADDR .UCONST xFE00  	; alias for keyboard status reg
  OS_KBDR_ADDR .UCONST xFE02  	; alias for keyboard data reg

  OS_ADSR_ADDR .UCONST xFE04  	; alias for display status register
  OS_ADDR_ADDR .UCONST xFE06  	; alias for display data register

  OS_TSR_ADDR .UCONST xFE08 	; alias for timer status register
  OS_TIR_ADDR .UCONST xFE0A 	; alias for timer interval register

  OS_VDCR_ADDR	.UCONST xFE0C	; video display control register
  OS_MCR_ADDR	.UCONST xFFEE	; machine control register
  OS_VIDEO_NUM_COLS .UCONST #128
  OS_VIDEO_NUM_ROWS .UCONST #124


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; OS DATA MEMORY RESERVATIONS ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.DATA
.ADDR xA000
;;;  LFSR value used by lfsr code
LFSR .FILL 0x0001

OS_GLOBALS_MEM  .BLKW x1000

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;; OS VIDEO MEMORY RESERVATION ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.DATA
.ADDR xC000
OS_VIDEO_MEM .BLKW x3E00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;   OS & TRAP IMPLEMENTATIONS BEGIN HERE   ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

.CODE
.ADDR x8200
.FALIGN
  ;; first job of OS is to return PennSim to x0000 & downgrade privledge
  CONST R7, #0   ; R7 = 0
  RTI            ; PC = R7 ; PSR[15]=0


;;;;;;;;;;;;;;;;;;;;;;;;;;;   TRAP_GETC   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Get a single character from keyboard
;;; Inputs           - none
;;; Outputs          - R0 = ASCII character from ASCII keyboard

.CODE
TRAP_GETC
    LC R0, OS_KBSR_ADDR  ; R0 = address of keyboard status reg
    LDR R0, R0, #0       ; R0 = value of keyboard status reg
    BRzp TRAP_GETC       ; if R0[15]=1, data is waiting!
                             ; else, loop and check again...

    ; reaching here, means data is waiting in keyboard data reg

    LC R0, OS_KBDR_ADDR  ; R0 = address of keyboard data reg
    LDR R0, R0, #0       ; R0 = value of keyboard data reg
    RTI                  ; PC = R7 ; PSR[15]=0


;;;;;;;;;;;;;;;;;;;;;;;;;;;   TRAP_PUTC   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Put a single character out to ASCII display
;;; Inputs           - R0 = ASCII character to write to ASCII display
;;; Outputs          - none

.CODE
TRAP_PUTC
  LC R1, OS_ADSR_ADDR 	; R1 = address of display status reg
  LDR R1, R1, #0    	; R1 = value of display status reg
  BRzp TRAP_PUTC    	; if R1[15]=1, display is ready to write!
		    	    ; else, loop and check again...

  ; reaching here, means console is ready to display next char

  LC R1, OS_ADDR_ADDR 	; R1 = address of display data reg
  STR R0, R1, #0    	; R1 = value of keyboard data reg (R0)
  RTI			; PC = R7 ; PSR[15]=0


;;;;;;;;;;;;;;;;;;;;;;;;;;;   TRAP_PUTS   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Put a string of characters out to ASCII display
;;; Inputs           - R0 = Address for first character
;;; Outputs          - none

.CODE
TRAP_PUTS
  LDR R1, R0, #0    ; Load the next character into R1
  BRz END_TRAP_PUTS ; Check for the zero terminating character

  LC R2, OS_ADSR_ADDR
CHECK_ADSR
  LDR R3, R2, #0
  BRzp CHECK_ADSR   ; Loop while ADSR[15] == 0 ie output not ready
  LC R2, OS_ADDR_ADDR
  STR R1, R2, #0    ; Write out the character
  ADD R0, R0, #1    ; Increment the pointer R0
  BRnzp TRAP_PUTS   ; Go back to the top 
  
END_TRAP_PUTS
  RTI


;;;;;;;;;;;;;;;;;;;;;;;;;   TRAP_TIMER   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function:
;;; Inputs           - R0 = time to wait in milliseconds
;;; Outputs          - none

.CODE
TRAP_TIMER
  LC R1, OS_TIR_ADDR 	; R1 = address of timer interval reg
  STR R0, R1, #0    	; Store R0 in timer interval register

COUNT
  LC R1, OS_TSR_ADDR  	; Save timer status register in R1
  LDR R1, R1, #0    	; Load the contents of TSR in R1
  BRzp COUNT    	; If R1[15]=1, timer has gone off!

  ; reaching this line means we've finished counting R0

  RTI       		; PC = R7 ; PSR[15]=0



;;;;;;;;;;;;;;;;;;;;;;;   TRAP_GETC_TIMER   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Get a single character from keyboard
;;; Inputs           - R0 = time to wait
;;; Outputs          - R0 = ASCII character from keyboard or 0 if timer expired

.CODE
TRAP_GETC_TIMER
  LC R1, OS_TIR_ADDR  ; Location of the address in R1 for timer
  STR R0, R1, #0      ; Stores the time to wait into R1

TIMER
  LC R2, OS_KBSR_ADDR ; Location of the adress in R2 for keyboard
  LDR R2, R2, #0      ; Load the status of the keyboard into R2
  BRn FOUND_KEYPRESS

  LC R1, OS_TSR_ADDR  ; Address for timer status in R1
  LDR R1, R1, #0      ; Loads the status of the timer into R1
  BRzp TIMER

  CONST R0, #0        ; Reset the timer after timer has went through one cycle
  JMP TRAP_GETC_TIMER_END

FOUND_KEYPRESS
  LC R0, OS_KBDR_ADDR ; Address of the keyboard status in R0
  LDR R0, R0, #0      ; Load the status of the address into R0
  JMP TRAP_GETC_TIMER_END

TRAP_GETC_TIMER_END
  RTI

;;;;;;;;;;;;;;;;;;;;;;;;;   TRAP_DRAW_PIXEL   ;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Draw point on video display
;;; Inputs           - R0 = row to draw on (y)
;;;                  - R1 = column to draw on (x)
;;;                  - R2 = color to draw with
;;; Outputs          - none

.CODE
TRAP_DRAW_PIXEL
  LEA R3, OS_VIDEO_MEM       ; R3=start address of video memory
  LC  R4, OS_VIDEO_NUM_COLS  ; R4=number of columns

  CMPIU R1, #0           ; Checks if x coord from input is > 0
  BRn END_PIXEL
  CMPIU R1, #127           ; Checks if x coord from input is < 127
  BRp END_PIXEL
  CMPIU R0, #0           ; Checks if y coord from input is > 0
  BRn END_PIXEL
  CMPIU R0, #123           ; Checks if y coord from input is < 123
  BRp END_PIXEL

  MUL R4, R0, R4             ; R4= (row * NUM_COLS)
  ADD R4, R4, R1             ; R4= (row * NUM_COLS) + col
  ADD R4, R4, R3             ; Add the offset to the start of video memory
  STR R2, R4, #0             ; Fill in the pixel with color from user (R2)

END_PIXEL
  RTI                ; PC = R7 ; PSR[15]=0
  

;;;;;;;;;;;;;;;;;;;;;;;;;   TRAP_DRAW_HLINE   ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Draws a horizontal on the screen
;;; Inputs           - R0 = row coordinate of start of the line
;;; Inputs           - R1 = col coordinate of start of the line
;;; Inputs           - R2 = length of the line
;;; Inputs           - R3 = color of line
;;; Outputs          - none

.CODE
TRAP_DRAW_HLINE
  LEA R4, OS_VIDEO_MEM
  LC R5, OS_VIDEO_NUM_COLS
  
  CMPIU R1, #0
  BRn TRAP_DRAW_HLINE_END
  CMPIU R1, #127
  BRp TRAP_DRAW_HLINE_END
  CMPIU R0, #0                ; Checks if y coord from input is > 0
  BRn TRAP_DRAW_HLINE_END
  CMPIU R0, #123              ; Checks if y coord from input is < 123
  BRp TRAP_DRAW_HLINE_END
  CMPIU R2, #0
  BRnz TRAP_DRAW_HLINE_END

  MUL R5, R0, R5             ; R5= (row * NUM_COLS)
  ADD R5, R5, R1             ; R5= (row * NUM_COLS) + col
  ADD R4, R4, R5             ; Add the offset to the start of video memory

DRAW_HLINE
  STR R3, R4, #0              ; Stores the color of the pixel pixel onto the screen of R4
  ADD R4, R4, #1              ; Increment the video address by 1 for next column
  ADD R1, R1, #1              ; Increment col coordinate for next draw
  ADD R2, R2, #-1             ; Decrement length remaining by 1

HLINE_TEST
  CMPIU R1, #0
  BRn TRAP_DRAW_HLINE_END
  CMPIU R1, #127
  BRp TRAP_DRAW_HLINE_END
  CMPIU R0, #0                ; Checks if y coord from input is > 0
  BRn TRAP_DRAW_HLINE_END
  CMPIU R0, #123              ; Checks if y coord from input is < 123
  BRp TRAP_DRAW_HLINE_END
  CMPIU R2, #0             ; Checks if the length is zero or not
  BRnz TRAP_DRAW_HLINE_END           ; If none above are true, branch back to draw_hline

  BRnzp DRAW_HLINE

TRAP_DRAW_HLINE_END
  RTI



;;;;;;;;;;;;;;;;;;;;;;;;;   TRAP_DRAW_VLINE   ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Draws a horizontal on the screen
;;; Inputs           - R0 = row coordinate of start of the line
;;; Inputs           - R1 = col coordinate of start of the line
;;; Inputs           - R2 = length of the line
;;; Inputs           - R3 = color of line
;;; Outputs          - none

.CODE
TRAP_DRAW_VLINE
	LEA R4, OS_VIDEO_MEM
  LC R5, OS_VIDEO_NUM_COLS

  CMPIU R1, #0
  BRn TRAP_DRAW_VLINE_END
  CMPIU R1, #127
  BRp TRAP_DRAW_VLINE_END
  CMPIU R0, #0                ; Checks if y coord from input is > 0
  BRn TRAP_DRAW_VLINE_END
  CMPIU R0, #123              ; Checks if y coord from input is < 123
  BRp TRAP_DRAW_VLINE_END 
  CMPIU R2, #0
  BRnz TRAP_DRAW_HLINE_END

  MUL R6, R0, R5             ; R6= (row * NUM_COLS)
  ADD R6, R6, R1             ; R6= (row * NUM_COLS) + col
  ADD R4, R4, R6             ; Add the offset to the start of video memory

DRAW_VLINE
  STR R3, R4, #0              ; Stores the color of the pixel pixel onto the screen of R4
  ADD R4, R4, R5              ; Increment the video address by 1 for next row
  ADD R0, R0, #1              ; Increment row coordinate (top to bottom)
  ADD R2, R2, #-1             ; Decrement length by 1

VLINE_TEST
  CMPIU R1, #0
  BRn TRAP_DRAW_VLINE_END
  CMPIU R1, #127
  BRp TRAP_DRAW_VLINE_END
  CMPIU R0, #0                ; Checks if y coord from input is > 0
  BRn TRAP_DRAW_VLINE_END
  CMPIU R0, #123              ; Checks if y coord from input is < 123
  BRp TRAP_DRAW_VLINE_END
  CMPIU R2, #0                 ; Checks if the length is zero or not
  BRnz TRAP_DRAW_VLINE_END

  BRnzp DRAW_VLINE     

TRAP_DRAW_VLINE_END
  RTI  




;;;;;;;;;;;;;;;;;;;;;;;;;   TRAP_DRAW_RECT   ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Draws a solid rectangular block on the screen
;;; Inputs           - R0 = x coordinate of top left corner of rectangle
;;; Inputs           - R1 = y coordinate of top left corner of rectangle
;;; Inputs           - R2 = width of rectangle
;;; Inputs           - R3 = height of rectangle
;;; Inputs           - R4 = color of rectangle
;;; Outputs          - none

.CODE
TRAP_DRAW_RECT

LEA R6, OS_GLOBALS_MEM 
STR R0, R6, #0 
STR R1, R6, #1 
STR R7, R6, #2 

  ;; Check if width or height is <= 0 
  CMPI R2, #0
  BRnz TRAP_DRAW_RECT_END
  CMPI R3, #0
  BRnz TRAP_DRAW_RECT_END

  ;; Compute end row and store in R3
  ;; R3 = MIN(OS_VIDEO_NUM_COLS, R3 + R1) 
  ADD R3, R3, R1
  LC R5 OS_VIDEO_NUM_ROWS
  CMP R3, R5
  BRnz TRAP_DRAW_RECT_L1
  LC R3 OS_VIDEO_NUM_ROWS
TRAP_DRAW_RECT_L1

  ;; Compute start row and store in R1
  ;; R1 = MAX(0, R1)
  CMPI R1, #0
  BRzp TRAP_DRAW_RECT_L2
  CONST R1, #0
TRAP_DRAW_RECT_L2

  ;; Compute end column and store in R2
  ;; R2 = MIN(OS_VIDEO_NUM_COLS, R0+R2)
  ADD R2, R2, R0
  LC R5 OS_VIDEO_NUM_COLS
  CMP R2, R5
  BRnz TRAP_DRAW_RECT_L3
  LC R2 OS_VIDEO_NUM_COLS
TRAP_DRAW_RECT_L3
  
  ;; Compute start col and store in R0
  ;; R0 = MAX(0, R0)
  CMPI R0, #0
  BRzp TRAP_DRAW_RECT_L4
  CONST R0, #0
TRAP_DRAW_RECT_L4

  ;; Register allocation
  ;; R1 - row
  ;; R5 - col
  ;; R6 - ptr to video memory

;;; for (row = start_row; row < end_row; ++row) {
;;;   ptr = VIDEO_MEM + row*num_cols + start_col
;;;   for (col = start_col; col < end_col; ++col, ++ptr)
;;;       *ptr = color;
;;; }
  
  JMP TRAP_DRAW_RECT_F12

TRAP_DRAW_RECT_F11

  ;; Set up ptr in R6 using R5
  SLL R6, R1, #7    ; R6 = R1 << 7 = R1*128
  LEA R5, OS_VIDEO_MEM
  ADD R6, R6, R5
  ADD R6, R6, R0

  ADD R5, R0, #0    ; col = start_col
  JMP TRAP_DRAW_RECT_F22
TRAP_DRAW_RECT_F21
  STR R4, R6, #0    ; *ptr = color
  ADD R6, R6, #1    ; increment ptr
  ADD R5, R5, #1    ; increment col
TRAP_DRAW_RECT_F22
  CMP R5, R2
  BRn TRAP_DRAW_RECT_F21

  ADD R1, R1, #1    ; increment row
TRAP_DRAW_RECT_F12
  CMP R1, R3
  BRn TRAP_DRAW_RECT_F11
  
TRAP_DRAW_RECT_END
LEA R6, OS_GLOBALS_MEM 
LDR R7, R6, #2 
  RTI


;;;;;;;;;;;;;;;;;;;;;;;   TRAP_DRAW_SPRITE   ;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function: Draws a circle on the video screen at a specific loc.
;;; Inputs           - R0 = x coordinate of top left corner of sprite
;;; Inputs           - R1 = y coordinate of top left corner of box
;;; Inputs           - R2 = color of the sprite
;;; Inputs           - R3 = starting address in data memory of sprite pattern
;;; Outputs          - none

.CODE
TRAP_DRAW_SPRITE
  LEA R6, OS_GLOBALS_MEM      ; Store registers into global memory
  STR R0, R6, #0
  STR R1, R6, #1
  STR R7, R6, #2

  CONST R0, #0                ; Array index for R3

SPRITE_LOOP                   ; Loops through each index of array
  LEA R6, OS_GLOBALS_MEM      ; Calls Global Memory
  LDR R1, R6, #1              ; Load the y coordinate into R1
  ADD R1, R1, R0              ; y = y + x (col = col + row)
  LC R7, OS_VIDEO_NUM_ROWS    ; Calls OS_VIDEO_NUM_ROWS 
  CMP R1, R7                  ; If the y coordinate surpasses the num of rows, branch to END
  BRzp TRAP_DRAW_SPRITE_END
  LDR R4, R3, #0              ; Load address into R4
  CONST R7, 0xFF              ; Construct a line 0xFF in R7
  AND R4, R4, R7              
  LEA R6, OS_GLOBALS_MEM      ; Call Global Memory
  LDR R5, R6, #0              ; Loads R6 #0 into R5
  ADD R5, R5, #7
  SLL R1, R1, #7              ; Shift bits to the left for 8 least sig bits
  ADD R1, R1, R5
  LEA R7, OS_VIDEO_MEM
  ADD R1, R1, R7

  LC R7, OS_VIDEO_NUM_COLS

SPRITE_LOOP_TEST
  CMPI R5, #0                 ; Checks if x is outside the row bounds of the grid
  BRn INNER_SPRITE_LOOP
  CMP R5, R7                  ; Checks if x is outside the col bound of the grid
  BRzp INNER_SPRITE_LOOP
  AND R6, R4, 0x01            ; Check if the bit is equal to 1, if it isn't skip
  BRz INNER_SPRITE_LOOP
  STR R2, R1, #0             ; Stores the color into the bit if it is 1

INNER_SPRITE_LOOP
  ADD R5, R5, #-1           ; Decrement counter and col counter
  ADD R1, R1, #-1
  SRL R4, R4, #1            ; Shift bits in R4 to the right

  BRnp SPRITE_LOOP_TEST
  ADD R0, R0, #1              ; Iterate index by one for next address
  ADD R3, R3, #1              ; Iterate address by 1 for next row of bits
  CMPI R0, #8                 ; If we have reached all 8 rows, END
  BRn SPRITE_LOOP

TRAP_DRAW_SPRITE_END
  LEA R6, OS_GLOBALS_MEM      ; Call Global Memory
  LDR R7, R6, #2              ; Load the next address back into R7
  RTI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;; TRAP_RESET_VMEM ;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; In double-buffered video mode, resets the video display
;;; CIS 240 students do not need to modify this trap, it's for HW#8
;;; Inputs - none
;;; Outputs - none
.CODE	
TRAP_RESET_VMEM
	LC R4, OS_VDCR_ADDR
	CONST R5, #1
	STR R5, R4, #0
	RTI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; TRAP_BLT_VMEM ;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_BLT_VMEM - In double-buffered video mode, copies the contents
;;; of video memory to the video display.
;;; CIS 240 students do not need to modify this trap, it's for HW#8
;;; Inputs - none
;;; Outputs - none
.CODE
TRAP_BLT_VMEM
	LC R4, OS_VDCR_ADDR
	CONST R5, #2
	STR R5, R4, #0
	RTI


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_LFSR_SET_SEED - sets the seed value used by TRAP_LFSR
;;; Inputs - R0: initial value
;;; Outputs - none

.CODE
TRAP_LFSR_SET_SEED
  LEA R3, LFSR

  STR R0, R3, #0

  RTI

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; TRAP_LFSR - returns a shifted bit pattern
;;; Inputs - none
;;; Outputs - R0: shifted bit pattern

.CODE
TRAP_LFSR
  LEA R3, LFSR
  LDR R0, R3, 0

  SLL R1, R0, 2   ; move bit 13 to MSB
  XOR R2, R0, R1    ; xor with bit 15

  SLL R1, R0, 3   ; move bit 12 to MSB
  XOR R2, R1, R2

  SLL R1, R0, 5   ; move bit 10 to MSB
  XOR R2, R1, R2

  SRL R2, R2, 15    ; Shift right logical move MSB to LSB and zeros elsewhere

  SLL R0, R0, 1   ; shift left by one bit
  OR  R0, R0, R2    ; add in the LSB - note upper bits of R2 are all 0

  STR R0, R3, 0   ; update the LFSR in memory

  RTI
