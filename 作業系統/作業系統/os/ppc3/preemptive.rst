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
                                    109 	.globl _new_ID
                                    110 	.globl _temp_SP
                                    111 	.globl _bitmap_ID
                                    112 	.globl _cur_ID
                                    113 	.globl _saved_SP
                                    114 	.globl _ThreadCreate
                                    115 	.globl _ThreadYield
                                    116 	.globl _myTimer0Handler
                                    117 	.globl _ThreadExit
                                    118 ;--------------------------------------------------------
                                    119 ; special function registers
                                    120 ;--------------------------------------------------------
                                    121 	.area RSEG    (ABS,DATA)
      000000                        122 	.org 0x0000
                           000080   123 _P0	=	0x0080
                           000081   124 _SP	=	0x0081
                           000082   125 _DPL	=	0x0082
                           000083   126 _DPH	=	0x0083
                           000087   127 _PCON	=	0x0087
                           000088   128 _TCON	=	0x0088
                           000089   129 _TMOD	=	0x0089
                           00008A   130 _TL0	=	0x008a
                           00008B   131 _TL1	=	0x008b
                           00008C   132 _TH0	=	0x008c
                           00008D   133 _TH1	=	0x008d
                           000090   134 _P1	=	0x0090
                           000098   135 _SCON	=	0x0098
                           000099   136 _SBUF	=	0x0099
                           0000A0   137 _P2	=	0x00a0
                           0000A8   138 _IE	=	0x00a8
                           0000B0   139 _P3	=	0x00b0
                           0000B8   140 _IP	=	0x00b8
                           0000D0   141 _PSW	=	0x00d0
                           0000E0   142 _ACC	=	0x00e0
                           0000F0   143 _B	=	0x00f0
                                    144 ;--------------------------------------------------------
                                    145 ; special function bits
                                    146 ;--------------------------------------------------------
                                    147 	.area RSEG    (ABS,DATA)
      000000                        148 	.org 0x0000
                           000080   149 _P0_0	=	0x0080
                           000081   150 _P0_1	=	0x0081
                           000082   151 _P0_2	=	0x0082
                           000083   152 _P0_3	=	0x0083
                           000084   153 _P0_4	=	0x0084
                           000085   154 _P0_5	=	0x0085
                           000086   155 _P0_6	=	0x0086
                           000087   156 _P0_7	=	0x0087
                           000088   157 _IT0	=	0x0088
                           000089   158 _IE0	=	0x0089
                           00008A   159 _IT1	=	0x008a
                           00008B   160 _IE1	=	0x008b
                           00008C   161 _TR0	=	0x008c
                           00008D   162 _TF0	=	0x008d
                           00008E   163 _TR1	=	0x008e
                           00008F   164 _TF1	=	0x008f
                           000090   165 _P1_0	=	0x0090
                           000091   166 _P1_1	=	0x0091
                           000092   167 _P1_2	=	0x0092
                           000093   168 _P1_3	=	0x0093
                           000094   169 _P1_4	=	0x0094
                           000095   170 _P1_5	=	0x0095
                           000096   171 _P1_6	=	0x0096
                           000097   172 _P1_7	=	0x0097
                           000098   173 _RI	=	0x0098
                           000099   174 _TI	=	0x0099
                           00009A   175 _RB8	=	0x009a
                           00009B   176 _TB8	=	0x009b
                           00009C   177 _REN	=	0x009c
                           00009D   178 _SM2	=	0x009d
                           00009E   179 _SM1	=	0x009e
                           00009F   180 _SM0	=	0x009f
                           0000A0   181 _P2_0	=	0x00a0
                           0000A1   182 _P2_1	=	0x00a1
                           0000A2   183 _P2_2	=	0x00a2
                           0000A3   184 _P2_3	=	0x00a3
                           0000A4   185 _P2_4	=	0x00a4
                           0000A5   186 _P2_5	=	0x00a5
                           0000A6   187 _P2_6	=	0x00a6
                           0000A7   188 _P2_7	=	0x00a7
                           0000A8   189 _EX0	=	0x00a8
                           0000A9   190 _ET0	=	0x00a9
                           0000AA   191 _EX1	=	0x00aa
                           0000AB   192 _ET1	=	0x00ab
                           0000AC   193 _ES	=	0x00ac
                           0000AF   194 _EA	=	0x00af
                           0000B0   195 _P3_0	=	0x00b0
                           0000B1   196 _P3_1	=	0x00b1
                           0000B2   197 _P3_2	=	0x00b2
                           0000B3   198 _P3_3	=	0x00b3
                           0000B4   199 _P3_4	=	0x00b4
                           0000B5   200 _P3_5	=	0x00b5
                           0000B6   201 _P3_6	=	0x00b6
                           0000B7   202 _P3_7	=	0x00b7
                           0000B0   203 _RXD	=	0x00b0
                           0000B1   204 _TXD	=	0x00b1
                           0000B2   205 _INT0	=	0x00b2
                           0000B3   206 _INT1	=	0x00b3
                           0000B4   207 _T0	=	0x00b4
                           0000B5   208 _T1	=	0x00b5
                           0000B6   209 _WR	=	0x00b6
                           0000B7   210 _RD	=	0x00b7
                           0000B8   211 _PX0	=	0x00b8
                           0000B9   212 _PT0	=	0x00b9
                           0000BA   213 _PX1	=	0x00ba
                           0000BB   214 _PT1	=	0x00bb
                           0000BC   215 _PS	=	0x00bc
                           0000D0   216 _P	=	0x00d0
                           0000D1   217 _F1	=	0x00d1
                           0000D2   218 _OV	=	0x00d2
                           0000D3   219 _RS0	=	0x00d3
                           0000D4   220 _RS1	=	0x00d4
                           0000D5   221 _F0	=	0x00d5
                           0000D6   222 _AC	=	0x00d6
                           0000D7   223 _CY	=	0x00d7
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable register banks
                                    226 ;--------------------------------------------------------
                                    227 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        228 	.ds 8
                                    229 ;--------------------------------------------------------
                                    230 ; internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area DSEG    (DATA)
                           000030   233 _saved_SP	=	0x0030
                           000034   234 _cur_ID	=	0x0034
                           000035   235 _bitmap_ID	=	0x0035
                           000036   236 _temp_SP	=	0x0036
                           000037   237 _new_ID	=	0x0037
                                    238 ;--------------------------------------------------------
                                    239 ; overlayable items in internal ram 
                                    240 ;--------------------------------------------------------
                                    241 	.area	OSEG    (OVR,DATA)
                                    242 ;--------------------------------------------------------
                                    243 ; indirectly addressable internal ram data
                                    244 ;--------------------------------------------------------
                                    245 	.area ISEG    (DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; absolute internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area IABS    (ABS,DATA)
                                    250 	.area IABS    (ABS,DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; bit data
                                    253 ;--------------------------------------------------------
                                    254 	.area BSEG    (BIT)
                                    255 ;--------------------------------------------------------
                                    256 ; paged external ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area PSEG    (PAG,XDATA)
                                    259 ;--------------------------------------------------------
                                    260 ; external ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area XSEG    (XDATA)
                                    263 ;--------------------------------------------------------
                                    264 ; absolute external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area XABS    (ABS,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; external initialized ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XISEG   (XDATA)
                                    271 	.area HOME    (CODE)
                                    272 	.area GSINIT0 (CODE)
                                    273 	.area GSINIT1 (CODE)
                                    274 	.area GSINIT2 (CODE)
                                    275 	.area GSINIT3 (CODE)
                                    276 	.area GSINIT4 (CODE)
                                    277 	.area GSINIT5 (CODE)
                                    278 	.area GSINIT  (CODE)
                                    279 	.area GSFINAL (CODE)
                                    280 	.area CSEG    (CODE)
                                    281 ;--------------------------------------------------------
                                    282 ; global & static initialisations
                                    283 ;--------------------------------------------------------
                                    284 	.area HOME    (CODE)
                                    285 	.area GSINIT  (CODE)
                                    286 	.area GSFINAL (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 ;--------------------------------------------------------
                                    289 ; Home
                                    290 ;--------------------------------------------------------
                                    291 	.area HOME    (CODE)
                                    292 	.area HOME    (CODE)
                                    293 ;--------------------------------------------------------
                                    294 ; code
                                    295 ;--------------------------------------------------------
                                    296 	.area CSEG    (CODE)
                                    297 ;------------------------------------------------------------
                                    298 ;Allocation info for local variables in function 'Bootstrap'
                                    299 ;------------------------------------------------------------
                                    300 ;	preemptive.c:79: void Bootstrap(void)
                                    301 ;	-----------------------------------------
                                    302 ;	 function Bootstrap
                                    303 ;	-----------------------------------------
      0000E7                        304 _Bootstrap:
                           000007   305 	ar7 = 0x07
                           000006   306 	ar6 = 0x06
                           000005   307 	ar5 = 0x05
                           000004   308 	ar4 = 0x04
                           000003   309 	ar3 = 0x03
                           000002   310 	ar2 = 0x02
                           000001   311 	ar1 = 0x01
                           000000   312 	ar0 = 0x00
                                    313 ;	preemptive.c:93: bitmap_ID = 0b0000;
      0000E7 75 35 00         [24]  314 	mov	_bitmap_ID,#0x00
                                    315 ;	preemptive.c:94: cur_ID = 0;
      0000EA 75 34 00         [24]  316 	mov	_cur_ID,#0x00
                                    317 ;	preemptive.c:96: TMOD = 0; // set Timer 0  as mode 0
      0000ED 75 89 00         [24]  318 	mov	_TMOD,#0x00
                                    319 ;	preemptive.c:97: IE = 0x82; //
      0000F0 75 A8 82         [24]  320 	mov	_IE,#0x82
                                    321 ;	preemptive.c:98: TR0 = 1;   // start Timer 0
                                    322 ;	assignBit
      0000F3 D2 8C            [12]  323 	setb	_TR0
                                    324 ;	preemptive.c:100: cur_ID = ThreadCreate(main);
      0000F5 90 00 C4         [24]  325 	mov	dptr,#_main
      0000F8 12 01 10         [24]  326 	lcall	_ThreadCreate
      0000FB 85 82 34         [24]  327 	mov	_cur_ID,dpl
                                    328 ;	preemptive.c:101: RESTORESTATE;               \
      0000FE E5 34            [12]  329 	mov	a,_cur_ID
      000100 24 30            [12]  330 	add	a,#_saved_SP
      000102 F9               [12]  331 	mov	r1,a
      000103 87 81            [24]  332 	mov	_SP,@r1
      000105 D0 D0            [24]  333 	POP PSW 
      000107 D0 83            [24]  334 	POP DPH 
      000109 D0 82            [24]  335 	POP DPL 
      00010B D0 F0            [24]  336 	POP B 
      00010D D0 E0            [24]  337 	POP ACC 
      00010F 22               [24]  338 	ret
                                    339 ;------------------------------------------------------------
                                    340 ;Allocation info for local variables in function 'ThreadCreate'
                                    341 ;------------------------------------------------------------
                                    342 ;fp                        Allocated to registers 
                                    343 ;------------------------------------------------------------
                                    344 ;	preemptive.c:110: ThreadID ThreadCreate(FunctionPtr fp) {
                                    345 ;	-----------------------------------------
                                    346 ;	 function ThreadCreate
                                    347 ;	-----------------------------------------
      000110                        348 _ThreadCreate:
                                    349 ;	preemptive.c:112: if (bitmap_ID == 0xF) return -1;
      000110 74 0F            [12]  350 	mov	a,#0x0f
      000112 B5 35 04         [24]  351 	cjne	a,_bitmap_ID,00102$
      000115 75 82 FF         [24]  352 	mov	dpl,#0xff
      000118 22               [24]  353 	ret
      000119                        354 00102$:
                                    355 ;	preemptive.c:114: EA = 0;
                                    356 ;	assignBit
      000119 C2 AF            [12]  357 	clr	_EA
                                    358 ;	preemptive.c:116: temp_SP = SP; // 保存當前堆棧指針
      00011B 85 81 36         [24]  359 	mov	_temp_SP,_SP
                                    360 ;	preemptive.c:118: if (!(bitmap_ID & 0x1)) {
      00011E E5 35            [12]  361 	mov	a,_bitmap_ID
      000120 20 E0 08         [24]  362 	jb	acc.0,00112$
                                    363 ;	preemptive.c:119: bitmap_ID |= 0x1;
      000123 43 35 01         [24]  364 	orl	_bitmap_ID,#0x01
                                    365 ;	preemptive.c:120: new_ID = 0;
      000126 75 37 00         [24]  366 	mov	_new_ID,#0x00
      000129 80 25            [24]  367 	sjmp	00113$
      00012B                        368 00112$:
                                    369 ;	preemptive.c:121: } else if (!(bitmap_ID & 0x2)) {
      00012B E5 35            [12]  370 	mov	a,_bitmap_ID
      00012D 20 E1 08         [24]  371 	jb	acc.1,00109$
                                    372 ;	preemptive.c:122: bitmap_ID |= 0x2;
      000130 43 35 02         [24]  373 	orl	_bitmap_ID,#0x02
                                    374 ;	preemptive.c:123: new_ID = 1;
      000133 75 37 01         [24]  375 	mov	_new_ID,#0x01
      000136 80 18            [24]  376 	sjmp	00113$
      000138                        377 00109$:
                                    378 ;	preemptive.c:124: } else if (!(bitmap_ID & 0x4)) {
      000138 E5 35            [12]  379 	mov	a,_bitmap_ID
      00013A 20 E2 08         [24]  380 	jb	acc.2,00106$
                                    381 ;	preemptive.c:125: bitmap_ID |= 0x4;
      00013D 43 35 04         [24]  382 	orl	_bitmap_ID,#0x04
                                    383 ;	preemptive.c:126: new_ID = 2;
      000140 75 37 02         [24]  384 	mov	_new_ID,#0x02
      000143 80 0B            [24]  385 	sjmp	00113$
      000145                        386 00106$:
                                    387 ;	preemptive.c:127: } else if (!(bitmap_ID & 0x8)) {
      000145 E5 35            [12]  388 	mov	a,_bitmap_ID
      000147 20 E3 06         [24]  389 	jb	acc.3,00113$
                                    390 ;	preemptive.c:128: bitmap_ID |= 0x8;
      00014A 43 35 08         [24]  391 	orl	_bitmap_ID,#0x08
                                    392 ;	preemptive.c:129: new_ID = 3;
      00014D 75 37 03         [24]  393 	mov	_new_ID,#0x03
      000150                        394 00113$:
                                    395 ;	preemptive.c:132: SP = 0x3F + (new_ID * 0x10); 
      000150 E5 37            [12]  396 	mov	a,_new_ID
      000152 C4               [12]  397 	swap	a
      000153 54 F0            [12]  398 	anl	a,#0xf0
      000155 FF               [12]  399 	mov	r7,a
      000156 24 3F            [12]  400 	add	a,#0x3f
      000158 F5 81            [12]  401 	mov	_SP,a
                                    402 ;	preemptive.c:139: __endasm;
      00015A E5 82            [12]  403 	MOV	A, DPL
      00015C C0 E0            [24]  404 	PUSH	A
      00015E E5 83            [12]  405 	MOV	A, DPH
      000160 C0 E0            [24]  406 	PUSH	A
                                    407 ;	preemptive.c:147: __endasm;
      000162 74 00            [12]  408 	MOV	A, #0x00
      000164 C0 E0            [24]  409 	PUSH	A
      000166 C0 E0            [24]  410 	PUSH	A
      000168 C0 E0            [24]  411 	PUSH	A
      00016A C0 E0            [24]  412 	PUSH	A
                                    413 ;	preemptive.c:149: PSW = (new_ID << 3); 
      00016C E5 37            [12]  414 	mov	a,_new_ID
      00016E FF               [12]  415 	mov	r7,a
      00016F C4               [12]  416 	swap	a
      000170 03               [12]  417 	rr	a
      000171 54 F8            [12]  418 	anl	a,#0xf8
      000173 F5 D0            [12]  419 	mov	_PSW,a
                                    420 ;	preemptive.c:153: __endasm;
      000175 C0 D0            [24]  421 	PUSH	PSW
                                    422 ;	preemptive.c:155: saved_SP[new_ID] = SP;           
      000177 E5 37            [12]  423 	mov	a,_new_ID
      000179 24 30            [12]  424 	add	a,#_saved_SP
      00017B F8               [12]  425 	mov	r0,a
      00017C A6 81            [24]  426 	mov	@r0,_SP
                                    427 ;	preemptive.c:157: SP = temp_SP;                    
      00017E 85 36 81         [24]  428 	mov	_SP,_temp_SP
                                    429 ;	preemptive.c:159: EA = 1;
                                    430 ;	assignBit
      000181 D2 AF            [12]  431 	setb	_EA
                                    432 ;	preemptive.c:161: return new_ID;                   //
      000183 85 37 82         [24]  433 	mov	dpl,_new_ID
                                    434 ;	preemptive.c:162: }
      000186 22               [24]  435 	ret
                                    436 ;------------------------------------------------------------
                                    437 ;Allocation info for local variables in function 'ThreadYield'
                                    438 ;------------------------------------------------------------
                                    439 ;	preemptive.c:173: void ThreadYield(void) {
                                    440 ;	-----------------------------------------
                                    441 ;	 function ThreadYield
                                    442 ;	-----------------------------------------
      000187                        443 _ThreadYield:
                                    444 ;	preemptive.c:174: SAVESTATE; 
      000187 C0 E0            [24]  445 	PUSH ACC 
      000189 C0 F0            [24]  446 	PUSH B 
      00018B C0 82            [24]  447 	PUSH DPL 
      00018D C0 83            [24]  448 	PUSH DPH 
      00018F C0 D0            [24]  449 	PUSH PSW 
      000191 E5 34            [12]  450 	mov	a,_cur_ID
      000193 24 30            [12]  451 	add	a,#_saved_SP
      000195 F8               [12]  452 	mov	r0,a
      000196 A6 81            [24]  453 	mov	@r0,_SP
                                    454 ;	preemptive.c:175: if (!bitmap_ID) return;
      000198 E5 35            [12]  455 	mov	a,_bitmap_ID
      00019A 70 01            [24]  456 	jnz	00102$
      00019C 22               [24]  457 	ret
      00019D                        458 00102$:
                                    459 ;	preemptive.c:176: if (cur_ID == 0) {
      00019D E5 34            [12]  460 	mov	a,_cur_ID
      00019F 70 24            [24]  461 	jnz	00144$
                                    462 ;	preemptive.c:177: if (bitmap_ID & 0x2) cur_ID = 1;
      0001A1 E5 35            [12]  463 	mov	a,_bitmap_ID
      0001A3 30 E1 06         [24]  464 	jnb	acc.1,00109$
      0001A6 75 34 01         [24]  465 	mov	_cur_ID,#0x01
      0001A9 02 02 2C         [24]  466 	ljmp	00145$
      0001AC                        467 00109$:
                                    468 ;	preemptive.c:178: else if (bitmap_ID & 0x4) cur_ID = 2;
      0001AC E5 35            [12]  469 	mov	a,_bitmap_ID
      0001AE 30 E2 06         [24]  470 	jnb	acc.2,00106$
      0001B1 75 34 02         [24]  471 	mov	_cur_ID,#0x02
      0001B4 02 02 2C         [24]  472 	ljmp	00145$
      0001B7                        473 00106$:
                                    474 ;	preemptive.c:179: else if (bitmap_ID & 0x8) cur_ID = 3;
      0001B7 E5 35            [12]  475 	mov	a,_bitmap_ID
      0001B9 20 E3 03         [24]  476 	jb	acc.3,00220$
      0001BC 02 02 2C         [24]  477 	ljmp	00145$
      0001BF                        478 00220$:
      0001BF 75 34 03         [24]  479 	mov	_cur_ID,#0x03
      0001C2 02 02 2C         [24]  480 	ljmp	00145$
      0001C5                        481 00144$:
                                    482 ;	preemptive.c:180: } else if (cur_ID == 1) {
      0001C5 74 01            [12]  483 	mov	a,#0x01
      0001C7 B5 34 1E         [24]  484 	cjne	a,_cur_ID,00141$
                                    485 ;	preemptive.c:181: if (bitmap_ID & 0x4) cur_ID = 2;
      0001CA E5 35            [12]  486 	mov	a,_bitmap_ID
      0001CC 30 E2 05         [24]  487 	jnb	acc.2,00117$
      0001CF 75 34 02         [24]  488 	mov	_cur_ID,#0x02
      0001D2 80 58            [24]  489 	sjmp	00145$
      0001D4                        490 00117$:
                                    491 ;	preemptive.c:182: else if (bitmap_ID & 0x8) cur_ID = 3;
      0001D4 E5 35            [12]  492 	mov	a,_bitmap_ID
      0001D6 30 E3 05         [24]  493 	jnb	acc.3,00114$
      0001D9 75 34 03         [24]  494 	mov	_cur_ID,#0x03
      0001DC 80 4E            [24]  495 	sjmp	00145$
      0001DE                        496 00114$:
                                    497 ;	preemptive.c:183: else if (bitmap_ID & 0x1) cur_ID = 0;
      0001DE E5 35            [12]  498 	mov	a,_bitmap_ID
      0001E0 30 E0 49         [24]  499 	jnb	acc.0,00145$
      0001E3 75 34 00         [24]  500 	mov	_cur_ID,#0x00
      0001E6 80 44            [24]  501 	sjmp	00145$
      0001E8                        502 00141$:
                                    503 ;	preemptive.c:184: } else if (cur_ID == 2) {
      0001E8 74 02            [12]  504 	mov	a,#0x02
      0001EA B5 34 1E         [24]  505 	cjne	a,_cur_ID,00138$
                                    506 ;	preemptive.c:185: if (bitmap_ID & 0x8) cur_ID = 3;
      0001ED E5 35            [12]  507 	mov	a,_bitmap_ID
      0001EF 30 E3 05         [24]  508 	jnb	acc.3,00125$
      0001F2 75 34 03         [24]  509 	mov	_cur_ID,#0x03
      0001F5 80 35            [24]  510 	sjmp	00145$
      0001F7                        511 00125$:
                                    512 ;	preemptive.c:186: else if (bitmap_ID & 0x1) cur_ID = 0;
      0001F7 E5 35            [12]  513 	mov	a,_bitmap_ID
      0001F9 30 E0 05         [24]  514 	jnb	acc.0,00122$
      0001FC 75 34 00         [24]  515 	mov	_cur_ID,#0x00
      0001FF 80 2B            [24]  516 	sjmp	00145$
      000201                        517 00122$:
                                    518 ;	preemptive.c:187: else if (bitmap_ID & 0x2) cur_ID = 1;
      000201 E5 35            [12]  519 	mov	a,_bitmap_ID
      000203 30 E1 26         [24]  520 	jnb	acc.1,00145$
      000206 75 34 01         [24]  521 	mov	_cur_ID,#0x01
      000209 80 21            [24]  522 	sjmp	00145$
      00020B                        523 00138$:
                                    524 ;	preemptive.c:188: } else if (cur_ID == 3) {
      00020B 74 03            [12]  525 	mov	a,#0x03
      00020D B5 34 1C         [24]  526 	cjne	a,_cur_ID,00145$
                                    527 ;	preemptive.c:189: if (bitmap_ID & 0x1) cur_ID = 0;
      000210 E5 35            [12]  528 	mov	a,_bitmap_ID
      000212 30 E0 05         [24]  529 	jnb	acc.0,00133$
      000215 75 34 00         [24]  530 	mov	_cur_ID,#0x00
      000218 80 12            [24]  531 	sjmp	00145$
      00021A                        532 00133$:
                                    533 ;	preemptive.c:190: else if (bitmap_ID & 0x2) cur_ID = 1;
      00021A E5 35            [12]  534 	mov	a,_bitmap_ID
      00021C 30 E1 05         [24]  535 	jnb	acc.1,00130$
      00021F 75 34 01         [24]  536 	mov	_cur_ID,#0x01
      000222 80 08            [24]  537 	sjmp	00145$
      000224                        538 00130$:
                                    539 ;	preemptive.c:191: else if (bitmap_ID & 0x4) cur_ID = 2;
      000224 E5 35            [12]  540 	mov	a,_bitmap_ID
      000226 30 E2 03         [24]  541 	jnb	acc.2,00145$
      000229 75 34 02         [24]  542 	mov	_cur_ID,#0x02
      00022C                        543 00145$:
                                    544 ;	preemptive.c:193: RESTORESTATE; 
      00022C E5 34            [12]  545 	mov	a,_cur_ID
      00022E 24 30            [12]  546 	add	a,#_saved_SP
      000230 F9               [12]  547 	mov	r1,a
      000231 87 81            [24]  548 	mov	_SP,@r1
      000233 D0 D0            [24]  549 	POP PSW 
      000235 D0 83            [24]  550 	POP DPH 
      000237 D0 82            [24]  551 	POP DPL 
      000239 D0 F0            [24]  552 	POP B 
      00023B D0 E0            [24]  553 	POP ACC 
                                    554 ;	preemptive.c:194: }
      00023D 22               [24]  555 	ret
                                    556 ;------------------------------------------------------------
                                    557 ;Allocation info for local variables in function 'myTimer0Handler'
                                    558 ;------------------------------------------------------------
                                    559 ;	preemptive.c:196: void myTimer0Handler(void) {
                                    560 ;	-----------------------------------------
                                    561 ;	 function myTimer0Handler
                                    562 ;	-----------------------------------------
      00023E                        563 _myTimer0Handler:
                                    564 ;	preemptive.c:221: }
      00023E 7F 01            [12]  565 	mov	r7,#0x01
      000240 10 AF 02         [24]  566 	jbc	ea,00217$
      000243 7F 00            [12]  567 	mov	r7,#0x00
      000245                        568 00217$:
                                    569 ;	preemptive.c:198: SAVESTATE; 
      000245 C0 E0            [24]  570 	PUSH ACC 
      000247 C0 F0            [24]  571 	PUSH B 
      000249 C0 82            [24]  572 	PUSH DPL 
      00024B C0 83            [24]  573 	PUSH DPH 
      00024D C0 D0            [24]  574 	PUSH PSW 
      00024F E5 34            [12]  575 	mov	a,_cur_ID
      000251 24 30            [12]  576 	add	a,#_saved_SP
      000253 F8               [12]  577 	mov	r0,a
      000254 A6 81            [24]  578 	mov	@r0,_SP
                                    579 ;	preemptive.c:201: if (!bitmap_ID) ;
      000256 E5 35            [12]  580 	mov	a,_bitmap_ID
      000258 70 03            [24]  581 	jnz	00218$
      00025A 02 02 EC         [24]  582 	ljmp	00146$
      00025D                        583 00218$:
                                    584 ;	preemptive.c:202: else if (cur_ID == 0) {
      00025D E5 34            [12]  585 	mov	a,_cur_ID
      00025F 70 24            [24]  586 	jnz	00142$
                                    587 ;	preemptive.c:203: if (bitmap_ID & 0x2) cur_ID = 1;
      000261 E5 35            [12]  588 	mov	a,_bitmap_ID
      000263 30 E1 06         [24]  589 	jnb	acc.1,00107$
      000266 75 34 01         [24]  590 	mov	_cur_ID,#0x01
      000269 02 02 EC         [24]  591 	ljmp	00146$
      00026C                        592 00107$:
                                    593 ;	preemptive.c:204: else if (bitmap_ID & 0x4) cur_ID = 2;
      00026C E5 35            [12]  594 	mov	a,_bitmap_ID
      00026E 30 E2 06         [24]  595 	jnb	acc.2,00104$
      000271 75 34 02         [24]  596 	mov	_cur_ID,#0x02
      000274 02 02 EC         [24]  597 	ljmp	00146$
      000277                        598 00104$:
                                    599 ;	preemptive.c:205: else if (bitmap_ID & 0x8) cur_ID = 3;
      000277 E5 35            [12]  600 	mov	a,_bitmap_ID
      000279 20 E3 03         [24]  601 	jb	acc.3,00222$
      00027C 02 02 EC         [24]  602 	ljmp	00146$
      00027F                        603 00222$:
      00027F 75 34 03         [24]  604 	mov	_cur_ID,#0x03
      000282 02 02 EC         [24]  605 	ljmp	00146$
      000285                        606 00142$:
                                    607 ;	preemptive.c:206: } else if (cur_ID == 1) {
      000285 74 01            [12]  608 	mov	a,#0x01
      000287 B5 34 1E         [24]  609 	cjne	a,_cur_ID,00139$
                                    610 ;	preemptive.c:207: if (bitmap_ID & 0x4) cur_ID = 2;
      00028A E5 35            [12]  611 	mov	a,_bitmap_ID
      00028C 30 E2 05         [24]  612 	jnb	acc.2,00115$
      00028F 75 34 02         [24]  613 	mov	_cur_ID,#0x02
      000292 80 58            [24]  614 	sjmp	00146$
      000294                        615 00115$:
                                    616 ;	preemptive.c:208: else if (bitmap_ID & 0x8) cur_ID = 3;
      000294 E5 35            [12]  617 	mov	a,_bitmap_ID
      000296 30 E3 05         [24]  618 	jnb	acc.3,00112$
      000299 75 34 03         [24]  619 	mov	_cur_ID,#0x03
      00029C 80 4E            [24]  620 	sjmp	00146$
      00029E                        621 00112$:
                                    622 ;	preemptive.c:209: else if (bitmap_ID & 0x1) cur_ID = 0;
      00029E E5 35            [12]  623 	mov	a,_bitmap_ID
      0002A0 30 E0 49         [24]  624 	jnb	acc.0,00146$
      0002A3 75 34 00         [24]  625 	mov	_cur_ID,#0x00
      0002A6 80 44            [24]  626 	sjmp	00146$
      0002A8                        627 00139$:
                                    628 ;	preemptive.c:210: } else if (cur_ID == 2) {
      0002A8 74 02            [12]  629 	mov	a,#0x02
      0002AA B5 34 1E         [24]  630 	cjne	a,_cur_ID,00136$
                                    631 ;	preemptive.c:211: if (bitmap_ID & 0x8) cur_ID = 3;
      0002AD E5 35            [12]  632 	mov	a,_bitmap_ID
      0002AF 30 E3 05         [24]  633 	jnb	acc.3,00123$
      0002B2 75 34 03         [24]  634 	mov	_cur_ID,#0x03
      0002B5 80 35            [24]  635 	sjmp	00146$
      0002B7                        636 00123$:
                                    637 ;	preemptive.c:212: else if (bitmap_ID & 0x1) cur_ID = 0;
      0002B7 E5 35            [12]  638 	mov	a,_bitmap_ID
      0002B9 30 E0 05         [24]  639 	jnb	acc.0,00120$
      0002BC 75 34 00         [24]  640 	mov	_cur_ID,#0x00
      0002BF 80 2B            [24]  641 	sjmp	00146$
      0002C1                        642 00120$:
                                    643 ;	preemptive.c:213: else if (bitmap_ID & 0x2) cur_ID = 1;
      0002C1 E5 35            [12]  644 	mov	a,_bitmap_ID
      0002C3 30 E1 26         [24]  645 	jnb	acc.1,00146$
      0002C6 75 34 01         [24]  646 	mov	_cur_ID,#0x01
      0002C9 80 21            [24]  647 	sjmp	00146$
      0002CB                        648 00136$:
                                    649 ;	preemptive.c:214: } else if (cur_ID == 3) {
      0002CB 74 03            [12]  650 	mov	a,#0x03
      0002CD B5 34 1C         [24]  651 	cjne	a,_cur_ID,00146$
                                    652 ;	preemptive.c:215: if (bitmap_ID & 0x1) cur_ID = 0;
      0002D0 E5 35            [12]  653 	mov	a,_bitmap_ID
      0002D2 30 E0 05         [24]  654 	jnb	acc.0,00131$
      0002D5 75 34 00         [24]  655 	mov	_cur_ID,#0x00
      0002D8 80 12            [24]  656 	sjmp	00146$
      0002DA                        657 00131$:
                                    658 ;	preemptive.c:216: else if (bitmap_ID & 0x2) cur_ID = 1;
      0002DA E5 35            [12]  659 	mov	a,_bitmap_ID
      0002DC 30 E1 05         [24]  660 	jnb	acc.1,00128$
      0002DF 75 34 01         [24]  661 	mov	_cur_ID,#0x01
      0002E2 80 08            [24]  662 	sjmp	00146$
      0002E4                        663 00128$:
                                    664 ;	preemptive.c:217: else if (bitmap_ID & 0x4) cur_ID = 2;
      0002E4 E5 35            [12]  665 	mov	a,_bitmap_ID
      0002E6 30 E2 03         [24]  666 	jnb	acc.2,00146$
      0002E9 75 34 02         [24]  667 	mov	_cur_ID,#0x02
      0002EC                        668 00146$:
                                    669 ;	preemptive.c:220: RESTORESTATE; 
      0002EC E5 34            [12]  670 	mov	a,_cur_ID
      0002EE 24 30            [12]  671 	add	a,#_saved_SP
      0002F0 F9               [12]  672 	mov	r1,a
      0002F1 87 81            [24]  673 	mov	_SP,@r1
      0002F3 D0 D0            [24]  674 	POP PSW 
      0002F5 D0 83            [24]  675 	POP DPH 
      0002F7 D0 82            [24]  676 	POP DPL 
      0002F9 D0 F0            [24]  677 	POP B 
      0002FB D0 E0            [24]  678 	POP ACC 
      0002FD EF               [12]  679 	mov	a,r7
      0002FE 13               [12]  680 	rrc	a
      0002FF 92 AF            [24]  681 	mov	ea,c
                                    682 ;	preemptive.c:224: __endasm;
      000301 32               [24]  683 	RETI
                                    684 ;	preemptive.c:225: }
      000302 22               [24]  685 	ret
                                    686 ;------------------------------------------------------------
                                    687 ;Allocation info for local variables in function 'ThreadExit'
                                    688 ;------------------------------------------------------------
                                    689 ;	preemptive.c:234: void ThreadExit(void) {
                                    690 ;	-----------------------------------------
                                    691 ;	 function ThreadExit
                                    692 ;	-----------------------------------------
      000303                        693 _ThreadExit:
                                    694 ;	preemptive.c:235: bitmap_ID &= ~(1 << cur_ID); // 清除當前線程位
      000303 AF 34            [24]  695 	mov	r7,_cur_ID
      000305 8F F0            [24]  696 	mov	b,r7
      000307 05 F0            [12]  697 	inc	b
      000309 74 01            [12]  698 	mov	a,#0x01
      00030B 80 02            [24]  699 	sjmp	00218$
      00030D                        700 00216$:
      00030D 25 E0            [12]  701 	add	a,acc
      00030F                        702 00218$:
      00030F D5 F0 FB         [24]  703 	djnz	b,00216$
      000312 F4               [12]  704 	cpl	a
      000313 FF               [12]  705 	mov	r7,a
      000314 AE 35            [24]  706 	mov	r6,_bitmap_ID
      000316 5E               [12]  707 	anl	a,r6
      000317 F5 35            [12]  708 	mov	_bitmap_ID,a
                                    709 ;	preemptive.c:236: if (!bitmap_ID) return;
      000319 E5 35            [12]  710 	mov	a,_bitmap_ID
      00031B 70 01            [24]  711 	jnz	00102$
      00031D 22               [24]  712 	ret
      00031E                        713 00102$:
                                    714 ;	preemptive.c:237: if (cur_ID == 0) {
      00031E E5 34            [12]  715 	mov	a,_cur_ID
      000320 70 1F            [24]  716 	jnz	00144$
                                    717 ;	preemptive.c:238: if (bitmap_ID & 0x2) cur_ID = 1;
      000322 E5 35            [12]  718 	mov	a,_bitmap_ID
      000324 30 E1 06         [24]  719 	jnb	acc.1,00109$
      000327 75 34 01         [24]  720 	mov	_cur_ID,#0x01
      00032A 02 03 A8         [24]  721 	ljmp	00145$
      00032D                        722 00109$:
                                    723 ;	preemptive.c:239: else if (bitmap_ID & 0x4) cur_ID = 2;
      00032D E5 35            [12]  724 	mov	a,_bitmap_ID
      00032F 30 E2 05         [24]  725 	jnb	acc.2,00106$
      000332 75 34 02         [24]  726 	mov	_cur_ID,#0x02
      000335 80 71            [24]  727 	sjmp	00145$
      000337                        728 00106$:
                                    729 ;	preemptive.c:240: else if (bitmap_ID & 0x8) cur_ID = 3;
      000337 E5 35            [12]  730 	mov	a,_bitmap_ID
      000339 30 E3 6C         [24]  731 	jnb	acc.3,00145$
      00033C 75 34 03         [24]  732 	mov	_cur_ID,#0x03
      00033F 80 67            [24]  733 	sjmp	00145$
      000341                        734 00144$:
                                    735 ;	preemptive.c:241: } else if (cur_ID == 1) {
      000341 74 01            [12]  736 	mov	a,#0x01
      000343 B5 34 1E         [24]  737 	cjne	a,_cur_ID,00141$
                                    738 ;	preemptive.c:242: if (bitmap_ID & 0x4) cur_ID = 2;
      000346 E5 35            [12]  739 	mov	a,_bitmap_ID
      000348 30 E2 05         [24]  740 	jnb	acc.2,00117$
      00034B 75 34 02         [24]  741 	mov	_cur_ID,#0x02
      00034E 80 58            [24]  742 	sjmp	00145$
      000350                        743 00117$:
                                    744 ;	preemptive.c:243: else if (bitmap_ID & 0x8) cur_ID = 3;
      000350 E5 35            [12]  745 	mov	a,_bitmap_ID
      000352 30 E3 05         [24]  746 	jnb	acc.3,00114$
      000355 75 34 03         [24]  747 	mov	_cur_ID,#0x03
      000358 80 4E            [24]  748 	sjmp	00145$
      00035A                        749 00114$:
                                    750 ;	preemptive.c:244: else if (bitmap_ID & 0x1) cur_ID = 0;
      00035A E5 35            [12]  751 	mov	a,_bitmap_ID
      00035C 30 E0 49         [24]  752 	jnb	acc.0,00145$
      00035F 75 34 00         [24]  753 	mov	_cur_ID,#0x00
      000362 80 44            [24]  754 	sjmp	00145$
      000364                        755 00141$:
                                    756 ;	preemptive.c:245: } else if (cur_ID == 2) {
      000364 74 02            [12]  757 	mov	a,#0x02
      000366 B5 34 1E         [24]  758 	cjne	a,_cur_ID,00138$
                                    759 ;	preemptive.c:246: if (bitmap_ID & 0x8) cur_ID = 3;
      000369 E5 35            [12]  760 	mov	a,_bitmap_ID
      00036B 30 E3 05         [24]  761 	jnb	acc.3,00125$
      00036E 75 34 03         [24]  762 	mov	_cur_ID,#0x03
      000371 80 35            [24]  763 	sjmp	00145$
      000373                        764 00125$:
                                    765 ;	preemptive.c:247: else if (bitmap_ID & 0x1) cur_ID = 0;
      000373 E5 35            [12]  766 	mov	a,_bitmap_ID
      000375 30 E0 05         [24]  767 	jnb	acc.0,00122$
      000378 75 34 00         [24]  768 	mov	_cur_ID,#0x00
      00037B 80 2B            [24]  769 	sjmp	00145$
      00037D                        770 00122$:
                                    771 ;	preemptive.c:248: else if (bitmap_ID & 0x2) cur_ID = 1;
      00037D E5 35            [12]  772 	mov	a,_bitmap_ID
      00037F 30 E1 26         [24]  773 	jnb	acc.1,00145$
      000382 75 34 01         [24]  774 	mov	_cur_ID,#0x01
      000385 80 21            [24]  775 	sjmp	00145$
      000387                        776 00138$:
                                    777 ;	preemptive.c:249: } else if (cur_ID == 3) {
      000387 74 03            [12]  778 	mov	a,#0x03
      000389 B5 34 1C         [24]  779 	cjne	a,_cur_ID,00145$
                                    780 ;	preemptive.c:250: if (bitmap_ID & 0x1) cur_ID = 0;
      00038C E5 35            [12]  781 	mov	a,_bitmap_ID
      00038E 30 E0 05         [24]  782 	jnb	acc.0,00133$
      000391 75 34 00         [24]  783 	mov	_cur_ID,#0x00
      000394 80 12            [24]  784 	sjmp	00145$
      000396                        785 00133$:
                                    786 ;	preemptive.c:251: else if (bitmap_ID & 0x2) cur_ID = 1;
      000396 E5 35            [12]  787 	mov	a,_bitmap_ID
      000398 30 E1 05         [24]  788 	jnb	acc.1,00130$
      00039B 75 34 01         [24]  789 	mov	_cur_ID,#0x01
      00039E 80 08            [24]  790 	sjmp	00145$
      0003A0                        791 00130$:
                                    792 ;	preemptive.c:252: else if (bitmap_ID & 0x4) cur_ID = 2;
      0003A0 E5 35            [12]  793 	mov	a,_bitmap_ID
      0003A2 30 E2 03         [24]  794 	jnb	acc.2,00145$
      0003A5 75 34 02         [24]  795 	mov	_cur_ID,#0x02
      0003A8                        796 00145$:
                                    797 ;	preemptive.c:254: RESTORESTATE;
      0003A8 E5 34            [12]  798 	mov	a,_cur_ID
      0003AA 24 30            [12]  799 	add	a,#_saved_SP
      0003AC F9               [12]  800 	mov	r1,a
      0003AD 87 81            [24]  801 	mov	_SP,@r1
      0003AF D0 D0            [24]  802 	POP PSW 
      0003B1 D0 83            [24]  803 	POP DPH 
      0003B3 D0 82            [24]  804 	POP DPL 
      0003B5 D0 F0            [24]  805 	POP B 
      0003B7 D0 E0            [24]  806 	POP ACC 
                                    807 ;	preemptive.c:255: }
      0003B9 22               [24]  808 	ret
                                    809 	.area CSEG    (CODE)
                                    810 	.area CONST   (CODE)
                                    811 	.area XINIT   (CODE)
                                    812 	.area CABS    (ABS,CODE)
