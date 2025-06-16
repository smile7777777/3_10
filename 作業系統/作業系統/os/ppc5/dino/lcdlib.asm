;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW64)
;--------------------------------------------------------
	.module lcdlib
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cactus
	.globl _dinosaur
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
	.globl _LCD_set_symbol_PARM_2
	.globl _lcd_ready
	.globl _LCD_ready
	.globl _LCD_Init
	.globl _LCD_IRWrite
	.globl _LCD_functionSet
	.globl _LCD_write_char
	.globl _LCD_write_string
	.globl _delay
	.globl _LCD_set_symbol
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
_lcd_ready	=	0x003d
_LCD_set_symbol_PARM_2:
	.ds 3
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
;Allocation info for local variables in function 'LCD_ready'
;------------------------------------------------------------
;	lcdlib.c:19: unsigned char LCD_ready(void) {
;	-----------------------------------------
;	 function LCD_ready
;	-----------------------------------------
_LCD_ready:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	lcdlib.c:20: return lcd_ready;
	mov	dpl,_lcd_ready
;	lcdlib.c:21: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_Init'
;------------------------------------------------------------
;	lcdlib.c:23: void LCD_Init(void) {
;	-----------------------------------------
;	 function LCD_Init
;	-----------------------------------------
_LCD_Init:
;	lcdlib.c:24: LCD_functionSet();
	lcall	_LCD_functionSet
;	lcdlib.c:25: LCD_entryModeSet(1, 1); /* increment and no shift */
	mov	dpl,#0x07
	lcall	_LCD_IRWrite
;	lcdlib.c:26: LCD_displayOnOffControl(1, 1, 1); /* display on, cursor on and blinking on */
	mov	dpl,#0x0f
	lcall	_LCD_IRWrite
;	lcdlib.c:27: LCD_set_symbol(0x00, dinosaur); // bitmap for dinosaur starts at 0x10
	mov	_LCD_set_symbol_PARM_2,#_dinosaur
	mov	(_LCD_set_symbol_PARM_2 + 1),#(_dinosaur >> 8)
	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
	mov	dpl,#0x00
	lcall	_LCD_set_symbol
;	lcdlib.c:28: LCD_set_symbol(0x08, cactus); // bitmap for cactus starts at 0x20
	mov	_LCD_set_symbol_PARM_2,#_cactus
	mov	(_LCD_set_symbol_PARM_2 + 1),#(_cactus >> 8)
	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
	mov	dpl,#0x08
	lcall	_LCD_set_symbol
;	lcdlib.c:29: lcd_ready = 1;
	mov	_lcd_ready,#0x01
;	lcdlib.c:30: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_IRWrite'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;------------------------------------------------------------
;	lcdlib.c:32: void LCD_IRWrite(char c) {
;	-----------------------------------------
;	 function LCD_IRWrite
;	-----------------------------------------
_LCD_IRWrite:
	mov	r7,dpl
;	lcdlib.c:33: lcd_ready = 0;
	mov	_lcd_ready,#0x00
;	lcdlib.c:34: DB = (c & 0xf0); // high nibble, keep RS low
	mov	a,#0xf0
	anl	a,r7
	mov	_P1,a
;	lcdlib.c:35: E = 1; // pulse E
;	assignBit
	setb	_P1_2
;	lcdlib.c:36: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:37: DB = (c << 4); // low nibble, keep RS low
	mov	a,r7
	swap	a
	anl	a,#0xf0
	mov	_P1,a
;	lcdlib.c:38: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:39: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:40: delay(DELAY_AMOUNT);
	mov	dpl,#0x28
	lcall	_delay
;	lcdlib.c:41: lcd_ready = 1;
	mov	_lcd_ready,#0x01
;	lcdlib.c:42: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_functionSet'
;------------------------------------------------------------
;	lcdlib.c:44: void LCD_functionSet(void) {
;	-----------------------------------------
;	 function LCD_functionSet
;	-----------------------------------------
_LCD_functionSet:
;	lcdlib.c:45: lcd_ready = 0;
	mov	_lcd_ready,#0x00
;	lcdlib.c:48: DB = 0x20; // DB<7:4> = 0010, <RS,E,x,x>=0
	mov	_P1,#0x20
;	lcdlib.c:49: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:50: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:51: delay(DELAY_AMOUNT);
	mov	dpl,#0x28
	lcall	_delay
;	lcdlib.c:52: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:53: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:54: delay(DELAY_AMOUNT); // added, to ensure sufficient delay
	mov	dpl,#0x28
	lcall	_delay
;	lcdlib.c:55: DB7 = 1; // 2-line model
;	assignBit
	setb	_P1_7
;	lcdlib.c:57: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:58: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:59: delay(DELAY_AMOUNT);
	mov	dpl,#0x28
	lcall	_delay
;	lcdlib.c:60: lcd_ready = 1;
	mov	_lcd_ready,#0x01
;	lcdlib.c:61: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_write_char'
;------------------------------------------------------------
;c                         Allocated to registers r7 
;------------------------------------------------------------
;	lcdlib.c:63: void LCD_write_char(char c) {
;	-----------------------------------------
;	 function LCD_write_char
;	-----------------------------------------
_LCD_write_char:
	mov	r7,dpl
;	lcdlib.c:64: lcd_ready = 0;
	mov	_lcd_ready,#0x00
;	lcdlib.c:65: DB = (c & 0xf0) | 0x08; //; keep the RS
	mov	a,#0xf0
	anl	a,r7
	orl	a,#0x08
	mov	_P1,a
;	lcdlib.c:66: RS = 1;
;	assignBit
	setb	_P1_3
;	lcdlib.c:67: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:68: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:69: DB = (c << 4) | 0x08; // keep the RS
	mov	a,r7
	swap	a
	anl	a,#0xf0
	mov	r7,a
	mov	a,#0x08
	orl	a,r7
	mov	_P1,a
;	lcdlib.c:70: E = 1;
;	assignBit
	setb	_P1_2
;	lcdlib.c:71: E = 0;
;	assignBit
	clr	_P1_2
;	lcdlib.c:72: delay(DELAY_AMOUNT);
	mov	dpl,#0x28
	lcall	_delay
;	lcdlib.c:73: lcd_ready = 1;
	mov	_lcd_ready,#0x01
;	lcdlib.c:74: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_write_string'
;------------------------------------------------------------
;str                       Allocated to registers 
;------------------------------------------------------------
;	lcdlib.c:76: void LCD_write_string(char* str) {
;	-----------------------------------------
;	 function LCD_write_string
;	-----------------------------------------
_LCD_write_string:
	mov	r5,dpl
	mov	r6,dph
	mov	r7,b
;	lcdlib.c:77: while (*str++) {
00101$:
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	r4,a
	inc	dptr
	mov	r5,dpl
	mov	r6,dph
	mov	a,r4
	jz	00104$
;	lcdlib.c:78: LCD_write_char(*str);
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
	sjmp	00101$
00104$:
;	lcdlib.c:80: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'delay'
;------------------------------------------------------------
;n                         Allocated to registers 
;------------------------------------------------------------
;	lcdlib.c:82: void delay(unsigned char n) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
;	lcdlib.c:86: __endasm;
	    dhere:
	djnz	dpl, dhere
;	lcdlib.c:88: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'LCD_set_symbol'
;------------------------------------------------------------
;symb                      Allocated with name '_LCD_set_symbol_PARM_2'
;code                      Allocated to registers r7 
;------------------------------------------------------------
;	lcdlib.c:90: void LCD_set_symbol(char code, const char symb[]) {
;	-----------------------------------------
;	 function LCD_set_symbol
;	-----------------------------------------
_LCD_set_symbol:
	mov	r7,dpl
;	lcdlib.c:93: LCD_setCgRamAddress(code); // code is the character generation memory
	mov	a,#0x40
	orl	a,r7
	mov	dpl,a
	lcall	_LCD_IRWrite
;	lcdlib.c:96: LCD_write_char(symb[0]);
	mov	r5,_LCD_set_symbol_PARM_2
	mov	r6,(_LCD_set_symbol_PARM_2 + 1)
	mov	r7,(_LCD_set_symbol_PARM_2 + 2)
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:97: LCD_write_char(symb[1]);
	mov	a,#0x01
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:98: LCD_write_char(symb[2]);
	mov	a,#0x02
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:99: LCD_write_char(symb[3]);
	mov	a,#0x03
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:100: LCD_write_char(symb[4]);
	mov	a,#0x04
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:101: LCD_write_char(symb[5]);
	mov	a,#0x05
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:102: LCD_write_char(symb[6]);
	mov	a,#0x06
	add	a,r5
	mov	r2,a
	clr	a
	addc	a,r6
	mov	r3,a
	mov	ar4,r7
	mov	dpl,r2
	mov	dph,r3
	mov	b,r4
	lcall	__gptrget
	mov	dpl,a
	push	ar7
	push	ar6
	push	ar5
	lcall	_LCD_write_char
	pop	ar5
	pop	ar6
	pop	ar7
;	lcdlib.c:103: LCD_write_char(symb[7]);
	mov	a,#0x07
	add	a,r5
	mov	r5,a
	clr	a
	addc	a,r6
	mov	r6,a
	mov	dpl,r5
	mov	dph,r6
	mov	b,r7
	lcall	__gptrget
	mov	dpl,a
;	lcdlib.c:106: }
	ljmp	_LCD_write_char
	.area CSEG    (CODE)
	.area CONST   (CODE)
_dinosaur:
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x14	; 20
	.db #0x17	; 23
	.db #0x0e	; 14
	.db #0x0a	; 10
_cactus:
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x15	; 21
	.db #0x15	; 21
	.db #0x16	; 22
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0x04	; 4
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
