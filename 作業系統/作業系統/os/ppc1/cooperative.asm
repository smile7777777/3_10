;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module cooperative
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Bootstrap
	.globl _main
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
	.globl _new_ID
	.globl _temp_SP
	.globl _bitmap_ID
	.globl _cur_ID
	.globl _saved_SP
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
_saved_SP	=	0x0030
_cur_ID	=	0x0034
_bitmap_ID	=	0x0035
_temp_SP	=	0x0036
_new_ID	=	0x0037
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	cooperative.c:79: void Bootstrap(void)
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	cooperative.c:93: bitmap_ID = 0b0000;
	mov	_bitmap_ID,#0x00
;	cooperative.c:94: cur_ID = 0;
	mov	_cur_ID,#0x00
;	cooperative.c:96: cur_ID = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_cur_ID,dpl
;	cooperative.c:98: RESTORESTATE;               \
	mov	a,_cur_ID
	add	a,#_saved_SP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	cooperative.c:107: ThreadID ThreadCreate(FunctionPtr fp) {
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	cooperative.c:108: if (bitmap_ID == 0b1111) return -1; //check 
	mov	a,#0x0f
	cjne	a,_bitmap_ID,00102$
	mov	dpl,#0xff
	ret
00102$:
;	cooperative.c:110: temp_SP = SP; //save current SP
	mov	_temp_SP,_SP
;	cooperative.c:112: if (!(bitmap_ID & 0b0001)) {
	mov	a,_bitmap_ID
	jb	acc.0,00112$
;	cooperative.c:113: bitmap_ID |= 0b0001;
	orl	_bitmap_ID,#0x01
;	cooperative.c:114: new_ID = 0;
	mov	_new_ID,#0x00
	sjmp	00113$
00112$:
;	cooperative.c:115: } else if (!(bitmap_ID & 0b0010)) {
	mov	a,_bitmap_ID
	jb	acc.1,00109$
;	cooperative.c:116: bitmap_ID |= 0b0010;
	orl	_bitmap_ID,#0x02
;	cooperative.c:117: new_ID = 1;
	mov	_new_ID,#0x01
	sjmp	00113$
00109$:
;	cooperative.c:118: } else if (!(bitmap_ID & 0b0100)) {
	mov	a,_bitmap_ID
	jb	acc.2,00106$
;	cooperative.c:119: bitmap_ID |= 0b0100;
	orl	_bitmap_ID,#0x04
;	cooperative.c:120: new_ID = 2;
	mov	_new_ID,#0x02
	sjmp	00113$
00106$:
;	cooperative.c:121: } else if (!(bitmap_ID & 0b1000)) {
	mov	a,_bitmap_ID
	jb	acc.3,00113$
;	cooperative.c:122: bitmap_ID |= 0b1000;
	orl	_bitmap_ID,#0x08
;	cooperative.c:123: new_ID = 3;
	mov	_new_ID,#0x03
00113$:
;	cooperative.c:126: SP = 0x3F + (new_ID * 0x10); 
	mov	a,_new_ID
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	cooperative.c:131: __endasm;
	PUSH	DPL
	PUSH	DPH
;	cooperative.c:139: __endasm;
	MOV	A, #0
	PUSH	A
	PUSH	A
	PUSH	A
	PUSH	A
;	cooperative.c:141: PSW = (new_ID << 3); 
	mov	a,_new_ID
	mov	r7,a
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_PSW,a
;	cooperative.c:145: __endasm;
	PUSH	PSW
;	cooperative.c:147: saved_SP[new_ID] = SP;           
	mov	a,_new_ID
	add	a,#_saved_SP
	mov	r0,a
	mov	@r0,_SP
;	cooperative.c:148: SP = temp_SP;                    
	mov	_SP,_temp_SP
;	cooperative.c:150: return new_ID;                   //
	mov	dpl,_new_ID
;	cooperative.c:151: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	cooperative.c:162: void ThreadYield(void) {
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	cooperative.c:163: SAVESTATE; 
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_cur_ID
	add	a,#_saved_SP
	mov	r0,a
	mov	@r0,_SP
;	cooperative.c:164: if (!bitmap_ID) return;
	mov	a,_bitmap_ID
	jnz	00102$
	ret
00102$:
;	cooperative.c:165: if (cur_ID == 0) {
	mov	a,_cur_ID
	jnz	00144$
;	cooperative.c:166: if (bitmap_ID & 0b0010) cur_ID = 1;
	mov	a,_bitmap_ID
	jnb	acc.1,00109$
	mov	_cur_ID,#0x01
	ljmp	00145$
00109$:
;	cooperative.c:167: else if (bitmap_ID & 0b0100) cur_ID = 2;
	mov	a,_bitmap_ID
	jnb	acc.2,00106$
	mov	_cur_ID,#0x02
	ljmp	00145$
00106$:
;	cooperative.c:168: else if (bitmap_ID & 0b1000) cur_ID = 3;
	mov	a,_bitmap_ID
	jb	acc.3,00220$
	ljmp	00145$
00220$:
	mov	_cur_ID,#0x03
	ljmp	00145$
00144$:
;	cooperative.c:169: } else if (cur_ID == 1) {
	mov	a,#0x01
	cjne	a,_cur_ID,00141$
;	cooperative.c:170: if (bitmap_ID & 0b0100) cur_ID = 2;
	mov	a,_bitmap_ID
	jnb	acc.2,00117$
	mov	_cur_ID,#0x02
	sjmp	00145$
00117$:
;	cooperative.c:171: else if (bitmap_ID & 0b1000) cur_ID = 3;
	mov	a,_bitmap_ID
	jnb	acc.3,00114$
	mov	_cur_ID,#0x03
	sjmp	00145$
00114$:
;	cooperative.c:172: else if (bitmap_ID & 0b0001) cur_ID = 0;
	mov	a,_bitmap_ID
	jnb	acc.0,00145$
	mov	_cur_ID,#0x00
	sjmp	00145$
00141$:
;	cooperative.c:173: } else if (cur_ID == 2) {
	mov	a,#0x02
	cjne	a,_cur_ID,00138$
;	cooperative.c:174: if (bitmap_ID & 0b1000) cur_ID = 3;
	mov	a,_bitmap_ID
	jnb	acc.3,00125$
	mov	_cur_ID,#0x03
	sjmp	00145$
00125$:
;	cooperative.c:175: else if (bitmap_ID & 0b0001) cur_ID = 0;
	mov	a,_bitmap_ID
	jnb	acc.0,00122$
	mov	_cur_ID,#0x00
	sjmp	00145$
00122$:
;	cooperative.c:176: else if (bitmap_ID & 0b0010) cur_ID = 1;
	mov	a,_bitmap_ID
	jnb	acc.1,00145$
	mov	_cur_ID,#0x01
	sjmp	00145$
00138$:
;	cooperative.c:177: } else if (cur_ID == 3) {
	mov	a,#0x03
	cjne	a,_cur_ID,00145$
;	cooperative.c:178: if (bitmap_ID & 0b0001) cur_ID = 0;
	mov	a,_bitmap_ID
	jnb	acc.0,00133$
	mov	_cur_ID,#0x00
	sjmp	00145$
00133$:
;	cooperative.c:179: else if (bitmap_ID & 0b0010) cur_ID = 1;
	mov	a,_bitmap_ID
	jnb	acc.1,00130$
	mov	_cur_ID,#0x01
	sjmp	00145$
00130$:
;	cooperative.c:180: else if (bitmap_ID & 0b0100) cur_ID = 2;
	mov	a,_bitmap_ID
	jnb	acc.2,00145$
	mov	_cur_ID,#0x02
00145$:
;	cooperative.c:182: RESTORESTATE; 
	mov	a,_cur_ID
	add	a,#_saved_SP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	cooperative.c:183: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	cooperative.c:192: void ThreadExit(void) {
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	cooperative.c:193: bitmap_ID &= ~(1 << cur_ID); // clear current thread
	mov	r7,_cur_ID
	mov	b,r7
	inc	b
	mov	a,#0x01
	sjmp	00218$
00216$:
	add	a,acc
00218$:
	djnz	b,00216$
	cpl	a
	mov	r7,a
	mov	r6,_bitmap_ID
	anl	a,r6
	mov	_bitmap_ID,a
;	cooperative.c:194: if (!bitmap_ID) return;
	mov	a,_bitmap_ID
	jnz	00102$
	ret
00102$:
;	cooperative.c:195: if (cur_ID == 0) {
	mov	a,_cur_ID
	jnz	00144$
;	cooperative.c:196: if (bitmap_ID & 0b0010) cur_ID = 1;
	mov	a,_bitmap_ID
	jnb	acc.1,00109$
	mov	_cur_ID,#0x01
	ljmp	00145$
00109$:
;	cooperative.c:197: else if (bitmap_ID & 0b0100) cur_ID = 2;
	mov	a,_bitmap_ID
	jnb	acc.2,00106$
	mov	_cur_ID,#0x02
	sjmp	00145$
00106$:
;	cooperative.c:198: else if (bitmap_ID & 0b1000) cur_ID = 3;
	mov	a,_bitmap_ID
	jnb	acc.3,00145$
	mov	_cur_ID,#0x03
	sjmp	00145$
00144$:
;	cooperative.c:199: } else if (cur_ID == 1) {
	mov	a,#0x01
	cjne	a,_cur_ID,00141$
;	cooperative.c:200: if (bitmap_ID & 0b0100) cur_ID = 2;
	mov	a,_bitmap_ID
	jnb	acc.2,00117$
	mov	_cur_ID,#0x02
	sjmp	00145$
00117$:
;	cooperative.c:201: else if (bitmap_ID & 0b1000) cur_ID = 3;
	mov	a,_bitmap_ID
	jnb	acc.3,00114$
	mov	_cur_ID,#0x03
	sjmp	00145$
00114$:
;	cooperative.c:202: else if (bitmap_ID & 0b0001) cur_ID = 0;
	mov	a,_bitmap_ID
	jnb	acc.0,00145$
	mov	_cur_ID,#0x00
	sjmp	00145$
00141$:
;	cooperative.c:203: } else if (cur_ID == 2) {
	mov	a,#0x02
	cjne	a,_cur_ID,00138$
;	cooperative.c:204: if (bitmap_ID & 0b1000) cur_ID = 3;
	mov	a,_bitmap_ID
	jnb	acc.3,00125$
	mov	_cur_ID,#0x03
	sjmp	00145$
00125$:
;	cooperative.c:205: else if (bitmap_ID & 0b0001) cur_ID = 0;
	mov	a,_bitmap_ID
	jnb	acc.0,00122$
	mov	_cur_ID,#0x00
	sjmp	00145$
00122$:
;	cooperative.c:206: else if (bitmap_ID & 0b0010) cur_ID = 1;
	mov	a,_bitmap_ID
	jnb	acc.1,00145$
	mov	_cur_ID,#0x01
	sjmp	00145$
00138$:
;	cooperative.c:207: } else if (cur_ID == 3) {
	mov	a,#0x03
	cjne	a,_cur_ID,00145$
;	cooperative.c:208: if (bitmap_ID & 0b0001) cur_ID = 0;
	mov	a,_bitmap_ID
	jnb	acc.0,00133$
	mov	_cur_ID,#0x00
	sjmp	00145$
00133$:
;	cooperative.c:209: else if (bitmap_ID & 0b0010) cur_ID = 1;
	mov	a,_bitmap_ID
	jnb	acc.1,00130$
	mov	_cur_ID,#0x01
	sjmp	00145$
00130$:
;	cooperative.c:210: else if (bitmap_ID & 0b0100) cur_ID = 2;
	mov	a,_bitmap_ID
	jnb	acc.2,00145$
	mov	_cur_ID,#0x02
00145$:
;	cooperative.c:212: RESTORESTATE;
	mov	a,_cur_ID
	add	a,#_saved_SP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	cooperative.c:213: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
