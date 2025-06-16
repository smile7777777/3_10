                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module lcdlib
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _cactus
                                     12 	.globl _dinosaur
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _LCD_set_symbol_PARM_2
                                    110 	.globl _lcd_ready
                                    111 	.globl _LCD_ready
                                    112 	.globl _LCD_Init
                                    113 	.globl _LCD_IRWrite
                                    114 	.globl _LCD_functionSet
                                    115 	.globl _LCD_write_char
                                    116 	.globl _LCD_write_string
                                    117 	.globl _delay
                                    118 	.globl _LCD_set_symbol
                                    119 ;--------------------------------------------------------
                                    120 ; special function registers
                                    121 ;--------------------------------------------------------
                                    122 	.area RSEG    (ABS,DATA)
      000000                        123 	.org 0x0000
                           000080   124 _P0	=	0x0080
                           000081   125 _SP	=	0x0081
                           000082   126 _DPL	=	0x0082
                           000083   127 _DPH	=	0x0083
                           000087   128 _PCON	=	0x0087
                           000088   129 _TCON	=	0x0088
                           000089   130 _TMOD	=	0x0089
                           00008A   131 _TL0	=	0x008a
                           00008B   132 _TL1	=	0x008b
                           00008C   133 _TH0	=	0x008c
                           00008D   134 _TH1	=	0x008d
                           000090   135 _P1	=	0x0090
                           000098   136 _SCON	=	0x0098
                           000099   137 _SBUF	=	0x0099
                           0000A0   138 _P2	=	0x00a0
                           0000A8   139 _IE	=	0x00a8
                           0000B0   140 _P3	=	0x00b0
                           0000B8   141 _IP	=	0x00b8
                           0000D0   142 _PSW	=	0x00d0
                           0000E0   143 _ACC	=	0x00e0
                           0000F0   144 _B	=	0x00f0
                                    145 ;--------------------------------------------------------
                                    146 ; special function bits
                                    147 ;--------------------------------------------------------
                                    148 	.area RSEG    (ABS,DATA)
      000000                        149 	.org 0x0000
                           000080   150 _P0_0	=	0x0080
                           000081   151 _P0_1	=	0x0081
                           000082   152 _P0_2	=	0x0082
                           000083   153 _P0_3	=	0x0083
                           000084   154 _P0_4	=	0x0084
                           000085   155 _P0_5	=	0x0085
                           000086   156 _P0_6	=	0x0086
                           000087   157 _P0_7	=	0x0087
                           000088   158 _IT0	=	0x0088
                           000089   159 _IE0	=	0x0089
                           00008A   160 _IT1	=	0x008a
                           00008B   161 _IE1	=	0x008b
                           00008C   162 _TR0	=	0x008c
                           00008D   163 _TF0	=	0x008d
                           00008E   164 _TR1	=	0x008e
                           00008F   165 _TF1	=	0x008f
                           000090   166 _P1_0	=	0x0090
                           000091   167 _P1_1	=	0x0091
                           000092   168 _P1_2	=	0x0092
                           000093   169 _P1_3	=	0x0093
                           000094   170 _P1_4	=	0x0094
                           000095   171 _P1_5	=	0x0095
                           000096   172 _P1_6	=	0x0096
                           000097   173 _P1_7	=	0x0097
                           000098   174 _RI	=	0x0098
                           000099   175 _TI	=	0x0099
                           00009A   176 _RB8	=	0x009a
                           00009B   177 _TB8	=	0x009b
                           00009C   178 _REN	=	0x009c
                           00009D   179 _SM2	=	0x009d
                           00009E   180 _SM1	=	0x009e
                           00009F   181 _SM0	=	0x009f
                           0000A0   182 _P2_0	=	0x00a0
                           0000A1   183 _P2_1	=	0x00a1
                           0000A2   184 _P2_2	=	0x00a2
                           0000A3   185 _P2_3	=	0x00a3
                           0000A4   186 _P2_4	=	0x00a4
                           0000A5   187 _P2_5	=	0x00a5
                           0000A6   188 _P2_6	=	0x00a6
                           0000A7   189 _P2_7	=	0x00a7
                           0000A8   190 _EX0	=	0x00a8
                           0000A9   191 _ET0	=	0x00a9
                           0000AA   192 _EX1	=	0x00aa
                           0000AB   193 _ET1	=	0x00ab
                           0000AC   194 _ES	=	0x00ac
                           0000AF   195 _EA	=	0x00af
                           0000B0   196 _P3_0	=	0x00b0
                           0000B1   197 _P3_1	=	0x00b1
                           0000B2   198 _P3_2	=	0x00b2
                           0000B3   199 _P3_3	=	0x00b3
                           0000B4   200 _P3_4	=	0x00b4
                           0000B5   201 _P3_5	=	0x00b5
                           0000B6   202 _P3_6	=	0x00b6
                           0000B7   203 _P3_7	=	0x00b7
                           0000B0   204 _RXD	=	0x00b0
                           0000B1   205 _TXD	=	0x00b1
                           0000B2   206 _INT0	=	0x00b2
                           0000B3   207 _INT1	=	0x00b3
                           0000B4   208 _T0	=	0x00b4
                           0000B5   209 _T1	=	0x00b5
                           0000B6   210 _WR	=	0x00b6
                           0000B7   211 _RD	=	0x00b7
                           0000B8   212 _PX0	=	0x00b8
                           0000B9   213 _PT0	=	0x00b9
                           0000BA   214 _PX1	=	0x00ba
                           0000BB   215 _PT1	=	0x00bb
                           0000BC   216 _PS	=	0x00bc
                           0000D0   217 _P	=	0x00d0
                           0000D1   218 _F1	=	0x00d1
                           0000D2   219 _OV	=	0x00d2
                           0000D3   220 _RS0	=	0x00d3
                           0000D4   221 _RS1	=	0x00d4
                           0000D5   222 _F0	=	0x00d5
                           0000D6   223 _AC	=	0x00d6
                           0000D7   224 _CY	=	0x00d7
                                    225 ;--------------------------------------------------------
                                    226 ; overlayable register banks
                                    227 ;--------------------------------------------------------
                                    228 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        229 	.ds 8
                                    230 ;--------------------------------------------------------
                                    231 ; internal ram data
                                    232 ;--------------------------------------------------------
                                    233 	.area DSEG    (DATA)
                           00003D   234 _lcd_ready	=	0x003d
      000008                        235 _LCD_set_symbol_PARM_2:
      000008                        236 	.ds 3
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram 
                                    239 ;--------------------------------------------------------
                                    240 	.area	OSEG    (OVR,DATA)
                                    241 ;--------------------------------------------------------
                                    242 ; indirectly addressable internal ram data
                                    243 ;--------------------------------------------------------
                                    244 	.area ISEG    (DATA)
                                    245 ;--------------------------------------------------------
                                    246 ; absolute internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area IABS    (ABS,DATA)
                                    249 	.area IABS    (ABS,DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; bit data
                                    252 ;--------------------------------------------------------
                                    253 	.area BSEG    (BIT)
                                    254 ;--------------------------------------------------------
                                    255 ; paged external ram data
                                    256 ;--------------------------------------------------------
                                    257 	.area PSEG    (PAG,XDATA)
                                    258 ;--------------------------------------------------------
                                    259 ; external ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area XSEG    (XDATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area XABS    (ABS,XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; external initialized ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XISEG   (XDATA)
                                    270 	.area HOME    (CODE)
                                    271 	.area GSINIT0 (CODE)
                                    272 	.area GSINIT1 (CODE)
                                    273 	.area GSINIT2 (CODE)
                                    274 	.area GSINIT3 (CODE)
                                    275 	.area GSINIT4 (CODE)
                                    276 	.area GSINIT5 (CODE)
                                    277 	.area GSINIT  (CODE)
                                    278 	.area GSFINAL (CODE)
                                    279 	.area CSEG    (CODE)
                                    280 ;--------------------------------------------------------
                                    281 ; global & static initialisations
                                    282 ;--------------------------------------------------------
                                    283 	.area HOME    (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 	.area GSFINAL (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 ;--------------------------------------------------------
                                    288 ; Home
                                    289 ;--------------------------------------------------------
                                    290 	.area HOME    (CODE)
                                    291 	.area HOME    (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; code
                                    294 ;--------------------------------------------------------
                                    295 	.area CSEG    (CODE)
                                    296 ;------------------------------------------------------------
                                    297 ;Allocation info for local variables in function 'LCD_ready'
                                    298 ;------------------------------------------------------------
                                    299 ;	lcdlib.c:19: unsigned char LCD_ready(void) {
                                    300 ;	-----------------------------------------
                                    301 ;	 function LCD_ready
                                    302 ;	-----------------------------------------
      000966                        303 _LCD_ready:
                           000007   304 	ar7 = 0x07
                           000006   305 	ar6 = 0x06
                           000005   306 	ar5 = 0x05
                           000004   307 	ar4 = 0x04
                           000003   308 	ar3 = 0x03
                           000002   309 	ar2 = 0x02
                           000001   310 	ar1 = 0x01
                           000000   311 	ar0 = 0x00
                                    312 ;	lcdlib.c:20: return lcd_ready;
      000966 85 3D 82         [24]  313 	mov	dpl,_lcd_ready
                                    314 ;	lcdlib.c:21: }
      000969 22               [24]  315 	ret
                                    316 ;------------------------------------------------------------
                                    317 ;Allocation info for local variables in function 'LCD_Init'
                                    318 ;------------------------------------------------------------
                                    319 ;	lcdlib.c:23: void LCD_Init(void) {
                                    320 ;	-----------------------------------------
                                    321 ;	 function LCD_Init
                                    322 ;	-----------------------------------------
      00096A                        323 _LCD_Init:
                                    324 ;	lcdlib.c:24: LCD_functionSet();
      00096A 12 09 BD         [24]  325 	lcall	_LCD_functionSet
                                    326 ;	lcdlib.c:25: LCD_entryModeSet(1, 1); /* increment and no shift */
      00096D 75 82 07         [24]  327 	mov	dpl,#0x07
      000970 12 09 9B         [24]  328 	lcall	_LCD_IRWrite
                                    329 ;	lcdlib.c:26: LCD_displayOnOffControl(1, 1, 1); /* display on, cursor on and blinking on */
      000973 75 82 0F         [24]  330 	mov	dpl,#0x0f
      000976 12 09 9B         [24]  331 	lcall	_LCD_IRWrite
                                    332 ;	lcdlib.c:27: LCD_set_symbol(0x00, dinosaur); // bitmap for dinosaur starts at 0x10
      000979 75 08 19         [24]  333 	mov	_LCD_set_symbol_PARM_2,#_dinosaur
      00097C 75 09 0D         [24]  334 	mov	(_LCD_set_symbol_PARM_2 + 1),#(_dinosaur >> 8)
      00097F 75 0A 80         [24]  335 	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
      000982 75 82 00         [24]  336 	mov	dpl,#0x00
      000985 12 0A 4A         [24]  337 	lcall	_LCD_set_symbol
                                    338 ;	lcdlib.c:28: LCD_set_symbol(0x08, cactus); // bitmap for cactus starts at 0x20
      000988 75 08 21         [24]  339 	mov	_LCD_set_symbol_PARM_2,#_cactus
      00098B 75 09 0D         [24]  340 	mov	(_LCD_set_symbol_PARM_2 + 1),#(_cactus >> 8)
      00098E 75 0A 80         [24]  341 	mov	(_LCD_set_symbol_PARM_2 + 2),#0x80
      000991 75 82 08         [24]  342 	mov	dpl,#0x08
      000994 12 0A 4A         [24]  343 	lcall	_LCD_set_symbol
                                    344 ;	lcdlib.c:29: lcd_ready = 1;
      000997 75 3D 01         [24]  345 	mov	_lcd_ready,#0x01
                                    346 ;	lcdlib.c:30: }
      00099A 22               [24]  347 	ret
                                    348 ;------------------------------------------------------------
                                    349 ;Allocation info for local variables in function 'LCD_IRWrite'
                                    350 ;------------------------------------------------------------
                                    351 ;c                         Allocated to registers r7 
                                    352 ;------------------------------------------------------------
                                    353 ;	lcdlib.c:32: void LCD_IRWrite(char c) {
                                    354 ;	-----------------------------------------
                                    355 ;	 function LCD_IRWrite
                                    356 ;	-----------------------------------------
      00099B                        357 _LCD_IRWrite:
      00099B AF 82            [24]  358 	mov	r7,dpl
                                    359 ;	lcdlib.c:33: lcd_ready = 0;
      00099D 75 3D 00         [24]  360 	mov	_lcd_ready,#0x00
                                    361 ;	lcdlib.c:34: DB = (c & 0xf0); // high nibble, keep RS low
      0009A0 74 F0            [12]  362 	mov	a,#0xf0
      0009A2 5F               [12]  363 	anl	a,r7
      0009A3 F5 90            [12]  364 	mov	_P1,a
                                    365 ;	lcdlib.c:35: E = 1; // pulse E
                                    366 ;	assignBit
      0009A5 D2 92            [12]  367 	setb	_P1_2
                                    368 ;	lcdlib.c:36: E = 0;
                                    369 ;	assignBit
      0009A7 C2 92            [12]  370 	clr	_P1_2
                                    371 ;	lcdlib.c:37: DB = (c << 4); // low nibble, keep RS low
      0009A9 EF               [12]  372 	mov	a,r7
      0009AA C4               [12]  373 	swap	a
      0009AB 54 F0            [12]  374 	anl	a,#0xf0
      0009AD F5 90            [12]  375 	mov	_P1,a
                                    376 ;	lcdlib.c:38: E = 1;
                                    377 ;	assignBit
      0009AF D2 92            [12]  378 	setb	_P1_2
                                    379 ;	lcdlib.c:39: E = 0;
                                    380 ;	assignBit
      0009B1 C2 92            [12]  381 	clr	_P1_2
                                    382 ;	lcdlib.c:40: delay(DELAY_AMOUNT);
      0009B3 75 82 28         [24]  383 	mov	dpl,#0x28
      0009B6 12 0A 46         [24]  384 	lcall	_delay
                                    385 ;	lcdlib.c:41: lcd_ready = 1;
      0009B9 75 3D 01         [24]  386 	mov	_lcd_ready,#0x01
                                    387 ;	lcdlib.c:42: }
      0009BC 22               [24]  388 	ret
                                    389 ;------------------------------------------------------------
                                    390 ;Allocation info for local variables in function 'LCD_functionSet'
                                    391 ;------------------------------------------------------------
                                    392 ;	lcdlib.c:44: void LCD_functionSet(void) {
                                    393 ;	-----------------------------------------
                                    394 ;	 function LCD_functionSet
                                    395 ;	-----------------------------------------
      0009BD                        396 _LCD_functionSet:
                                    397 ;	lcdlib.c:45: lcd_ready = 0;
      0009BD 75 3D 00         [24]  398 	mov	_lcd_ready,#0x00
                                    399 ;	lcdlib.c:48: DB = 0x20; // DB<7:4> = 0010, <RS,E,x,x>=0
      0009C0 75 90 20         [24]  400 	mov	_P1,#0x20
                                    401 ;	lcdlib.c:49: E = 1;
                                    402 ;	assignBit
      0009C3 D2 92            [12]  403 	setb	_P1_2
                                    404 ;	lcdlib.c:50: E = 0;
                                    405 ;	assignBit
      0009C5 C2 92            [12]  406 	clr	_P1_2
                                    407 ;	lcdlib.c:51: delay(DELAY_AMOUNT);
      0009C7 75 82 28         [24]  408 	mov	dpl,#0x28
      0009CA 12 0A 46         [24]  409 	lcall	_delay
                                    410 ;	lcdlib.c:52: E = 1;
                                    411 ;	assignBit
      0009CD D2 92            [12]  412 	setb	_P1_2
                                    413 ;	lcdlib.c:53: E = 0;
                                    414 ;	assignBit
      0009CF C2 92            [12]  415 	clr	_P1_2
                                    416 ;	lcdlib.c:54: delay(DELAY_AMOUNT); // added, to ensure sufficient delay
      0009D1 75 82 28         [24]  417 	mov	dpl,#0x28
      0009D4 12 0A 46         [24]  418 	lcall	_delay
                                    419 ;	lcdlib.c:55: DB7 = 1; // 2-line model
                                    420 ;	assignBit
      0009D7 D2 97            [12]  421 	setb	_P1_7
                                    422 ;	lcdlib.c:57: E = 1;
                                    423 ;	assignBit
      0009D9 D2 92            [12]  424 	setb	_P1_2
                                    425 ;	lcdlib.c:58: E = 0;
                                    426 ;	assignBit
      0009DB C2 92            [12]  427 	clr	_P1_2
                                    428 ;	lcdlib.c:59: delay(DELAY_AMOUNT);
      0009DD 75 82 28         [24]  429 	mov	dpl,#0x28
      0009E0 12 0A 46         [24]  430 	lcall	_delay
                                    431 ;	lcdlib.c:60: lcd_ready = 1;
      0009E3 75 3D 01         [24]  432 	mov	_lcd_ready,#0x01
                                    433 ;	lcdlib.c:61: }
      0009E6 22               [24]  434 	ret
                                    435 ;------------------------------------------------------------
                                    436 ;Allocation info for local variables in function 'LCD_write_char'
                                    437 ;------------------------------------------------------------
                                    438 ;c                         Allocated to registers r7 
                                    439 ;------------------------------------------------------------
                                    440 ;	lcdlib.c:63: void LCD_write_char(char c) {
                                    441 ;	-----------------------------------------
                                    442 ;	 function LCD_write_char
                                    443 ;	-----------------------------------------
      0009E7                        444 _LCD_write_char:
      0009E7 AF 82            [24]  445 	mov	r7,dpl
                                    446 ;	lcdlib.c:64: lcd_ready = 0;
      0009E9 75 3D 00         [24]  447 	mov	_lcd_ready,#0x00
                                    448 ;	lcdlib.c:65: DB = (c & 0xf0) | 0x08; //; keep the RS
      0009EC 74 F0            [12]  449 	mov	a,#0xf0
      0009EE 5F               [12]  450 	anl	a,r7
      0009EF 44 08            [12]  451 	orl	a,#0x08
      0009F1 F5 90            [12]  452 	mov	_P1,a
                                    453 ;	lcdlib.c:66: RS = 1;
                                    454 ;	assignBit
      0009F3 D2 93            [12]  455 	setb	_P1_3
                                    456 ;	lcdlib.c:67: E = 1;
                                    457 ;	assignBit
      0009F5 D2 92            [12]  458 	setb	_P1_2
                                    459 ;	lcdlib.c:68: E = 0;
                                    460 ;	assignBit
      0009F7 C2 92            [12]  461 	clr	_P1_2
                                    462 ;	lcdlib.c:69: DB = (c << 4) | 0x08; // keep the RS
      0009F9 EF               [12]  463 	mov	a,r7
      0009FA C4               [12]  464 	swap	a
      0009FB 54 F0            [12]  465 	anl	a,#0xf0
      0009FD FF               [12]  466 	mov	r7,a
      0009FE 74 08            [12]  467 	mov	a,#0x08
      000A00 4F               [12]  468 	orl	a,r7
      000A01 F5 90            [12]  469 	mov	_P1,a
                                    470 ;	lcdlib.c:70: E = 1;
                                    471 ;	assignBit
      000A03 D2 92            [12]  472 	setb	_P1_2
                                    473 ;	lcdlib.c:71: E = 0;
                                    474 ;	assignBit
      000A05 C2 92            [12]  475 	clr	_P1_2
                                    476 ;	lcdlib.c:72: delay(DELAY_AMOUNT);
      000A07 75 82 28         [24]  477 	mov	dpl,#0x28
      000A0A 12 0A 46         [24]  478 	lcall	_delay
                                    479 ;	lcdlib.c:73: lcd_ready = 1;
      000A0D 75 3D 01         [24]  480 	mov	_lcd_ready,#0x01
                                    481 ;	lcdlib.c:74: }
      000A10 22               [24]  482 	ret
                                    483 ;------------------------------------------------------------
                                    484 ;Allocation info for local variables in function 'LCD_write_string'
                                    485 ;------------------------------------------------------------
                                    486 ;str                       Allocated to registers 
                                    487 ;------------------------------------------------------------
                                    488 ;	lcdlib.c:76: void LCD_write_string(char* str) {
                                    489 ;	-----------------------------------------
                                    490 ;	 function LCD_write_string
                                    491 ;	-----------------------------------------
      000A11                        492 _LCD_write_string:
      000A11 AD 82            [24]  493 	mov	r5,dpl
      000A13 AE 83            [24]  494 	mov	r6,dph
      000A15 AF F0            [24]  495 	mov	r7,b
                                    496 ;	lcdlib.c:77: while (*str++) {
      000A17                        497 00101$:
      000A17 8D 82            [24]  498 	mov	dpl,r5
      000A19 8E 83            [24]  499 	mov	dph,r6
      000A1B 8F F0            [24]  500 	mov	b,r7
      000A1D 12 0C C7         [24]  501 	lcall	__gptrget
      000A20 FC               [12]  502 	mov	r4,a
      000A21 A3               [24]  503 	inc	dptr
      000A22 AD 82            [24]  504 	mov	r5,dpl
      000A24 AE 83            [24]  505 	mov	r6,dph
      000A26 EC               [12]  506 	mov	a,r4
      000A27 60 1C            [24]  507 	jz	00104$
                                    508 ;	lcdlib.c:78: LCD_write_char(*str);
      000A29 8D 82            [24]  509 	mov	dpl,r5
      000A2B 8E 83            [24]  510 	mov	dph,r6
      000A2D 8F F0            [24]  511 	mov	b,r7
      000A2F 12 0C C7         [24]  512 	lcall	__gptrget
      000A32 F5 82            [12]  513 	mov	dpl,a
      000A34 C0 07            [24]  514 	push	ar7
      000A36 C0 06            [24]  515 	push	ar6
      000A38 C0 05            [24]  516 	push	ar5
      000A3A 12 09 E7         [24]  517 	lcall	_LCD_write_char
      000A3D D0 05            [24]  518 	pop	ar5
      000A3F D0 06            [24]  519 	pop	ar6
      000A41 D0 07            [24]  520 	pop	ar7
      000A43 80 D2            [24]  521 	sjmp	00101$
      000A45                        522 00104$:
                                    523 ;	lcdlib.c:80: }
      000A45 22               [24]  524 	ret
                                    525 ;------------------------------------------------------------
                                    526 ;Allocation info for local variables in function 'delay'
                                    527 ;------------------------------------------------------------
                                    528 ;n                         Allocated to registers 
                                    529 ;------------------------------------------------------------
                                    530 ;	lcdlib.c:82: void delay(unsigned char n) {
                                    531 ;	-----------------------------------------
                                    532 ;	 function delay
                                    533 ;	-----------------------------------------
      000A46                        534 _delay:
                                    535 ;	lcdlib.c:86: __endasm;
      000A46                        536 	    dhere:
      000A46 D5 82 FD         [24]  537 	djnz	dpl, dhere
                                    538 ;	lcdlib.c:88: }
      000A49 22               [24]  539 	ret
                                    540 ;------------------------------------------------------------
                                    541 ;Allocation info for local variables in function 'LCD_set_symbol'
                                    542 ;------------------------------------------------------------
                                    543 ;symb                      Allocated with name '_LCD_set_symbol_PARM_2'
                                    544 ;code                      Allocated to registers r7 
                                    545 ;------------------------------------------------------------
                                    546 ;	lcdlib.c:90: void LCD_set_symbol(char code, const char symb[]) {
                                    547 ;	-----------------------------------------
                                    548 ;	 function LCD_set_symbol
                                    549 ;	-----------------------------------------
      000A4A                        550 _LCD_set_symbol:
      000A4A AF 82            [24]  551 	mov	r7,dpl
                                    552 ;	lcdlib.c:93: LCD_setCgRamAddress(code); // code is the character generation memory
      000A4C 74 40            [12]  553 	mov	a,#0x40
      000A4E 4F               [12]  554 	orl	a,r7
      000A4F F5 82            [12]  555 	mov	dpl,a
      000A51 12 09 9B         [24]  556 	lcall	_LCD_IRWrite
                                    557 ;	lcdlib.c:96: LCD_write_char(symb[0]);
      000A54 AD 08            [24]  558 	mov	r5,_LCD_set_symbol_PARM_2
      000A56 AE 09            [24]  559 	mov	r6,(_LCD_set_symbol_PARM_2 + 1)
      000A58 AF 0A            [24]  560 	mov	r7,(_LCD_set_symbol_PARM_2 + 2)
      000A5A 8D 82            [24]  561 	mov	dpl,r5
      000A5C 8E 83            [24]  562 	mov	dph,r6
      000A5E 8F F0            [24]  563 	mov	b,r7
      000A60 12 0C C7         [24]  564 	lcall	__gptrget
      000A63 F5 82            [12]  565 	mov	dpl,a
      000A65 C0 07            [24]  566 	push	ar7
      000A67 C0 06            [24]  567 	push	ar6
      000A69 C0 05            [24]  568 	push	ar5
      000A6B 12 09 E7         [24]  569 	lcall	_LCD_write_char
      000A6E D0 05            [24]  570 	pop	ar5
      000A70 D0 06            [24]  571 	pop	ar6
      000A72 D0 07            [24]  572 	pop	ar7
                                    573 ;	lcdlib.c:97: LCD_write_char(symb[1]);
      000A74 74 01            [12]  574 	mov	a,#0x01
      000A76 2D               [12]  575 	add	a,r5
      000A77 FA               [12]  576 	mov	r2,a
      000A78 E4               [12]  577 	clr	a
      000A79 3E               [12]  578 	addc	a,r6
      000A7A FB               [12]  579 	mov	r3,a
      000A7B 8F 04            [24]  580 	mov	ar4,r7
      000A7D 8A 82            [24]  581 	mov	dpl,r2
      000A7F 8B 83            [24]  582 	mov	dph,r3
      000A81 8C F0            [24]  583 	mov	b,r4
      000A83 12 0C C7         [24]  584 	lcall	__gptrget
      000A86 F5 82            [12]  585 	mov	dpl,a
      000A88 C0 07            [24]  586 	push	ar7
      000A8A C0 06            [24]  587 	push	ar6
      000A8C C0 05            [24]  588 	push	ar5
      000A8E 12 09 E7         [24]  589 	lcall	_LCD_write_char
      000A91 D0 05            [24]  590 	pop	ar5
      000A93 D0 06            [24]  591 	pop	ar6
      000A95 D0 07            [24]  592 	pop	ar7
                                    593 ;	lcdlib.c:98: LCD_write_char(symb[2]);
      000A97 74 02            [12]  594 	mov	a,#0x02
      000A99 2D               [12]  595 	add	a,r5
      000A9A FA               [12]  596 	mov	r2,a
      000A9B E4               [12]  597 	clr	a
      000A9C 3E               [12]  598 	addc	a,r6
      000A9D FB               [12]  599 	mov	r3,a
      000A9E 8F 04            [24]  600 	mov	ar4,r7
      000AA0 8A 82            [24]  601 	mov	dpl,r2
      000AA2 8B 83            [24]  602 	mov	dph,r3
      000AA4 8C F0            [24]  603 	mov	b,r4
      000AA6 12 0C C7         [24]  604 	lcall	__gptrget
      000AA9 F5 82            [12]  605 	mov	dpl,a
      000AAB C0 07            [24]  606 	push	ar7
      000AAD C0 06            [24]  607 	push	ar6
      000AAF C0 05            [24]  608 	push	ar5
      000AB1 12 09 E7         [24]  609 	lcall	_LCD_write_char
      000AB4 D0 05            [24]  610 	pop	ar5
      000AB6 D0 06            [24]  611 	pop	ar6
      000AB8 D0 07            [24]  612 	pop	ar7
                                    613 ;	lcdlib.c:99: LCD_write_char(symb[3]);
      000ABA 74 03            [12]  614 	mov	a,#0x03
      000ABC 2D               [12]  615 	add	a,r5
      000ABD FA               [12]  616 	mov	r2,a
      000ABE E4               [12]  617 	clr	a
      000ABF 3E               [12]  618 	addc	a,r6
      000AC0 FB               [12]  619 	mov	r3,a
      000AC1 8F 04            [24]  620 	mov	ar4,r7
      000AC3 8A 82            [24]  621 	mov	dpl,r2
      000AC5 8B 83            [24]  622 	mov	dph,r3
      000AC7 8C F0            [24]  623 	mov	b,r4
      000AC9 12 0C C7         [24]  624 	lcall	__gptrget
      000ACC F5 82            [12]  625 	mov	dpl,a
      000ACE C0 07            [24]  626 	push	ar7
      000AD0 C0 06            [24]  627 	push	ar6
      000AD2 C0 05            [24]  628 	push	ar5
      000AD4 12 09 E7         [24]  629 	lcall	_LCD_write_char
      000AD7 D0 05            [24]  630 	pop	ar5
      000AD9 D0 06            [24]  631 	pop	ar6
      000ADB D0 07            [24]  632 	pop	ar7
                                    633 ;	lcdlib.c:100: LCD_write_char(symb[4]);
      000ADD 74 04            [12]  634 	mov	a,#0x04
      000ADF 2D               [12]  635 	add	a,r5
      000AE0 FA               [12]  636 	mov	r2,a
      000AE1 E4               [12]  637 	clr	a
      000AE2 3E               [12]  638 	addc	a,r6
      000AE3 FB               [12]  639 	mov	r3,a
      000AE4 8F 04            [24]  640 	mov	ar4,r7
      000AE6 8A 82            [24]  641 	mov	dpl,r2
      000AE8 8B 83            [24]  642 	mov	dph,r3
      000AEA 8C F0            [24]  643 	mov	b,r4
      000AEC 12 0C C7         [24]  644 	lcall	__gptrget
      000AEF F5 82            [12]  645 	mov	dpl,a
      000AF1 C0 07            [24]  646 	push	ar7
      000AF3 C0 06            [24]  647 	push	ar6
      000AF5 C0 05            [24]  648 	push	ar5
      000AF7 12 09 E7         [24]  649 	lcall	_LCD_write_char
      000AFA D0 05            [24]  650 	pop	ar5
      000AFC D0 06            [24]  651 	pop	ar6
      000AFE D0 07            [24]  652 	pop	ar7
                                    653 ;	lcdlib.c:101: LCD_write_char(symb[5]);
      000B00 74 05            [12]  654 	mov	a,#0x05
      000B02 2D               [12]  655 	add	a,r5
      000B03 FA               [12]  656 	mov	r2,a
      000B04 E4               [12]  657 	clr	a
      000B05 3E               [12]  658 	addc	a,r6
      000B06 FB               [12]  659 	mov	r3,a
      000B07 8F 04            [24]  660 	mov	ar4,r7
      000B09 8A 82            [24]  661 	mov	dpl,r2
      000B0B 8B 83            [24]  662 	mov	dph,r3
      000B0D 8C F0            [24]  663 	mov	b,r4
      000B0F 12 0C C7         [24]  664 	lcall	__gptrget
      000B12 F5 82            [12]  665 	mov	dpl,a
      000B14 C0 07            [24]  666 	push	ar7
      000B16 C0 06            [24]  667 	push	ar6
      000B18 C0 05            [24]  668 	push	ar5
      000B1A 12 09 E7         [24]  669 	lcall	_LCD_write_char
      000B1D D0 05            [24]  670 	pop	ar5
      000B1F D0 06            [24]  671 	pop	ar6
      000B21 D0 07            [24]  672 	pop	ar7
                                    673 ;	lcdlib.c:102: LCD_write_char(symb[6]);
      000B23 74 06            [12]  674 	mov	a,#0x06
      000B25 2D               [12]  675 	add	a,r5
      000B26 FA               [12]  676 	mov	r2,a
      000B27 E4               [12]  677 	clr	a
      000B28 3E               [12]  678 	addc	a,r6
      000B29 FB               [12]  679 	mov	r3,a
      000B2A 8F 04            [24]  680 	mov	ar4,r7
      000B2C 8A 82            [24]  681 	mov	dpl,r2
      000B2E 8B 83            [24]  682 	mov	dph,r3
      000B30 8C F0            [24]  683 	mov	b,r4
      000B32 12 0C C7         [24]  684 	lcall	__gptrget
      000B35 F5 82            [12]  685 	mov	dpl,a
      000B37 C0 07            [24]  686 	push	ar7
      000B39 C0 06            [24]  687 	push	ar6
      000B3B C0 05            [24]  688 	push	ar5
      000B3D 12 09 E7         [24]  689 	lcall	_LCD_write_char
      000B40 D0 05            [24]  690 	pop	ar5
      000B42 D0 06            [24]  691 	pop	ar6
      000B44 D0 07            [24]  692 	pop	ar7
                                    693 ;	lcdlib.c:103: LCD_write_char(symb[7]);
      000B46 74 07            [12]  694 	mov	a,#0x07
      000B48 2D               [12]  695 	add	a,r5
      000B49 FD               [12]  696 	mov	r5,a
      000B4A E4               [12]  697 	clr	a
      000B4B 3E               [12]  698 	addc	a,r6
      000B4C FE               [12]  699 	mov	r6,a
      000B4D 8D 82            [24]  700 	mov	dpl,r5
      000B4F 8E 83            [24]  701 	mov	dph,r6
      000B51 8F F0            [24]  702 	mov	b,r7
      000B53 12 0C C7         [24]  703 	lcall	__gptrget
      000B56 F5 82            [12]  704 	mov	dpl,a
                                    705 ;	lcdlib.c:106: }
      000B58 02 09 E7         [24]  706 	ljmp	_LCD_write_char
                                    707 	.area CSEG    (CODE)
                                    708 	.area CONST   (CODE)
      000D19                        709 _dinosaur:
      000D19 07                     710 	.db #0x07	; 7
      000D1A 05                     711 	.db #0x05	; 5
      000D1B 06                     712 	.db #0x06	; 6
      000D1C 07                     713 	.db #0x07	; 7
      000D1D 14                     714 	.db #0x14	; 20
      000D1E 17                     715 	.db #0x17	; 23
      000D1F 0E                     716 	.db #0x0e	; 14
      000D20 0A                     717 	.db #0x0a	; 10
      000D21                        718 _cactus:
      000D21 04                     719 	.db #0x04	; 4
      000D22 05                     720 	.db #0x05	; 5
      000D23 15                     721 	.db #0x15	; 21
      000D24 15                     722 	.db #0x15	; 21
      000D25 16                     723 	.db #0x16	; 22
      000D26 0C                     724 	.db #0x0c	; 12
      000D27 04                     725 	.db #0x04	; 4
      000D28 04                     726 	.db #0x04	; 4
                                    727 	.area XINIT   (CODE)
                                    728 	.area CABS    (ABS,CODE)
