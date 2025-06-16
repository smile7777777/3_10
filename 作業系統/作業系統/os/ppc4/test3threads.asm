;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module test3threads
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl _timer0_ISR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Consumer
	.globl _Producer2
	.globl _Producer1
	.globl _initialize
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
	.globl _empty
	.globl _full
	.globl _mutex
	.globl _buffer
	.globl _nextNum
	.globl _nextChar
	.globl _tail
	.globl _head
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
_head	=	0x0039
_tail	=	0x003a
_nextChar	=	0x003b
_nextNum	=	0x003c
_buffer	=	0x003d
_mutex	=	0x0020
_full	=	0x0021
_empty	=	0x0022
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
;	test3threads.c:16: void initialize(){
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
;	test3threads.c:17: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	test3threads.c:18: SCON = 0x50;        
	mov	_SCON,#0x50
;	test3threads.c:19: TH1 = (char) -6;            
	mov	_TH1,#0xfa
;	test3threads.c:20: TR1 = 1;            
;	assignBit
	setb	_TR1
;	test3threads.c:21: TI = 1;             
;	assignBit
	setb	_TI
;	test3threads.c:22: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer1'
;------------------------------------------------------------
;	test3threads.c:24: void Producer1(void) {
;	-----------------------------------------
;	 function Producer1
;	-----------------------------------------
_Producer1:
;	test3threads.c:25: nextChar = 'A'; // 
	mov	_nextChar,#0x41
;	test3threads.c:26: while (1) {
00105$:
;	test3threads.c:27: SemaphoreWait(empty);
		0$:
	MOV A, _empty 
	JZ 0$ 
	JB ACC.7, 0$ 
	DEC _empty 
;	test3threads.c:28: SemaphoreWait(mutex);
		1$:
	MOV A, _mutex 
	JZ 1$ 
	JB ACC.7, 1$ 
	DEC _mutex 
;	test3threads.c:34: }
	mov	r7,#0x01
	jbc	ea,00117$
	mov	r7,#0x00
00117$:
;	test3threads.c:30: buffer[head] = nextChar;
	mov	a,_head
	add	a,#_buffer
	mov	r0,a
	mov	@r0,_nextChar
;	test3threads.c:31: if (head == 2) head = 0;
	mov	a,#0x02
	cjne	a,_head,00102$
	mov	_head,#0x00
	sjmp	00103$
00102$:
;	test3threads.c:32: else head = (head + 1);
	mov	a,_head
	mov	r6,a
	inc	a
	mov	_head,a
00103$:
;	test3threads.c:33: nextChar = (nextChar - 'A' + 1) % 26 + 'A';
	mov	r5,_nextChar
	mov	r6,#0x00
	mov	a,#0xc0
	add	a,r5
	mov	dpl,a
	mov	a,#0xff
	addc	a,r6
	mov	dph,a
	mov	__modsint_PARM_2,#0x1a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r6
	push	ar7
	lcall	__modsint
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	a,#0x41
	add	a,r5
	mov	_nextChar,a
	mov	a,r7
	rrc	a
	mov	ea,c
;	test3threads.c:35: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:36: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:38: }
	sjmp	00105$
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer2'
;------------------------------------------------------------
;	test3threads.c:40: void Producer2(void) {
;	-----------------------------------------
;	 function Producer2
;	-----------------------------------------
_Producer2:
;	test3threads.c:41: nextNum = '0'; // 
	mov	_nextNum,#0x30
;	test3threads.c:42: while (1) {
00105$:
;	test3threads.c:43: SemaphoreWait(empty);
		2$:
	MOV A, _empty 
	JZ 2$ 
	JB ACC.7, 2$ 
	DEC _empty 
;	test3threads.c:44: SemaphoreWait(mutex);
		3$:
	MOV A, _mutex 
	JZ 3$ 
	JB ACC.7, 3$ 
	DEC _mutex 
;	test3threads.c:50: }
	mov	r7,#0x01
	jbc	ea,00117$
	mov	r7,#0x00
00117$:
;	test3threads.c:46: buffer[head] = nextNum;
	mov	a,_head
	add	a,#_buffer
	mov	r0,a
	mov	@r0,_nextNum
;	test3threads.c:47: if (head == 2) head = 0;
	mov	a,#0x02
	cjne	a,_head,00102$
	mov	_head,#0x00
	sjmp	00103$
00102$:
;	test3threads.c:48: else head = (head + 1);
	mov	a,_head
	mov	r6,a
	inc	a
	mov	_head,a
00103$:
;	test3threads.c:49: nextNum = (nextNum - '0' + 1) % 10 + '0';
	mov	r5,_nextNum
	mov	r6,#0x00
	mov	a,#0xd1
	add	a,r5
	mov	dpl,a
	mov	a,#0xff
	addc	a,r6
	mov	dph,a
	mov	__modsint_PARM_2,#0x0a
;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
	mov	(__modsint_PARM_2 + 1),r6
	push	ar7
	lcall	__modsint
	mov	r5,dpl
	mov	r6,dph
	pop	ar7
	mov	a,#0x30
	add	a,r5
	mov	_nextNum,a
	mov	a,r7
	rrc	a
	mov	ea,c
;	test3threads.c:51: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:52: SemaphoreSignal(full);
	INC _full 
;	test3threads.c:54: }
	sjmp	00105$
;------------------------------------------------------------
;Allocation info for local variables in function 'Consumer'
;------------------------------------------------------------
;	test3threads.c:56: void Consumer(void) {
;	-----------------------------------------
;	 function Consumer
;	-----------------------------------------
_Consumer:
;	test3threads.c:57: initialize();
	lcall	_initialize
;	test3threads.c:58: while (1) {
00108$:
;	test3threads.c:59: SemaphoreWait(full);
		4$:
	MOV A, _full 
	JZ 4$ 
	JB ACC.7, 4$ 
	DEC _full 
;	test3threads.c:60: SemaphoreWait(mutex);
		5$:
	MOV A, _mutex 
	JZ 5$ 
	JB ACC.7, 5$ 
	DEC _mutex 
;	test3threads.c:61: while (!TI); // 等待傳輸完成
00101$:
	jnb	_TI,00101$
;	test3threads.c:69: }
	mov	r7,#0x01
	jbc	ea,00129$
	mov	r7,#0x00
00129$:
;	test3threads.c:63: SBUF = buffer[tail];
	mov	a,_tail
	add	a,#_buffer
	mov	r1,a
	mov	_SBUF,@r1
;	test3threads.c:64: TI = 0; // mark done
;	assignBit
	clr	_TI
;	test3threads.c:65: if (tail == 2) tail = 0;
	mov	a,#0x02
	cjne	a,_tail,00105$
	mov	_tail,#0x00
	sjmp	00106$
00105$:
;	test3threads.c:66: else tail = tail + 1;
	mov	a,_tail
	mov	r6,a
	inc	a
	mov	_tail,a
00106$:
	mov	a,r7
	rrc	a
	mov	ea,c
;	test3threads.c:70: SemaphoreSignal(mutex);
	INC _mutex 
;	test3threads.c:71: SemaphoreSignal(empty);
	INC _empty 
;	test3threads.c:73: }
	sjmp	00108$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	test3threads.c:75: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	test3threads.c:79: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
;	test3threads.c:80: SemaphoreCreate(full, 0);
	mov	_full,#0x00
;	test3threads.c:81: SemaphoreCreate(empty, 3);
	mov	_empty,#0x03
;	test3threads.c:84: head = tail = 0;
	mov	_tail,#0x00
	mov	_head,#0x00
;	test3threads.c:85: ThreadCreate(Producer1); // 
	mov	dptr,#_Producer1
	lcall	_ThreadCreate
;	test3threads.c:86: ThreadCreate(Producer2); // 
	mov	dptr,#_Producer2
	lcall	_ThreadCreate
;	test3threads.c:89: Consumer(); // 
;	test3threads.c:90: }
	ljmp	_Consumer
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	test3threads.c:92: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	test3threads.c:95: __endasm;
	LJMP	_Bootstrap
;	test3threads.c:96: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	test3threads.c:97: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	test3threads.c:100: __endasm;
	LJMP	_myTimer0Handler
;	test3threads.c:101: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:103: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	test3threads.c:104: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	test3threads.c:105: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
