                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
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
                                    109 	.globl _producer
                                    110 	.globl _new_ID
                                    111 	.globl _temp_SP
                                    112 	.globl _bitmap_ID
                                    113 	.globl _cur_ID
                                    114 	.globl _saved_SP
                                    115 	.globl _ThreadCreate
                                    116 	.globl _ThreadYield
                                    117 	.globl _myTimer0Handler
                                    118 	.globl _ThreadExit
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
                           000030   234 _saved_SP	=	0x0030
                           000034   235 _cur_ID	=	0x0034
                           000035   236 _bitmap_ID	=	0x0035
                           000036   237 _temp_SP	=	0x0036
                           000037   238 _new_ID	=	0x0037
                           000038   239 _producer	=	0x0038
                                    240 ;--------------------------------------------------------
                                    241 ; overlayable items in internal ram 
                                    242 ;--------------------------------------------------------
                                    243 	.area	OSEG    (OVR,DATA)
                                    244 ;--------------------------------------------------------
                                    245 ; indirectly addressable internal ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area ISEG    (DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; absolute internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area IABS    (ABS,DATA)
                                    252 	.area IABS    (ABS,DATA)
                                    253 ;--------------------------------------------------------
                                    254 ; bit data
                                    255 ;--------------------------------------------------------
                                    256 	.area BSEG    (BIT)
                                    257 ;--------------------------------------------------------
                                    258 ; paged external ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area PSEG    (PAG,XDATA)
                                    261 ;--------------------------------------------------------
                                    262 ; external ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area XSEG    (XDATA)
                                    265 ;--------------------------------------------------------
                                    266 ; absolute external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area XABS    (ABS,XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; external initialized ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XISEG   (XDATA)
                                    273 	.area HOME    (CODE)
                                    274 	.area GSINIT0 (CODE)
                                    275 	.area GSINIT1 (CODE)
                                    276 	.area GSINIT2 (CODE)
                                    277 	.area GSINIT3 (CODE)
                                    278 	.area GSINIT4 (CODE)
                                    279 	.area GSINIT5 (CODE)
                                    280 	.area GSINIT  (CODE)
                                    281 	.area GSFINAL (CODE)
                                    282 	.area CSEG    (CODE)
                                    283 ;--------------------------------------------------------
                                    284 ; global & static initialisations
                                    285 ;--------------------------------------------------------
                                    286 	.area HOME    (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area GSINIT  (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; Home
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
                                    294 	.area HOME    (CODE)
                                    295 ;--------------------------------------------------------
                                    296 ; code
                                    297 ;--------------------------------------------------------
                                    298 	.area CSEG    (CODE)
                                    299 ;------------------------------------------------------------
                                    300 ;Allocation info for local variables in function 'Bootstrap'
                                    301 ;------------------------------------------------------------
                                    302 ;	preemptive.c:80: void Bootstrap(void)
                                    303 ;	-----------------------------------------
                                    304 ;	 function Bootstrap
                                    305 ;	-----------------------------------------
      0006EC                        306 _Bootstrap:
                           000007   307 	ar7 = 0x07
                           000006   308 	ar6 = 0x06
                           000005   309 	ar5 = 0x05
                           000004   310 	ar4 = 0x04
                           000003   311 	ar3 = 0x03
                           000002   312 	ar2 = 0x02
                           000001   313 	ar1 = 0x01
                           000000   314 	ar0 = 0x00
                                    315 ;	preemptive.c:94: bitmap_ID = 0b0000;
      0006EC 75 35 00         [24]  316 	mov	_bitmap_ID,#0x00
                                    317 ;	preemptive.c:95: cur_ID = 0;
      0006EF 75 34 00         [24]  318 	mov	_cur_ID,#0x00
                                    319 ;	preemptive.c:97: TMOD = 0; // set Timer 0  as mode 0
      0006F2 75 89 00         [24]  320 	mov	_TMOD,#0x00
                                    321 ;	preemptive.c:98: IE = 0x82; //
      0006F5 75 A8 82         [24]  322 	mov	_IE,#0x82
                                    323 ;	preemptive.c:99: TR0 = 1;   // start Timer 0
                                    324 ;	assignBit
      0006F8 D2 8C            [12]  325 	setb	_TR0
                                    326 ;	preemptive.c:101: producer = 1;
      0006FA 75 38 01         [24]  327 	mov	_producer,#0x01
                                    328 ;	preemptive.c:103: cur_ID = ThreadCreate(main);
      0006FD 90 06 47         [24]  329 	mov	dptr,#_main
      000700 12 07 18         [24]  330 	lcall	_ThreadCreate
      000703 85 82 34         [24]  331 	mov	_cur_ID,dpl
                                    332 ;	preemptive.c:104: RESTORESTATE;               \
      000706 E5 34            [12]  333 	mov	a,_cur_ID
      000708 24 30            [12]  334 	add	a,#_saved_SP
      00070A F9               [12]  335 	mov	r1,a
      00070B 87 81            [24]  336 	mov	_SP,@r1
      00070D D0 D0            [24]  337 	POP PSW 
      00070F D0 83            [24]  338 	POP DPH 
      000711 D0 82            [24]  339 	POP DPL 
      000713 D0 F0            [24]  340 	POP B 
      000715 D0 E0            [24]  341 	POP ACC 
      000717 22               [24]  342 	ret
                                    343 ;------------------------------------------------------------
                                    344 ;Allocation info for local variables in function 'ThreadCreate'
                                    345 ;------------------------------------------------------------
                                    346 ;fp                        Allocated to registers 
                                    347 ;------------------------------------------------------------
                                    348 ;	preemptive.c:113: ThreadID ThreadCreate(FunctionPtr fp) {
                                    349 ;	-----------------------------------------
                                    350 ;	 function ThreadCreate
                                    351 ;	-----------------------------------------
      000718                        352 _ThreadCreate:
                                    353 ;	preemptive.c:115: if (bitmap_ID == 0xF) return -1;
      000718 74 0F            [12]  354 	mov	a,#0x0f
      00071A B5 35 04         [24]  355 	cjne	a,_bitmap_ID,00102$
      00071D 75 82 FF         [24]  356 	mov	dpl,#0xff
      000720 22               [24]  357 	ret
      000721                        358 00102$:
                                    359 ;	preemptive.c:117: EA = 0;
                                    360 ;	assignBit
      000721 C2 AF            [12]  361 	clr	_EA
                                    362 ;	preemptive.c:119: temp_SP = SP; // 保存當前堆棧指針
      000723 85 81 36         [24]  363 	mov	_temp_SP,_SP
                                    364 ;	preemptive.c:121: if (!(bitmap_ID & 0x1)) {
      000726 E5 35            [12]  365 	mov	a,_bitmap_ID
      000728 20 E0 08         [24]  366 	jb	acc.0,00112$
                                    367 ;	preemptive.c:122: bitmap_ID |= 0x1;
      00072B 43 35 01         [24]  368 	orl	_bitmap_ID,#0x01
                                    369 ;	preemptive.c:123: new_ID = 0;
      00072E 75 37 00         [24]  370 	mov	_new_ID,#0x00
      000731 80 25            [24]  371 	sjmp	00113$
      000733                        372 00112$:
                                    373 ;	preemptive.c:124: } else if (!(bitmap_ID & 0x2)) {
      000733 E5 35            [12]  374 	mov	a,_bitmap_ID
      000735 20 E1 08         [24]  375 	jb	acc.1,00109$
                                    376 ;	preemptive.c:125: bitmap_ID |= 0x2;
      000738 43 35 02         [24]  377 	orl	_bitmap_ID,#0x02
                                    378 ;	preemptive.c:126: new_ID = 1;
      00073B 75 37 01         [24]  379 	mov	_new_ID,#0x01
      00073E 80 18            [24]  380 	sjmp	00113$
      000740                        381 00109$:
                                    382 ;	preemptive.c:127: } else if (!(bitmap_ID & 0x4)) {
      000740 E5 35            [12]  383 	mov	a,_bitmap_ID
      000742 20 E2 08         [24]  384 	jb	acc.2,00106$
                                    385 ;	preemptive.c:128: bitmap_ID |= 0x4;
      000745 43 35 04         [24]  386 	orl	_bitmap_ID,#0x04
                                    387 ;	preemptive.c:129: new_ID = 2;
      000748 75 37 02         [24]  388 	mov	_new_ID,#0x02
      00074B 80 0B            [24]  389 	sjmp	00113$
      00074D                        390 00106$:
                                    391 ;	preemptive.c:130: } else if (!(bitmap_ID & 0x8)) {
      00074D E5 35            [12]  392 	mov	a,_bitmap_ID
      00074F 20 E3 06         [24]  393 	jb	acc.3,00113$
                                    394 ;	preemptive.c:131: bitmap_ID |= 0x8;
      000752 43 35 08         [24]  395 	orl	_bitmap_ID,#0x08
                                    396 ;	preemptive.c:132: new_ID = 3;
      000755 75 37 03         [24]  397 	mov	_new_ID,#0x03
      000758                        398 00113$:
                                    399 ;	preemptive.c:135: SP = 0x3F + (new_ID * 0x10); 
      000758 E5 37            [12]  400 	mov	a,_new_ID
      00075A C4               [12]  401 	swap	a
      00075B 54 F0            [12]  402 	anl	a,#0xf0
      00075D FF               [12]  403 	mov	r7,a
      00075E 24 3F            [12]  404 	add	a,#0x3f
      000760 F5 81            [12]  405 	mov	_SP,a
                                    406 ;	preemptive.c:142: __endasm;
      000762 E5 82            [12]  407 	MOV	A, DPL
      000764 C0 E0            [24]  408 	PUSH	A
      000766 E5 83            [12]  409 	MOV	A, DPH
      000768 C0 E0            [24]  410 	PUSH	A
                                    411 ;	preemptive.c:150: __endasm;
      00076A 74 00            [12]  412 	MOV	A, #0x00
      00076C C0 E0            [24]  413 	PUSH	A
      00076E C0 E0            [24]  414 	PUSH	A
      000770 C0 E0            [24]  415 	PUSH	A
      000772 C0 E0            [24]  416 	PUSH	A
                                    417 ;	preemptive.c:152: PSW = (new_ID << 3); 
      000774 E5 37            [12]  418 	mov	a,_new_ID
      000776 FF               [12]  419 	mov	r7,a
      000777 C4               [12]  420 	swap	a
      000778 03               [12]  421 	rr	a
      000779 54 F8            [12]  422 	anl	a,#0xf8
      00077B F5 D0            [12]  423 	mov	_PSW,a
                                    424 ;	preemptive.c:156: __endasm;
      00077D C0 D0            [24]  425 	PUSH	PSW
                                    426 ;	preemptive.c:158: saved_SP[new_ID] = SP;           
      00077F E5 37            [12]  427 	mov	a,_new_ID
      000781 24 30            [12]  428 	add	a,#_saved_SP
      000783 F8               [12]  429 	mov	r0,a
      000784 A6 81            [24]  430 	mov	@r0,_SP
                                    431 ;	preemptive.c:160: SP = temp_SP;                    
      000786 85 36 81         [24]  432 	mov	_SP,_temp_SP
                                    433 ;	preemptive.c:162: EA = 1;
                                    434 ;	assignBit
      000789 D2 AF            [12]  435 	setb	_EA
                                    436 ;	preemptive.c:164: return new_ID;                   //
      00078B 85 37 82         [24]  437 	mov	dpl,_new_ID
                                    438 ;	preemptive.c:165: }
      00078E 22               [24]  439 	ret
                                    440 ;------------------------------------------------------------
                                    441 ;Allocation info for local variables in function 'ThreadYield'
                                    442 ;------------------------------------------------------------
                                    443 ;	preemptive.c:176: void ThreadYield(void) {
                                    444 ;	-----------------------------------------
                                    445 ;	 function ThreadYield
                                    446 ;	-----------------------------------------
      00078F                        447 _ThreadYield:
                                    448 ;	preemptive.c:199: } 
      00078F 7F 01            [12]  449 	mov	r7,#0x01
      000791 10 AF 02         [24]  450 	jbc	ea,00216$
      000794 7F 00            [12]  451 	mov	r7,#0x00
      000796                        452 00216$:
                                    453 ;	preemptive.c:178: SAVESTATE; 
      000796 C0 E0            [24]  454 	PUSH ACC 
      000798 C0 F0            [24]  455 	PUSH B 
      00079A C0 82            [24]  456 	PUSH DPL 
      00079C C0 83            [24]  457 	PUSH DPH 
      00079E C0 D0            [24]  458 	PUSH PSW 
      0007A0 E5 34            [12]  459 	mov	a,_cur_ID
      0007A2 24 30            [12]  460 	add	a,#_saved_SP
      0007A4 F8               [12]  461 	mov	r0,a
      0007A5 A6 81            [24]  462 	mov	@r0,_SP
                                    463 ;	preemptive.c:179: if (bitmap_ID) {
      0007A7 E5 35            [12]  464 	mov	a,_bitmap_ID
      0007A9 70 03            [24]  465 	jnz	00217$
      0007AB 02 08 4E         [24]  466 	ljmp	00145$
      0007AE                        467 00217$:
                                    468 ;	preemptive.c:180: if (cur_ID == 0) {
      0007AE E5 34            [12]  469 	mov	a,_cur_ID
      0007B0 70 24            [24]  470 	jnz	00142$
                                    471 ;	preemptive.c:181: if (bitmap_ID & 0x2) cur_ID = 1;
      0007B2 E5 35            [12]  472 	mov	a,_bitmap_ID
      0007B4 30 E1 06         [24]  473 	jnb	acc.1,00107$
      0007B7 75 34 01         [24]  474 	mov	_cur_ID,#0x01
      0007BA 02 08 3D         [24]  475 	ljmp	00143$
      0007BD                        476 00107$:
                                    477 ;	preemptive.c:182: else if (bitmap_ID & 0x4) cur_ID = 2;
      0007BD E5 35            [12]  478 	mov	a,_bitmap_ID
      0007BF 30 E2 06         [24]  479 	jnb	acc.2,00104$
      0007C2 75 34 02         [24]  480 	mov	_cur_ID,#0x02
      0007C5 02 08 3D         [24]  481 	ljmp	00143$
      0007C8                        482 00104$:
                                    483 ;	preemptive.c:183: else if (bitmap_ID & 0x8) cur_ID = 3;
      0007C8 E5 35            [12]  484 	mov	a,_bitmap_ID
      0007CA 20 E3 03         [24]  485 	jb	acc.3,00221$
      0007CD 02 08 3D         [24]  486 	ljmp	00143$
      0007D0                        487 00221$:
      0007D0 75 34 03         [24]  488 	mov	_cur_ID,#0x03
      0007D3 02 08 3D         [24]  489 	ljmp	00143$
      0007D6                        490 00142$:
                                    491 ;	preemptive.c:184: } else if (cur_ID == 1) {
      0007D6 74 01            [12]  492 	mov	a,#0x01
      0007D8 B5 34 1E         [24]  493 	cjne	a,_cur_ID,00139$
                                    494 ;	preemptive.c:185: if (bitmap_ID & 0x4) cur_ID = 2;
      0007DB E5 35            [12]  495 	mov	a,_bitmap_ID
      0007DD 30 E2 05         [24]  496 	jnb	acc.2,00115$
      0007E0 75 34 02         [24]  497 	mov	_cur_ID,#0x02
      0007E3 80 58            [24]  498 	sjmp	00143$
      0007E5                        499 00115$:
                                    500 ;	preemptive.c:186: else if (bitmap_ID & 0x8) cur_ID = 3;
      0007E5 E5 35            [12]  501 	mov	a,_bitmap_ID
      0007E7 30 E3 05         [24]  502 	jnb	acc.3,00112$
      0007EA 75 34 03         [24]  503 	mov	_cur_ID,#0x03
      0007ED 80 4E            [24]  504 	sjmp	00143$
      0007EF                        505 00112$:
                                    506 ;	preemptive.c:187: else if (bitmap_ID & 0x1) cur_ID = 0;
      0007EF E5 35            [12]  507 	mov	a,_bitmap_ID
      0007F1 30 E0 49         [24]  508 	jnb	acc.0,00143$
      0007F4 75 34 00         [24]  509 	mov	_cur_ID,#0x00
      0007F7 80 44            [24]  510 	sjmp	00143$
      0007F9                        511 00139$:
                                    512 ;	preemptive.c:188: } else if (cur_ID == 2) {
      0007F9 74 02            [12]  513 	mov	a,#0x02
      0007FB B5 34 1E         [24]  514 	cjne	a,_cur_ID,00136$
                                    515 ;	preemptive.c:189: if (bitmap_ID & 0x8) cur_ID = 3;
      0007FE E5 35            [12]  516 	mov	a,_bitmap_ID
      000800 30 E3 05         [24]  517 	jnb	acc.3,00123$
      000803 75 34 03         [24]  518 	mov	_cur_ID,#0x03
      000806 80 35            [24]  519 	sjmp	00143$
      000808                        520 00123$:
                                    521 ;	preemptive.c:190: else if (bitmap_ID & 0x1) cur_ID = 0;
      000808 E5 35            [12]  522 	mov	a,_bitmap_ID
      00080A 30 E0 05         [24]  523 	jnb	acc.0,00120$
      00080D 75 34 00         [24]  524 	mov	_cur_ID,#0x00
      000810 80 2B            [24]  525 	sjmp	00143$
      000812                        526 00120$:
                                    527 ;	preemptive.c:191: else if (bitmap_ID & 0x2) cur_ID = 1;
      000812 E5 35            [12]  528 	mov	a,_bitmap_ID
      000814 30 E1 26         [24]  529 	jnb	acc.1,00143$
      000817 75 34 01         [24]  530 	mov	_cur_ID,#0x01
      00081A 80 21            [24]  531 	sjmp	00143$
      00081C                        532 00136$:
                                    533 ;	preemptive.c:192: } else if (cur_ID == 3) {
      00081C 74 03            [12]  534 	mov	a,#0x03
      00081E B5 34 1C         [24]  535 	cjne	a,_cur_ID,00143$
                                    536 ;	preemptive.c:193: if (bitmap_ID & 0x1) cur_ID = 0;
      000821 E5 35            [12]  537 	mov	a,_bitmap_ID
      000823 30 E0 05         [24]  538 	jnb	acc.0,00131$
      000826 75 34 00         [24]  539 	mov	_cur_ID,#0x00
      000829 80 12            [24]  540 	sjmp	00143$
      00082B                        541 00131$:
                                    542 ;	preemptive.c:194: else if (bitmap_ID & 0x2) cur_ID = 1;
      00082B E5 35            [12]  543 	mov	a,_bitmap_ID
      00082D 30 E1 05         [24]  544 	jnb	acc.1,00128$
      000830 75 34 01         [24]  545 	mov	_cur_ID,#0x01
      000833 80 08            [24]  546 	sjmp	00143$
      000835                        547 00128$:
                                    548 ;	preemptive.c:195: else if (bitmap_ID & 0x4) cur_ID = 2;
      000835 E5 35            [12]  549 	mov	a,_bitmap_ID
      000837 30 E2 03         [24]  550 	jnb	acc.2,00143$
      00083A 75 34 02         [24]  551 	mov	_cur_ID,#0x02
      00083D                        552 00143$:
                                    553 ;	preemptive.c:197: RESTORESTATE;
      00083D E5 34            [12]  554 	mov	a,_cur_ID
      00083F 24 30            [12]  555 	add	a,#_saved_SP
      000841 F9               [12]  556 	mov	r1,a
      000842 87 81            [24]  557 	mov	_SP,@r1
      000844 D0 D0            [24]  558 	POP PSW 
      000846 D0 83            [24]  559 	POP DPH 
      000848 D0 82            [24]  560 	POP DPL 
      00084A D0 F0            [24]  561 	POP B 
      00084C D0 E0            [24]  562 	POP ACC 
      00084E                        563 00145$:
      00084E EF               [12]  564 	mov	a,r7
      00084F 13               [12]  565 	rrc	a
      000850 92 AF            [24]  566 	mov	ea,c
                                    567 ;	preemptive.c:200: }
      000852 22               [24]  568 	ret
                                    569 ;------------------------------------------------------------
                                    570 ;Allocation info for local variables in function 'myTimer0Handler'
                                    571 ;------------------------------------------------------------
                                    572 ;	preemptive.c:202: void myTimer0Handler(void) {
                                    573 ;	-----------------------------------------
                                    574 ;	 function myTimer0Handler
                                    575 ;	-----------------------------------------
      000853                        576 _myTimer0Handler:
                                    577 ;	preemptive.c:203: EA = 0;
                                    578 ;	assignBit
      000853 C2 AF            [12]  579 	clr	_EA
                                    580 ;	preemptive.c:204: SAVESTATE;
      000855 C0 E0            [24]  581 	PUSH ACC 
      000857 C0 F0            [24]  582 	PUSH B 
      000859 C0 82            [24]  583 	PUSH DPL 
      00085B C0 83            [24]  584 	PUSH DPH 
      00085D C0 D0            [24]  585 	PUSH PSW 
      00085F E5 34            [12]  586 	mov	a,_cur_ID
      000861 24 30            [12]  587 	add	a,#_saved_SP
      000863 F8               [12]  588 	mov	r0,a
      000864 A6 81            [24]  589 	mov	@r0,_SP
                                    590 ;	preemptive.c:206: if(&bitmap_ID) {
      000866 74 35            [12]  591 	mov	a,#_bitmap_ID
      000868 60 23            [24]  592 	jz	00110$
                                    593 ;	preemptive.c:207: P1 = cur_ID; 
      00086A 85 34 90         [24]  594 	mov	_P1,_cur_ID
                                    595 ;	preemptive.c:208: if (cur_ID == 0) {
      00086D E5 34            [12]  596 	mov	a,_cur_ID
      00086F 70 19            [24]  597 	jnz	00107$
                                    598 ;	preemptive.c:209: if(producer == 1) {
      000871 74 01            [12]  599 	mov	a,#0x01
      000873 B5 38 08         [24]  600 	cjne	a,_producer,00104$
                                    601 ;	preemptive.c:210: cur_ID = 1;
      000876 75 34 01         [24]  602 	mov	_cur_ID,#0x01
                                    603 ;	preemptive.c:211: producer = 0;
      000879 75 38 00         [24]  604 	mov	_producer,#0x00
      00087C 80 0F            [24]  605 	sjmp	00110$
      00087E                        606 00104$:
                                    607 ;	preemptive.c:213: else if(producer == 0){
      00087E E5 38            [12]  608 	mov	a,_producer
      000880 70 0B            [24]  609 	jnz	00110$
                                    610 ;	preemptive.c:214: cur_ID = 2;
      000882 75 34 02         [24]  611 	mov	_cur_ID,#0x02
                                    612 ;	preemptive.c:215: producer = 1;
      000885 75 38 01         [24]  613 	mov	_producer,#0x01
      000888 80 03            [24]  614 	sjmp	00110$
      00088A                        615 00107$:
                                    616 ;	preemptive.c:219: cur_ID = 0;
      00088A 75 34 00         [24]  617 	mov	_cur_ID,#0x00
      00088D                        618 00110$:
                                    619 ;	preemptive.c:222: RESTORESTATE; 
      00088D E5 34            [12]  620 	mov	a,_cur_ID
      00088F 24 30            [12]  621 	add	a,#_saved_SP
      000891 F9               [12]  622 	mov	r1,a
      000892 87 81            [24]  623 	mov	_SP,@r1
      000894 D0 D0            [24]  624 	POP PSW 
      000896 D0 83            [24]  625 	POP DPH 
      000898 D0 82            [24]  626 	POP DPL 
      00089A D0 F0            [24]  627 	POP B 
      00089C D0 E0            [24]  628 	POP ACC 
                                    629 ;	preemptive.c:223: EA = 1;
                                    630 ;	assignBit
      00089E D2 AF            [12]  631 	setb	_EA
                                    632 ;	preemptive.c:226: __endasm;
      0008A0 32               [24]  633 	RETI
                                    634 ;	preemptive.c:227: }
      0008A1 22               [24]  635 	ret
                                    636 ;------------------------------------------------------------
                                    637 ;Allocation info for local variables in function 'ThreadExit'
                                    638 ;------------------------------------------------------------
                                    639 ;	preemptive.c:236: void ThreadExit(void) {
                                    640 ;	-----------------------------------------
                                    641 ;	 function ThreadExit
                                    642 ;	-----------------------------------------
      0008A2                        643 _ThreadExit:
                                    644 ;	preemptive.c:259: }
      0008A2 7F 01            [12]  645 	mov	r7,#0x01
      0008A4 10 AF 02         [24]  646 	jbc	ea,00216$
      0008A7 7F 00            [12]  647 	mov	r7,#0x00
      0008A9                        648 00216$:
                                    649 ;	preemptive.c:238: bitmap_ID &= ~(1 << cur_ID); // 清除當前線程位
      0008A9 AE 34            [24]  650 	mov	r6,_cur_ID
      0008AB 8E F0            [24]  651 	mov	b,r6
      0008AD 05 F0            [12]  652 	inc	b
      0008AF 74 01            [12]  653 	mov	a,#0x01
      0008B1 80 02            [24]  654 	sjmp	00219$
      0008B3                        655 00217$:
      0008B3 25 E0            [12]  656 	add	a,acc
      0008B5                        657 00219$:
      0008B5 D5 F0 FB         [24]  658 	djnz	b,00217$
      0008B8 F4               [12]  659 	cpl	a
      0008B9 FE               [12]  660 	mov	r6,a
      0008BA AD 35            [24]  661 	mov	r5,_bitmap_ID
      0008BC 5D               [12]  662 	anl	a,r5
      0008BD F5 35            [12]  663 	mov	_bitmap_ID,a
                                    664 ;	preemptive.c:239: if (bitmap_ID){
      0008BF E5 35            [12]  665 	mov	a,_bitmap_ID
      0008C1 70 03            [24]  666 	jnz	00220$
      0008C3 02 09 61         [24]  667 	ljmp	00145$
      0008C6                        668 00220$:
                                    669 ;	preemptive.c:240: if (cur_ID == 0) {
      0008C6 E5 34            [12]  670 	mov	a,_cur_ID
      0008C8 70 1F            [24]  671 	jnz	00142$
                                    672 ;	preemptive.c:241: if (bitmap_ID & 0x2) cur_ID = 1;
      0008CA E5 35            [12]  673 	mov	a,_bitmap_ID
      0008CC 30 E1 06         [24]  674 	jnb	acc.1,00107$
      0008CF 75 34 01         [24]  675 	mov	_cur_ID,#0x01
      0008D2 02 09 50         [24]  676 	ljmp	00143$
      0008D5                        677 00107$:
                                    678 ;	preemptive.c:242: else if (bitmap_ID & 0x4) cur_ID = 2;
      0008D5 E5 35            [12]  679 	mov	a,_bitmap_ID
      0008D7 30 E2 05         [24]  680 	jnb	acc.2,00104$
      0008DA 75 34 02         [24]  681 	mov	_cur_ID,#0x02
      0008DD 80 71            [24]  682 	sjmp	00143$
      0008DF                        683 00104$:
                                    684 ;	preemptive.c:243: else if (bitmap_ID & 0x8) cur_ID = 3;
      0008DF E5 35            [12]  685 	mov	a,_bitmap_ID
      0008E1 30 E3 6C         [24]  686 	jnb	acc.3,00143$
      0008E4 75 34 03         [24]  687 	mov	_cur_ID,#0x03
      0008E7 80 67            [24]  688 	sjmp	00143$
      0008E9                        689 00142$:
                                    690 ;	preemptive.c:244: } else if (cur_ID == 1) {
      0008E9 74 01            [12]  691 	mov	a,#0x01
      0008EB B5 34 1E         [24]  692 	cjne	a,_cur_ID,00139$
                                    693 ;	preemptive.c:245: if (bitmap_ID & 0x4) cur_ID = 2;
      0008EE E5 35            [12]  694 	mov	a,_bitmap_ID
      0008F0 30 E2 05         [24]  695 	jnb	acc.2,00115$
      0008F3 75 34 02         [24]  696 	mov	_cur_ID,#0x02
      0008F6 80 58            [24]  697 	sjmp	00143$
      0008F8                        698 00115$:
                                    699 ;	preemptive.c:246: else if (bitmap_ID & 0x8) cur_ID = 3;
      0008F8 E5 35            [12]  700 	mov	a,_bitmap_ID
      0008FA 30 E3 05         [24]  701 	jnb	acc.3,00112$
      0008FD 75 34 03         [24]  702 	mov	_cur_ID,#0x03
      000900 80 4E            [24]  703 	sjmp	00143$
      000902                        704 00112$:
                                    705 ;	preemptive.c:247: else if (bitmap_ID & 0x1) cur_ID = 0;
      000902 E5 35            [12]  706 	mov	a,_bitmap_ID
      000904 30 E0 49         [24]  707 	jnb	acc.0,00143$
      000907 75 34 00         [24]  708 	mov	_cur_ID,#0x00
      00090A 80 44            [24]  709 	sjmp	00143$
      00090C                        710 00139$:
                                    711 ;	preemptive.c:248: } else if (cur_ID == 2) {
      00090C 74 02            [12]  712 	mov	a,#0x02
      00090E B5 34 1E         [24]  713 	cjne	a,_cur_ID,00136$
                                    714 ;	preemptive.c:249: if (bitmap_ID & 0x8) cur_ID = 3;
      000911 E5 35            [12]  715 	mov	a,_bitmap_ID
      000913 30 E3 05         [24]  716 	jnb	acc.3,00123$
      000916 75 34 03         [24]  717 	mov	_cur_ID,#0x03
      000919 80 35            [24]  718 	sjmp	00143$
      00091B                        719 00123$:
                                    720 ;	preemptive.c:250: else if (bitmap_ID & 0x1) cur_ID = 0;
      00091B E5 35            [12]  721 	mov	a,_bitmap_ID
      00091D 30 E0 05         [24]  722 	jnb	acc.0,00120$
      000920 75 34 00         [24]  723 	mov	_cur_ID,#0x00
      000923 80 2B            [24]  724 	sjmp	00143$
      000925                        725 00120$:
                                    726 ;	preemptive.c:251: else if (bitmap_ID & 0x2) cur_ID = 1;
      000925 E5 35            [12]  727 	mov	a,_bitmap_ID
      000927 30 E1 26         [24]  728 	jnb	acc.1,00143$
      00092A 75 34 01         [24]  729 	mov	_cur_ID,#0x01
      00092D 80 21            [24]  730 	sjmp	00143$
      00092F                        731 00136$:
                                    732 ;	preemptive.c:252: } else if (cur_ID == 3) {
      00092F 74 03            [12]  733 	mov	a,#0x03
      000931 B5 34 1C         [24]  734 	cjne	a,_cur_ID,00143$
                                    735 ;	preemptive.c:253: if (bitmap_ID & 0x1) cur_ID = 0;
      000934 E5 35            [12]  736 	mov	a,_bitmap_ID
      000936 30 E0 05         [24]  737 	jnb	acc.0,00131$
      000939 75 34 00         [24]  738 	mov	_cur_ID,#0x00
      00093C 80 12            [24]  739 	sjmp	00143$
      00093E                        740 00131$:
                                    741 ;	preemptive.c:254: else if (bitmap_ID & 0x2) cur_ID = 1;
      00093E E5 35            [12]  742 	mov	a,_bitmap_ID
      000940 30 E1 05         [24]  743 	jnb	acc.1,00128$
      000943 75 34 01         [24]  744 	mov	_cur_ID,#0x01
      000946 80 08            [24]  745 	sjmp	00143$
      000948                        746 00128$:
                                    747 ;	preemptive.c:255: else if (bitmap_ID & 0x4) cur_ID = 2;
      000948 E5 35            [12]  748 	mov	a,_bitmap_ID
      00094A 30 E2 03         [24]  749 	jnb	acc.2,00143$
      00094D 75 34 02         [24]  750 	mov	_cur_ID,#0x02
      000950                        751 00143$:
                                    752 ;	preemptive.c:257: RESTORESTATE;
      000950 E5 34            [12]  753 	mov	a,_cur_ID
      000952 24 30            [12]  754 	add	a,#_saved_SP
      000954 F9               [12]  755 	mov	r1,a
      000955 87 81            [24]  756 	mov	_SP,@r1
      000957 D0 D0            [24]  757 	POP PSW 
      000959 D0 83            [24]  758 	POP DPH 
      00095B D0 82            [24]  759 	POP DPL 
      00095D D0 F0            [24]  760 	POP B 
      00095F D0 E0            [24]  761 	POP ACC 
      000961                        762 00145$:
      000961 EF               [12]  763 	mov	a,r7
      000962 13               [12]  764 	rrc	a
      000963 92 AF            [24]  765 	mov	ea,c
                                    766 ;	preemptive.c:260: }
      000965 22               [24]  767 	ret
                                    768 	.area CSEG    (CODE)
                                    769 	.area CONST   (CODE)
                                    770 	.area XINIT   (CODE)
                                    771 	.area CABS    (ABS,CODE)
