;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module testlcd
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _game_ctrl
	.globl _end_game
	.globl _move_dinosaur
	.globl _update_cactus
	.globl _init
	.globl _render_task
	.globl _keypad_ctrl
	.globl _LCD_ready
	.globl _delay
	.globl _LCD_write_char
	.globl _LCD_IRWrite
	.globl _LCD_Init
	.globl _ButtonToChar
	.globl _AnyButtonPressed
	.globl _AnyKeyPressed
	.globl _KeyToChar
	.globl _Init_Keypad
	.globl _ThreadExit
	.globl _ThreadYield
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _diff
	.globl _flag
	.globl _pre_score
	.globl _cactus_pos
	.globl _k
	.globl _j
	.globl _i
	.globl _game_over
	.globl _score
	.globl _dino_pos
	.globl _cur_input
	.globl _prev_input
	.globl _iter
	.globl _full
	.globl _mutex
	.globl _buffer
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_buffer	=	0x0039
_mutex	=	0x003a
_full	=	0x003b
_iter	=	0x003c
_prev_input	=	0x003e
_cur_input	=	0x003f
_dino_pos	=	0x0020
_score	=	0x002e
_game_over	=	0x0023
_i	=	0x0024
_j	=	0x0025
_k	=	0x0026
_cactus_pos	=	0x0029
_pre_score	=	0x0027
_flag	=	0x0028
_diff	=	0x002f
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'keypad_ctrl'
;------------------------------------------------------------
;	testlcd.c:27: void keypad_ctrl(void) {
;	-----------------------------------------
;	 function keypad_ctrl
;	-----------------------------------------
_keypad_ctrl:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	testlcd.c:28: while (1) {
00121$:
;	testlcd.c:29: if (game_over) {ThreadExit(); return;}
	mov	a,_game_over
	jz	00102$
	ljmp	_ThreadExit
00102$:
;	testlcd.c:30: if (AnyButtonPressed()) {
	lcall	_AnyButtonPressed
	mov	a,dpl
	jz	00118$
;	testlcd.c:31: cur_input = ButtonToChar();
	lcall	_ButtonToChar
	mov	_cur_input,dpl
;	testlcd.c:32: if (cur_input != prev_input && prev_input == 0x00) {
	mov	a,_prev_input
	cjne	a,_cur_input,00167$
	sjmp	00121$
00167$:
	mov	a,_prev_input
	jnz	00121$
;	testlcd.c:33: EA = 0; 
;	assignBit
	clr	_EA
;	testlcd.c:34: buffer = cur_input; 
	mov	_buffer,_cur_input
;	testlcd.c:35: prev_input = cur_input; 
	mov	_prev_input,_cur_input
;	testlcd.c:36: EA = 1;
;	assignBit
	setb	_EA
	sjmp	00121$
00118$:
;	testlcd.c:39: else if (AnyKeyPressed()) {
	lcall	_AnyKeyPressed
	mov	a,dpl
	jnz	00169$
	ljmp	00115$
00169$:
;	testlcd.c:40: cur_input = KeyToChar();
	lcall	_KeyToChar
	mov	_cur_input,dpl
;	testlcd.c:41: if (cur_input != prev_input && prev_input == 0x00) {
	mov	a,_prev_input
	cjne	a,_cur_input,00170$
	sjmp	00121$
00170$:
	mov	a,_prev_input
	jnz	00121$
;	testlcd.c:42: EA = 0;
;	assignBit
	clr	_EA
;	testlcd.c:43: buffer = cur_input; 
	mov	_buffer,_cur_input
;	testlcd.c:44: if (buffer == '2' ) { // Move up
	mov	a,#0x32
	cjne	a,_buffer,00109$
;	testlcd.c:45: LCD_cursorGoTo(dino_pos, 0); 
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:46: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:47: dino_pos = 0;
	mov	_dino_pos,#0x00
;	testlcd.c:48: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:49: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
	sjmp	00110$
00109$:
;	testlcd.c:50: } else if (buffer == '8') { // Move down
	mov	a,#0x38
	cjne	a,_buffer,00110$
;	testlcd.c:51: LCD_cursorGoTo(dino_pos, 0); 
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:52: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:53: dino_pos = 1;
	mov	_dino_pos,#0x01
;	testlcd.c:54: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:55: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
00110$:
;	testlcd.c:57: prev_input = cur_input; 
	mov	_prev_input,_cur_input
;	testlcd.c:58: EA = 1;
;	assignBit
	setb	_EA
	ljmp	00121$
00115$:
;	testlcd.c:62: prev_input = 0x00; 
	mov	_prev_input,#0x00
;	testlcd.c:65: }
	ljmp	00121$
;------------------------------------------------------------
;Allocation info for local variables in function 'render_task'
;------------------------------------------------------------
;	testlcd.c:67: void render_task(void) {
;	-----------------------------------------
;	 function render_task
;	-----------------------------------------
_render_task:
;	testlcd.c:69: while (1) {
00106$:
;	testlcd.c:70: if (game_over) {ThreadExit(); return;}
	mov	a,_game_over
	jz	00102$
	ljmp	_ThreadExit
00102$:
;	testlcd.c:72: SemaphoreWait(mutex);
		0$:
	MOV A, _mutex 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _mutex 
;	testlcd.c:77: EA = 0;
;	assignBit
	clr	_EA
;	testlcd.c:78: if(!k){;
	mov	a,_k
	jnz	00104$
;	testlcd.c:79: k = 1;
	mov	_k,#0x01
00104$:
;	testlcd.c:81: EA = 1;
;	assignBit
	setb	_EA
;	testlcd.c:83: SemaphoreSignal(mutex);
	INC _mutex 
;	testlcd.c:89: ThreadYield(); 
	lcall	_ThreadYield
;	testlcd.c:91: }
	sjmp	00106$
;------------------------------------------------------------
;Allocation info for local variables in function 'init'
;------------------------------------------------------------
;	testlcd.c:93: void init(void) {
;	-----------------------------------------
;	 function init
;	-----------------------------------------
_init:
;	testlcd.c:94: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	testlcd.c:95: SCON = 0x50;        
	mov	_SCON,#0x50
;	testlcd.c:96: TH1 = (char) -6;            
	mov	_TH1,#0xfa
;	testlcd.c:97: TR1 = 1;            
;	assignBit
	setb	_TR1
;	testlcd.c:98: TI = 1;
;	assignBit
	setb	_TI
;	testlcd.c:99: dino_pos = 0; // Dinosaur starts at row 0
	mov	_dino_pos,#0x00
;	testlcd.c:100: score = 0;      // Reset score
	mov	_score,#0x00
;	testlcd.c:101: pre_score = 0;
	mov	_pre_score,#0x00
;	testlcd.c:102: game_over = 0;  // Game is running
	mov	_game_over,#0x00
;	testlcd.c:103: cactus_pos[0] = 4;
	mov	_cactus_pos,#0x04
;	testlcd.c:104: cactus_pos[1] = 6;
	mov	(_cactus_pos + 0x0001),#0x06
;	testlcd.c:105: cactus_pos[2] = 8;
	mov	(_cactus_pos + 0x0002),#0x08
;	testlcd.c:106: cactus_pos[3] = 12;
	mov	(_cactus_pos + 0x0003),#0x0c
;	testlcd.c:107: cactus_pos[4] = 14;  
	mov	(_cactus_pos + 0x0004),#0x0e
;	testlcd.c:108: k = 0;;
	mov	_k,#0x00
;	testlcd.c:109: flag = 1;
	mov	_flag,#0x01
;	testlcd.c:110: LCD_cursorGoTo(0, 0); // 固定在第 0 列
	mov	dpl,#0x80
	lcall	_LCD_IRWrite
;	testlcd.c:111: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
;	testlcd.c:112: LCD_cursorGoTo(0, cactus_pos[0]);
	mov	a,#0x80
	orl	a,_cactus_pos
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:113: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:114: LCD_cursorGoTo(1, cactus_pos[1]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0001)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:115: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:116: LCD_cursorGoTo(0, cactus_pos[2]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0002)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:117: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:118: LCD_cursorGoTo(1, cactus_pos[3]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0003)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:119: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:120: LCD_cursorGoTo(0, cactus_pos[4]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0004)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:121: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:122: diff = 0;
	mov	_diff,#0x00
;	testlcd.c:123: i = 0;
	mov	_i,#0x00
;	testlcd.c:125: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_cactus'
;------------------------------------------------------------
;	testlcd.c:127: void update_cactus(void) {
;	-----------------------------------------
;	 function update_cactus
;	-----------------------------------------
_update_cactus:
;	testlcd.c:129: if(game_over) {
	mov	a,_game_over
	jz	00102$
;	testlcd.c:130: return;}
	ret
00102$:
;	testlcd.c:131: SemaphoreWait(mutex);
		1$:
	MOV A, _mutex 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _mutex 
;	testlcd.c:133: if (k) {
	mov	a,_k
	jnz	00177$
	ljmp	00129$
00177$:
;	testlcd.c:134: LCD_cursorGoTo(0, cactus_pos[0]);
	mov	a,#0x80
	orl	a,_cactus_pos
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:135: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:136: LCD_cursorGoTo(1, cactus_pos[1]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0001)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:137: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:138: LCD_cursorGoTo(0, cactus_pos[2]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0002)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:139: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:140: LCD_cursorGoTo(1, cactus_pos[3]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0003)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:141: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:142: LCD_cursorGoTo(0, cactus_pos[4]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0004)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:143: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:145: if(game_over) {return;}
	mov	a,_game_over
	jz	00104$
	ret
00104$:
;	testlcd.c:147: if (cactus_pos[0] == 0) cactus_pos[0] = 15;
	mov	a,_cactus_pos
	jnz	00106$
	mov	_cactus_pos,#0x0f
	sjmp	00107$
00106$:
;	testlcd.c:148: else cactus_pos[0] = cactus_pos[0] - 1;
	mov	a,_cactus_pos
	mov	r7,a
	dec	a
	mov	_cactus_pos,a
00107$:
;	testlcd.c:149: if (cactus_pos[1] == 0) cactus_pos[1] = 15;
	mov	a,(_cactus_pos + 0x0001)
	jnz	00109$
	mov	(_cactus_pos + 0x0001),#0x0f
	sjmp	00110$
00109$:
;	testlcd.c:150: else cactus_pos[1] = cactus_pos[1] - 1;
	mov	a,(_cactus_pos + 0x0001)
	mov	r7,a
	dec	a
	mov	(_cactus_pos + 0x0001),a
00110$:
;	testlcd.c:151: if (cactus_pos[2] == 0) cactus_pos[2] = 15;
	mov	a,(_cactus_pos + 0x0002)
	jnz	00112$
	mov	(_cactus_pos + 0x0002),#0x0f
	sjmp	00113$
00112$:
;	testlcd.c:152: else cactus_pos[2] = cactus_pos[2] - 1;
	mov	a,(_cactus_pos + 0x0002)
	mov	r7,a
	dec	a
	mov	(_cactus_pos + 0x0002),a
00113$:
;	testlcd.c:153: if (cactus_pos[3] == 0) cactus_pos[3] = 15;
	mov	a,(_cactus_pos + 0x0003)
	jnz	00115$
	mov	(_cactus_pos + 0x0003),#0x0f
	sjmp	00116$
00115$:
;	testlcd.c:154: else cactus_pos[3] = cactus_pos[3] - 1;
	mov	a,(_cactus_pos + 0x0003)
	mov	r7,a
	dec	a
	mov	(_cactus_pos + 0x0003),a
00116$:
;	testlcd.c:155: if (cactus_pos[4] == 0) cactus_pos[4] = 15;
	mov	a,(_cactus_pos + 0x0004)
	jnz	00118$
	mov	(_cactus_pos + 0x0004),#0x0f
	sjmp	00119$
00118$:
;	testlcd.c:156: else cactus_pos[4] = cactus_pos[4] - 1;
	mov	a,(_cactus_pos + 0x0004)
	mov	r7,a
	dec	a
	mov	(_cactus_pos + 0x0004),a
00119$:
;	testlcd.c:162: if(game_over) { 
	mov	a,_game_over
	jz	00126$
;	testlcd.c:163: return;
	ret
00126$:
;	testlcd.c:166: if(!flag){
	mov	a,_flag
	jnz	00124$
;	testlcd.c:167: if (score == 9){
	mov	a,#0x09
	cjne	a,_score,00121$
;	testlcd.c:168: score = 0;
	mov	_score,#0x00
;	testlcd.c:169: pre_score = pre_score + 1;
	mov	a,_pre_score
	mov	r7,a
	inc	a
	mov	_pre_score,a
	sjmp	00124$
00121$:
;	testlcd.c:172: score = score + 1;
	mov	a,_score
	mov	r7,a
	inc	a
	mov	_score,a
00124$:
;	testlcd.c:175: flag = 1;
	mov	_flag,#0x01
;	testlcd.c:176: LCD_cursorGoTo(0, cactus_pos[0]);
	mov	a,#0x80
	orl	a,_cactus_pos
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:177: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:178: LCD_cursorGoTo(1, cactus_pos[1]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0001)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:179: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:180: LCD_cursorGoTo(0, cactus_pos[2]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0002)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:181: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:182: LCD_cursorGoTo(1, cactus_pos[3]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0003)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:183: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:184: LCD_cursorGoTo(0, cactus_pos[4]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0004)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:185: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	testlcd.c:186: LCD_returnHome();
	mov	dpl,#0x02
	lcall	_LCD_IRWrite
;	testlcd.c:190: k = 0;
	mov	_k,#0x00
00129$:
;	testlcd.c:193: SemaphoreSignal(mutex); 
	INC _mutex 
;	testlcd.c:195: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'move_dinosaur'
;------------------------------------------------------------
;	testlcd.c:198: void move_dinosaur(void) {
;	-----------------------------------------
;	 function move_dinosaur
;	-----------------------------------------
_move_dinosaur:
;	testlcd.c:199: if(game_over) return;
	mov	a,_game_over
	jz	00102$
	ret
00102$:
;	testlcd.c:201: dino_pos = dino_pos;
	mov	_dino_pos,_dino_pos
;	testlcd.c:204: if (dino_pos != 0 && dino_pos != 1) {
	mov	a,_dino_pos
	jz	00107$
	mov	a,#0x01
	cjne	a,_dino_pos,00123$
	ret
00123$:
;	testlcd.c:205: dino_pos = 0; // 回到安全值 0
	mov	_dino_pos,#0x00
00107$:
;	testlcd.c:207: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'end_game'
;------------------------------------------------------------
;	testlcd.c:209: void end_game(void) {
;	-----------------------------------------
;	 function end_game
;	-----------------------------------------
_end_game:
;	testlcd.c:210: i = 0;
	mov	_i,#0x00
;	testlcd.c:211: j = 0;
	mov	_j,#0x00
;	testlcd.c:213: while(1){
00104$:
;	testlcd.c:214: LCD_cursorGoTo(i, j);
	mov	a,_i
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,_j
	add	a,r7
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:215: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:216: j = j + 1;
	mov	a,_j
	mov	r7,a
	inc	a
	mov	_j,a
;	testlcd.c:217: if(j == 16){ j = 0; break;}
	mov	a,#0x10
	cjne	a,_j,00104$
	mov	_j,#0x00
;	testlcd.c:219: i = i + 1;
	mov	a,_i
	mov	r7,a
	inc	a
	mov	_i,a
;	testlcd.c:220: if(i == 2)break;
	mov	a,#0x02
	cjne	a,_i,00104$
;	testlcd.c:222: i = 0;
	mov	_i,#0x00
;	testlcd.c:223: j = 0;
	mov	_j,#0x00
;	testlcd.c:224: LCD_cursorGoTo(0, 0);
	mov	dpl,#0x80
	lcall	_LCD_IRWrite
;	testlcd.c:225: j = 'S';
	mov	_j,#0x53
;	testlcd.c:226: LCD_write_char(0x53);
	mov	dpl,#0x53
	lcall	_LCD_write_char
;	testlcd.c:227: LCD_cursorGoTo(0, 1);
	mov	dpl,#0x81
	lcall	_LCD_IRWrite
;	testlcd.c:228: j = 'c';
	mov	_j,#0x63
;	testlcd.c:229: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	testlcd.c:230: LCD_cursorGoTo(0, 2);
	mov	dpl,#0x82
	lcall	_LCD_IRWrite
;	testlcd.c:231: j = 'o';
	mov	_j,#0x6f
;	testlcd.c:232: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	testlcd.c:233: LCD_cursorGoTo(0, 3);
	mov	dpl,#0x83
	lcall	_LCD_IRWrite
;	testlcd.c:234: j = 'r';
	mov	_j,#0x72
;	testlcd.c:235: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	testlcd.c:236: LCD_cursorGoTo(0, 4);
	mov	dpl,#0x84
	lcall	_LCD_IRWrite
;	testlcd.c:237: j = 'e';
	mov	_j,#0x65
;	testlcd.c:238: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	testlcd.c:239: LCD_cursorGoTo(0, 5);
	mov	dpl,#0x85
	lcall	_LCD_IRWrite
;	testlcd.c:240: j = pre_score % 10 + '0';
	mov	r6,_pre_score
	mov	r7,#0x00
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	mov	dpl,r6
	mov	dph,r7
	lcall	__modsint
	mov	r6,dpl
	mov	a,#0x30
	add	a,r6
	mov	_j,a
;	testlcd.c:241: LCD_write_char(j); // 顯示分數十位數
	mov	dpl,_j
	lcall	_LCD_write_char
;	testlcd.c:242: LCD_cursorGoTo(0, 6);
	mov	dpl,#0x86
	lcall	_LCD_IRWrite
;	testlcd.c:243: j = score % 10 + '0';
	mov	r6,_score
	mov	r7,#0x00
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	mov	dpl,r6
	mov	dph,r7
	lcall	__modsint
	mov	r6,dpl
	mov	a,#0x30
	add	a,r6
	mov	_j,a
;	testlcd.c:244: LCD_write_char(j); // 顯示分數個位數    
	mov	dpl,_j
	lcall	_LCD_write_char
;	testlcd.c:245: LCD_returnHome();
	mov	dpl,#0x02
;	testlcd.c:246: return;
;	testlcd.c:247: }
	ljmp	_LCD_IRWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'game_ctrl'
;------------------------------------------------------------
;	testlcd.c:250: void game_ctrl(void) {
;	-----------------------------------------
;	 function game_ctrl
;	-----------------------------------------
_game_ctrl:
;	testlcd.c:253: while (1) {
00146$:
;	testlcd.c:255: if (LCD_ready()) {
	lcall	_LCD_ready
	mov	a,dpl
	jz	00146$
;	testlcd.c:257: update_cactus();
	lcall	_update_cactus
;	testlcd.c:259: flag = 1;
	mov	_flag,#0x01
;	testlcd.c:260: EA = 0;
;	assignBit
	clr	_EA
;	testlcd.c:261: i = 0;
	mov	_i,#0x00
;	testlcd.c:262: while(1){
00111$:
;	testlcd.c:263: if (i == 5){ break;}
	mov	a,#0x05
	cjne	a,_i,00231$
	sjmp	00112$
00231$:
;	testlcd.c:264: if((cactus_pos[i] == 0)){
	mov	a,_i
	add	a,#_cactus_pos
	mov	r1,a
	mov	a,@r1
;	testlcd.c:265: if((i-dino_pos) % 2 == 0){
	jnz	00109$
	mov	r6,_i
	mov	r7,a
	mov	r4,_dino_pos
	mov	r5,a
	mov	a,r6
	clr	c
	subb	a,r4
	mov	dpl,a
	mov	a,r7
	subb	a,r5
	mov	dph,a
	mov	__modsint_PARM_2,#0x02
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00106$
;	testlcd.c:266: game_over = 1; 
	mov	_game_over,#0x01
;	testlcd.c:267: EA = 1;
;	assignBit
	setb	_EA
;	testlcd.c:268: return;        
	ret
00106$:
;	testlcd.c:269: }else if(flag){
	mov	a,_flag
	jz	00109$
;	testlcd.c:270: flag = 0;
	mov	_flag,#0x00
00109$:
;	testlcd.c:273: i = i + 1;
	mov	a,_i
	mov	r7,a
	inc	a
	mov	_i,a
	sjmp	00111$
00112$:
;	testlcd.c:275: i = 0;
	mov	_i,#0x00
;	testlcd.c:276: j = 20 - 2*diff;
	mov	a,_diff
	add	a,acc
	mov	r7,a
	mov	a,#0x14
	clr	c
	subb	a,r7
	mov	_j,a
;	testlcd.c:277: while(1){
00139$:
;	testlcd.c:278: delay(255); // Control game speed
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:279: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:280: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:281: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:282: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:284: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:285: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:286: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:287: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:288: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:289: move_dinosaur();
	lcall	_move_dinosaur
;	testlcd.c:290: if (AnyKeyPressed()) {
	lcall	_AnyKeyPressed
	mov	a,dpl
	jnz	00235$
	ljmp	00122$
00235$:
;	testlcd.c:291: cur_input = KeyToChar();
	lcall	_KeyToChar
	mov	_cur_input,dpl
;	testlcd.c:292: if (cur_input != prev_input && prev_input == 0x00) {
	mov	a,_prev_input
	cjne	a,_cur_input,00236$
	ljmp	00123$
00236$:
	mov	a,_prev_input
	jz	00237$
	ljmp	00123$
00237$:
;	testlcd.c:293: buffer = cur_input; 
	mov	_buffer,_cur_input
;	testlcd.c:294: if (buffer == '2' ) { // Move up
	mov	a,#0x32
	cjne	a,_buffer,00116$
;	testlcd.c:295: LCD_cursorGoTo(dino_pos, 0); 
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:296: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:297: dino_pos = 0;
	mov	_dino_pos,#0x00
;	testlcd.c:298: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:299: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
	sjmp	00117$
00116$:
;	testlcd.c:300: } else if (buffer == '8') { // Move down
	mov	a,#0x38
	cjne	a,_buffer,00117$
;	testlcd.c:301: LCD_cursorGoTo(dino_pos, 0); 
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:302: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	testlcd.c:303: dino_pos = 1;
	mov	_dino_pos,#0x01
;	testlcd.c:304: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	testlcd.c:305: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
00117$:
;	testlcd.c:307: prev_input = cur_input; 
	mov	_prev_input,_cur_input
	sjmp	00123$
00122$:
;	testlcd.c:311: prev_input = 0x00; 
	mov	_prev_input,#0x00
00123$:
;	testlcd.c:313: iter = 0;
	mov	_iter,#0x00
;	testlcd.c:314: while(1){
00134$:
;	testlcd.c:315: if (iter == 5){ break;}
	mov	a,#0x05
	cjne	a,_iter,00242$
	sjmp	00135$
00242$:
;	testlcd.c:316: if((cactus_pos[iter] == 0)){
	mov	a,_iter
	add	a,#_cactus_pos
	mov	r1,a
	mov	a,@r1
;	testlcd.c:317: if((iter-dino_pos) % 2 == 0){
	jnz	00132$
	mov	r6,_iter
	mov	r7,a
	mov	r4,_dino_pos
	mov	r5,a
	mov	a,r6
	clr	c
	subb	a,r4
	mov	dpl,a
	mov	a,r7
	subb	a,r5
	mov	dph,a
	mov	__modsint_PARM_2,#0x02
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r7
	lcall	__modsint
	mov	a,dpl
	mov	b,dph
	orl	a,b
	jnz	00129$
;	testlcd.c:318: game_over = 1; 
	mov	_game_over,#0x01
;	testlcd.c:319: EA = 1;
;	assignBit
	setb	_EA
;	testlcd.c:320: return;        
	ret
00129$:
;	testlcd.c:321: }else if(flag){
	mov	a,_flag
	jz	00132$
;	testlcd.c:322: flag = 0;
	mov	_flag,#0x00
00132$:
;	testlcd.c:325: iter = iter + 1;
	mov	a,_iter
	mov	r7,a
	inc	a
	mov	_iter,a
	sjmp	00134$
00135$:
;	testlcd.c:327: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:328: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:329: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:330: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:331: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:333: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:334: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:335: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:336: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:337: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	testlcd.c:339: i = i + 1;
	mov	a,_i
	inc	a
	mov	_i,a
;	testlcd.c:340: if ((j-i) == 0) break;
	mov	r6,_j
	mov	r7,#0x00
	mov	r4,_i
	mov	r5,#0x00
	mov	a,r6
	clr	c
	subb	a,r4
	mov	r6,a
	mov	a,r7
	subb	a,r5
	mov	r7,a
	orl	a,r6
	jz	00246$
	ljmp	00139$
00246$:
;	testlcd.c:344: EA = 1;
;	assignBit
	setb	_EA
;	testlcd.c:346: if (game_over == 1) {
	mov	a,#0x01
	cjne	a,_game_over,00247$
	sjmp	00248$
00247$:
	ljmp	00146$
00248$:
;	testlcd.c:347: LCD_clearScreen();
	mov	dpl,#0x01
	lcall	_LCD_IRWrite
;	testlcd.c:348: delay(300);
	mov	dpl,#0x2c
	lcall	_delay
;	testlcd.c:349: ThreadExit();
;	testlcd.c:350: return; // Exit the loop
;	testlcd.c:355: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testlcd.c:357: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testlcd.c:358: LCD_Init();
	lcall	_LCD_Init
;	testlcd.c:359: Init_Keypad();
	lcall	_Init_Keypad
;	testlcd.c:360: SemaphoreCreate(mutex,1);
	mov	_mutex,#0x01
;	testlcd.c:361: SemaphoreCreate(full,0);
	mov	_full,#0x00
;	testlcd.c:363: init();
	lcall	_init
;	testlcd.c:365: while(1){
00124$:
;	testlcd.c:366: if (AnyButtonPressed()) {
	lcall	_AnyButtonPressed
	mov	a,dpl
	jz	00119$
;	testlcd.c:367: cur_input = ButtonToChar();
	lcall	_ButtonToChar
	mov	_cur_input,dpl
;	testlcd.c:368: if (cur_input != prev_input && prev_input == 0x00 && diff == 0){
	mov	a,_prev_input
	cjne	a,_cur_input,00200$
	sjmp	00120$
00200$:
	mov	a,_prev_input
	jnz	00120$
	mov	a,_diff
	jnz	00120$
;	testlcd.c:369: i = cur_input;
	mov	_i,_cur_input
	sjmp	00120$
00119$:
;	testlcd.c:372: else if (AnyKeyPressed()) {
	lcall	_AnyKeyPressed
	mov	a,dpl
	jz	00116$
;	testlcd.c:373: cur_input = KeyToChar();
	lcall	_KeyToChar
	mov	_cur_input,dpl
;	testlcd.c:374: if (cur_input != prev_input && prev_input == 0x00) {
	mov	a,_prev_input
	cjne	a,_cur_input,00204$
	sjmp	00120$
00204$:
	mov	a,_prev_input
	jnz	00120$
;	testlcd.c:375: if(!diff){
	mov	a,_diff
	jnz	00111$
;	testlcd.c:376: if ('1' <= i && i <= '9' && cur_input == '#') {
	mov	a,#0x100 - 0x31
	add	a,_i
	jnc	00106$
	mov	a,_i
	add	a,#0xff - 0x39
	jc	00106$
	mov	a,#0x23
	cjne	a,_cur_input,00106$
;	testlcd.c:377: diff = i - '0';
	mov	a,_i
	mov	r7,a
	add	a,#0xd0
	mov	_diff,a
	sjmp	00111$
00106$:
;	testlcd.c:379: i = cur_input;
	mov	_i,_cur_input
00111$:
;	testlcd.c:382: prev_input = cur_input; 
	mov	_prev_input,_cur_input
	sjmp	00120$
00116$:
;	testlcd.c:386: prev_input = 0x00; 
	mov	_prev_input,#0x00
00120$:
;	testlcd.c:388: if(diff) break;
	mov	a,_diff
	jz	00124$
;	testlcd.c:390: ThreadCreate(keypad_ctrl);
	mov	dptr,#_keypad_ctrl
	lcall	_ThreadCreate
;	testlcd.c:392: if (!game_over)
	mov	a,_game_over
	jnz	00127$
;	testlcd.c:393: ThreadCreate(render_task);
	mov	dptr,#_render_task
	lcall	_ThreadCreate
00127$:
;	testlcd.c:395: if (!game_over) 
	mov	a,_game_over
	jnz	00129$
;	testlcd.c:396: game_ctrl();
	lcall	_game_ctrl
00129$:
;	testlcd.c:399: end_game(); 
	lcall	_end_game
;	testlcd.c:400: game_over = 0;  
	mov	_game_over,#0x00
;	testlcd.c:401: score = 0;
	mov	_score,#0x00
;	testlcd.c:402: pre_score = 0;
	mov	_pre_score,#0x00
;	testlcd.c:403: while(1);
00131$:
;	testlcd.c:404: }
	sjmp	00131$
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testlcd.c:406: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testlcd.c:409: __endasm;
	ljmp	_Bootstrap
;	testlcd.c:410: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testlcd.c:412: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testlcd.c:413: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testlcd.c:414: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testlcd.c:416: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testlcd.c:419: __endasm;
	ljmp	_myTimer0Handler
;	testlcd.c:420: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
