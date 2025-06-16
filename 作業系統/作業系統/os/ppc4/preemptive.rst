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
      00014D                        306 _Bootstrap:
                           000007   307 	ar7 = 0x07
                           000006   308 	ar6 = 0x06
                           000005   309 	ar5 = 0x05
                           000004   310 	ar4 = 0x04
                           000003   311 	ar3 = 0x03
                           000002   312 	ar2 = 0x02
                           000001   313 	ar1 = 0x01
                           000000   314 	ar0 = 0x00
                                    315 ;	preemptive.c:94: bitmap_ID = 0b0000;
      00014D 75 35 00         [24]  316 	mov	_bitmap_ID,#0x00
                                    317 ;	preemptive.c:95: cur_ID = 0;
      000150 75 34 00         [24]  318 	mov	_cur_ID,#0x00
                                    319 ;	preemptive.c:97: TMOD = 0; // set Timer 0  as mode 0
      000153 75 89 00         [24]  320 	mov	_TMOD,#0x00
                                    321 ;	preemptive.c:98: IE = 0x82; //
      000156 75 A8 82         [24]  322 	mov	_IE,#0x82
                                    323 ;	preemptive.c:99: TR0 = 1;   // start Timer 0
                                    324 ;	assignBit
      000159 D2 8C            [12]  325 	setb	_TR0
                                    326 ;	preemptive.c:101: producer = 1;
      00015B 75 38 01         [24]  327 	mov	_producer,#0x01
                                    328 ;	preemptive.c:103: cur_ID = ThreadCreate(main);
      00015E 90 01 24         [24]  329 	mov	dptr,#_main
      000161 12 01 79         [24]  330 	lcall	_ThreadCreate
      000164 85 82 34         [24]  331 	mov	_cur_ID,dpl
                                    332 ;	preemptive.c:104: RESTORESTATE;               \
      000167 E5 34            [12]  333 	mov	a,_cur_ID
      000169 24 30            [12]  334 	add	a,#_saved_SP
      00016B F9               [12]  335 	mov	r1,a
      00016C 87 81            [24]  336 	mov	_SP,@r1
      00016E D0 D0            [24]  337 	POP PSW 
      000170 D0 83            [24]  338 	POP DPH 
      000172 D0 82            [24]  339 	POP DPL 
      000174 D0 F0            [24]  340 	POP B 
      000176 D0 E0            [24]  341 	POP ACC 
      000178 22               [24]  342 	ret
                                    343 ;------------------------------------------------------------
                                    344 ;Allocation info for local variables in function 'ThreadCreate'
                                    345 ;------------------------------------------------------------
                                    346 ;fp                        Allocated to registers 
                                    347 ;------------------------------------------------------------
                                    348 ;	preemptive.c:113: ThreadID ThreadCreate(FunctionPtr fp) {
                                    349 ;	-----------------------------------------
                                    350 ;	 function ThreadCreate
                                    351 ;	-----------------------------------------
      000179                        352 _ThreadCreate:
                                    353 ;	preemptive.c:115: if (bitmap_ID == 0xF) return -1;
      000179 74 0F            [12]  354 	mov	a,#0x0f
      00017B B5 35 04         [24]  355 	cjne	a,_bitmap_ID,00102$
      00017E 75 82 FF         [24]  356 	mov	dpl,#0xff
      000181 22               [24]  357 	ret
      000182                        358 00102$:
                                    359 ;	preemptive.c:117: EA = 0;
                                    360 ;	assignBit
      000182 C2 AF            [12]  361 	clr	_EA
                                    362 ;	preemptive.c:119: temp_SP = SP; // 保存當前堆棧指針
      000184 85 81 36         [24]  363 	mov	_temp_SP,_SP
                                    364 ;	preemptive.c:121: if (!(bitmap_ID & 0x1)) {
      000187 E5 35            [12]  365 	mov	a,_bitmap_ID
      000189 20 E0 08         [24]  366 	jb	acc.0,00112$
                                    367 ;	preemptive.c:122: bitmap_ID |= 0x1;
      00018C 43 35 01         [24]  368 	orl	_bitmap_ID,#0x01
                                    369 ;	preemptive.c:123: new_ID = 0;
      00018F 75 37 00         [24]  370 	mov	_new_ID,#0x00
      000192 80 25            [24]  371 	sjmp	00113$
      000194                        372 00112$:
                                    373 ;	preemptive.c:124: } else if (!(bitmap_ID & 0x2)) {
      000194 E5 35            [12]  374 	mov	a,_bitmap_ID
      000196 20 E1 08         [24]  375 	jb	acc.1,00109$
                                    376 ;	preemptive.c:125: bitmap_ID |= 0x2;
      000199 43 35 02         [24]  377 	orl	_bitmap_ID,#0x02
                                    378 ;	preemptive.c:126: new_ID = 1;
      00019C 75 37 01         [24]  379 	mov	_new_ID,#0x01
      00019F 80 18            [24]  380 	sjmp	00113$
      0001A1                        381 00109$:
                                    382 ;	preemptive.c:127: } else if (!(bitmap_ID & 0x4)) {
      0001A1 E5 35            [12]  383 	mov	a,_bitmap_ID
      0001A3 20 E2 08         [24]  384 	jb	acc.2,00106$
                                    385 ;	preemptive.c:128: bitmap_ID |= 0x4;
      0001A6 43 35 04         [24]  386 	orl	_bitmap_ID,#0x04
                                    387 ;	preemptive.c:129: new_ID = 2;
      0001A9 75 37 02         [24]  388 	mov	_new_ID,#0x02
      0001AC 80 0B            [24]  389 	sjmp	00113$
      0001AE                        390 00106$:
                                    391 ;	preemptive.c:130: } else if (!(bitmap_ID & 0x8)) {
      0001AE E5 35            [12]  392 	mov	a,_bitmap_ID
      0001B0 20 E3 06         [24]  393 	jb	acc.3,00113$
                                    394 ;	preemptive.c:131: bitmap_ID |= 0x8;
      0001B3 43 35 08         [24]  395 	orl	_bitmap_ID,#0x08
                                    396 ;	preemptive.c:132: new_ID = 3;
      0001B6 75 37 03         [24]  397 	mov	_new_ID,#0x03
      0001B9                        398 00113$:
                                    399 ;	preemptive.c:135: SP = 0x3F + (new_ID * 0x10); 
      0001B9 E5 37            [12]  400 	mov	a,_new_ID
      0001BB C4               [12]  401 	swap	a
      0001BC 54 F0            [12]  402 	anl	a,#0xf0
      0001BE FF               [12]  403 	mov	r7,a
      0001BF 24 3F            [12]  404 	add	a,#0x3f
      0001C1 F5 81            [12]  405 	mov	_SP,a
                                    406 ;	preemptive.c:142: __endasm;
      0001C3 E5 82            [12]  407 	MOV	A, DPL
      0001C5 C0 E0            [24]  408 	PUSH	A
      0001C7 E5 83            [12]  409 	MOV	A, DPH
      0001C9 C0 E0            [24]  410 	PUSH	A
                                    411 ;	preemptive.c:150: __endasm;
      0001CB 74 00            [12]  412 	MOV	A, #0x00
      0001CD C0 E0            [24]  413 	PUSH	A
      0001CF C0 E0            [24]  414 	PUSH	A
      0001D1 C0 E0            [24]  415 	PUSH	A
      0001D3 C0 E0            [24]  416 	PUSH	A
                                    417 ;	preemptive.c:152: PSW = (new_ID << 3); 
      0001D5 E5 37            [12]  418 	mov	a,_new_ID
      0001D7 FF               [12]  419 	mov	r7,a
      0001D8 C4               [12]  420 	swap	a
      0001D9 03               [12]  421 	rr	a
      0001DA 54 F8            [12]  422 	anl	a,#0xf8
      0001DC F5 D0            [12]  423 	mov	_PSW,a
                                    424 ;	preemptive.c:156: __endasm;
      0001DE C0 D0            [24]  425 	PUSH	PSW
                                    426 ;	preemptive.c:158: saved_SP[new_ID] = SP;           
      0001E0 E5 37            [12]  427 	mov	a,_new_ID
      0001E2 24 30            [12]  428 	add	a,#_saved_SP
      0001E4 F8               [12]  429 	mov	r0,a
      0001E5 A6 81            [24]  430 	mov	@r0,_SP
                                    431 ;	preemptive.c:160: SP = temp_SP;                    
      0001E7 85 36 81         [24]  432 	mov	_SP,_temp_SP
                                    433 ;	preemptive.c:162: EA = 1;
                                    434 ;	assignBit
      0001EA D2 AF            [12]  435 	setb	_EA
                                    436 ;	preemptive.c:164: return new_ID;                   //
      0001EC 85 37 82         [24]  437 	mov	dpl,_new_ID
                                    438 ;	preemptive.c:165: }
      0001EF 22               [24]  439 	ret
                                    440 ;------------------------------------------------------------
                                    441 ;Allocation info for local variables in function 'ThreadYield'
                                    442 ;------------------------------------------------------------
                                    443 ;	preemptive.c:176: void ThreadYield(void) {
                                    444 ;	-----------------------------------------
                                    445 ;	 function ThreadYield
                                    446 ;	-----------------------------------------
      0001F0                        447 _ThreadYield:
                                    448 ;	preemptive.c:199: } 
      0001F0 7F 01            [12]  449 	mov	r7,#0x01
      0001F2 10 AF 02         [24]  450 	jbc	ea,00216$
      0001F5 7F 00            [12]  451 	mov	r7,#0x00
      0001F7                        452 00216$:
                                    453 ;	preemptive.c:178: SAVESTATE; 
      0001F7 C0 E0            [24]  454 	PUSH ACC 
      0001F9 C0 F0            [24]  455 	PUSH B 
      0001FB C0 82            [24]  456 	PUSH DPL 
      0001FD C0 83            [24]  457 	PUSH DPH 
      0001FF C0 D0            [24]  458 	PUSH PSW 
      000201 E5 34            [12]  459 	mov	a,_cur_ID
      000203 24 30            [12]  460 	add	a,#_saved_SP
      000205 F8               [12]  461 	mov	r0,a
      000206 A6 81            [24]  462 	mov	@r0,_SP
                                    463 ;	preemptive.c:179: if (bitmap_ID) {
      000208 E5 35            [12]  464 	mov	a,_bitmap_ID
      00020A 70 03            [24]  465 	jnz	00217$
      00020C 02 02 AF         [24]  466 	ljmp	00145$
      00020F                        467 00217$:
                                    468 ;	preemptive.c:180: if (cur_ID == 0) {
      00020F E5 34            [12]  469 	mov	a,_cur_ID
      000211 70 24            [24]  470 	jnz	00142$
                                    471 ;	preemptive.c:181: if (bitmap_ID & 0x2) cur_ID = 1;
      000213 E5 35            [12]  472 	mov	a,_bitmap_ID
      000215 30 E1 06         [24]  473 	jnb	acc.1,00107$
      000218 75 34 01         [24]  474 	mov	_cur_ID,#0x01
      00021B 02 02 9E         [24]  475 	ljmp	00143$
      00021E                        476 00107$:
                                    477 ;	preemptive.c:182: else if (bitmap_ID & 0x4) cur_ID = 2;
      00021E E5 35            [12]  478 	mov	a,_bitmap_ID
      000220 30 E2 06         [24]  479 	jnb	acc.2,00104$
      000223 75 34 02         [24]  480 	mov	_cur_ID,#0x02
      000226 02 02 9E         [24]  481 	ljmp	00143$
      000229                        482 00104$:
                                    483 ;	preemptive.c:183: else if (bitmap_ID & 0x8) cur_ID = 3;
      000229 E5 35            [12]  484 	mov	a,_bitmap_ID
      00022B 20 E3 03         [24]  485 	jb	acc.3,00221$
      00022E 02 02 9E         [24]  486 	ljmp	00143$
      000231                        487 00221$:
      000231 75 34 03         [24]  488 	mov	_cur_ID,#0x03
      000234 02 02 9E         [24]  489 	ljmp	00143$
      000237                        490 00142$:
                                    491 ;	preemptive.c:184: } else if (cur_ID == 1) {
      000237 74 01            [12]  492 	mov	a,#0x01
      000239 B5 34 1E         [24]  493 	cjne	a,_cur_ID,00139$
                                    494 ;	preemptive.c:185: if (bitmap_ID & 0x4) cur_ID = 2;
      00023C E5 35            [12]  495 	mov	a,_bitmap_ID
      00023E 30 E2 05         [24]  496 	jnb	acc.2,00115$
      000241 75 34 02         [24]  497 	mov	_cur_ID,#0x02
      000244 80 58            [24]  498 	sjmp	00143$
      000246                        499 00115$:
                                    500 ;	preemptive.c:186: else if (bitmap_ID & 0x8) cur_ID = 3;
      000246 E5 35            [12]  501 	mov	a,_bitmap_ID
      000248 30 E3 05         [24]  502 	jnb	acc.3,00112$
      00024B 75 34 03         [24]  503 	mov	_cur_ID,#0x03
      00024E 80 4E            [24]  504 	sjmp	00143$
      000250                        505 00112$:
                                    506 ;	preemptive.c:187: else if (bitmap_ID & 0x1) cur_ID = 0;
      000250 E5 35            [12]  507 	mov	a,_bitmap_ID
      000252 30 E0 49         [24]  508 	jnb	acc.0,00143$
      000255 75 34 00         [24]  509 	mov	_cur_ID,#0x00
      000258 80 44            [24]  510 	sjmp	00143$
      00025A                        511 00139$:
                                    512 ;	preemptive.c:188: } else if (cur_ID == 2) {
      00025A 74 02            [12]  513 	mov	a,#0x02
      00025C B5 34 1E         [24]  514 	cjne	a,_cur_ID,00136$
                                    515 ;	preemptive.c:189: if (bitmap_ID & 0x8) cur_ID = 3;
      00025F E5 35            [12]  516 	mov	a,_bitmap_ID
      000261 30 E3 05         [24]  517 	jnb	acc.3,00123$
      000264 75 34 03         [24]  518 	mov	_cur_ID,#0x03
      000267 80 35            [24]  519 	sjmp	00143$
      000269                        520 00123$:
                                    521 ;	preemptive.c:190: else if (bitmap_ID & 0x1) cur_ID = 0;
      000269 E5 35            [12]  522 	mov	a,_bitmap_ID
      00026B 30 E0 05         [24]  523 	jnb	acc.0,00120$
      00026E 75 34 00         [24]  524 	mov	_cur_ID,#0x00
      000271 80 2B            [24]  525 	sjmp	00143$
      000273                        526 00120$:
                                    527 ;	preemptive.c:191: else if (bitmap_ID & 0x2) cur_ID = 1;
      000273 E5 35            [12]  528 	mov	a,_bitmap_ID
      000275 30 E1 26         [24]  529 	jnb	acc.1,00143$
      000278 75 34 01         [24]  530 	mov	_cur_ID,#0x01
      00027B 80 21            [24]  531 	sjmp	00143$
      00027D                        532 00136$:
                                    533 ;	preemptive.c:192: } else if (cur_ID == 3) {
      00027D 74 03            [12]  534 	mov	a,#0x03
      00027F B5 34 1C         [24]  535 	cjne	a,_cur_ID,00143$
                                    536 ;	preemptive.c:193: if (bitmap_ID & 0x1) cur_ID = 0;
      000282 E5 35            [12]  537 	mov	a,_bitmap_ID
      000284 30 E0 05         [24]  538 	jnb	acc.0,00131$
      000287 75 34 00         [24]  539 	mov	_cur_ID,#0x00
      00028A 80 12            [24]  540 	sjmp	00143$
      00028C                        541 00131$:
                                    542 ;	preemptive.c:194: else if (bitmap_ID & 0x2) cur_ID = 1;
      00028C E5 35            [12]  543 	mov	a,_bitmap_ID
      00028E 30 E1 05         [24]  544 	jnb	acc.1,00128$
      000291 75 34 01         [24]  545 	mov	_cur_ID,#0x01
      000294 80 08            [24]  546 	sjmp	00143$
      000296                        547 00128$:
                                    548 ;	preemptive.c:195: else if (bitmap_ID & 0x4) cur_ID = 2;
      000296 E5 35            [12]  549 	mov	a,_bitmap_ID
      000298 30 E2 03         [24]  550 	jnb	acc.2,00143$
      00029B 75 34 02         [24]  551 	mov	_cur_ID,#0x02
      00029E                        552 00143$:
                                    553 ;	preemptive.c:197: RESTORESTATE;
      00029E E5 34            [12]  554 	mov	a,_cur_ID
      0002A0 24 30            [12]  555 	add	a,#_saved_SP
      0002A2 F9               [12]  556 	mov	r1,a
      0002A3 87 81            [24]  557 	mov	_SP,@r1
      0002A5 D0 D0            [24]  558 	POP PSW 
      0002A7 D0 83            [24]  559 	POP DPH 
      0002A9 D0 82            [24]  560 	POP DPL 
      0002AB D0 F0            [24]  561 	POP B 
      0002AD D0 E0            [24]  562 	POP ACC 
      0002AF                        563 00145$:
      0002AF EF               [12]  564 	mov	a,r7
      0002B0 13               [12]  565 	rrc	a
      0002B1 92 AF            [24]  566 	mov	ea,c
                                    567 ;	preemptive.c:200: }
      0002B3 22               [24]  568 	ret
                                    569 ;------------------------------------------------------------
                                    570 ;Allocation info for local variables in function 'myTimer0Handler'
                                    571 ;------------------------------------------------------------
                                    572 ;	preemptive.c:202: void myTimer0Handler(void) {
                                    573 ;	-----------------------------------------
                                    574 ;	 function myTimer0Handler
                                    575 ;	-----------------------------------------
      0002B4                        576 _myTimer0Handler:
                                    577 ;	preemptive.c:203: EA = 0;
                                    578 ;	assignBit
      0002B4 C2 AF            [12]  579 	clr	_EA
                                    580 ;	preemptive.c:204: SAVESTATE;
      0002B6 C0 E0            [24]  581 	PUSH ACC 
      0002B8 C0 F0            [24]  582 	PUSH B 
      0002BA C0 82            [24]  583 	PUSH DPL 
      0002BC C0 83            [24]  584 	PUSH DPH 
      0002BE C0 D0            [24]  585 	PUSH PSW 
      0002C0 E5 34            [12]  586 	mov	a,_cur_ID
      0002C2 24 30            [12]  587 	add	a,#_saved_SP
      0002C4 F8               [12]  588 	mov	r0,a
      0002C5 A6 81            [24]  589 	mov	@r0,_SP
                                    590 ;	preemptive.c:206: if(&bitmap_ID) {
      0002C7 74 35            [12]  591 	mov	a,#_bitmap_ID
      0002C9 60 23            [24]  592 	jz	00110$
                                    593 ;	preemptive.c:207: P1 = cur_ID; 
      0002CB 85 34 90         [24]  594 	mov	_P1,_cur_ID
                                    595 ;	preemptive.c:208: if (cur_ID == 0) {
      0002CE E5 34            [12]  596 	mov	a,_cur_ID
      0002D0 70 19            [24]  597 	jnz	00107$
                                    598 ;	preemptive.c:209: if(producer == 1) {
      0002D2 74 01            [12]  599 	mov	a,#0x01
      0002D4 B5 38 08         [24]  600 	cjne	a,_producer,00104$
                                    601 ;	preemptive.c:210: cur_ID = 1;
      0002D7 75 34 01         [24]  602 	mov	_cur_ID,#0x01
                                    603 ;	preemptive.c:211: producer = 0;
      0002DA 75 38 00         [24]  604 	mov	_producer,#0x00
      0002DD 80 0F            [24]  605 	sjmp	00110$
      0002DF                        606 00104$:
                                    607 ;	preemptive.c:213: else if(producer == 0){
      0002DF E5 38            [12]  608 	mov	a,_producer
      0002E1 70 0B            [24]  609 	jnz	00110$
                                    610 ;	preemptive.c:214: cur_ID = 2;
      0002E3 75 34 02         [24]  611 	mov	_cur_ID,#0x02
                                    612 ;	preemptive.c:215: producer = 1;
      0002E6 75 38 01         [24]  613 	mov	_producer,#0x01
      0002E9 80 03            [24]  614 	sjmp	00110$
      0002EB                        615 00107$:
                                    616 ;	preemptive.c:219: cur_ID = 0;
      0002EB 75 34 00         [24]  617 	mov	_cur_ID,#0x00
      0002EE                        618 00110$:
                                    619 ;	preemptive.c:222: RESTORESTATE; 
      0002EE E5 34            [12]  620 	mov	a,_cur_ID
      0002F0 24 30            [12]  621 	add	a,#_saved_SP
      0002F2 F9               [12]  622 	mov	r1,a
      0002F3 87 81            [24]  623 	mov	_SP,@r1
      0002F5 D0 D0            [24]  624 	POP PSW 
      0002F7 D0 83            [24]  625 	POP DPH 
      0002F9 D0 82            [24]  626 	POP DPL 
      0002FB D0 F0            [24]  627 	POP B 
      0002FD D0 E0            [24]  628 	POP ACC 
                                    629 ;	preemptive.c:223: EA = 1;
                                    630 ;	assignBit
      0002FF D2 AF            [12]  631 	setb	_EA
                                    632 ;	preemptive.c:226: __endasm;
      000301 32               [24]  633 	RETI
                                    634 ;	preemptive.c:227: }
      000302 22               [24]  635 	ret
                                    636 ;------------------------------------------------------------
                                    637 ;Allocation info for local variables in function 'ThreadExit'
                                    638 ;------------------------------------------------------------
                                    639 ;	preemptive.c:236: void ThreadExit(void) {
                                    640 ;	-----------------------------------------
                                    641 ;	 function ThreadExit
                                    642 ;	-----------------------------------------
      000303                        643 _ThreadExit:
                                    644 ;	preemptive.c:259: }
      000303 7F 01            [12]  645 	mov	r7,#0x01
      000305 10 AF 02         [24]  646 	jbc	ea,00216$
      000308 7F 00            [12]  647 	mov	r7,#0x00
      00030A                        648 00216$:
                                    649 ;	preemptive.c:238: bitmap_ID &= ~(1 << cur_ID); // 清除當前線程位
      00030A AE 34            [24]  650 	mov	r6,_cur_ID
      00030C 8E F0            [24]  651 	mov	b,r6
      00030E 05 F0            [12]  652 	inc	b
      000310 74 01            [12]  653 	mov	a,#0x01
      000312 80 02            [24]  654 	sjmp	00219$
      000314                        655 00217$:
      000314 25 E0            [12]  656 	add	a,acc
      000316                        657 00219$:
      000316 D5 F0 FB         [24]  658 	djnz	b,00217$
      000319 F4               [12]  659 	cpl	a
      00031A FE               [12]  660 	mov	r6,a
      00031B AD 35            [24]  661 	mov	r5,_bitmap_ID
      00031D 5D               [12]  662 	anl	a,r5
      00031E F5 35            [12]  663 	mov	_bitmap_ID,a
                                    664 ;	preemptive.c:239: if (bitmap_ID){
      000320 E5 35            [12]  665 	mov	a,_bitmap_ID
      000322 70 03            [24]  666 	jnz	00220$
      000324 02 03 C2         [24]  667 	ljmp	00145$
      000327                        668 00220$:
                                    669 ;	preemptive.c:240: if (cur_ID == 0) {
      000327 E5 34            [12]  670 	mov	a,_cur_ID
      000329 70 1F            [24]  671 	jnz	00142$
                                    672 ;	preemptive.c:241: if (bitmap_ID & 0x2) cur_ID = 1;
      00032B E5 35            [12]  673 	mov	a,_bitmap_ID
      00032D 30 E1 06         [24]  674 	jnb	acc.1,00107$
      000330 75 34 01         [24]  675 	mov	_cur_ID,#0x01
      000333 02 03 B1         [24]  676 	ljmp	00143$
      000336                        677 00107$:
                                    678 ;	preemptive.c:242: else if (bitmap_ID & 0x4) cur_ID = 2;
      000336 E5 35            [12]  679 	mov	a,_bitmap_ID
      000338 30 E2 05         [24]  680 	jnb	acc.2,00104$
      00033B 75 34 02         [24]  681 	mov	_cur_ID,#0x02
      00033E 80 71            [24]  682 	sjmp	00143$
      000340                        683 00104$:
                                    684 ;	preemptive.c:243: else if (bitmap_ID & 0x8) cur_ID = 3;
      000340 E5 35            [12]  685 	mov	a,_bitmap_ID
      000342 30 E3 6C         [24]  686 	jnb	acc.3,00143$
      000345 75 34 03         [24]  687 	mov	_cur_ID,#0x03
      000348 80 67            [24]  688 	sjmp	00143$
      00034A                        689 00142$:
                                    690 ;	preemptive.c:244: } else if (cur_ID == 1) {
      00034A 74 01            [12]  691 	mov	a,#0x01
      00034C B5 34 1E         [24]  692 	cjne	a,_cur_ID,00139$
                                    693 ;	preemptive.c:245: if (bitmap_ID & 0x4) cur_ID = 2;
      00034F E5 35            [12]  694 	mov	a,_bitmap_ID
      000351 30 E2 05         [24]  695 	jnb	acc.2,00115$
      000354 75 34 02         [24]  696 	mov	_cur_ID,#0x02
      000357 80 58            [24]  697 	sjmp	00143$
      000359                        698 00115$:
                                    699 ;	preemptive.c:246: else if (bitmap_ID & 0x8) cur_ID = 3;
      000359 E5 35            [12]  700 	mov	a,_bitmap_ID
      00035B 30 E3 05         [24]  701 	jnb	acc.3,00112$
      00035E 75 34 03         [24]  702 	mov	_cur_ID,#0x03
      000361 80 4E            [24]  703 	sjmp	00143$
      000363                        704 00112$:
                                    705 ;	preemptive.c:247: else if (bitmap_ID & 0x1) cur_ID = 0;
      000363 E5 35            [12]  706 	mov	a,_bitmap_ID
      000365 30 E0 49         [24]  707 	jnb	acc.0,00143$
      000368 75 34 00         [24]  708 	mov	_cur_ID,#0x00
      00036B 80 44            [24]  709 	sjmp	00143$
      00036D                        710 00139$:
                                    711 ;	preemptive.c:248: } else if (cur_ID == 2) {
      00036D 74 02            [12]  712 	mov	a,#0x02
      00036F B5 34 1E         [24]  713 	cjne	a,_cur_ID,00136$
                                    714 ;	preemptive.c:249: if (bitmap_ID & 0x8) cur_ID = 3;
      000372 E5 35            [12]  715 	mov	a,_bitmap_ID
      000374 30 E3 05         [24]  716 	jnb	acc.3,00123$
      000377 75 34 03         [24]  717 	mov	_cur_ID,#0x03
      00037A 80 35            [24]  718 	sjmp	00143$
      00037C                        719 00123$:
                                    720 ;	preemptive.c:250: else if (bitmap_ID & 0x1) cur_ID = 0;
      00037C E5 35            [12]  721 	mov	a,_bitmap_ID
      00037E 30 E0 05         [24]  722 	jnb	acc.0,00120$
      000381 75 34 00         [24]  723 	mov	_cur_ID,#0x00
      000384 80 2B            [24]  724 	sjmp	00143$
      000386                        725 00120$:
                                    726 ;	preemptive.c:251: else if (bitmap_ID & 0x2) cur_ID = 1;
      000386 E5 35            [12]  727 	mov	a,_bitmap_ID
      000388 30 E1 26         [24]  728 	jnb	acc.1,00143$
      00038B 75 34 01         [24]  729 	mov	_cur_ID,#0x01
      00038E 80 21            [24]  730 	sjmp	00143$
      000390                        731 00136$:
                                    732 ;	preemptive.c:252: } else if (cur_ID == 3) {
      000390 74 03            [12]  733 	mov	a,#0x03
      000392 B5 34 1C         [24]  734 	cjne	a,_cur_ID,00143$
                                    735 ;	preemptive.c:253: if (bitmap_ID & 0x1) cur_ID = 0;
      000395 E5 35            [12]  736 	mov	a,_bitmap_ID
      000397 30 E0 05         [24]  737 	jnb	acc.0,00131$
      00039A 75 34 00         [24]  738 	mov	_cur_ID,#0x00
      00039D 80 12            [24]  739 	sjmp	00143$
      00039F                        740 00131$:
                                    741 ;	preemptive.c:254: else if (bitmap_ID & 0x2) cur_ID = 1;
      00039F E5 35            [12]  742 	mov	a,_bitmap_ID
      0003A1 30 E1 05         [24]  743 	jnb	acc.1,00128$
      0003A4 75 34 01         [24]  744 	mov	_cur_ID,#0x01
      0003A7 80 08            [24]  745 	sjmp	00143$
      0003A9                        746 00128$:
                                    747 ;	preemptive.c:255: else if (bitmap_ID & 0x4) cur_ID = 2;
      0003A9 E5 35            [12]  748 	mov	a,_bitmap_ID
      0003AB 30 E2 03         [24]  749 	jnb	acc.2,00143$
      0003AE 75 34 02         [24]  750 	mov	_cur_ID,#0x02
      0003B1                        751 00143$:
                                    752 ;	preemptive.c:257: RESTORESTATE;
      0003B1 E5 34            [12]  753 	mov	a,_cur_ID
      0003B3 24 30            [12]  754 	add	a,#_saved_SP
      0003B5 F9               [12]  755 	mov	r1,a
      0003B6 87 81            [24]  756 	mov	_SP,@r1
      0003B8 D0 D0            [24]  757 	POP PSW 
      0003BA D0 83            [24]  758 	POP DPH 
      0003BC D0 82            [24]  759 	POP DPL 
      0003BE D0 F0            [24]  760 	POP B 
      0003C0 D0 E0            [24]  761 	POP ACC 
      0003C2                        762 00145$:
      0003C2 EF               [12]  763 	mov	a,r7
      0003C3 13               [12]  764 	rrc	a
      0003C4 92 AF            [24]  765 	mov	ea,c
                                    766 ;	preemptive.c:260: }
      0003C6 22               [24]  767 	ret
                                    768 	.area CSEG    (CODE)
                                    769 	.area CONST   (CODE)
                                    770 	.area XINIT   (CODE)
                                    771 	.area CABS    (ABS,CODE)
