		.DATA
numghosts 		.FILL #2
		.DATA
numdots 		.FILL #92
		.DATA
timer_speed 		.FILL #500
		.DATA
zero 		.FILL #255
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #255
		.DATA
one 		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.FILL #24
		.DATA
two 		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.FILL #224
		.FILL #255
		.FILL #255
		.DATA
three 		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.DATA
four 		.FILL #195
		.FILL #195
		.FILL #195
		.FILL #255
		.FILL #3
		.FILL #3
		.FILL #3
		.FILL #3
		.DATA
five 		.FILL #255
		.FILL #255
		.FILL #224
		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.DATA
six 		.FILL #255
		.FILL #255
		.FILL #224
		.FILL #255
		.FILL #255
		.FILL #195
		.FILL #255
		.FILL #255
		.DATA
seven 		.FILL #255
		.FILL #7
		.FILL #7
		.FILL #7
		.FILL #7
		.FILL #7
		.FILL #7
		.FILL #7
		.DATA
eight 		.FILL #255
		.FILL #195
		.FILL #195
		.FILL #255
		.FILL #195
		.FILL #195
		.FILL #255
		.FILL #255
		.DATA
nine 		.FILL #255
		.FILL #255
		.FILL #195
		.FILL #255
		.FILL #255
		.FILL #7
		.FILL #255
		.FILL #255
		.DATA
ghost 		.FILL #60
		.FILL #126
		.FILL #255
		.FILL #219
		.FILL #255
		.FILL #255
		.FILL #231
		.FILL #165
;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_score;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_score
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	CONST R7, #50
	STR R7, R5, #-1
	CONST R7, #58
	STR R7, R5, #-2
	LEA R7, score_left
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L2_pacman
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L2_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L4_pacman
	LEA R7, nine
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L4_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L6_pacman
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L6_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L8_pacman
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L8_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L10_pacman
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, three
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L10_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L12_pacman
	LEA R7, three
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, four
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L12_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRnp L14_pacman
	LEA R7, four
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, five
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L14_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #6
	CMP R7, R3
	BRnp L16_pacman
	LEA R7, five
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, six
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L16_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #7
	CMP R7, R3
	BRnp L18_pacman
	LEA R7, six
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, seven
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L18_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRnp L20_pacman
	LEA R7, seven
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, eight
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L20_pacman
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #9
	CMP R7, R3
	BRnp L22_pacman
	LEA R7, eight
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, nine
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	ADD R7, R7, #9
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L22_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #0
	CMP R7, R3
	BRnp L24_pacman
	LEA R7, nine
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L24_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L26_pacman
	LEA R7, zero
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L26_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L28_pacman
	LEA R7, one
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L28_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L30_pacman
	LEA R7, two
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, three
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L30_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L32_pacman
	LEA R7, three
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, four
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L32_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRnp L34_pacman
	LEA R7, four
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, five
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L34_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #6
	CMP R7, R3
	BRnp L36_pacman
	LEA R7, five
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, six
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L36_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #7
	CMP R7, R3
	BRnp L38_pacman
	LEA R7, six
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, seven
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L38_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRnp L40_pacman
	LEA R7, seven
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, eight
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L40_pacman
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #9
	CMP R7, R3
	BRnp L42_pacman
	LEA R7, eight
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, nine
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-2
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #-1
	CONST R3, #18
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L42_pacman
L1_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;endl;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
endl
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, L45_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L44_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;printnum;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
printnum
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, score
	LDR R7, R7, #0
	CONST R3, #10
	LEA R2, score_right
	MOD R1, R7, R3
	STR R1, R2, #0
	LEA R2, score_middle
	DIV R1, R7, R3
	STR R1, R2, #0
	LDR R1, R2, #0
	MOD R3, R1, R3
	STR R3, R2, #0
	LEA R3, score_left
	CONST R2, #100
	DIV R7, R7, R2
	STR R7, R3, #0
	LDR R7, R3, #0
	CONST R3, #48
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_putc
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, score_middle
	LDR R7, R7, #0
	CONST R3, #48
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_putc
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	LEA R7, score_right
	LDR R7, R7, #0
	CONST R3, #48
	ADD R7, R7, R3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_putc
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	JSR endl
	ADD R6, R6, #0	;; free space for arguments
L46_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;rand16;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
rand16
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L48_pacman
	JSR lc4_random
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	LEA R3, random
	STR R7, R3, #0
L49_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #7
	CMP R7, R3
	BRn L48_pacman
	LEA R7, random
	LDR R7, R7, #0
L47_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
pacmanrt 		.FILL #31
		.FILL #62
		.FILL #124
		.FILL #120
		.FILL #120
		.FILL #124
		.FILL #62
		.FILL #31
		.DATA
pacmanlt 		.FILL #248
		.FILL #124
		.FILL #62
		.FILL #30
		.FILL #30
		.FILL #62
		.FILL #124
		.FILL #248
		.DATA
pacmanup 		.FILL #129
		.FILL #195
		.FILL #231
		.FILL #255
		.FILL #255
		.FILL #126
		.FILL #60
		.FILL #0
		.DATA
pacmandown 		.FILL #0
		.FILL #60
		.FILL #126
		.FILL #255
		.FILL #255
		.FILL #231
		.FILL #195
		.FILL #129
;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_line;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_line
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LDR R7, R5, #7
	CONST R3, #0
	CMP R7, R3
	BRz L53_pacman
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_vline
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, i
	LDR R3, R5, #3
	STR R3, R7, #0
	JMP L58_pacman
L55_pacman
	LDR R7, R5, #4
	LEA R3, i
	LDR R3, R3, #0
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	CONST R3, #1
	STR R3, R7, #0
L56_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L58_pacman
	LEA R7, i
	LDR R7, R7, #0
	LDR R3, R5, #3
	LDR R2, R5, #5
	ADD R3, R3, R2
	CMP R7, R3
	BRn L55_pacman
	JMP L54_pacman
L53_pacman
	LDR R7, R5, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #5
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_hline
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, i
	LDR R3, R5, #4
	STR R3, R7, #0
	JMP L62_pacman
L59_pacman
	LEA R7, i
	LDR R7, R7, #0
	LDR R3, R5, #3
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	CONST R3, #1
	STR R3, R7, #0
L60_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L62_pacman
	LEA R7, i
	LDR R7, R7, #0
	LDR R3, R5, #4
	LDR R2, R5, #5
	ADD R3, R3, R2
	CMP R7, R3
	BRn L59_pacman
L54_pacman
L52_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;draw_grid;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
draw_grid
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #128
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #128
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #128
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #128
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #122
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #47
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #46
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #125
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #125
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #47
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #126
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #126
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #120
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #14
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #25
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #37
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #37
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #37
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #54
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #102
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #113
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #74
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #74
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #74
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #91
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #25
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #102
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #6
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #113
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #20
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #45
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #44
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #98
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #120
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #4
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #121
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #45
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #2
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #44
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #123
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #114
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #98
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #28
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #55
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #27
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #28
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #23
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #40
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #33
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #13
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #40
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #43
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #13
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #75
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #43
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #50
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #31
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #28
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #27
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R3, #117
	HICONST R3, #12
	ADD R6, R6, #-1
	STR R3, R6, #0
	CONST R3, #28
	ADD R6, R6, #-1
	STR R3, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #40
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #55
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #23
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #87
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #33
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #28
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #78
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #87
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #68
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #11
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #88
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #13
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #24
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #88
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #11
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #103
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #88
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #13
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #103
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #88
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #11
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #92
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #90
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #75
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #89
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #21
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #35
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #90
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #18
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #35
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #89
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #36
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #46
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #100
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #39
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #14
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #110
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #39
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #76
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #110
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #64
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #80
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #24
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #52
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #80
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #27
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #50
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #67
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #27
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #50
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #53
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #255
	HICONST R7, #255
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #10
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #59
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #53
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #50
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #53
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #117
	HICONST R7, #12
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #15
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #76
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #53
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR draw_line
	ADD R6, R6, #5	;; free space for arguments
L63_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;create_dots;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
create_dots
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, j
	CONST R3, #0
	STR R3, R7, #0
	LEA R7, i
	CONST R3, #47
	STR R3, R7, #0
L65_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	CONST R3, #96
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L66_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #78
	CMP R7, R3
	BRn L65_pacman
	LEA R7, i
	CONST R3, #47
	STR R3, R7, #0
L69_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	CONST R3, #33
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L70_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #78
	CMP R7, R3
	BRn L69_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L73_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #7
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L74_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L73_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L77_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #7
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L78_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L77_pacman
	LEA R7, i
	CONST R3, #46
	STR R3, R7, #0
L81_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #36
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L82_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L81_pacman
	LEA R7, i
	CONST R3, #69
	STR R3, R7, #0
L85_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #36
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L86_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #87
	CMP R7, R3
	BRn L85_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L89_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #42
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L90_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #40
	CMP R7, R3
	BRn L89_pacman
	LEA R7, i
	CONST R3, #89
	STR R3, R7, #0
L93_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #42
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L94_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L93_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L97_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #26
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L98_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L97_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L101_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #26
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L102_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L101_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L105_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #116
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L106_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L105_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L109_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #116
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L110_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L109_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L113_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #84
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L114_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L113_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L117_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #84
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L118_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L117_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L121_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #105
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L122_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L121_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L125_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #105
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L126_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L125_pacman
	LEA R7, i
	CONST R3, #8
	STR R3, R7, #0
L129_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #95
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L130_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #63
	CMP R7, R3
	BRn L129_pacman
	LEA R7, i
	CONST R3, #66
	STR R3, R7, #0
L133_pacman
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #95
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	LEA R3, i
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L134_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #123
	CMP R7, R3
	BRn L133_pacman
L64_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;redraw;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
redraw
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-4	;; allocate stack space for local variables
	;; function body
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L141_pacman
L138_pacman
	LEA R7, i
	LDR R7, R7, #0
	STR R7, R5, #-1
	CONST R3, #-1
	LEA R2, dotsy
	ADD R2, R7, R2
	LDR R2, R2, #0
	CMP R2, R3
	BRz L142_pacman
	LEA R7, dotsx
	LDR R2, R5, #-1
	ADD R7, R2, R7
	LDR R7, R7, #0
	CMP R7, R3
	BRz L142_pacman
	CONST R7, #240
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R3, R7, R3
	LDR R3, R3, #0
	ADD R6, R6, #-1
	STR R3, R6, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_pixel
	ADD R6, R6, #3	;; free space for arguments
L142_pacman
L139_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L141_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numdots
	LDR R3, R3, #0
	CMP R7, R3
	BRn L138_pacman
	CONST R7, #1
	STR R7, R5, #-1
	LEA R3, direction
	LDR R3, R3, #0
	CMP R3, R7
	BRnp L144_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	LDR R3, R5, #-1
	CMP R7, R3
	BRnp L144_pacman
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L144_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L146_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L146_pacman
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L146_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L148_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L148_pacman
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L148_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L150_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L150_pacman
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L150_pacman
	CONST R7, #2
	STR R7, R5, #-2
	LEA R3, direction
	LDR R3, R3, #0
	CMP R3, R7
	BRnp L152_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	LDR R3, R5, #-2
	CMP R7, R3
	BRnp L152_pacman
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L152_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L154_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L154_pacman
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L154_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L156_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L156_pacman
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L156_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L158_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L158_pacman
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L158_pacman
	CONST R7, #4
	STR R7, R5, #-3
	LEA R3, direction
	LDR R3, R3, #0
	CMP R3, R7
	BRnp L160_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	LDR R3, R5, #-3
	CMP R7, R3
	BRnp L160_pacman
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L160_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L162_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L162_pacman
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L162_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L164_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L164_pacman
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L164_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L166_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L166_pacman
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L166_pacman
	CONST R7, #3
	STR R7, R5, #-4
	LEA R3, direction
	LDR R3, R3, #0
	CMP R3, R7
	BRnp L168_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	LDR R3, R5, #-4
	CMP R7, R3
	BRnp L168_pacman
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L168_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L170_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L170_pacman
	LEA R7, pacmanlt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L170_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L172_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L172_pacman
	LEA R7, pacmanup
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L172_pacman
	LEA R7, direction
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L174_pacman
	LEA R7, prevdirection
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L174_pacman
	LEA R7, pacmandown
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, prevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, pacmanrt
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #224
	HICONST R7, #127
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, y
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, x
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L174_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L179_pacman
L176_pacman
	LEA R7, ghost
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, ghostsprevy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, ghostsprevx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, ghost
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	HICONST R7, #124
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, ghostsy
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, ghostsx
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, ghost
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, ghostsprevy
	LDR R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, ghostsprevx
	LDR R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
	LEA R7, ghost
	ADD R6, R6, #-1
	STR R7, R6, #0
	CONST R7, #0
	HICONST R7, #51
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, ghostsy
	LDR R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	LEA R7, ghostsx
	LDR R7, R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_draw_sprite
	ADD R6, R6, #4	;; free space for arguments
L177_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L179_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numghosts
	LDR R3, R3, #0
	CMP R7, R3
	BRn L176_pacman
	LEA R7, prevx
	LEA R3, x
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, prevy
	LEA R3, y
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, prevdirection
	LEA R3, direction
	LDR R3, R3, #0
	STR R3, R7, #0
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L183_pacman
L180_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevx
	ADD R3, R7, R3
	LEA R2, ghostsx
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevy
	ADD R3, R7, R3
	LEA R2, ghostsy
	ADD R7, R7, R2
	LDR R7, R7, #0
	STR R7, R3, #0
L181_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L183_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numghosts
	LDR R3, R3, #0
	CMP R7, R3
	BRn L180_pacman
	JSR draw_score
	ADD R6, R6, #0	;; free space for arguments
L137_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;reset_game_state;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
reset_game_state
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LEA R7, score
	CONST R3, #0
	STR R3, R7, #0
	CONST R7, #-10
	LEA R3, prevx
	STR R7, R3, #0
	LEA R3, prevy
	STR R7, R3, #0
	CONST R7, #3
	LEA R3, direction
	STR R7, R3, #0
	LEA R3, prevdirection
	STR R7, R3, #0
	LEA R7, ghostsx
	CONST R3, #42
	STR R3, R7, #0
	LEA R3, ghostsy
	CONST R2, #55
	STR R2, R3, #0
	CONST R3, #77
	STR R3, R7, #1
	LEA R7, ghostsy
	CONST R3, #55
	STR R3, R7, #1
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L188_pacman
L185_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevx
	ADD R7, R7, R3
	CONST R3, #-10
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsprevy
	ADD R7, R7, R3
	CONST R3, #-10
	STR R3, R7, #0
L186_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L188_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numghosts
	LDR R3, R3, #0
	CMP R7, R3
	BRn L185_pacman
	LEA R7, ghostsdirection
	CONST R3, #1
	STR R3, R7, #0
	CONST R3, #2
	STR R3, R7, #1
	LEA R7, colors
	CONST R3, #112
	HICONST R3, #7
	STR R3, R7, #0
	CONST R3, #0
	HICONST R3, #124
	STR R3, R7, #1
	LEA R7, x
	CONST R3, #60
	STR R3, R7, #0
	LEA R7, y
	CONST R3, #72
	STR R3, R7, #0
	JSR create_dots
	ADD R6, R6, #0	;; free space for arguments
L184_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;choose_direction;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
choose_direction
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-5	;; allocate stack space for local variables
	;; function body
	LEA R7, ghostsy
	LDR R7, R7, #0
	STR R7, R5, #-1
	LEA R7, ghostsx
	LDR R7, R7, #0
	STR R7, R5, #-2
	LDR R7, R5, #-2
	ADD R7, R7, #7
	STR R7, R5, #-3
	LDR R7, R5, #-1
	ADD R7, R7, #7
	STR R7, R5, #-4
	LEA R7, ghostsdirection
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L190_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L192_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L196_pacman
	LDR R7, R5, #-1
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-5
	CONST R3, #0
	CMP R7, R3
	BRn L200_pacman
	LEA R7, ghostsx
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-5
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L200_pacman
	LEA R7, ghostsy
	LDR R3, R5, #-1
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, ghostsdirection
	LEA R3, direction
	LDR R3, R3, #0
	STR R3, R7, #0
	JMP L189_pacman
L200_pacman
L197_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L196_pacman
L193_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L192_pacman
	LEA R7, ghostsy
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L190_pacman
	LEA R7, ghostsdirection
	LDR R7, R7, #0
	CONST R3, #2
	CMP R7, R3
	BRnp L202_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L204_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L208_pacman
	LDR R7, R5, #-4
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-5
	CONST R3, #124
	CMP R7, R3
	BRzp L212_pacman
	LEA R7, ghostsx
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-5
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L212_pacman
	LEA R7, ghostsy
	LDR R3, R5, #-4
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #0
	LEA R7, ghostsdirection
	LEA R3, direction
	LDR R3, R3, #0
	STR R3, R7, #0
	JMP L189_pacman
L212_pacman
L209_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L208_pacman
L205_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L204_pacman
	LEA R7, ghostsy
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L202_pacman
	LEA R7, ghostsdirection
	LDR R7, R7, #0
	CONST R3, #4
	CMP R7, R3
	BRnp L214_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L216_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L220_pacman
	LDR R7, R5, #-2
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-5
	CONST R3, #0
	CMP R7, R3
	BRn L224_pacman
	LEA R7, ghostsy
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-5
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L224_pacman
	LEA R7, ghostsx
	LDR R3, R5, #-2
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, ghostsdirection
	LEA R3, direction
	LDR R3, R3, #0
	STR R3, R7, #0
	JMP L189_pacman
L224_pacman
L221_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L220_pacman
L217_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L216_pacman
	LEA R7, ghostsx
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L214_pacman
	LEA R7, ghostsdirection
	LDR R7, R7, #0
	CONST R3, #3
	CMP R7, R3
	BRnp L226_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L228_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L232_pacman
	LDR R7, R5, #-3
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-5
	CONST R3, #128
	CMP R7, R3
	BRzp L236_pacman
	LEA R7, ghostsy
	LDR R7, R7, #1
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-5
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L236_pacman
	LEA R7, ghostsx
	LDR R3, R5, #-3
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #0
	LEA R7, ghostsdirection
	LEA R3, direction
	LDR R3, R3, #0
	STR R3, R7, #0
	JMP L189_pacman
L236_pacman
L233_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L232_pacman
L229_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L228_pacman
	LEA R7, ghostsx
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L226_pacman
	LEA R7, ghostsx
	LDR R7, R7, #0
	ADD R7, R7, #7
	CONST R3, #2
	CMP R7, R3
	BRzp L238_pacman
	LEA R7, ghostsx
	CONST R3, #126
	STR R3, R7, #0
	LEA R7, ghostsdirection
	CONST R3, #4
	STR R3, R7, #0
	JMP L189_pacman
L238_pacman
	LEA R7, ghostsx
	LDR R7, R7, #0
	CONST R3, #126
	CMP R7, R3
	BRnz L240_pacman
	LEA R7, ghostsx
	CONST R3, #-5
	STR R3, R7, #0
	LEA R7, ghostsdirection
	CONST R3, #3
	STR R3, R7, #0
L240_pacman
L189_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;choose_direction_random;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
choose_direction_random
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-10	;; allocate stack space for local variables
	;; function body
	LEA R7, ghostsy
	LDR R7, R7, #1
	STR R7, R5, #-3
	LEA R7, ghostsx
	LDR R7, R7, #1
	STR R7, R5, #-4
	LDR R7, R5, #-4
	ADD R7, R7, #7
	STR R7, R5, #-5
	LDR R7, R5, #-3
	ADD R7, R7, #7
	STR R7, R5, #-6
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	LEA R7, ghostsdirection
	LDR R7, R7, #1
	CONST R3, #1
	CMP R7, R3
	BRnp L243_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L245_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L249_pacman
	LDR R7, R5, #-3
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-7
	CONST R3, #0
	CMP R7, R3
	BRn L253_pacman
	LEA R7, ghostsx
	LDR R7, R7, #1
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-7
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L253_pacman
	LEA R7, ghostsy
	LDR R3, R5, #-3
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #1
	LDR R7, R5, #-1
	CONST R3, #0
	HICONST R3, #96
	CMP R7, R3
	BRnz L255_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #1
	STR R7, R5, #-2
L255_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-8
	CONST R3, #255
	HICONST R3, #63
	CMP R7, R3
	BRnz L257_pacman
	CONST R7, #1
	HICONST R7, #96
	LDR R3, R5, #-8
	CMP R3, R7
	BRzp L257_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #2
	STR R7, R5, #-2
L257_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-9
	CONST R3, #255
	HICONST R3, #31
	CMP R7, R3
	BRnz L259_pacman
	CONST R7, #0
	HICONST R7, #64
	LDR R3, R5, #-9
	CMP R3, R7
	BRzp L259_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #4
	STR R7, R5, #-2
L259_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-10
	CONST R3, #0
	CMP R7, R3
	BRn L261_pacman
	CONST R7, #0
	HICONST R7, #32
	LDR R3, R5, #-10
	CMP R3, R7
	BRzp L261_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #3
	STR R7, R5, #-1
L261_pacman
	LEA R7, ghostsdirection
	LDR R3, R5, #-2
	STR R3, R7, #1
	JMP L242_pacman
L253_pacman
L250_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L249_pacman
L246_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L245_pacman
	LEA R7, ghostsy
	ADD R7, R7, #1
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L243_pacman
	LEA R7, ghostsdirection
	LDR R7, R7, #1
	CONST R3, #2
	CMP R7, R3
	BRnp L263_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L265_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L269_pacman
	LDR R7, R5, #-6
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-7
	CONST R3, #124
	CMP R7, R3
	BRzp L273_pacman
	LEA R7, ghostsx
	LDR R7, R7, #1
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-7
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L273_pacman
	LEA R7, ghostsy
	LDR R3, R5, #-6
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #1
	LDR R7, R5, #-1
	CONST R3, #0
	HICONST R3, #96
	CMP R7, R3
	BRnz L275_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #1
	STR R7, R5, #-2
L275_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-8
	CONST R3, #255
	HICONST R3, #63
	CMP R7, R3
	BRnz L277_pacman
	CONST R7, #1
	HICONST R7, #96
	LDR R3, R5, #-8
	CMP R3, R7
	BRzp L277_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #2
	STR R7, R5, #-2
L277_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-9
	CONST R3, #255
	HICONST R3, #31
	CMP R7, R3
	BRnz L279_pacman
	CONST R7, #0
	HICONST R7, #64
	LDR R3, R5, #-9
	CMP R3, R7
	BRzp L279_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #4
	STR R7, R5, #-2
L279_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-10
	CONST R3, #0
	CMP R7, R3
	BRn L281_pacman
	CONST R7, #0
	HICONST R7, #32
	LDR R3, R5, #-10
	CMP R3, R7
	BRzp L281_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #3
	STR R7, R5, #-1
L281_pacman
	LEA R7, ghostsdirection
	LDR R3, R5, #-2
	STR R3, R7, #1
	JMP L242_pacman
L273_pacman
L270_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L269_pacman
L266_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L265_pacman
	LEA R7, ghostsy
	ADD R7, R7, #1
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L263_pacman
	LEA R7, ghostsdirection
	LDR R7, R7, #1
	CONST R3, #4
	CMP R7, R3
	BRnp L283_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L285_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L289_pacman
	LDR R7, R5, #-4
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-7
	CONST R3, #0
	CMP R7, R3
	BRn L293_pacman
	LEA R7, ghostsy
	LDR R7, R7, #1
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-7
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L293_pacman
	LEA R7, ghostsx
	LDR R3, R5, #-4
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #1
	LDR R7, R5, #-1
	CONST R3, #0
	HICONST R3, #96
	CMP R7, R3
	BRnz L295_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #1
	STR R7, R5, #-2
L295_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-8
	CONST R3, #255
	HICONST R3, #63
	CMP R7, R3
	BRnz L297_pacman
	CONST R7, #1
	HICONST R7, #96
	LDR R3, R5, #-8
	CMP R3, R7
	BRzp L297_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #2
	STR R7, R5, #-2
L297_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-9
	CONST R3, #255
	HICONST R3, #31
	CMP R7, R3
	BRnz L299_pacman
	CONST R7, #0
	HICONST R7, #64
	LDR R3, R5, #-9
	CMP R3, R7
	BRzp L299_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #4
	STR R7, R5, #-2
L299_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-10
	CONST R3, #0
	CMP R7, R3
	BRn L301_pacman
	CONST R7, #0
	HICONST R7, #32
	LDR R3, R5, #-10
	CMP R3, R7
	BRzp L301_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #3
	STR R7, R5, #-1
L301_pacman
	LEA R7, ghostsdirection
	LDR R3, R5, #-2
	STR R3, R7, #1
	JMP L242_pacman
L293_pacman
L290_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L289_pacman
L286_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L285_pacman
	LEA R7, ghostsx
	ADD R7, R7, #1
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L283_pacman
	LEA R7, ghostsdirection
	LDR R7, R7, #1
	CONST R3, #3
	CMP R7, R3
	BRnp L303_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L305_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L309_pacman
	LDR R7, R5, #-5
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-7
	CONST R3, #128
	CMP R7, R3
	BRzp L313_pacman
	LEA R7, ghostsy
	LDR R7, R7, #1
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-7
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L313_pacman
	LEA R7, ghostsx
	LDR R3, R5, #-5
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #1
	LDR R7, R5, #-1
	CONST R3, #0
	HICONST R3, #96
	CMP R7, R3
	BRnz L315_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #1
	STR R7, R5, #-2
L315_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-8
	CONST R3, #255
	HICONST R3, #63
	CMP R7, R3
	BRnz L317_pacman
	CONST R7, #1
	HICONST R7, #96
	LDR R3, R5, #-8
	CMP R3, R7
	BRzp L317_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #2
	STR R7, R5, #-2
L317_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-9
	CONST R3, #255
	HICONST R3, #31
	CMP R7, R3
	BRnz L319_pacman
	CONST R7, #0
	HICONST R7, #64
	LDR R3, R5, #-9
	CMP R3, R7
	BRzp L319_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #4
	STR R7, R5, #-2
L319_pacman
	LDR R7, R5, #-1
	STR R7, R5, #-10
	CONST R3, #0
	CMP R7, R3
	BRn L321_pacman
	CONST R7, #0
	HICONST R7, #32
	LDR R3, R5, #-10
	CMP R3, R7
	BRzp L321_pacman
	JSR rand16
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	STR R7, R5, #-1
	CONST R7, #3
	STR R7, R5, #-1
L321_pacman
	LEA R7, ghostsdirection
	LDR R3, R5, #-2
	STR R3, R7, #1
	JMP L242_pacman
L313_pacman
L310_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L309_pacman
L306_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L305_pacman
	LEA R7, ghostsx
	ADD R7, R7, #1
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L303_pacman
	LEA R7, ghostsx
	LDR R7, R7, #1
	ADD R7, R7, #7
	CONST R3, #2
	CMP R7, R3
	BRzp L323_pacman
	LEA R7, ghostsx
	CONST R3, #126
	STR R3, R7, #1
	LEA R7, ghostsdirection
	CONST R3, #4
	STR R3, R7, #1
	JMP L242_pacman
L323_pacman
	LEA R7, ghostsx
	LDR R7, R7, #1
	CONST R3, #126
	CMP R7, R3
	BRnz L325_pacman
	LEA R7, ghostsx
	CONST R3, #-5
	STR R3, R7, #1
	LEA R7, ghostsdirection
	CONST R3, #3
	STR R3, R7, #1
L325_pacman
L242_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;move_ghost;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
move_ghost
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	LDR R7, R5, #4
	CONST R3, #0
	CMP R7, R3
	BRz L328_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction_random
	ADD R6, R6, #1	;; free space for arguments
	JMP L329_pacman
L328_pacman
	LDR R7, R5, #3
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR choose_direction
	ADD R6, R6, #1	;; free space for arguments
L329_pacman
L327_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;move_pacman;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
move_pacman
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-1	;; allocate stack space for local variables
	;; function body
	LEA R7, y
	LDR R7, R7, #0
	LEA R3, top
	STR R7, R3, #0
	LEA R3, x
	LDR R3, R3, #0
	LEA R2, left
	STR R3, R2, #0
	LEA R2, right
	ADD R3, R3, #7
	STR R3, R2, #0
	LEA R3, bottom
	ADD R7, R7, #7
	STR R7, R3, #0
	LDR R7, R5, #3
	CONST R3, #1
	CMP R7, R3
	BRnp L331_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L333_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L337_pacman
	LEA R7, top
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRn L341_pacman
	LEA R7, x
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-1
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L341_pacman
	LEA R7, y
	LEA R3, top
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #0
	JMP L330_pacman
L341_pacman
L338_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L337_pacman
L334_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L333_pacman
	LEA R7, y
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L331_pacman
	LDR R7, R5, #3
	CONST R3, #3
	CMP R7, R3
	BRnp L343_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L345_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L349_pacman
	LEA R7, right
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #128
	CMP R7, R3
	BRzp L353_pacman
	LEA R7, y
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-1
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L353_pacman
	LEA R7, x
	LEA R3, right
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #0
	JMP L330_pacman
L353_pacman
L350_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L349_pacman
L346_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L345_pacman
	LEA R7, x
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L343_pacman
	LDR R7, R5, #3
	CONST R3, #4
	CMP R7, R3
	BRnp L355_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L357_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L361_pacman
	LEA R7, left
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	SUB R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #0
	CMP R7, R3
	BRn L365_pacman
	LEA R7, y
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	SLL R7, R7, #7
	LEA R3, validspace
	ADD R7, R7, R3
	LDR R3, R5, #-1
	ADD R7, R3, R7
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L365_pacman
	LEA R7, x
	LEA R3, left
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	SUB R3, R3, R2
	ADD R3, R3, #1
	STR R3, R7, #0
	JMP L330_pacman
L365_pacman
L362_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L361_pacman
L358_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L357_pacman
	LEA R7, x
	LDR R3, R7, #0
	ADD R3, R3, #-4
	STR R3, R7, #0
L355_pacman
	LDR R7, R5, #3
	CONST R3, #2
	CMP R7, R3
	BRnp L367_pacman
	LEA R7, j
	CONST R3, #1
	STR R3, R7, #0
L369_pacman
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
L373_pacman
	LEA R7, bottom
	LDR R7, R7, #0
	LEA R3, j
	LDR R3, R3, #0
	ADD R7, R7, R3
	STR R7, R5, #-1
	CONST R3, #124
	CMP R7, R3
	BRzp L377_pacman
	LEA R7, x
	LDR R7, R7, #0
	LEA R3, i
	LDR R3, R3, #0
	ADD R7, R7, R3
	LDR R3, R5, #-1
	SLL R3, R3, #7
	LEA R2, validspace
	ADD R3, R3, R2
	ADD R7, R7, R3
	LDR R7, R7, #0
	CONST R3, #1
	CMP R7, R3
	BRnp L377_pacman
	LEA R7, y
	LEA R3, bottom
	LDR R3, R3, #0
	LEA R2, j
	LDR R2, R2, #0
	ADD R3, R3, R2
	ADD R3, R3, #-8
	STR R3, R7, #0
	JMP L330_pacman
L377_pacman
L374_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	CONST R3, #8
	CMP R7, R3
	BRn L373_pacman
L370_pacman
	LEA R7, j
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	LEA R7, j
	LDR R7, R7, #0
	CONST R3, #5
	CMP R7, R3
	BRn L369_pacman
	LEA R7, y
	LDR R3, R7, #0
	ADD R3, R3, #4
	STR R3, R7, #0
L367_pacman
	LEA R7, x
	LDR R7, R7, #0
	ADD R7, R7, #7
	CONST R3, #2
	CMP R7, R3
	BRzp L379_pacman
	LEA R7, x
	CONST R3, #126
	STR R3, R7, #0
	CONST R7, #4
	STR R7, R5, #3
	JMP L330_pacman
L379_pacman
	LEA R7, x
	LDR R7, R7, #0
	CONST R3, #126
	CMP R7, R3
	BRnz L381_pacman
	LEA R7, x
	CONST R3, #-5
	STR R3, R7, #0
	CONST R7, #3
	STR R7, R5, #3
L381_pacman
L330_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;playerhit;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
playerhit
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-4	;; allocate stack space for local variables
	;; function body
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L387_pacman
L384_pacman
	LEA R7, x
	LDR R7, R7, #0
	STR R7, R5, #-1
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, ghostsx
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L388_pacman
	LDR R7, R5, #-1
	ADD R7, R7, #7
	CMP R7, R3
	BRn L388_pacman
	LEA R7, y
	LDR R7, R7, #0
	STR R7, R5, #-2
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, ghostsy
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L390_pacman
	LDR R7, R5, #-2
	ADD R7, R7, #7
	CMP R7, R3
	BRn L390_pacman
	CONST R7, #1
	JMP L383_pacman
L390_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsy
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-3
	LEA R3, y
	LDR R3, R3, #0
	CMP R7, R3
	BRp L389_pacman
	LDR R7, R5, #-3
	ADD R7, R7, #7
	CMP R7, R3
	BRn L389_pacman
	CONST R7, #1
	JMP L383_pacman
L388_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsx
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-2
	LEA R3, x
	LDR R3, R3, #0
	CMP R7, R3
	BRp L394_pacman
	LDR R7, R5, #-2
	ADD R7, R7, #7
	CMP R7, R3
	BRn L394_pacman
	LEA R7, y
	LDR R7, R7, #0
	STR R7, R5, #-3
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, ghostsy
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L396_pacman
	LDR R7, R5, #-3
	ADD R7, R7, #7
	CMP R7, R3
	BRn L396_pacman
	CONST R7, #1
	JMP L383_pacman
L396_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, ghostsy
	ADD R7, R7, R3
	LDR R7, R7, #0
	STR R7, R5, #-4
	LEA R3, y
	LDR R3, R3, #0
	CMP R7, R3
	BRp L398_pacman
	LDR R7, R5, #-4
	ADD R7, R7, #7
	CMP R7, R3
	BRn L398_pacman
	CONST R7, #1
	JMP L383_pacman
L398_pacman
L394_pacman
L389_pacman
L385_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L387_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numghosts
	LDR R3, R3, #0
	CMP R7, R3
	BRn L384_pacman
	CONST R7, #0
L383_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;eat_dot;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
eat_dot
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	ADD R6, R6, #-2	;; allocate stack space for local variables
	;; function body
	LEA R7, i
	CONST R3, #0
	STR R3, R7, #0
	JMP L404_pacman
L401_pacman
	LEA R7, x
	LDR R7, R7, #0
	STR R7, R5, #-1
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, dotsx
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L405_pacman
	LDR R7, R5, #-1
	ADD R7, R7, #7
	CMP R7, R3
	BRn L405_pacman
	LEA R7, y
	LDR R7, R7, #0
	STR R7, R5, #-2
	LEA R3, i
	LDR R3, R3, #0
	LEA R2, dotsy
	ADD R3, R3, R2
	LDR R3, R3, #0
	CMP R7, R3
	BRp L407_pacman
	LDR R7, R5, #-2
	ADD R7, R7, #7
	CMP R7, R3
	BRn L407_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, dotsx
	ADD R7, R7, R3
	CONST R3, #-1
	STR R3, R7, #0
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, dotsy
	ADD R7, R7, R3
	CONST R3, #-1
	STR R3, R7, #0
	LEA R7, score
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
	JSR printnum
	ADD R6, R6, #0	;; free space for arguments
L407_pacman
L405_pacman
L402_pacman
	LEA R7, i
	LDR R3, R7, #0
	ADD R3, R3, #1
	STR R3, R7, #0
L404_pacman
	LEA R7, i
	LDR R7, R7, #0
	LEA R3, numdots
	LDR R3, R3, #0
	CMP R7, R3
	BRn L401_pacman
L400_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;main;;;;;;;;;;;;;;;;;;;;;;;;;;;;
		.CODE
		.FALIGN
main
	;; prologue
	STR R7, R6, #-2	;; save return address
	STR R5, R6, #-3	;; save base pointer
	ADD R6, R6, #-3
	ADD R5, R6, #0
	;; function body
	JSR draw_grid
	ADD R6, R6, #0	;; free space for arguments
	LEA R7, L410_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L411_pacman
L412_pacman
	LEA R7, timer_speed
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_getc_timer
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	CONST R3, #116
	CMP R7, R3
	BRnp L411_pacman
	LEA R7, L414_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JSR draw_score
	ADD R6, R6, #0	;; free space for arguments
	JSR reset_game_state
	ADD R6, R6, #0	;; free space for arguments
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
	JSR printnum
	ADD R6, R6, #0	;; free space for arguments
	JMP L416_pacman
L415_pacman
	LEA R7, timer_speed
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_getc_timer
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #1	;; free space for arguments
	LEA R3, c
	STR R7, R3, #0
	LEA R7, c
	LDR R7, R7, #0
	CONST R3, #119
	CMP R7, R3
	BRnp L418_pacman
	LEA R7, direction
	CONST R3, #1
	STR R3, R7, #0
	JMP L419_pacman
L418_pacman
	LEA R7, c
	LDR R7, R7, #0
	CONST R3, #97
	CMP R7, R3
	BRnp L420_pacman
	LEA R7, direction
	CONST R3, #4
	STR R3, R7, #0
	JMP L421_pacman
L420_pacman
	LEA R7, c
	LDR R7, R7, #0
	CONST R3, #115
	CMP R7, R3
	BRnp L422_pacman
	LEA R7, direction
	CONST R3, #2
	STR R3, R7, #0
	JMP L423_pacman
L422_pacman
	LEA R7, c
	LDR R7, R7, #0
	CONST R3, #100
	CMP R7, R3
	BRnp L424_pacman
	LEA R7, direction
	CONST R3, #3
	STR R3, R7, #0
L424_pacman
L423_pacman
L421_pacman
L419_pacman
	LEA R7, direction
	LDR R7, R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR move_pacman
	ADD R6, R6, #1	;; free space for arguments
	CONST R7, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR move_ghost
	ADD R6, R6, #2	;; free space for arguments
	CONST R7, #1
	ADD R6, R6, #-1
	STR R7, R6, #0
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR move_ghost
	ADD R6, R6, #2	;; free space for arguments
	JSR eat_dot
	ADD R6, R6, #0	;; free space for arguments
	JSR redraw
	ADD R6, R6, #0	;; free space for arguments
L416_pacman
	JSR playerhit
	LDR R7, R6, #-1	;; grab return value
	ADD R6, R6, #0	;; free space for arguments
	CONST R3, #0
	CMP R7, R3
	BRnp L426_pacman
	LEA R7, score
	LDR R7, R7, #0
	LEA R3, numdots
	LDR R3, R3, #0
	CMP R7, R3
	BRnp L415_pacman
L426_pacman
	LEA R7, score
	LDR R7, R7, #0
	LEA R3, numdots
	LDR R3, R3, #0
	CMP R7, R3
	BRnp L427_pacman
	LEA R7, L429_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
	JMP L428_pacman
L427_pacman
	LEA R7, L430_pacman
	ADD R6, R6, #-1
	STR R7, R6, #0
	JSR lc4_puts
	ADD R6, R6, #1	;; free space for arguments
L428_pacman
	CONST R7, #0
L409_pacman
	;; epilogue
	ADD R6, R5, #0	;; pop locals off stack
	ADD R6, R6, #3	;; free space for return address, base pointer, and return value
	STR R7, R6, #-1	;; store return value
	LDR R5, R6, #-3	;; restore base pointer
	LDR R7, R6, #-2	;; restore return address
	RET

		.DATA
top 		.BLKW 1
		.DATA
bottom 		.BLKW 1
		.DATA
left 		.BLKW 1
		.DATA
right 		.BLKW 1
		.DATA
ghostsdirection 		.BLKW 2
		.DATA
ghostsprevy 		.BLKW 2
		.DATA
ghostsprevx 		.BLKW 2
		.DATA
ghostsy 		.BLKW 2
		.DATA
ghostsx 		.BLKW 2
		.DATA
randomdirection 		.BLKW 1
		.DATA
random 		.BLKW 1
		.DATA
y 		.BLKW 1
		.DATA
x 		.BLKW 1
		.DATA
prevdirection 		.BLKW 1
		.DATA
direction 		.BLKW 1
		.DATA
prevy 		.BLKW 1
		.DATA
prevx 		.BLKW 1
		.DATA
dotsy 		.BLKW 92
		.DATA
dotsx 		.BLKW 92
		.DATA
prev_score_right 		.BLKW 1
		.DATA
prev_score_middle 		.BLKW 1
		.DATA
prev_score_left 		.BLKW 1
		.DATA
score_right 		.BLKW 1
		.DATA
score_middle 		.BLKW 1
		.DATA
score_left 		.BLKW 1
		.DATA
score 		.BLKW 1
		.DATA
colors 		.BLKW 2
		.DATA
j 		.BLKW 1
		.DATA
i 		.BLKW 1
		.DATA
validspace 		.BLKW 15872
		.DATA
c 		.BLKW 1
		.DATA
L430_pacman 		.STRINGZ "You Lose"
		.DATA
L429_pacman 		.STRINGZ "You Win"
		.DATA
L414_pacman 		.STRINGZ "Use a to move left, s to down, d to move right, w to move up, try to collect all the pellets before being hit by a ghost\n"
		.DATA
L410_pacman 		.STRINGZ "Press t to start\n"
		.DATA
L45_pacman 		.STRINGZ "\n"
