                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl __mcs51_genXRAMCLEAR
                                     12 	.globl __mcs51_genXINIT
                                     13 	.globl __mcs51_genRAMCLEAR
                                     14 	.globl _timer0_ISR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _initialize
                                     21 	.globl _ThreadCreate
                                     22 	.globl _CY
                                     23 	.globl _AC
                                     24 	.globl _F0
                                     25 	.globl _RS1
                                     26 	.globl _RS0
                                     27 	.globl _OV
                                     28 	.globl _F1
                                     29 	.globl _P
                                     30 	.globl _PS
                                     31 	.globl _PT1
                                     32 	.globl _PX1
                                     33 	.globl _PT0
                                     34 	.globl _PX0
                                     35 	.globl _RD
                                     36 	.globl _WR
                                     37 	.globl _T1
                                     38 	.globl _T0
                                     39 	.globl _INT1
                                     40 	.globl _INT0
                                     41 	.globl _TXD
                                     42 	.globl _RXD
                                     43 	.globl _P3_7
                                     44 	.globl _P3_6
                                     45 	.globl _P3_5
                                     46 	.globl _P3_4
                                     47 	.globl _P3_3
                                     48 	.globl _P3_2
                                     49 	.globl _P3_1
                                     50 	.globl _P3_0
                                     51 	.globl _EA
                                     52 	.globl _ES
                                     53 	.globl _ET1
                                     54 	.globl _EX1
                                     55 	.globl _ET0
                                     56 	.globl _EX0
                                     57 	.globl _P2_7
                                     58 	.globl _P2_6
                                     59 	.globl _P2_5
                                     60 	.globl _P2_4
                                     61 	.globl _P2_3
                                     62 	.globl _P2_2
                                     63 	.globl _P2_1
                                     64 	.globl _P2_0
                                     65 	.globl _SM0
                                     66 	.globl _SM1
                                     67 	.globl _SM2
                                     68 	.globl _REN
                                     69 	.globl _TB8
                                     70 	.globl _RB8
                                     71 	.globl _TI
                                     72 	.globl _RI
                                     73 	.globl _P1_7
                                     74 	.globl _P1_6
                                     75 	.globl _P1_5
                                     76 	.globl _P1_4
                                     77 	.globl _P1_3
                                     78 	.globl _P1_2
                                     79 	.globl _P1_1
                                     80 	.globl _P1_0
                                     81 	.globl _TF1
                                     82 	.globl _TR1
                                     83 	.globl _TF0
                                     84 	.globl _TR0
                                     85 	.globl _IE1
                                     86 	.globl _IT1
                                     87 	.globl _IE0
                                     88 	.globl _IT0
                                     89 	.globl _P0_7
                                     90 	.globl _P0_6
                                     91 	.globl _P0_5
                                     92 	.globl _P0_4
                                     93 	.globl _P0_3
                                     94 	.globl _P0_2
                                     95 	.globl _P0_1
                                     96 	.globl _P0_0
                                     97 	.globl _B
                                     98 	.globl _ACC
                                     99 	.globl _PSW
                                    100 	.globl _IP
                                    101 	.globl _P3
                                    102 	.globl _IE
                                    103 	.globl _P2
                                    104 	.globl _SBUF
                                    105 	.globl _SCON
                                    106 	.globl _P1
                                    107 	.globl _TH1
                                    108 	.globl _TH0
                                    109 	.globl _TL1
                                    110 	.globl _TL0
                                    111 	.globl _TMOD
                                    112 	.globl _TCON
                                    113 	.globl _PCON
                                    114 	.globl _DPH
                                    115 	.globl _DPL
                                    116 	.globl _SP
                                    117 	.globl _P0
                                    118 	.globl _empty
                                    119 	.globl _full
                                    120 	.globl _mutex
                                    121 	.globl _buffer
                                    122 	.globl _nextNum
                                    123 	.globl _nextChar
                                    124 	.globl _tail
                                    125 	.globl _head
                                    126 ;--------------------------------------------------------
                                    127 ; special function registers
                                    128 ;--------------------------------------------------------
                                    129 	.area RSEG    (ABS,DATA)
      000000                        130 	.org 0x0000
                           000080   131 _P0	=	0x0080
                           000081   132 _SP	=	0x0081
                           000082   133 _DPL	=	0x0082
                           000083   134 _DPH	=	0x0083
                           000087   135 _PCON	=	0x0087
                           000088   136 _TCON	=	0x0088
                           000089   137 _TMOD	=	0x0089
                           00008A   138 _TL0	=	0x008a
                           00008B   139 _TL1	=	0x008b
                           00008C   140 _TH0	=	0x008c
                           00008D   141 _TH1	=	0x008d
                           000090   142 _P1	=	0x0090
                           000098   143 _SCON	=	0x0098
                           000099   144 _SBUF	=	0x0099
                           0000A0   145 _P2	=	0x00a0
                           0000A8   146 _IE	=	0x00a8
                           0000B0   147 _P3	=	0x00b0
                           0000B8   148 _IP	=	0x00b8
                           0000D0   149 _PSW	=	0x00d0
                           0000E0   150 _ACC	=	0x00e0
                           0000F0   151 _B	=	0x00f0
                                    152 ;--------------------------------------------------------
                                    153 ; special function bits
                                    154 ;--------------------------------------------------------
                                    155 	.area RSEG    (ABS,DATA)
      000000                        156 	.org 0x0000
                           000080   157 _P0_0	=	0x0080
                           000081   158 _P0_1	=	0x0081
                           000082   159 _P0_2	=	0x0082
                           000083   160 _P0_3	=	0x0083
                           000084   161 _P0_4	=	0x0084
                           000085   162 _P0_5	=	0x0085
                           000086   163 _P0_6	=	0x0086
                           000087   164 _P0_7	=	0x0087
                           000088   165 _IT0	=	0x0088
                           000089   166 _IE0	=	0x0089
                           00008A   167 _IT1	=	0x008a
                           00008B   168 _IE1	=	0x008b
                           00008C   169 _TR0	=	0x008c
                           00008D   170 _TF0	=	0x008d
                           00008E   171 _TR1	=	0x008e
                           00008F   172 _TF1	=	0x008f
                           000090   173 _P1_0	=	0x0090
                           000091   174 _P1_1	=	0x0091
                           000092   175 _P1_2	=	0x0092
                           000093   176 _P1_3	=	0x0093
                           000094   177 _P1_4	=	0x0094
                           000095   178 _P1_5	=	0x0095
                           000096   179 _P1_6	=	0x0096
                           000097   180 _P1_7	=	0x0097
                           000098   181 _RI	=	0x0098
                           000099   182 _TI	=	0x0099
                           00009A   183 _RB8	=	0x009a
                           00009B   184 _TB8	=	0x009b
                           00009C   185 _REN	=	0x009c
                           00009D   186 _SM2	=	0x009d
                           00009E   187 _SM1	=	0x009e
                           00009F   188 _SM0	=	0x009f
                           0000A0   189 _P2_0	=	0x00a0
                           0000A1   190 _P2_1	=	0x00a1
                           0000A2   191 _P2_2	=	0x00a2
                           0000A3   192 _P2_3	=	0x00a3
                           0000A4   193 _P2_4	=	0x00a4
                           0000A5   194 _P2_5	=	0x00a5
                           0000A6   195 _P2_6	=	0x00a6
                           0000A7   196 _P2_7	=	0x00a7
                           0000A8   197 _EX0	=	0x00a8
                           0000A9   198 _ET0	=	0x00a9
                           0000AA   199 _EX1	=	0x00aa
                           0000AB   200 _ET1	=	0x00ab
                           0000AC   201 _ES	=	0x00ac
                           0000AF   202 _EA	=	0x00af
                           0000B0   203 _P3_0	=	0x00b0
                           0000B1   204 _P3_1	=	0x00b1
                           0000B2   205 _P3_2	=	0x00b2
                           0000B3   206 _P3_3	=	0x00b3
                           0000B4   207 _P3_4	=	0x00b4
                           0000B5   208 _P3_5	=	0x00b5
                           0000B6   209 _P3_6	=	0x00b6
                           0000B7   210 _P3_7	=	0x00b7
                           0000B0   211 _RXD	=	0x00b0
                           0000B1   212 _TXD	=	0x00b1
                           0000B2   213 _INT0	=	0x00b2
                           0000B3   214 _INT1	=	0x00b3
                           0000B4   215 _T0	=	0x00b4
                           0000B5   216 _T1	=	0x00b5
                           0000B6   217 _WR	=	0x00b6
                           0000B7   218 _RD	=	0x00b7
                           0000B8   219 _PX0	=	0x00b8
                           0000B9   220 _PT0	=	0x00b9
                           0000BA   221 _PX1	=	0x00ba
                           0000BB   222 _PT1	=	0x00bb
                           0000BC   223 _PS	=	0x00bc
                           0000D0   224 _P	=	0x00d0
                           0000D1   225 _F1	=	0x00d1
                           0000D2   226 _OV	=	0x00d2
                           0000D3   227 _RS0	=	0x00d3
                           0000D4   228 _RS1	=	0x00d4
                           0000D5   229 _F0	=	0x00d5
                           0000D6   230 _AC	=	0x00d6
                           0000D7   231 _CY	=	0x00d7
                                    232 ;--------------------------------------------------------
                                    233 ; overlayable register banks
                                    234 ;--------------------------------------------------------
                                    235 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        236 	.ds 8
                                    237 ;--------------------------------------------------------
                                    238 ; internal ram data
                                    239 ;--------------------------------------------------------
                                    240 	.area DSEG    (DATA)
                           000039   241 _head	=	0x0039
                           00003A   242 _tail	=	0x003a
                           00003B   243 _nextChar	=	0x003b
                           00003C   244 _nextNum	=	0x003c
                           00003D   245 _buffer	=	0x003d
                           000020   246 _mutex	=	0x0020
                           000021   247 _full	=	0x0021
                           000022   248 _empty	=	0x0022
                                    249 ;--------------------------------------------------------
                                    250 ; overlayable items in internal ram 
                                    251 ;--------------------------------------------------------
                                    252 ;--------------------------------------------------------
                                    253 ; Stack segment in internal ram 
                                    254 ;--------------------------------------------------------
                                    255 	.area	SSEG
      00000A                        256 __start__stack:
      00000A                        257 	.ds	1
                                    258 
                                    259 ;--------------------------------------------------------
                                    260 ; indirectly addressable internal ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area ISEG    (DATA)
                                    263 ;--------------------------------------------------------
                                    264 ; absolute internal ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area IABS    (ABS,DATA)
                                    267 	.area IABS    (ABS,DATA)
                                    268 ;--------------------------------------------------------
                                    269 ; bit data
                                    270 ;--------------------------------------------------------
                                    271 	.area BSEG    (BIT)
                                    272 ;--------------------------------------------------------
                                    273 ; paged external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area PSEG    (PAG,XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; external ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XSEG    (XDATA)
                                    280 ;--------------------------------------------------------
                                    281 ; absolute external ram data
                                    282 ;--------------------------------------------------------
                                    283 	.area XABS    (ABS,XDATA)
                                    284 ;--------------------------------------------------------
                                    285 ; external initialized ram data
                                    286 ;--------------------------------------------------------
                                    287 	.area XISEG   (XDATA)
                                    288 	.area HOME    (CODE)
                                    289 	.area GSINIT0 (CODE)
                                    290 	.area GSINIT1 (CODE)
                                    291 	.area GSINIT2 (CODE)
                                    292 	.area GSINIT3 (CODE)
                                    293 	.area GSINIT4 (CODE)
                                    294 	.area GSINIT5 (CODE)
                                    295 	.area GSINIT  (CODE)
                                    296 	.area GSFINAL (CODE)
                                    297 	.area CSEG    (CODE)
                                    298 ;--------------------------------------------------------
                                    299 ; interrupt vector 
                                    300 ;--------------------------------------------------------
                                    301 	.area HOME    (CODE)
      000000                        302 __interrupt_vect:
      000000 02 01 42         [24]  303 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  304 	reti
      000004                        305 	.ds	7
      00000B 02 01 46         [24]  306 	ljmp	_timer0_ISR
                                    307 ;--------------------------------------------------------
                                    308 ; global & static initialisations
                                    309 ;--------------------------------------------------------
                                    310 	.area HOME    (CODE)
                                    311 	.area GSINIT  (CODE)
                                    312 	.area GSFINAL (CODE)
                                    313 	.area GSINIT  (CODE)
                                    314 	.globl __sdcc_gsinit_startup
                                    315 	.globl __sdcc_program_startup
                                    316 	.globl __start__stack
                                    317 	.globl __mcs51_genXINIT
                                    318 	.globl __mcs51_genXRAMCLEAR
                                    319 	.globl __mcs51_genRAMCLEAR
                                    320 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  321 	ljmp	__sdcc_program_startup
                                    322 ;--------------------------------------------------------
                                    323 ; Home
                                    324 ;--------------------------------------------------------
                                    325 	.area HOME    (CODE)
                                    326 	.area HOME    (CODE)
      00000E                        327 __sdcc_program_startup:
      00000E 02 01 24         [24]  328 	ljmp	_main
                                    329 ;	return from main will return to caller
                                    330 ;--------------------------------------------------------
                                    331 ; code
                                    332 ;--------------------------------------------------------
                                    333 	.area CSEG    (CODE)
                                    334 ;------------------------------------------------------------
                                    335 ;Allocation info for local variables in function 'initialize'
                                    336 ;------------------------------------------------------------
                                    337 ;	test3threads.c:16: void initialize(){
                                    338 ;	-----------------------------------------
                                    339 ;	 function initialize
                                    340 ;	-----------------------------------------
      000014                        341 _initialize:
                           000007   342 	ar7 = 0x07
                           000006   343 	ar6 = 0x06
                           000005   344 	ar5 = 0x05
                           000004   345 	ar4 = 0x04
                           000003   346 	ar3 = 0x03
                           000002   347 	ar2 = 0x02
                           000001   348 	ar1 = 0x01
                           000000   349 	ar0 = 0x00
                                    350 ;	test3threads.c:17: TMOD |= 0x20;
      000014 43 89 20         [24]  351 	orl	_TMOD,#0x20
                                    352 ;	test3threads.c:18: SCON = 0x50;        
      000017 75 98 50         [24]  353 	mov	_SCON,#0x50
                                    354 ;	test3threads.c:19: TH1 = (char) -6;            
      00001A 75 8D FA         [24]  355 	mov	_TH1,#0xfa
                                    356 ;	test3threads.c:20: TR1 = 1;            
                                    357 ;	assignBit
      00001D D2 8E            [12]  358 	setb	_TR1
                                    359 ;	test3threads.c:21: TI = 1;             
                                    360 ;	assignBit
      00001F D2 99            [12]  361 	setb	_TI
                                    362 ;	test3threads.c:22: }
      000021 22               [24]  363 	ret
                                    364 ;------------------------------------------------------------
                                    365 ;Allocation info for local variables in function 'Producer1'
                                    366 ;------------------------------------------------------------
                                    367 ;	test3threads.c:24: void Producer1(void) {
                                    368 ;	-----------------------------------------
                                    369 ;	 function Producer1
                                    370 ;	-----------------------------------------
      000022                        371 _Producer1:
                                    372 ;	test3threads.c:25: nextChar = 'A'; // 
      000022 75 3B 41         [24]  373 	mov	_nextChar,#0x41
                                    374 ;	test3threads.c:26: while (1) {
      000025                        375 00105$:
                                    376 ;	test3threads.c:27: SemaphoreWait(empty);
      000025                        377 		0$:
      000025 E5 22            [12]  378 	MOV A, _empty 
      000027 60 FC            [24]  379 	JZ 0$ 
      000029 20 E7 F9         [24]  380 	JB ACC.7, 0$ 
      00002C 15 22            [12]  381 	DEC _empty 
                                    382 ;	test3threads.c:28: SemaphoreWait(mutex);
      00002E                        383 		1$:
      00002E E5 20            [12]  384 	MOV A, _mutex 
      000030 60 FC            [24]  385 	JZ 1$ 
      000032 20 E7 F9         [24]  386 	JB ACC.7, 1$ 
      000035 15 20            [12]  387 	DEC _mutex 
                                    388 ;	test3threads.c:34: }
      000037 7F 01            [12]  389 	mov	r7,#0x01
      000039 10 AF 02         [24]  390 	jbc	ea,00117$
      00003C 7F 00            [12]  391 	mov	r7,#0x00
      00003E                        392 00117$:
                                    393 ;	test3threads.c:30: buffer[head] = nextChar;
      00003E E5 39            [12]  394 	mov	a,_head
      000040 24 3D            [12]  395 	add	a,#_buffer
      000042 F8               [12]  396 	mov	r0,a
      000043 A6 3B            [24]  397 	mov	@r0,_nextChar
                                    398 ;	test3threads.c:31: if (head == 2) head = 0;
      000045 74 02            [12]  399 	mov	a,#0x02
      000047 B5 39 05         [24]  400 	cjne	a,_head,00102$
      00004A 75 39 00         [24]  401 	mov	_head,#0x00
      00004D 80 06            [24]  402 	sjmp	00103$
      00004F                        403 00102$:
                                    404 ;	test3threads.c:32: else head = (head + 1);
      00004F E5 39            [12]  405 	mov	a,_head
      000051 FE               [12]  406 	mov	r6,a
      000052 04               [12]  407 	inc	a
      000053 F5 39            [12]  408 	mov	_head,a
      000055                        409 00103$:
                                    410 ;	test3threads.c:33: nextChar = (nextChar - 'A' + 1) % 26 + 'A';
      000055 AD 3B            [24]  411 	mov	r5,_nextChar
      000057 7E 00            [12]  412 	mov	r6,#0x00
      000059 74 C0            [12]  413 	mov	a,#0xc0
      00005B 2D               [12]  414 	add	a,r5
      00005C F5 82            [12]  415 	mov	dpl,a
      00005E 74 FF            [12]  416 	mov	a,#0xff
      000060 3E               [12]  417 	addc	a,r6
      000061 F5 83            [12]  418 	mov	dph,a
      000063 75 08 1A         [24]  419 	mov	__modsint_PARM_2,#0x1a
                                    420 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000066 8E 09            [24]  421 	mov	(__modsint_PARM_2 + 1),r6
      000068 C0 07            [24]  422 	push	ar7
      00006A 12 04 14         [24]  423 	lcall	__modsint
      00006D AD 82            [24]  424 	mov	r5,dpl
      00006F AE 83            [24]  425 	mov	r6,dph
      000071 D0 07            [24]  426 	pop	ar7
      000073 74 41            [12]  427 	mov	a,#0x41
      000075 2D               [12]  428 	add	a,r5
      000076 F5 3B            [12]  429 	mov	_nextChar,a
      000078 EF               [12]  430 	mov	a,r7
      000079 13               [12]  431 	rrc	a
      00007A 92 AF            [24]  432 	mov	ea,c
                                    433 ;	test3threads.c:35: SemaphoreSignal(mutex);
      00007C 05 20            [12]  434 	INC _mutex 
                                    435 ;	test3threads.c:36: SemaphoreSignal(full);
      00007E 05 21            [12]  436 	INC _full 
                                    437 ;	test3threads.c:38: }
      000080 80 A3            [24]  438 	sjmp	00105$
                                    439 ;------------------------------------------------------------
                                    440 ;Allocation info for local variables in function 'Producer2'
                                    441 ;------------------------------------------------------------
                                    442 ;	test3threads.c:40: void Producer2(void) {
                                    443 ;	-----------------------------------------
                                    444 ;	 function Producer2
                                    445 ;	-----------------------------------------
      000082                        446 _Producer2:
                                    447 ;	test3threads.c:41: nextNum = '0'; // 
      000082 75 3C 30         [24]  448 	mov	_nextNum,#0x30
                                    449 ;	test3threads.c:42: while (1) {
      000085                        450 00105$:
                                    451 ;	test3threads.c:43: SemaphoreWait(empty);
      000085                        452 		2$:
      000085 E5 22            [12]  453 	MOV A, _empty 
      000087 60 FC            [24]  454 	JZ 2$ 
      000089 20 E7 F9         [24]  455 	JB ACC.7, 2$ 
      00008C 15 22            [12]  456 	DEC _empty 
                                    457 ;	test3threads.c:44: SemaphoreWait(mutex);
      00008E                        458 		3$:
      00008E E5 20            [12]  459 	MOV A, _mutex 
      000090 60 FC            [24]  460 	JZ 3$ 
      000092 20 E7 F9         [24]  461 	JB ACC.7, 3$ 
      000095 15 20            [12]  462 	DEC _mutex 
                                    463 ;	test3threads.c:50: }
      000097 7F 01            [12]  464 	mov	r7,#0x01
      000099 10 AF 02         [24]  465 	jbc	ea,00117$
      00009C 7F 00            [12]  466 	mov	r7,#0x00
      00009E                        467 00117$:
                                    468 ;	test3threads.c:46: buffer[head] = nextNum;
      00009E E5 39            [12]  469 	mov	a,_head
      0000A0 24 3D            [12]  470 	add	a,#_buffer
      0000A2 F8               [12]  471 	mov	r0,a
      0000A3 A6 3C            [24]  472 	mov	@r0,_nextNum
                                    473 ;	test3threads.c:47: if (head == 2) head = 0;
      0000A5 74 02            [12]  474 	mov	a,#0x02
      0000A7 B5 39 05         [24]  475 	cjne	a,_head,00102$
      0000AA 75 39 00         [24]  476 	mov	_head,#0x00
      0000AD 80 06            [24]  477 	sjmp	00103$
      0000AF                        478 00102$:
                                    479 ;	test3threads.c:48: else head = (head + 1);
      0000AF E5 39            [12]  480 	mov	a,_head
      0000B1 FE               [12]  481 	mov	r6,a
      0000B2 04               [12]  482 	inc	a
      0000B3 F5 39            [12]  483 	mov	_head,a
      0000B5                        484 00103$:
                                    485 ;	test3threads.c:49: nextNum = (nextNum - '0' + 1) % 10 + '0';
      0000B5 AD 3C            [24]  486 	mov	r5,_nextNum
      0000B7 7E 00            [12]  487 	mov	r6,#0x00
      0000B9 74 D1            [12]  488 	mov	a,#0xd1
      0000BB 2D               [12]  489 	add	a,r5
      0000BC F5 82            [12]  490 	mov	dpl,a
      0000BE 74 FF            [12]  491 	mov	a,#0xff
      0000C0 3E               [12]  492 	addc	a,r6
      0000C1 F5 83            [12]  493 	mov	dph,a
      0000C3 75 08 0A         [24]  494 	mov	__modsint_PARM_2,#0x0a
                                    495 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      0000C6 8E 09            [24]  496 	mov	(__modsint_PARM_2 + 1),r6
      0000C8 C0 07            [24]  497 	push	ar7
      0000CA 12 04 14         [24]  498 	lcall	__modsint
      0000CD AD 82            [24]  499 	mov	r5,dpl
      0000CF AE 83            [24]  500 	mov	r6,dph
      0000D1 D0 07            [24]  501 	pop	ar7
      0000D3 74 30            [12]  502 	mov	a,#0x30
      0000D5 2D               [12]  503 	add	a,r5
      0000D6 F5 3C            [12]  504 	mov	_nextNum,a
      0000D8 EF               [12]  505 	mov	a,r7
      0000D9 13               [12]  506 	rrc	a
      0000DA 92 AF            [24]  507 	mov	ea,c
                                    508 ;	test3threads.c:51: SemaphoreSignal(mutex);
      0000DC 05 20            [12]  509 	INC _mutex 
                                    510 ;	test3threads.c:52: SemaphoreSignal(full);
      0000DE 05 21            [12]  511 	INC _full 
                                    512 ;	test3threads.c:54: }
      0000E0 80 A3            [24]  513 	sjmp	00105$
                                    514 ;------------------------------------------------------------
                                    515 ;Allocation info for local variables in function 'Consumer'
                                    516 ;------------------------------------------------------------
                                    517 ;	test3threads.c:56: void Consumer(void) {
                                    518 ;	-----------------------------------------
                                    519 ;	 function Consumer
                                    520 ;	-----------------------------------------
      0000E2                        521 _Consumer:
                                    522 ;	test3threads.c:57: initialize();
      0000E2 12 00 14         [24]  523 	lcall	_initialize
                                    524 ;	test3threads.c:58: while (1) {
      0000E5                        525 00108$:
                                    526 ;	test3threads.c:59: SemaphoreWait(full);
      0000E5                        527 		4$:
      0000E5 E5 21            [12]  528 	MOV A, _full 
      0000E7 60 FC            [24]  529 	JZ 4$ 
      0000E9 20 E7 F9         [24]  530 	JB ACC.7, 4$ 
      0000EC 15 21            [12]  531 	DEC _full 
                                    532 ;	test3threads.c:60: SemaphoreWait(mutex);
      0000EE                        533 		5$:
      0000EE E5 20            [12]  534 	MOV A, _mutex 
      0000F0 60 FC            [24]  535 	JZ 5$ 
      0000F2 20 E7 F9         [24]  536 	JB ACC.7, 5$ 
      0000F5 15 20            [12]  537 	DEC _mutex 
                                    538 ;	test3threads.c:61: while (!TI); // 等待傳輸完成
      0000F7                        539 00101$:
      0000F7 30 99 FD         [24]  540 	jnb	_TI,00101$
                                    541 ;	test3threads.c:69: }
      0000FA 7F 01            [12]  542 	mov	r7,#0x01
      0000FC 10 AF 02         [24]  543 	jbc	ea,00129$
      0000FF 7F 00            [12]  544 	mov	r7,#0x00
      000101                        545 00129$:
                                    546 ;	test3threads.c:63: SBUF = buffer[tail];
      000101 E5 3A            [12]  547 	mov	a,_tail
      000103 24 3D            [12]  548 	add	a,#_buffer
      000105 F9               [12]  549 	mov	r1,a
      000106 87 99            [24]  550 	mov	_SBUF,@r1
                                    551 ;	test3threads.c:64: TI = 0; // mark done
                                    552 ;	assignBit
      000108 C2 99            [12]  553 	clr	_TI
                                    554 ;	test3threads.c:65: if (tail == 2) tail = 0;
      00010A 74 02            [12]  555 	mov	a,#0x02
      00010C B5 3A 05         [24]  556 	cjne	a,_tail,00105$
      00010F 75 3A 00         [24]  557 	mov	_tail,#0x00
      000112 80 06            [24]  558 	sjmp	00106$
      000114                        559 00105$:
                                    560 ;	test3threads.c:66: else tail = tail + 1;
      000114 E5 3A            [12]  561 	mov	a,_tail
      000116 FE               [12]  562 	mov	r6,a
      000117 04               [12]  563 	inc	a
      000118 F5 3A            [12]  564 	mov	_tail,a
      00011A                        565 00106$:
      00011A EF               [12]  566 	mov	a,r7
      00011B 13               [12]  567 	rrc	a
      00011C 92 AF            [24]  568 	mov	ea,c
                                    569 ;	test3threads.c:70: SemaphoreSignal(mutex);
      00011E 05 20            [12]  570 	INC _mutex 
                                    571 ;	test3threads.c:71: SemaphoreSignal(empty);
      000120 05 22            [12]  572 	INC _empty 
                                    573 ;	test3threads.c:73: }
      000122 80 C1            [24]  574 	sjmp	00108$
                                    575 ;------------------------------------------------------------
                                    576 ;Allocation info for local variables in function 'main'
                                    577 ;------------------------------------------------------------
                                    578 ;	test3threads.c:75: void main(void) {
                                    579 ;	-----------------------------------------
                                    580 ;	 function main
                                    581 ;	-----------------------------------------
      000124                        582 _main:
                                    583 ;	test3threads.c:79: SemaphoreCreate(mutex, 1);
      000124 75 20 01         [24]  584 	mov	_mutex,#0x01
                                    585 ;	test3threads.c:80: SemaphoreCreate(full, 0);
      000127 75 21 00         [24]  586 	mov	_full,#0x00
                                    587 ;	test3threads.c:81: SemaphoreCreate(empty, 3);
      00012A 75 22 03         [24]  588 	mov	_empty,#0x03
                                    589 ;	test3threads.c:84: head = tail = 0;
      00012D 75 3A 00         [24]  590 	mov	_tail,#0x00
      000130 75 39 00         [24]  591 	mov	_head,#0x00
                                    592 ;	test3threads.c:85: ThreadCreate(Producer1); // 
      000133 90 00 22         [24]  593 	mov	dptr,#_Producer1
      000136 12 01 79         [24]  594 	lcall	_ThreadCreate
                                    595 ;	test3threads.c:86: ThreadCreate(Producer2); // 
      000139 90 00 82         [24]  596 	mov	dptr,#_Producer2
      00013C 12 01 79         [24]  597 	lcall	_ThreadCreate
                                    598 ;	test3threads.c:89: Consumer(); // 
                                    599 ;	test3threads.c:90: }
      00013F 02 00 E2         [24]  600 	ljmp	_Consumer
                                    601 ;------------------------------------------------------------
                                    602 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    603 ;------------------------------------------------------------
                                    604 ;	test3threads.c:92: void _sdcc_gsinit_startup(void) {
                                    605 ;	-----------------------------------------
                                    606 ;	 function _sdcc_gsinit_startup
                                    607 ;	-----------------------------------------
      000142                        608 __sdcc_gsinit_startup:
                                    609 ;	test3threads.c:95: __endasm;
      000142 02 01 4D         [24]  610 	LJMP	_Bootstrap
                                    611 ;	test3threads.c:96: }
      000145 22               [24]  612 	ret
                                    613 ;------------------------------------------------------------
                                    614 ;Allocation info for local variables in function 'timer0_ISR'
                                    615 ;------------------------------------------------------------
                                    616 ;	test3threads.c:97: void timer0_ISR(void) __interrupt(1) {
                                    617 ;	-----------------------------------------
                                    618 ;	 function timer0_ISR
                                    619 ;	-----------------------------------------
      000146                        620 _timer0_ISR:
                                    621 ;	test3threads.c:100: __endasm;
      000146 02 02 B4         [24]  622 	LJMP	_myTimer0Handler
                                    623 ;	test3threads.c:101: }
      000149 32               [24]  624 	reti
                                    625 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    626 ;	eliminated unneeded push/pop psw
                                    627 ;	eliminated unneeded push/pop dpl
                                    628 ;	eliminated unneeded push/pop dph
                                    629 ;	eliminated unneeded push/pop b
                                    630 ;	eliminated unneeded push/pop acc
                                    631 ;------------------------------------------------------------
                                    632 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    633 ;------------------------------------------------------------
                                    634 ;	test3threads.c:103: void _mcs51_genRAMCLEAR(void) {}
                                    635 ;	-----------------------------------------
                                    636 ;	 function _mcs51_genRAMCLEAR
                                    637 ;	-----------------------------------------
      00014A                        638 __mcs51_genRAMCLEAR:
      00014A 22               [24]  639 	ret
                                    640 ;------------------------------------------------------------
                                    641 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    642 ;------------------------------------------------------------
                                    643 ;	test3threads.c:104: void _mcs51_genXINIT(void) {}
                                    644 ;	-----------------------------------------
                                    645 ;	 function _mcs51_genXINIT
                                    646 ;	-----------------------------------------
      00014B                        647 __mcs51_genXINIT:
      00014B 22               [24]  648 	ret
                                    649 ;------------------------------------------------------------
                                    650 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    651 ;------------------------------------------------------------
                                    652 ;	test3threads.c:105: void _mcs51_genXRAMCLEAR(void) {}
                                    653 ;	-----------------------------------------
                                    654 ;	 function _mcs51_genXRAMCLEAR
                                    655 ;	-----------------------------------------
      00014C                        656 __mcs51_genXRAMCLEAR:
      00014C 22               [24]  657 	ret
                                    658 	.area CSEG    (CODE)
                                    659 	.area CONST   (CODE)
                                    660 	.area XINIT   (CODE)
                                    661 	.area CABS    (ABS,CODE)
