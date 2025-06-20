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
	.globl _Consumer
	.globl _Producer2
	.globl _Producer1
	.globl _initialize
	.globl _LCD_ready
	.globl _LCD_write_char
	.globl _LCD_Init
	.globl _ButtonToChar
	.globl _AnyButtonPressed
	.globl _AnyKeyPressed
	.globl _KeyToChar
	.globl _Init_Keypad
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
	.globl _last_key
	.globl _cur_key
	.globl _last_but
	.globl _cur_but
	.globl _empty
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
_mutex	=	0x0020
_full	=	0x0021
_empty	=	0x0022
_cur_but	=	0x002a
_last_but	=	0x002b
_cur_key	=	0x002c
_last_key	=	0x002d
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
;Allocation info for local variables in function 'initialize'
;------------------------------------------------------------
;	testlcd.c:19: void initialize(){
;	-----------------------------------------
;	 function initialize
;	-----------------------------------------
_initialize:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	testlcd.c:20: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	testlcd.c:21: SCON = 0x50;        
	mov	_SCON,#0x50
;	testlcd.c:22: TH1 = (char) -6;            
	mov	_TH1,#0xfa
;	testlcd.c:23: TR1 = 1;            
;	assignBit
	setb	_TR1
;	testlcd.c:24: TI = 1;             
;	assignBit
	setb	_TI
;	testlcd.c:25: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer1'
;------------------------------------------------------------
;	testlcd.c:28: void Producer1(void) {
;	-----------------------------------------
;	 function Producer1
;	-----------------------------------------
_Producer1:
;	testlcd.c:29: while(1) {
00107$:
;	testlcd.c:30: if(AnyButtonPressed()){
	lcall	_AnyButtonPressed
	mov	a,dpl
	jz	00104$
;	testlcd.c:31: cur_but = ButtonToChar();
	lcall	_ButtonToChar
	mov	_cur_but,dpl
;	testlcd.c:32: if(last_but != cur_but){
	mov	a,_cur_but
	cjne	a,_last_but,00124$
	sjmp	00107$
00124$:
;	testlcd.c:33: SemaphoreWait(empty);
		0$:
	MOV A, _empty 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _empty 
;	testlcd.c:34: SemaphoreWait(mutex);
		1$:
	MOV A, _mutex 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _mutex 
;	testlcd.c:35: EA = 0;
;	assignBit
	clr	_EA
;	testlcd.c:36: buffer = cur_but;
	mov	_buffer,_cur_but
;	testlcd.c:37: last_but = cur_but;
	mov	_last_but,_cur_but
;	testlcd.c:38: EA = 1;
;	assignBit
	setb	_EA
;	testlcd.c:39: SemaphoreSignal(mutex);
	INC _mutex 
;	testlcd.c:40: SemaphoreSignal(full);
	INC _full 
	sjmp	00107$
00104$:
;	testlcd.c:44: last_but = 0x00;
	mov	_last_but,#0x00
;	testlcd.c:47: }
	sjmp	00107$
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer2'
;------------------------------------------------------------
;	testlcd.c:49: void Producer2(void) {
;	-----------------------------------------
;	 function Producer2
;	-----------------------------------------
_Producer2:
;	testlcd.c:50: while(1) {
00107$:
;	testlcd.c:51: if(AnyKeyPressed()){
	lcall	_AnyKeyPressed
	mov	a,dpl
	jz	00104$
;	testlcd.c:52: cur_key = KeyToChar();
	lcall	_KeyToChar
	mov	_cur_key,dpl
;	testlcd.c:53: if(last_key != cur_key){
	mov	a,_cur_key
	cjne	a,_last_key,00124$
	sjmp	00107$
00124$:
;	testlcd.c:54: SemaphoreWait(empty);
		2$:
	MOV A, _empty 
	JZ 2$ 
	JB ACC.7, 2$ 
	DEC _empty 
;	testlcd.c:55: SemaphoreWait(mutex);
		3$:
	MOV A, _mutex 
	JZ 3$ 
	JB ACC.7, 3$ 
	DEC _mutex 
;	testlcd.c:56: EA = 0;
;	assignBit
	clr	_EA
;	testlcd.c:57: buffer = cur_key;
	mov	_buffer,_cur_key
;	testlcd.c:58: last_key = cur_key;
	mov	_last_key,_cur_key
;	testlcd.c:59: EA = 1;
;	assignBit
	setb	_EA
;	testlcd.c:60: SemaphoreSignal(mutex);
	INC _mutex 
;	testlcd.c:61: SemaphoreSignal(full);
	INC _full 
	sjmp	00107$
00104$:
;	testlcd.c:65: last_key = 0x00;
	mov	_last_key,#0x00
;	testlcd.c:68: }
	sjmp	00107$
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;	testlcd.c:70: void Consumer(void) {
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	testlcd.c:71: initialize();
	lcall	_initialize
;	testlcd.c:72: while (1) {
00106$:
;	testlcd.c:73: if(LCD_ready()){
	lcall	_LCD_ready
	mov	a,dpl
	jz	00106$
;	testlcd.c:74: SemaphoreWait(full);
		4$:
	MOV A, _full 
	JZ 4$ 
	JB ACC.7, 4$ 
	DEC _full 
;	testlcd.c:75: SemaphoreWait(mutex);
		5$:
	MOV A, _mutex 
	JZ 5$ 
	JB ACC.7, 5$ 
	DEC _mutex 
;	testlcd.c:77: EA = 0;
;	assignBit
	clr	_EA
;	testlcd.c:78: if(buffer != 0x00) LCD_write_char(buffer);
	mov	a,_buffer
	jz	00102$
	mov	dpl,_buffer
	lcall	_LCD_write_char
00102$:
;	testlcd.c:80: EA = 1;
;	assignBit
	setb	_EA
;	testlcd.c:81: SemaphoreSignal(mutex);
	INC _mutex 
;	testlcd.c:82: SemaphoreSignal(empty);                       
	INC _empty 
;	testlcd.c:85: }
	sjmp	00106$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testlcd.c:88: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testlcd.c:89: LCD_Init();
	lcall	_LCD_Init
;	testlcd.c:90: Init_Keypad();
	lcall	_Init_Keypad
;	testlcd.c:91: SemaphoreCreate(mutex,1);
	mov	_mutex,#0x01
;	testlcd.c:92: SemaphoreCreate(full,0);
	mov	_full,#0x00
;	testlcd.c:93: SemaphoreCreate(empty,1);
	mov	_empty,#0x01
;	testlcd.c:94: ThreadCreate(Producer1);
	mov	dptr,#_Producer1
	lcall	_ThreadCreate
;	testlcd.c:95: ThreadCreate(Producer2);
	mov	dptr,#_Producer2
	lcall	_ThreadCreate
;	testlcd.c:96: Consumer();
;	testlcd.c:97: }
	ljmp	_Consumer
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testlcd.c:99: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testlcd.c:102: __endasm;
	ljmp	_Bootstrap
;	testlcd.c:103: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testlcd.c:105: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testlcd.c:106: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testlcd.c:107: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testlcd.c:109: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testlcd.c:112: __endasm;
	ljmp	_myTimer0Handler
;	testlcd.c:113: }
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
