;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module dino
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
;	dino.c:27: void keypad_ctrl(void) {
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
;	dino.c:28: while (1) {
00121$:
;	dino.c:29: if (game_over) {ThreadExit(); return;}
	mov	a,_game_over
	jz	00102$
	ljmp	_ThreadExit
00102$:
;	dino.c:30: if (AnyButtonPressed()) {
	lcall	_AnyButtonPressed
	mov	a,dpl
	jz	00118$
;	dino.c:31: cur_input = ButtonToChar();
	lcall	_ButtonToChar
	mov	_cur_input,dpl
;	dino.c:32: if (cur_input != prev_input && prev_input == 0x00) {
	mov	a,_prev_input
	cjne	a,_cur_input,00167$
	sjmp	00121$
00167$:
	mov	a,_prev_input
	jnz	00121$
;	dino.c:33: EA = 0; 
;	assignBit
	clr	_EA
;	dino.c:34: buffer = cur_input; 
	mov	_buffer,_cur_input
;	dino.c:35: prev_input = cur_input; 
	mov	_prev_input,_cur_input
;	dino.c:36: EA = 1;
;	assignBit
	setb	_EA
	sjmp	00121$
00118$:
;	dino.c:39: else if (AnyKeyPressed()) {
	lcall	_AnyKeyPressed
	mov	a,dpl
	jnz	00169$
	ljmp	00115$
00169$:
;	dino.c:40: cur_input = KeyToChar();
	lcall	_KeyToChar
	mov	_cur_input,dpl
;	dino.c:41: if (cur_input != prev_input && prev_input == 0x00) {
	mov	a,_prev_input
	cjne	a,_cur_input,00170$
	sjmp	00121$
00170$:
	mov	a,_prev_input
	jnz	00121$
;	dino.c:42: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:43: buffer = cur_input; 
	mov	_buffer,_cur_input
;	dino.c:44: if (buffer == '2' ) { // Move up
	mov	a,#0x32
	cjne	a,_buffer,00109$
;	dino.c:45: LCD_cursorGoTo(dino_pos, 0); 
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:46: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:47: dino_pos = 0;
	mov	_dino_pos,#0x00
;	dino.c:48: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:49: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
	sjmp	00110$
00109$:
;	dino.c:50: } else if (buffer == '8') { // Move down
	mov	a,#0x38
	cjne	a,_buffer,00110$
;	dino.c:51: LCD_cursorGoTo(dino_pos, 0); 
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:52: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:53: dino_pos = 1;
	mov	_dino_pos,#0x01
;	dino.c:54: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:55: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
00110$:
;	dino.c:57: prev_input = cur_input; 
	mov	_prev_input,_cur_input
;	dino.c:58: EA = 1;
;	assignBit
	setb	_EA
	ljmp	00121$
00115$:
;	dino.c:62: prev_input = 0x00; 
	mov	_prev_input,#0x00
;	dino.c:65: }
	ljmp	00121$
;------------------------------------------------------------
;Allocation info for local variables in function 'render_task'
;------------------------------------------------------------
;	dino.c:67: void render_task(void) {
;	-----------------------------------------
;	 function render_task
;	-----------------------------------------
_render_task:
;	dino.c:69: while (1) {
00131$:
;	dino.c:70: if (game_over) {ThreadExit(); return;}
	mov	a,_game_over
	jz	00102$
	ljmp	_ThreadExit
00102$:
;	dino.c:72: SemaphoreWait(mutex);
		0$:
	MOV A, _mutex 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _mutex 
;	dino.c:77: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:78: if(!k){;
	mov	a,_k
	jz	00184$
	ljmp	00129$
00184$:
;	dino.c:79: k = 1;
	mov	_k,#0x01
;	dino.c:80: LCD_cursorGoTo(0, cactus_pos[0]);
	mov	a,#0x80
	orl	a,_cactus_pos
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:81: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:82: LCD_cursorGoTo(1, cactus_pos[1]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0001)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:83: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:84: LCD_cursorGoTo(0, cactus_pos[2]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0002)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:85: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:86: LCD_cursorGoTo(1, cactus_pos[3]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0003)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:87: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:88: LCD_cursorGoTo(0, cactus_pos[4]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0004)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:89: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:91: if(game_over) {return;}
	mov	a,_game_over
	jz	00104$
	ret
00104$:
;	dino.c:93: if (cactus_pos[0] == 0) cactus_pos[0] = 15;
	mov	a,_cactus_pos
	jnz	00106$
	mov	_cactus_pos,#0x0f
	sjmp	00107$
00106$:
;	dino.c:94: else cactus_pos[0] = cactus_pos[0] - 1;
	mov	a,_cactus_pos
	mov	r7,a
	dec	a
	mov	_cactus_pos,a
00107$:
;	dino.c:95: if (cactus_pos[1] == 0) cactus_pos[1] = 15;
	mov	a,(_cactus_pos + 0x0001)
	jnz	00109$
	mov	(_cactus_pos + 0x0001),#0x0f
	sjmp	00110$
00109$:
;	dino.c:96: else cactus_pos[1] = cactus_pos[1] - 1;
	mov	a,(_cactus_pos + 0x0001)
	mov	r7,a
	dec	a
	mov	(_cactus_pos + 0x0001),a
00110$:
;	dino.c:97: if (cactus_pos[2] == 0) cactus_pos[2] = 15;
	mov	a,(_cactus_pos + 0x0002)
	jnz	00112$
	mov	(_cactus_pos + 0x0002),#0x0f
	sjmp	00113$
00112$:
;	dino.c:98: else cactus_pos[2] = cactus_pos[2] - 1;
	mov	a,(_cactus_pos + 0x0002)
	mov	r7,a
	dec	a
	mov	(_cactus_pos + 0x0002),a
00113$:
;	dino.c:99: if (cactus_pos[3] == 0) cactus_pos[3] = 15;
	mov	a,(_cactus_pos + 0x0003)
	jnz	00115$
	mov	(_cactus_pos + 0x0003),#0x0f
	sjmp	00116$
00115$:
;	dino.c:100: else cactus_pos[3] = cactus_pos[3] - 1;
	mov	a,(_cactus_pos + 0x0003)
	mov	r7,a
	dec	a
	mov	(_cactus_pos + 0x0003),a
00116$:
;	dino.c:101: if (cactus_pos[4] == 0) cactus_pos[4] = 15;
	mov	a,(_cactus_pos + 0x0004)
	jnz	00118$
	mov	(_cactus_pos + 0x0004),#0x0f
	sjmp	00119$
00118$:
;	dino.c:102: else cactus_pos[4] = cactus_pos[4] - 1;
	mov	a,(_cactus_pos + 0x0004)
	mov	r7,a
	dec	a
	mov	(_cactus_pos + 0x0004),a
00119$:
;	dino.c:108: if(game_over) { 
	mov	a,_game_over
	jz	00126$
;	dino.c:109: return;
	ret
00126$:
;	dino.c:112: if(!flag){
	mov	a,_flag
	jnz	00124$
;	dino.c:113: if (score == 9){
	mov	a,#0x09
	cjne	a,_score,00121$
;	dino.c:114: score = 0;
	mov	_score,#0x00
;	dino.c:115: pre_score = pre_score + 1;
	mov	a,_pre_score
	mov	r7,a
	inc	a
	mov	_pre_score,a
	sjmp	00124$
00121$:
;	dino.c:118: score = score + 1;
	mov	a,_score
	mov	r7,a
	inc	a
	mov	_score,a
00124$:
;	dino.c:121: flag = 1;
	mov	_flag,#0x01
;	dino.c:122: LCD_cursorGoTo(0, cactus_pos[0]);
	mov	a,#0x80
	orl	a,_cactus_pos
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:123: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:124: LCD_cursorGoTo(1, cactus_pos[1]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0001)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:125: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:126: LCD_cursorGoTo(0, cactus_pos[2]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0002)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:127: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:128: LCD_cursorGoTo(1, cactus_pos[3]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0003)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:129: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:130: LCD_cursorGoTo(0, cactus_pos[4]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0004)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:131: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:132: LCD_returnHome();
	mov	dpl,#0x02
	lcall	_LCD_IRWrite
00129$:
;	dino.c:137: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:139: SemaphoreSignal(mutex);
	INC _mutex 
;	dino.c:145: ThreadYield(); 
	lcall	_ThreadYield
;	dino.c:147: }
	ljmp	00131$
;------------------------------------------------------------
;Allocation info for local variables in function 'init'
;------------------------------------------------------------
;	dino.c:149: void init(void) {
;	-----------------------------------------
;	 function init
;	-----------------------------------------
_init:
;	dino.c:150: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	dino.c:151: SCON = 0x50;        
	mov	_SCON,#0x50
;	dino.c:152: TH1 = (char) -6;            
	mov	_TH1,#0xfa
;	dino.c:153: TR1 = 1;            
;	assignBit
	setb	_TR1
;	dino.c:154: TI = 1;
;	assignBit
	setb	_TI
;	dino.c:155: dino_pos = 0; // Dinosaur starts at row 0
	mov	_dino_pos,#0x00
;	dino.c:156: score = 0;      // Reset score
	mov	_score,#0x00
;	dino.c:157: pre_score = 0;
	mov	_pre_score,#0x00
;	dino.c:158: game_over = 0;  // Game is running
	mov	_game_over,#0x00
;	dino.c:159: cactus_pos[0] = 4;
	mov	_cactus_pos,#0x04
;	dino.c:160: cactus_pos[1] = 6;
	mov	(_cactus_pos + 0x0001),#0x06
;	dino.c:161: cactus_pos[2] = 8;
	mov	(_cactus_pos + 0x0002),#0x08
;	dino.c:162: cactus_pos[3] = 12;
	mov	(_cactus_pos + 0x0003),#0x0c
;	dino.c:163: cactus_pos[4] = 14;  
	mov	(_cactus_pos + 0x0004),#0x0e
;	dino.c:164: k = 0;;
	mov	_k,#0x00
;	dino.c:165: flag = 1;
	mov	_flag,#0x01
;	dino.c:166: LCD_cursorGoTo(0, 0); // 固定在第 0 列
	mov	dpl,#0x80
	lcall	_LCD_IRWrite
;	dino.c:167: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
;	dino.c:168: LCD_cursorGoTo(0, cactus_pos[0]);
	mov	a,#0x80
	orl	a,_cactus_pos
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:169: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:170: LCD_cursorGoTo(1, cactus_pos[1]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0001)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:171: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:172: LCD_cursorGoTo(0, cactus_pos[2]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0002)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:173: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:174: LCD_cursorGoTo(1, cactus_pos[3]);
	mov	a,#0x40
	add	a,(_cactus_pos + 0x0003)
	orl	a,#0x80
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:175: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:176: LCD_cursorGoTo(0, cactus_pos[4]);
	mov	a,#0x80
	orl	a,(_cactus_pos + 0x0004)
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:177: LCD_write_char(0x01);
	mov	dpl,#0x01
	lcall	_LCD_write_char
;	dino.c:178: diff = 0;
	mov	_diff,#0x00
;	dino.c:179: i = 0;
	mov	_i,#0x00
;	dino.c:181: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'update_cactus'
;------------------------------------------------------------
;	dino.c:183: void update_cactus(void) {
;	-----------------------------------------
;	 function update_cactus
;	-----------------------------------------
_update_cactus:
;	dino.c:185: if(game_over) {
	mov	a,_game_over
	jz	00102$
;	dino.c:186: return;}
	ret
00102$:
;	dino.c:187: SemaphoreWait(mutex);
		1$:
	MOV A, _mutex 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _mutex 
;	dino.c:189: if (k) {
	mov	a,_k
	jz	00104$
;	dino.c:190: k = 0;
	mov	_k,#0x00
00104$:
;	dino.c:193: SemaphoreSignal(mutex); 
	INC _mutex 
;	dino.c:195: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'move_dinosaur'
;------------------------------------------------------------
;	dino.c:198: void move_dinosaur(void) {
;	-----------------------------------------
;	 function move_dinosaur
;	-----------------------------------------
_move_dinosaur:
;	dino.c:199: if(game_over) return;
	mov	a,_game_over
	jz	00102$
	ret
00102$:
;	dino.c:201: dino_pos = dino_pos;
	mov	_dino_pos,_dino_pos
;	dino.c:204: if (dino_pos != 0 && dino_pos != 1) {
	mov	a,_dino_pos
	jz	00107$
	mov	a,#0x01
	cjne	a,_dino_pos,00123$
	ret
00123$:
;	dino.c:205: dino_pos = 0; // 回到安全值 0
	mov	_dino_pos,#0x00
00107$:
;	dino.c:207: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'end_game'
;------------------------------------------------------------
;	dino.c:209: void end_game(void) {
;	-----------------------------------------
;	 function end_game
;	-----------------------------------------
_end_game:
;	dino.c:210: i = 0;
	mov	_i,#0x00
;	dino.c:211: j = 0;
	mov	_j,#0x00
;	dino.c:213: while(1){
00104$:
;	dino.c:214: LCD_cursorGoTo(i, j);
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
;	dino.c:215: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:216: j = j + 1;
	mov	a,_j
	mov	r7,a
	inc	a
	mov	_j,a
;	dino.c:217: if(j == 16){ j = 0; break;}
	mov	a,#0x10
	cjne	a,_j,00104$
	mov	_j,#0x00
;	dino.c:219: i = i + 1;
	mov	a,_i
	mov	r7,a
	inc	a
	mov	_i,a
;	dino.c:220: if(i == 2)break;
	mov	a,#0x02
	cjne	a,_i,00104$
;	dino.c:222: i = 0;
	mov	_i,#0x00
;	dino.c:223: j = 0;
	mov	_j,#0x00
;	dino.c:224: LCD_cursorGoTo(0, 0);
	mov	dpl,#0x80
	lcall	_LCD_IRWrite
;	dino.c:225: j = 'G';
	mov	_j,#0x47
;	dino.c:226: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:227: LCD_cursorGoTo(0, 1);
	mov	dpl,#0x81
	lcall	_LCD_IRWrite
;	dino.c:228: j = 'a';
	mov	_j,#0x61
;	dino.c:229: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:230: LCD_cursorGoTo(0, 2);
	mov	dpl,#0x82
	lcall	_LCD_IRWrite
;	dino.c:231: j = 'm';
	mov	_j,#0x6d
;	dino.c:232: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:233: LCD_cursorGoTo(0, 3);
	mov	dpl,#0x83
	lcall	_LCD_IRWrite
;	dino.c:234: j = 'e';
	mov	_j,#0x65
;	dino.c:235: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:236: LCD_cursorGoTo(0, 4);
	mov	dpl,#0x84
	lcall	_LCD_IRWrite
;	dino.c:237: j = ' ';
	mov	_j,#0x20
;	dino.c:238: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:239: LCD_cursorGoTo(0, 5);
	mov	dpl,#0x85
	lcall	_LCD_IRWrite
;	dino.c:240: j = 'o';
	mov	_j,#0x6f
;	dino.c:241: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:242: LCD_cursorGoTo(0, 6);
	mov	dpl,#0x86
	lcall	_LCD_IRWrite
;	dino.c:243: j = 'v';
	mov	_j,#0x76
;	dino.c:244: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:245: LCD_cursorGoTo(0, 7);
	mov	dpl,#0x87
	lcall	_LCD_IRWrite
;	dino.c:246: j = 'e';
	mov	_j,#0x65
;	dino.c:247: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:248: LCD_cursorGoTo(0, 8);
	mov	dpl,#0x88
	lcall	_LCD_IRWrite
;	dino.c:249: j = 'r';
	mov	_j,#0x72
;	dino.c:250: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:251: LCD_cursorGoTo(1, 0);
	mov	dpl,#0xc0
	lcall	_LCD_IRWrite
;	dino.c:252: j = 'S';
	mov	_j,#0x53
;	dino.c:253: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:254: LCD_cursorGoTo(1, 1);
	mov	dpl,#0xc1
	lcall	_LCD_IRWrite
;	dino.c:255: j = 'c';
	mov	_j,#0x63
;	dino.c:256: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:257: LCD_cursorGoTo(1, 2);
	mov	dpl,#0xc2
	lcall	_LCD_IRWrite
;	dino.c:258: j = 'o';
	mov	_j,#0x6f
;	dino.c:259: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:260: LCD_cursorGoTo(1, 3);
	mov	dpl,#0xc3
	lcall	_LCD_IRWrite
;	dino.c:261: j = 'r';
	mov	_j,#0x72
;	dino.c:262: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:263: LCD_cursorGoTo(1, 4);
	mov	dpl,#0xc4
	lcall	_LCD_IRWrite
;	dino.c:264: j = 'e';
	mov	_j,#0x65
;	dino.c:265: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:266: LCD_cursorGoTo(1, 5);
	mov	dpl,#0xc5
	lcall	_LCD_IRWrite
;	dino.c:267: j = ' ';
	mov	_j,#0x20
;	dino.c:268: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:269: LCD_cursorGoTo(1, 6);
	mov	dpl,#0xc6
	lcall	_LCD_IRWrite
;	dino.c:270: j = ':';
	mov	_j,#0x3a
;	dino.c:271: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:272: LCD_cursorGoTo(1, 7);
	mov	dpl,#0xc7
	lcall	_LCD_IRWrite
;	dino.c:273: j = ' ';
	mov	_j,#0x20
;	dino.c:274: LCD_write_char(j);
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:275: LCD_cursorGoTo(1, 8);
	mov	dpl,#0xc8
	lcall	_LCD_IRWrite
;	dino.c:276: j = pre_score % 10 + '0';
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
;	dino.c:277: LCD_write_char(j); // 
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:278: LCD_cursorGoTo(1, 9);
	mov	dpl,#0xc9
	lcall	_LCD_IRWrite
;	dino.c:279: j = score % 10 + '0';
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
;	dino.c:280: LCD_write_char(j); //
	mov	dpl,_j
	lcall	_LCD_write_char
;	dino.c:281: delay(40);     
	mov	dpl,#0x28
	lcall	_delay
;	dino.c:282: LCD_returnHome();
	mov	dpl,#0x02
;	dino.c:283: return;
;	dino.c:284: }
	ljmp	_LCD_IRWrite
;------------------------------------------------------------
;Allocation info for local variables in function 'game_ctrl'
;------------------------------------------------------------
;	dino.c:287: void game_ctrl(void) {
;	-----------------------------------------
;	 function game_ctrl
;	-----------------------------------------
_game_ctrl:
;	dino.c:290: while (1) {
00146$:
;	dino.c:292: if (LCD_ready()) {
	lcall	_LCD_ready
	mov	a,dpl
	jz	00146$
;	dino.c:294: update_cactus();
	lcall	_update_cactus
;	dino.c:296: flag = 1;
	mov	_flag,#0x01
;	dino.c:297: EA = 0;
;	assignBit
	clr	_EA
;	dino.c:298: i = 0;
	mov	_i,#0x00
;	dino.c:299: while(1){
00111$:
;	dino.c:300: if (i == 5){ break;}
	mov	a,#0x05
	cjne	a,_i,00231$
	sjmp	00112$
00231$:
;	dino.c:301: if((cactus_pos[i] == 0)){
	mov	a,_i
	add	a,#_cactus_pos
	mov	r1,a
	mov	a,@r1
;	dino.c:302: if((i-dino_pos) % 2 == 0){
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
;	dino.c:303: game_over = 1; 
	mov	_game_over,#0x01
;	dino.c:304: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:305: return;        
	ret
00106$:
;	dino.c:306: }else if(flag){
	mov	a,_flag
	jz	00109$
;	dino.c:307: flag = 0;
	mov	_flag,#0x00
00109$:
;	dino.c:310: i = i + 1;
	mov	a,_i
	mov	r7,a
	inc	a
	mov	_i,a
	sjmp	00111$
00112$:
;	dino.c:312: i = 0;
	mov	_i,#0x00
;	dino.c:313: j = 20 - 2*diff;
	mov	a,_diff
	add	a,acc
	mov	r7,a
	mov	a,#0x14
	clr	c
	subb	a,r7
	mov	_j,a
;	dino.c:314: while(1){
00139$:
;	dino.c:315: delay(255); // Control game speed
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:316: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:317: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:318: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:319: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:321: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:322: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:323: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:324: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:325: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:326: move_dinosaur();
	lcall	_move_dinosaur
;	dino.c:327: if (AnyKeyPressed()) {
	lcall	_AnyKeyPressed
	mov	a,dpl
	jnz	00235$
	ljmp	00122$
00235$:
;	dino.c:328: cur_input = KeyToChar();
	lcall	_KeyToChar
	mov	_cur_input,dpl
;	dino.c:329: if (cur_input != prev_input && prev_input == 0x00) {
	mov	a,_prev_input
	cjne	a,_cur_input,00236$
	ljmp	00123$
00236$:
	mov	a,_prev_input
	jz	00237$
	ljmp	00123$
00237$:
;	dino.c:330: buffer = cur_input; 
	mov	_buffer,_cur_input
;	dino.c:331: if (buffer == '2' ) { // Move up
	mov	a,#0x32
	cjne	a,_buffer,00116$
;	dino.c:332: LCD_cursorGoTo(dino_pos, 0); 
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:333: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:334: dino_pos = 0;
	mov	_dino_pos,#0x00
;	dino.c:335: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:336: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
	sjmp	00117$
00116$:
;	dino.c:337: } else if (buffer == '8') { // Move down
	mov	a,#0x38
	cjne	a,_buffer,00117$
;	dino.c:338: LCD_cursorGoTo(dino_pos, 0); 
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:339: LCD_write_char(' ');
	mov	dpl,#0x20
	lcall	_LCD_write_char
;	dino.c:340: dino_pos = 1;
	mov	_dino_pos,#0x01
;	dino.c:341: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
	mov	a,_dino_pos
	rr	a
	rr	a
	anl	a,#0xc0
	mov	r7,a
	mov	a,#0x80
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	dino.c:342: LCD_write_char(0x00);
	mov	dpl,#0x00
	lcall	_LCD_write_char
00117$:
;	dino.c:344: prev_input = cur_input; 
	mov	_prev_input,_cur_input
	sjmp	00123$
00122$:
;	dino.c:348: prev_input = 0x00; 
	mov	_prev_input,#0x00
00123$:
;	dino.c:350: iter = 0;
	mov	_iter,#0x00
;	dino.c:351: while(1){
00134$:
;	dino.c:352: if (iter == 5){ break;}
	mov	a,#0x05
	cjne	a,_iter,00242$
	sjmp	00135$
00242$:
;	dino.c:353: if((cactus_pos[iter] == 0)){
	mov	a,_iter
	add	a,#_cactus_pos
	mov	r1,a
	mov	a,@r1
;	dino.c:354: if((iter-dino_pos) % 2 == 0){
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
;	dino.c:355: game_over = 1; 
	mov	_game_over,#0x01
;	dino.c:356: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:357: return;        
	ret
00129$:
;	dino.c:358: }else if(flag){
	mov	a,_flag
	jz	00132$
;	dino.c:359: flag = 0;
	mov	_flag,#0x00
00132$:
;	dino.c:362: iter = iter + 1;
	mov	a,_iter
	mov	r7,a
	inc	a
	mov	_iter,a
	sjmp	00134$
00135$:
;	dino.c:364: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:365: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:366: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:367: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:368: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:370: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:371: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:372: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:373: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:374: delay(255);
	mov	dpl,#0xff
	lcall	_delay
;	dino.c:376: i = i + 1;
	mov	a,_i
	inc	a
	mov	_i,a
;	dino.c:377: if ((j-i) == 0) break;
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
;	dino.c:381: EA = 1;
;	assignBit
	setb	_EA
;	dino.c:383: if (game_over == 1) {
	mov	a,#0x01
	cjne	a,_game_over,00247$
	sjmp	00248$
00247$:
	ljmp	00146$
00248$:
;	dino.c:384: LCD_clearScreen();
	mov	dpl,#0x01
	lcall	_LCD_IRWrite
;	dino.c:385: delay(300);
	mov	dpl,#0x2c
	lcall	_delay
;	dino.c:386: ThreadExit();
;	dino.c:387: return; // Exit the loop
;	dino.c:392: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	dino.c:394: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	dino.c:395: LCD_Init();
	lcall	_LCD_Init
;	dino.c:396: Init_Keypad();
	lcall	_Init_Keypad
;	dino.c:397: SemaphoreCreate(mutex,1);
	mov	_mutex,#0x01
;	dino.c:398: SemaphoreCreate(full,0);
	mov	_full,#0x00
;	dino.c:400: init();
	lcall	_init
;	dino.c:402: while(1){
00124$:
;	dino.c:403: if (AnyButtonPressed()) {
	lcall	_AnyButtonPressed
	mov	a,dpl
	jz	00119$
;	dino.c:404: cur_input = ButtonToChar();
	lcall	_ButtonToChar
	mov	_cur_input,dpl
;	dino.c:405: if (cur_input != prev_input && prev_input == 0x00 && diff == 0){
	mov	a,_prev_input
	cjne	a,_cur_input,00200$
	sjmp	00120$
00200$:
	mov	a,_prev_input
	jnz	00120$
	mov	a,_diff
	jnz	00120$
;	dino.c:406: i = cur_input;
	mov	_i,_cur_input
	sjmp	00120$
00119$:
;	dino.c:409: else if (AnyKeyPressed()) {
	lcall	_AnyKeyPressed
	mov	a,dpl
	jz	00116$
;	dino.c:410: cur_input = KeyToChar();
	lcall	_KeyToChar
	mov	_cur_input,dpl
;	dino.c:411: if (cur_input != prev_input && prev_input == 0x00) {
	mov	a,_prev_input
	cjne	a,_cur_input,00204$
	sjmp	00120$
00204$:
	mov	a,_prev_input
	jnz	00120$
;	dino.c:412: if(!diff){
	mov	a,_diff
	jnz	00111$
;	dino.c:413: if ('1' <= i && i <= '9' && cur_input == '#') {
	mov	a,#0x100 - 0x31
	add	a,_i
	jnc	00106$
	mov	a,_i
	add	a,#0xff - 0x39
	jc	00106$
	mov	a,#0x23
	cjne	a,_cur_input,00106$
;	dino.c:414: diff = i - '0';
	mov	a,_i
	mov	r7,a
	add	a,#0xd0
	mov	_diff,a
	sjmp	00111$
00106$:
;	dino.c:416: i = cur_input;
	mov	_i,_cur_input
00111$:
;	dino.c:419: prev_input = cur_input; 
	mov	_prev_input,_cur_input
	sjmp	00120$
00116$:
;	dino.c:423: prev_input = 0x00; 
	mov	_prev_input,#0x00
00120$:
;	dino.c:425: if(diff) break;
	mov	a,_diff
	jz	00124$
;	dino.c:427: ThreadCreate(keypad_ctrl);
	mov	dptr,#_keypad_ctrl
	lcall	_ThreadCreate
;	dino.c:429: if (!game_over)
	mov	a,_game_over
	jnz	00127$
;	dino.c:430: ThreadCreate(render_task);
	mov	dptr,#_render_task
	lcall	_ThreadCreate
00127$:
;	dino.c:432: if (!game_over) 
	mov	a,_game_over
	jnz	00129$
;	dino.c:433: game_ctrl();
	lcall	_game_ctrl
00129$:
;	dino.c:436: end_game(); 
	lcall	_end_game
;	dino.c:437: game_over = 0;  
	mov	_game_over,#0x00
;	dino.c:438: score = 0;
	mov	_score,#0x00
;	dino.c:439: pre_score = 0;
	mov	_pre_score,#0x00
;	dino.c:440: while(1);
00131$:
;	dino.c:441: }
	sjmp	00131$
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	dino.c:443: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	dino.c:446: __endasm;
	ljmp	_Bootstrap
;	dino.c:447: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	dino.c:449: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	dino.c:450: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	dino.c:451: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	dino.c:453: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	dino.c:456: __endasm;
	ljmp	_myTimer0Handler
;	dino.c:457: }
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
