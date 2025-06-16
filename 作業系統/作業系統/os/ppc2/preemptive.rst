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
      000094                        304 _Bootstrap:
                           000007   305 	ar7 = 0x07
                           000006   306 	ar6 = 0x06
                           000005   307 	ar5 = 0x05
                           000004   308 	ar4 = 0x04
                           000003   309 	ar3 = 0x03
                           000002   310 	ar2 = 0x02
                           000001   311 	ar1 = 0x01
                           000000   312 	ar0 = 0x00
                                    313 ;	preemptive.c:93: bitmap_ID = 0b0000;
      000094 75 35 00         [24]  314 	mov	_bitmap_ID,#0x00
                                    315 ;	preemptive.c:94: cur_ID = 0;
      000097 75 34 00         [24]  316 	mov	_cur_ID,#0x00
                                    317 ;	preemptive.c:96: TMOD = 0; // set Timer 0  as mode 0
      00009A 75 89 00         [24]  318 	mov	_TMOD,#0x00
                                    319 ;	preemptive.c:97: IE = 0x82; //
      00009D 75 A8 82         [24]  320 	mov	_IE,#0x82
                                    321 ;	preemptive.c:98: TR0 = 1;   // start Timer 0
                                    322 ;	assignBit
      0000A0 D2 8C            [12]  323 	setb	_TR0
                                    324 ;	preemptive.c:100: cur_ID = ThreadCreate(main);
      0000A2 90 00 7D         [24]  325 	mov	dptr,#_main
      0000A5 12 00 BD         [24]  326 	lcall	_ThreadCreate
      0000A8 85 82 34         [24]  327 	mov	_cur_ID,dpl
                                    328 ;	preemptive.c:101: RESTORESTATE;               \
      0000AB E5 34            [12]  329 	mov	a,_cur_ID
      0000AD 24 30            [12]  330 	add	a,#_saved_SP
      0000AF F9               [12]  331 	mov	r1,a
      0000B0 87 81            [24]  332 	mov	_SP,@r1
      0000B2 D0 D0            [24]  333 	POP PSW 
      0000B4 D0 83            [24]  334 	POP DPH 
      0000B6 D0 82            [24]  335 	POP DPL 
      0000B8 D0 F0            [24]  336 	POP B 
      0000BA D0 E0            [24]  337 	POP ACC 
      0000BC 22               [24]  338 	ret
                                    339 ;------------------------------------------------------------
                                    340 ;Allocation info for local variables in function 'ThreadCreate'
                                    341 ;------------------------------------------------------------
                                    342 ;fp                        Allocated to registers 
                                    343 ;------------------------------------------------------------
                                    344 ;	preemptive.c:110: ThreadID ThreadCreate(FunctionPtr fp) {
                                    345 ;	-----------------------------------------
                                    346 ;	 function ThreadCreate
                                    347 ;	-----------------------------------------
      0000BD                        348 _ThreadCreate:
                                    349 ;	preemptive.c:112: if (bitmap_ID == 0xF) return -1;
      0000BD 74 0F            [12]  350 	mov	a,#0x0f
      0000BF B5 35 04         [24]  351 	cjne	a,_bitmap_ID,00102$
      0000C2 75 82 FF         [24]  352 	mov	dpl,#0xff
      0000C5 22               [24]  353 	ret
      0000C6                        354 00102$:
                                    355 ;	preemptive.c:114: EA = 0;
                                    356 ;	assignBit
      0000C6 C2 AF            [12]  357 	clr	_EA
                                    358 ;	preemptive.c:116: temp_SP = SP; // 保存當前堆棧指針
      0000C8 85 81 36         [24]  359 	mov	_temp_SP,_SP
                                    360 ;	preemptive.c:118: if (!(bitmap_ID & 0x1)) {
      0000CB E5 35            [12]  361 	mov	a,_bitmap_ID
      0000CD 20 E0 08         [24]  362 	jb	acc.0,00112$
                                    363 ;	preemptive.c:119: bitmap_ID |= 0x1;
      0000D0 43 35 01         [24]  364 	orl	_bitmap_ID,#0x01
                                    365 ;	preemptive.c:120: new_ID = 0;
      0000D3 75 37 00         [24]  366 	mov	_new_ID,#0x00
      0000D6 80 25            [24]  367 	sjmp	00113$
      0000D8                        368 00112$:
                                    369 ;	preemptive.c:121: } else if (!(bitmap_ID & 0x2)) {
      0000D8 E5 35            [12]  370 	mov	a,_bitmap_ID
      0000DA 20 E1 08         [24]  371 	jb	acc.1,00109$
                                    372 ;	preemptive.c:122: bitmap_ID |= 0x2;
      0000DD 43 35 02         [24]  373 	orl	_bitmap_ID,#0x02
                                    374 ;	preemptive.c:123: new_ID = 1;
      0000E0 75 37 01         [24]  375 	mov	_new_ID,#0x01
      0000E3 80 18            [24]  376 	sjmp	00113$
      0000E5                        377 00109$:
                                    378 ;	preemptive.c:124: } else if (!(bitmap_ID & 0x4)) {
      0000E5 E5 35            [12]  379 	mov	a,_bitmap_ID
      0000E7 20 E2 08         [24]  380 	jb	acc.2,00106$
                                    381 ;	preemptive.c:125: bitmap_ID |= 0x4;
      0000EA 43 35 04         [24]  382 	orl	_bitmap_ID,#0x04
                                    383 ;	preemptive.c:126: new_ID = 2;
      0000ED 75 37 02         [24]  384 	mov	_new_ID,#0x02
      0000F0 80 0B            [24]  385 	sjmp	00113$
      0000F2                        386 00106$:
                                    387 ;	preemptive.c:127: } else if (!(bitmap_ID & 0x8)) {
      0000F2 E5 35            [12]  388 	mov	a,_bitmap_ID
      0000F4 20 E3 06         [24]  389 	jb	acc.3,00113$
                                    390 ;	preemptive.c:128: bitmap_ID |= 0x8;
      0000F7 43 35 08         [24]  391 	orl	_bitmap_ID,#0x08
                                    392 ;	preemptive.c:129: new_ID = 3;
      0000FA 75 37 03         [24]  393 	mov	_new_ID,#0x03
      0000FD                        394 00113$:
                                    395 ;	preemptive.c:132: SP = 0x3F + (new_ID * 0x10); 
      0000FD E5 37            [12]  396 	mov	a,_new_ID
      0000FF C4               [12]  397 	swap	a
      000100 54 F0            [12]  398 	anl	a,#0xf0
      000102 FF               [12]  399 	mov	r7,a
      000103 24 3F            [12]  400 	add	a,#0x3f
      000105 F5 81            [12]  401 	mov	_SP,a
                                    402 ;	preemptive.c:139: __endasm;
      000107 E5 82            [12]  403 	MOV	A, DPL
      000109 C0 E0            [24]  404 	PUSH	A
      00010B E5 83            [12]  405 	MOV	A, DPH
      00010D C0 E0            [24]  406 	PUSH	A
                                    407 ;	preemptive.c:147: __endasm;
      00010F 74 00            [12]  408 	MOV	A, #0x00
      000111 C0 E0            [24]  409 	PUSH	A
      000113 C0 E0            [24]  410 	PUSH	A
      000115 C0 E0            [24]  411 	PUSH	A
      000117 C0 E0            [24]  412 	PUSH	A
                                    413 ;	preemptive.c:149: PSW = (new_ID << 3); 
      000119 E5 37            [12]  414 	mov	a,_new_ID
      00011B FF               [12]  415 	mov	r7,a
      00011C C4               [12]  416 	swap	a
      00011D 03               [12]  417 	rr	a
      00011E 54 F8            [12]  418 	anl	a,#0xf8
      000120 F5 D0            [12]  419 	mov	_PSW,a
                                    420 ;	preemptive.c:153: __endasm;
      000122 C0 D0            [24]  421 	PUSH	PSW
                                    422 ;	preemptive.c:155: saved_SP[new_ID] = SP;           
      000124 E5 37            [12]  423 	mov	a,_new_ID
      000126 24 30            [12]  424 	add	a,#_saved_SP
      000128 F8               [12]  425 	mov	r0,a
      000129 A6 81            [24]  426 	mov	@r0,_SP
                                    427 ;	preemptive.c:157: SP = temp_SP;                    
      00012B 85 36 81         [24]  428 	mov	_SP,_temp_SP
                                    429 ;	preemptive.c:159: EA = 1;
                                    430 ;	assignBit
      00012E D2 AF            [12]  431 	setb	_EA
                                    432 ;	preemptive.c:161: return new_ID;                   //
      000130 85 37 82         [24]  433 	mov	dpl,_new_ID
                                    434 ;	preemptive.c:162: }
      000133 22               [24]  435 	ret
                                    436 ;------------------------------------------------------------
                                    437 ;Allocation info for local variables in function 'ThreadYield'
                                    438 ;------------------------------------------------------------
                                    439 ;	preemptive.c:173: void ThreadYield(void) {
                                    440 ;	-----------------------------------------
                                    441 ;	 function ThreadYield
                                    442 ;	-----------------------------------------
      000134                        443 _ThreadYield:
                                    444 ;	preemptive.c:196: } 
      000134 7F 01            [12]  445 	mov	r7,#0x01
      000136 10 AF 02         [24]  446 	jbc	ea,00216$
      000139 7F 00            [12]  447 	mov	r7,#0x00
      00013B                        448 00216$:
                                    449 ;	preemptive.c:175: SAVESTATE; 
      00013B C0 E0            [24]  450 	PUSH ACC 
      00013D C0 F0            [24]  451 	PUSH B 
      00013F C0 82            [24]  452 	PUSH DPL 
      000141 C0 83            [24]  453 	PUSH DPH 
      000143 C0 D0            [24]  454 	PUSH PSW 
      000145 E5 34            [12]  455 	mov	a,_cur_ID
      000147 24 30            [12]  456 	add	a,#_saved_SP
      000149 F8               [12]  457 	mov	r0,a
      00014A A6 81            [24]  458 	mov	@r0,_SP
                                    459 ;	preemptive.c:176: if (bitmap_ID) {
      00014C E5 35            [12]  460 	mov	a,_bitmap_ID
      00014E 70 03            [24]  461 	jnz	00217$
      000150 02 01 F3         [24]  462 	ljmp	00145$
      000153                        463 00217$:
                                    464 ;	preemptive.c:177: if (cur_ID == 0) {
      000153 E5 34            [12]  465 	mov	a,_cur_ID
      000155 70 24            [24]  466 	jnz	00142$
                                    467 ;	preemptive.c:178: if (bitmap_ID & 0x2) cur_ID = 1;
      000157 E5 35            [12]  468 	mov	a,_bitmap_ID
      000159 30 E1 06         [24]  469 	jnb	acc.1,00107$
      00015C 75 34 01         [24]  470 	mov	_cur_ID,#0x01
      00015F 02 01 E2         [24]  471 	ljmp	00143$
      000162                        472 00107$:
                                    473 ;	preemptive.c:179: else if (bitmap_ID & 0x4) cur_ID = 2;
      000162 E5 35            [12]  474 	mov	a,_bitmap_ID
      000164 30 E2 06         [24]  475 	jnb	acc.2,00104$
      000167 75 34 02         [24]  476 	mov	_cur_ID,#0x02
      00016A 02 01 E2         [24]  477 	ljmp	00143$
      00016D                        478 00104$:
                                    479 ;	preemptive.c:180: else if (bitmap_ID & 0x8) cur_ID = 3;
      00016D E5 35            [12]  480 	mov	a,_bitmap_ID
      00016F 20 E3 03         [24]  481 	jb	acc.3,00221$
      000172 02 01 E2         [24]  482 	ljmp	00143$
      000175                        483 00221$:
      000175 75 34 03         [24]  484 	mov	_cur_ID,#0x03
      000178 02 01 E2         [24]  485 	ljmp	00143$
      00017B                        486 00142$:
                                    487 ;	preemptive.c:181: } else if (cur_ID == 1) {
      00017B 74 01            [12]  488 	mov	a,#0x01
      00017D B5 34 1E         [24]  489 	cjne	a,_cur_ID,00139$
                                    490 ;	preemptive.c:182: if (bitmap_ID & 0x4) cur_ID = 2;
      000180 E5 35            [12]  491 	mov	a,_bitmap_ID
      000182 30 E2 05         [24]  492 	jnb	acc.2,00115$
      000185 75 34 02         [24]  493 	mov	_cur_ID,#0x02
      000188 80 58            [24]  494 	sjmp	00143$
      00018A                        495 00115$:
                                    496 ;	preemptive.c:183: else if (bitmap_ID & 0x8) cur_ID = 3;
      00018A E5 35            [12]  497 	mov	a,_bitmap_ID
      00018C 30 E3 05         [24]  498 	jnb	acc.3,00112$
      00018F 75 34 03         [24]  499 	mov	_cur_ID,#0x03
      000192 80 4E            [24]  500 	sjmp	00143$
      000194                        501 00112$:
                                    502 ;	preemptive.c:184: else if (bitmap_ID & 0x1) cur_ID = 0;
      000194 E5 35            [12]  503 	mov	a,_bitmap_ID
      000196 30 E0 49         [24]  504 	jnb	acc.0,00143$
      000199 75 34 00         [24]  505 	mov	_cur_ID,#0x00
      00019C 80 44            [24]  506 	sjmp	00143$
      00019E                        507 00139$:
                                    508 ;	preemptive.c:185: } else if (cur_ID == 2) {
      00019E 74 02            [12]  509 	mov	a,#0x02
      0001A0 B5 34 1E         [24]  510 	cjne	a,_cur_ID,00136$
                                    511 ;	preemptive.c:186: if (bitmap_ID & 0x8) cur_ID = 3;
      0001A3 E5 35            [12]  512 	mov	a,_bitmap_ID
      0001A5 30 E3 05         [24]  513 	jnb	acc.3,00123$
      0001A8 75 34 03         [24]  514 	mov	_cur_ID,#0x03
      0001AB 80 35            [24]  515 	sjmp	00143$
      0001AD                        516 00123$:
                                    517 ;	preemptive.c:187: else if (bitmap_ID & 0x1) cur_ID = 0;
      0001AD E5 35            [12]  518 	mov	a,_bitmap_ID
      0001AF 30 E0 05         [24]  519 	jnb	acc.0,00120$
      0001B2 75 34 00         [24]  520 	mov	_cur_ID,#0x00
      0001B5 80 2B            [24]  521 	sjmp	00143$
      0001B7                        522 00120$:
                                    523 ;	preemptive.c:188: else if (bitmap_ID & 0x2) cur_ID = 1;
      0001B7 E5 35            [12]  524 	mov	a,_bitmap_ID
      0001B9 30 E1 26         [24]  525 	jnb	acc.1,00143$
      0001BC 75 34 01         [24]  526 	mov	_cur_ID,#0x01
      0001BF 80 21            [24]  527 	sjmp	00143$
      0001C1                        528 00136$:
                                    529 ;	preemptive.c:189: } else if (cur_ID == 3) {
      0001C1 74 03            [12]  530 	mov	a,#0x03
      0001C3 B5 34 1C         [24]  531 	cjne	a,_cur_ID,00143$
                                    532 ;	preemptive.c:190: if (bitmap_ID & 0x1) cur_ID = 0;
      0001C6 E5 35            [12]  533 	mov	a,_bitmap_ID
      0001C8 30 E0 05         [24]  534 	jnb	acc.0,00131$
      0001CB 75 34 00         [24]  535 	mov	_cur_ID,#0x00
      0001CE 80 12            [24]  536 	sjmp	00143$
      0001D0                        537 00131$:
                                    538 ;	preemptive.c:191: else if (bitmap_ID & 0x2) cur_ID = 1;
      0001D0 E5 35            [12]  539 	mov	a,_bitmap_ID
      0001D2 30 E1 05         [24]  540 	jnb	acc.1,00128$
      0001D5 75 34 01         [24]  541 	mov	_cur_ID,#0x01
      0001D8 80 08            [24]  542 	sjmp	00143$
      0001DA                        543 00128$:
                                    544 ;	preemptive.c:192: else if (bitmap_ID & 0x4) cur_ID = 2;
      0001DA E5 35            [12]  545 	mov	a,_bitmap_ID
      0001DC 30 E2 03         [24]  546 	jnb	acc.2,00143$
      0001DF 75 34 02         [24]  547 	mov	_cur_ID,#0x02
      0001E2                        548 00143$:
                                    549 ;	preemptive.c:194: RESTORESTATE;
      0001E2 E5 34            [12]  550 	mov	a,_cur_ID
      0001E4 24 30            [12]  551 	add	a,#_saved_SP
      0001E6 F9               [12]  552 	mov	r1,a
      0001E7 87 81            [24]  553 	mov	_SP,@r1
      0001E9 D0 D0            [24]  554 	POP PSW 
      0001EB D0 83            [24]  555 	POP DPH 
      0001ED D0 82            [24]  556 	POP DPL 
      0001EF D0 F0            [24]  557 	POP B 
      0001F1 D0 E0            [24]  558 	POP ACC 
      0001F3                        559 00145$:
      0001F3 EF               [12]  560 	mov	a,r7
      0001F4 13               [12]  561 	rrc	a
      0001F5 92 AF            [24]  562 	mov	ea,c
                                    563 ;	preemptive.c:197: }
      0001F7 22               [24]  564 	ret
                                    565 ;------------------------------------------------------------
                                    566 ;Allocation info for local variables in function 'myTimer0Handler'
                                    567 ;------------------------------------------------------------
                                    568 ;	preemptive.c:199: void myTimer0Handler(void) {
                                    569 ;	-----------------------------------------
                                    570 ;	 function myTimer0Handler
                                    571 ;	-----------------------------------------
      0001F8                        572 _myTimer0Handler:
                                    573 ;	preemptive.c:222: }
      0001F8 7F 01            [12]  574 	mov	r7,#0x01
      0001FA 10 AF 02         [24]  575 	jbc	ea,00217$
      0001FD 7F 00            [12]  576 	mov	r7,#0x00
      0001FF                        577 00217$:
                                    578 ;	preemptive.c:201: SAVESTATE; 
      0001FF C0 E0            [24]  579 	PUSH ACC 
      000201 C0 F0            [24]  580 	PUSH B 
      000203 C0 82            [24]  581 	PUSH DPL 
      000205 C0 83            [24]  582 	PUSH DPH 
      000207 C0 D0            [24]  583 	PUSH PSW 
      000209 E5 34            [12]  584 	mov	a,_cur_ID
      00020B 24 30            [12]  585 	add	a,#_saved_SP
      00020D F8               [12]  586 	mov	r0,a
      00020E A6 81            [24]  587 	mov	@r0,_SP
                                    588 ;	preemptive.c:202: if (!bitmap_ID) ;
      000210 E5 35            [12]  589 	mov	a,_bitmap_ID
      000212 70 03            [24]  590 	jnz	00218$
      000214 02 02 A6         [24]  591 	ljmp	00146$
      000217                        592 00218$:
                                    593 ;	preemptive.c:203: else if (cur_ID == 0) {
      000217 E5 34            [12]  594 	mov	a,_cur_ID
      000219 70 24            [24]  595 	jnz	00142$
                                    596 ;	preemptive.c:204: if (bitmap_ID & 0x2) cur_ID = 1;
      00021B E5 35            [12]  597 	mov	a,_bitmap_ID
      00021D 30 E1 06         [24]  598 	jnb	acc.1,00107$
      000220 75 34 01         [24]  599 	mov	_cur_ID,#0x01
      000223 02 02 A6         [24]  600 	ljmp	00146$
      000226                        601 00107$:
                                    602 ;	preemptive.c:205: else if (bitmap_ID & 0x4) cur_ID = 2;
      000226 E5 35            [12]  603 	mov	a,_bitmap_ID
      000228 30 E2 06         [24]  604 	jnb	acc.2,00104$
      00022B 75 34 02         [24]  605 	mov	_cur_ID,#0x02
      00022E 02 02 A6         [24]  606 	ljmp	00146$
      000231                        607 00104$:
                                    608 ;	preemptive.c:206: else if (bitmap_ID & 0x8) cur_ID = 3;
      000231 E5 35            [12]  609 	mov	a,_bitmap_ID
      000233 20 E3 03         [24]  610 	jb	acc.3,00222$
      000236 02 02 A6         [24]  611 	ljmp	00146$
      000239                        612 00222$:
      000239 75 34 03         [24]  613 	mov	_cur_ID,#0x03
      00023C 02 02 A6         [24]  614 	ljmp	00146$
      00023F                        615 00142$:
                                    616 ;	preemptive.c:207: } else if (cur_ID == 1) {
      00023F 74 01            [12]  617 	mov	a,#0x01
      000241 B5 34 1E         [24]  618 	cjne	a,_cur_ID,00139$
                                    619 ;	preemptive.c:208: if (bitmap_ID & 0x4) cur_ID = 2;
      000244 E5 35            [12]  620 	mov	a,_bitmap_ID
      000246 30 E2 05         [24]  621 	jnb	acc.2,00115$
      000249 75 34 02         [24]  622 	mov	_cur_ID,#0x02
      00024C 80 58            [24]  623 	sjmp	00146$
      00024E                        624 00115$:
                                    625 ;	preemptive.c:209: else if (bitmap_ID & 0x8) cur_ID = 3;
      00024E E5 35            [12]  626 	mov	a,_bitmap_ID
      000250 30 E3 05         [24]  627 	jnb	acc.3,00112$
      000253 75 34 03         [24]  628 	mov	_cur_ID,#0x03
      000256 80 4E            [24]  629 	sjmp	00146$
      000258                        630 00112$:
                                    631 ;	preemptive.c:210: else if (bitmap_ID & 0x1) cur_ID = 0;
      000258 E5 35            [12]  632 	mov	a,_bitmap_ID
      00025A 30 E0 49         [24]  633 	jnb	acc.0,00146$
      00025D 75 34 00         [24]  634 	mov	_cur_ID,#0x00
      000260 80 44            [24]  635 	sjmp	00146$
      000262                        636 00139$:
                                    637 ;	preemptive.c:211: } else if (cur_ID == 2) {
      000262 74 02            [12]  638 	mov	a,#0x02
      000264 B5 34 1E         [24]  639 	cjne	a,_cur_ID,00136$
                                    640 ;	preemptive.c:212: if (bitmap_ID & 0x8) cur_ID = 3;
      000267 E5 35            [12]  641 	mov	a,_bitmap_ID
      000269 30 E3 05         [24]  642 	jnb	acc.3,00123$
      00026C 75 34 03         [24]  643 	mov	_cur_ID,#0x03
      00026F 80 35            [24]  644 	sjmp	00146$
      000271                        645 00123$:
                                    646 ;	preemptive.c:213: else if (bitmap_ID & 0x1) cur_ID = 0;
      000271 E5 35            [12]  647 	mov	a,_bitmap_ID
      000273 30 E0 05         [24]  648 	jnb	acc.0,00120$
      000276 75 34 00         [24]  649 	mov	_cur_ID,#0x00
      000279 80 2B            [24]  650 	sjmp	00146$
      00027B                        651 00120$:
                                    652 ;	preemptive.c:214: else if (bitmap_ID & 0x2) cur_ID = 1;
      00027B E5 35            [12]  653 	mov	a,_bitmap_ID
      00027D 30 E1 26         [24]  654 	jnb	acc.1,00146$
      000280 75 34 01         [24]  655 	mov	_cur_ID,#0x01
      000283 80 21            [24]  656 	sjmp	00146$
      000285                        657 00136$:
                                    658 ;	preemptive.c:215: } else if (cur_ID == 3) {
      000285 74 03            [12]  659 	mov	a,#0x03
      000287 B5 34 1C         [24]  660 	cjne	a,_cur_ID,00146$
                                    661 ;	preemptive.c:216: if (bitmap_ID & 0x1) cur_ID = 0;
      00028A E5 35            [12]  662 	mov	a,_bitmap_ID
      00028C 30 E0 05         [24]  663 	jnb	acc.0,00131$
      00028F 75 34 00         [24]  664 	mov	_cur_ID,#0x00
      000292 80 12            [24]  665 	sjmp	00146$
      000294                        666 00131$:
                                    667 ;	preemptive.c:217: else if (bitmap_ID & 0x2) cur_ID = 1;
      000294 E5 35            [12]  668 	mov	a,_bitmap_ID
      000296 30 E1 05         [24]  669 	jnb	acc.1,00128$
      000299 75 34 01         [24]  670 	mov	_cur_ID,#0x01
      00029C 80 08            [24]  671 	sjmp	00146$
      00029E                        672 00128$:
                                    673 ;	preemptive.c:218: else if (bitmap_ID & 0x4) cur_ID = 2;
      00029E E5 35            [12]  674 	mov	a,_bitmap_ID
      0002A0 30 E2 03         [24]  675 	jnb	acc.2,00146$
      0002A3 75 34 02         [24]  676 	mov	_cur_ID,#0x02
      0002A6                        677 00146$:
                                    678 ;	preemptive.c:221: RESTORESTATE; 
      0002A6 E5 34            [12]  679 	mov	a,_cur_ID
      0002A8 24 30            [12]  680 	add	a,#_saved_SP
      0002AA F9               [12]  681 	mov	r1,a
      0002AB 87 81            [24]  682 	mov	_SP,@r1
      0002AD D0 D0            [24]  683 	POP PSW 
      0002AF D0 83            [24]  684 	POP DPH 
      0002B1 D0 82            [24]  685 	POP DPL 
      0002B3 D0 F0            [24]  686 	POP B 
      0002B5 D0 E0            [24]  687 	POP ACC 
      0002B7 EF               [12]  688 	mov	a,r7
      0002B8 13               [12]  689 	rrc	a
      0002B9 92 AF            [24]  690 	mov	ea,c
                                    691 ;	preemptive.c:225: __endasm;
      0002BB 32               [24]  692 	RETI
                                    693 ;	preemptive.c:226: }
      0002BC 22               [24]  694 	ret
                                    695 ;------------------------------------------------------------
                                    696 ;Allocation info for local variables in function 'ThreadExit'
                                    697 ;------------------------------------------------------------
                                    698 ;	preemptive.c:235: void ThreadExit(void) {
                                    699 ;	-----------------------------------------
                                    700 ;	 function ThreadExit
                                    701 ;	-----------------------------------------
      0002BD                        702 _ThreadExit:
                                    703 ;	preemptive.c:258: }
      0002BD 7F 01            [12]  704 	mov	r7,#0x01
      0002BF 10 AF 02         [24]  705 	jbc	ea,00216$
      0002C2 7F 00            [12]  706 	mov	r7,#0x00
      0002C4                        707 00216$:
                                    708 ;	preemptive.c:237: bitmap_ID &= ~(1 << cur_ID); // 清除當前線程位
      0002C4 AE 34            [24]  709 	mov	r6,_cur_ID
      0002C6 8E F0            [24]  710 	mov	b,r6
      0002C8 05 F0            [12]  711 	inc	b
      0002CA 74 01            [12]  712 	mov	a,#0x01
      0002CC 80 02            [24]  713 	sjmp	00219$
      0002CE                        714 00217$:
      0002CE 25 E0            [12]  715 	add	a,acc
      0002D0                        716 00219$:
      0002D0 D5 F0 FB         [24]  717 	djnz	b,00217$
      0002D3 F4               [12]  718 	cpl	a
      0002D4 FE               [12]  719 	mov	r6,a
      0002D5 AD 35            [24]  720 	mov	r5,_bitmap_ID
      0002D7 5D               [12]  721 	anl	a,r5
      0002D8 F5 35            [12]  722 	mov	_bitmap_ID,a
                                    723 ;	preemptive.c:238: if (bitmap_ID){
      0002DA E5 35            [12]  724 	mov	a,_bitmap_ID
      0002DC 70 03            [24]  725 	jnz	00220$
      0002DE 02 03 7C         [24]  726 	ljmp	00145$
      0002E1                        727 00220$:
                                    728 ;	preemptive.c:239: if (cur_ID == 0) {
      0002E1 E5 34            [12]  729 	mov	a,_cur_ID
      0002E3 70 1F            [24]  730 	jnz	00142$
                                    731 ;	preemptive.c:240: if (bitmap_ID & 0x2) cur_ID = 1;
      0002E5 E5 35            [12]  732 	mov	a,_bitmap_ID
      0002E7 30 E1 06         [24]  733 	jnb	acc.1,00107$
      0002EA 75 34 01         [24]  734 	mov	_cur_ID,#0x01
      0002ED 02 03 6B         [24]  735 	ljmp	00143$
      0002F0                        736 00107$:
                                    737 ;	preemptive.c:241: else if (bitmap_ID & 0x4) cur_ID = 2;
      0002F0 E5 35            [12]  738 	mov	a,_bitmap_ID
      0002F2 30 E2 05         [24]  739 	jnb	acc.2,00104$
      0002F5 75 34 02         [24]  740 	mov	_cur_ID,#0x02
      0002F8 80 71            [24]  741 	sjmp	00143$
      0002FA                        742 00104$:
                                    743 ;	preemptive.c:242: else if (bitmap_ID & 0x8) cur_ID = 3;
      0002FA E5 35            [12]  744 	mov	a,_bitmap_ID
      0002FC 30 E3 6C         [24]  745 	jnb	acc.3,00143$
      0002FF 75 34 03         [24]  746 	mov	_cur_ID,#0x03
      000302 80 67            [24]  747 	sjmp	00143$
      000304                        748 00142$:
                                    749 ;	preemptive.c:243: } else if (cur_ID == 1) {
      000304 74 01            [12]  750 	mov	a,#0x01
      000306 B5 34 1E         [24]  751 	cjne	a,_cur_ID,00139$
                                    752 ;	preemptive.c:244: if (bitmap_ID & 0x4) cur_ID = 2;
      000309 E5 35            [12]  753 	mov	a,_bitmap_ID
      00030B 30 E2 05         [24]  754 	jnb	acc.2,00115$
      00030E 75 34 02         [24]  755 	mov	_cur_ID,#0x02
      000311 80 58            [24]  756 	sjmp	00143$
      000313                        757 00115$:
                                    758 ;	preemptive.c:245: else if (bitmap_ID & 0x8) cur_ID = 3;
      000313 E5 35            [12]  759 	mov	a,_bitmap_ID
      000315 30 E3 05         [24]  760 	jnb	acc.3,00112$
      000318 75 34 03         [24]  761 	mov	_cur_ID,#0x03
      00031B 80 4E            [24]  762 	sjmp	00143$
      00031D                        763 00112$:
                                    764 ;	preemptive.c:246: else if (bitmap_ID & 0x1) cur_ID = 0;
      00031D E5 35            [12]  765 	mov	a,_bitmap_ID
      00031F 30 E0 49         [24]  766 	jnb	acc.0,00143$
      000322 75 34 00         [24]  767 	mov	_cur_ID,#0x00
      000325 80 44            [24]  768 	sjmp	00143$
      000327                        769 00139$:
                                    770 ;	preemptive.c:247: } else if (cur_ID == 2) {
      000327 74 02            [12]  771 	mov	a,#0x02
      000329 B5 34 1E         [24]  772 	cjne	a,_cur_ID,00136$
                                    773 ;	preemptive.c:248: if (bitmap_ID & 0x8) cur_ID = 3;
      00032C E5 35            [12]  774 	mov	a,_bitmap_ID
      00032E 30 E3 05         [24]  775 	jnb	acc.3,00123$
      000331 75 34 03         [24]  776 	mov	_cur_ID,#0x03
      000334 80 35            [24]  777 	sjmp	00143$
      000336                        778 00123$:
                                    779 ;	preemptive.c:249: else if (bitmap_ID & 0x1) cur_ID = 0;
      000336 E5 35            [12]  780 	mov	a,_bitmap_ID
      000338 30 E0 05         [24]  781 	jnb	acc.0,00120$
      00033B 75 34 00         [24]  782 	mov	_cur_ID,#0x00
      00033E 80 2B            [24]  783 	sjmp	00143$
      000340                        784 00120$:
                                    785 ;	preemptive.c:250: else if (bitmap_ID & 0x2) cur_ID = 1;
      000340 E5 35            [12]  786 	mov	a,_bitmap_ID
      000342 30 E1 26         [24]  787 	jnb	acc.1,00143$
      000345 75 34 01         [24]  788 	mov	_cur_ID,#0x01
      000348 80 21            [24]  789 	sjmp	00143$
      00034A                        790 00136$:
                                    791 ;	preemptive.c:251: } else if (cur_ID == 3) {
      00034A 74 03            [12]  792 	mov	a,#0x03
      00034C B5 34 1C         [24]  793 	cjne	a,_cur_ID,00143$
                                    794 ;	preemptive.c:252: if (bitmap_ID & 0x1) cur_ID = 0;
      00034F E5 35            [12]  795 	mov	a,_bitmap_ID
      000351 30 E0 05         [24]  796 	jnb	acc.0,00131$
      000354 75 34 00         [24]  797 	mov	_cur_ID,#0x00
      000357 80 12            [24]  798 	sjmp	00143$
      000359                        799 00131$:
                                    800 ;	preemptive.c:253: else if (bitmap_ID & 0x2) cur_ID = 1;
      000359 E5 35            [12]  801 	mov	a,_bitmap_ID
      00035B 30 E1 05         [24]  802 	jnb	acc.1,00128$
      00035E 75 34 01         [24]  803 	mov	_cur_ID,#0x01
      000361 80 08            [24]  804 	sjmp	00143$
      000363                        805 00128$:
                                    806 ;	preemptive.c:254: else if (bitmap_ID & 0x4) cur_ID = 2;
      000363 E5 35            [12]  807 	mov	a,_bitmap_ID
      000365 30 E2 03         [24]  808 	jnb	acc.2,00143$
      000368 75 34 02         [24]  809 	mov	_cur_ID,#0x02
      00036B                        810 00143$:
                                    811 ;	preemptive.c:256: RESTORESTATE;
      00036B E5 34            [12]  812 	mov	a,_cur_ID
      00036D 24 30            [12]  813 	add	a,#_saved_SP
      00036F F9               [12]  814 	mov	r1,a
      000370 87 81            [24]  815 	mov	_SP,@r1
      000372 D0 D0            [24]  816 	POP PSW 
      000374 D0 83            [24]  817 	POP DPH 
      000376 D0 82            [24]  818 	POP DPL 
      000378 D0 F0            [24]  819 	POP B 
      00037A D0 E0            [24]  820 	POP ACC 
      00037C                        821 00145$:
      00037C EF               [12]  822 	mov	a,r7
      00037D 13               [12]  823 	rrc	a
      00037E 92 AF            [24]  824 	mov	ea,c
                                    825 ;	preemptive.c:259: }
      000380 22               [24]  826 	ret
                                    827 	.area CSEG    (CODE)
                                    828 	.area CONST   (CODE)
                                    829 	.area XINIT   (CODE)
                                    830 	.area CABS    (ABS,CODE)
