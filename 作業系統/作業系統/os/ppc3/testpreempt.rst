                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
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
                                     18 	.globl _Producer
                                     19 	.globl _initialize
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _empty
                                    118 	.globl _full
                                    119 	.globl _mutex
                                    120 	.globl _buffer
                                    121 	.globl _nextChar
                                    122 	.globl _tail
                                    123 	.globl _head
                                    124 ;--------------------------------------------------------
                                    125 ; special function registers
                                    126 ;--------------------------------------------------------
                                    127 	.area RSEG    (ABS,DATA)
      000000                        128 	.org 0x0000
                           000080   129 _P0	=	0x0080
                           000081   130 _SP	=	0x0081
                           000082   131 _DPL	=	0x0082
                           000083   132 _DPH	=	0x0083
                           000087   133 _PCON	=	0x0087
                           000088   134 _TCON	=	0x0088
                           000089   135 _TMOD	=	0x0089
                           00008A   136 _TL0	=	0x008a
                           00008B   137 _TL1	=	0x008b
                           00008C   138 _TH0	=	0x008c
                           00008D   139 _TH1	=	0x008d
                           000090   140 _P1	=	0x0090
                           000098   141 _SCON	=	0x0098
                           000099   142 _SBUF	=	0x0099
                           0000A0   143 _P2	=	0x00a0
                           0000A8   144 _IE	=	0x00a8
                           0000B0   145 _P3	=	0x00b0
                           0000B8   146 _IP	=	0x00b8
                           0000D0   147 _PSW	=	0x00d0
                           0000E0   148 _ACC	=	0x00e0
                           0000F0   149 _B	=	0x00f0
                                    150 ;--------------------------------------------------------
                                    151 ; special function bits
                                    152 ;--------------------------------------------------------
                                    153 	.area RSEG    (ABS,DATA)
      000000                        154 	.org 0x0000
                           000080   155 _P0_0	=	0x0080
                           000081   156 _P0_1	=	0x0081
                           000082   157 _P0_2	=	0x0082
                           000083   158 _P0_3	=	0x0083
                           000084   159 _P0_4	=	0x0084
                           000085   160 _P0_5	=	0x0085
                           000086   161 _P0_6	=	0x0086
                           000087   162 _P0_7	=	0x0087
                           000088   163 _IT0	=	0x0088
                           000089   164 _IE0	=	0x0089
                           00008A   165 _IT1	=	0x008a
                           00008B   166 _IE1	=	0x008b
                           00008C   167 _TR0	=	0x008c
                           00008D   168 _TF0	=	0x008d
                           00008E   169 _TR1	=	0x008e
                           00008F   170 _TF1	=	0x008f
                           000090   171 _P1_0	=	0x0090
                           000091   172 _P1_1	=	0x0091
                           000092   173 _P1_2	=	0x0092
                           000093   174 _P1_3	=	0x0093
                           000094   175 _P1_4	=	0x0094
                           000095   176 _P1_5	=	0x0095
                           000096   177 _P1_6	=	0x0096
                           000097   178 _P1_7	=	0x0097
                           000098   179 _RI	=	0x0098
                           000099   180 _TI	=	0x0099
                           00009A   181 _RB8	=	0x009a
                           00009B   182 _TB8	=	0x009b
                           00009C   183 _REN	=	0x009c
                           00009D   184 _SM2	=	0x009d
                           00009E   185 _SM1	=	0x009e
                           00009F   186 _SM0	=	0x009f
                           0000A0   187 _P2_0	=	0x00a0
                           0000A1   188 _P2_1	=	0x00a1
                           0000A2   189 _P2_2	=	0x00a2
                           0000A3   190 _P2_3	=	0x00a3
                           0000A4   191 _P2_4	=	0x00a4
                           0000A5   192 _P2_5	=	0x00a5
                           0000A6   193 _P2_6	=	0x00a6
                           0000A7   194 _P2_7	=	0x00a7
                           0000A8   195 _EX0	=	0x00a8
                           0000A9   196 _ET0	=	0x00a9
                           0000AA   197 _EX1	=	0x00aa
                           0000AB   198 _ET1	=	0x00ab
                           0000AC   199 _ES	=	0x00ac
                           0000AF   200 _EA	=	0x00af
                           0000B0   201 _P3_0	=	0x00b0
                           0000B1   202 _P3_1	=	0x00b1
                           0000B2   203 _P3_2	=	0x00b2
                           0000B3   204 _P3_3	=	0x00b3
                           0000B4   205 _P3_4	=	0x00b4
                           0000B5   206 _P3_5	=	0x00b5
                           0000B6   207 _P3_6	=	0x00b6
                           0000B7   208 _P3_7	=	0x00b7
                           0000B0   209 _RXD	=	0x00b0
                           0000B1   210 _TXD	=	0x00b1
                           0000B2   211 _INT0	=	0x00b2
                           0000B3   212 _INT1	=	0x00b3
                           0000B4   213 _T0	=	0x00b4
                           0000B5   214 _T1	=	0x00b5
                           0000B6   215 _WR	=	0x00b6
                           0000B7   216 _RD	=	0x00b7
                           0000B8   217 _PX0	=	0x00b8
                           0000B9   218 _PT0	=	0x00b9
                           0000BA   219 _PX1	=	0x00ba
                           0000BB   220 _PT1	=	0x00bb
                           0000BC   221 _PS	=	0x00bc
                           0000D0   222 _P	=	0x00d0
                           0000D1   223 _F1	=	0x00d1
                           0000D2   224 _OV	=	0x00d2
                           0000D3   225 _RS0	=	0x00d3
                           0000D4   226 _RS1	=	0x00d4
                           0000D5   227 _F0	=	0x00d5
                           0000D6   228 _AC	=	0x00d6
                           0000D7   229 _CY	=	0x00d7
                                    230 ;--------------------------------------------------------
                                    231 ; overlayable register banks
                                    232 ;--------------------------------------------------------
                                    233 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        234 	.ds 8
                                    235 ;--------------------------------------------------------
                                    236 ; internal ram data
                                    237 ;--------------------------------------------------------
                                    238 	.area DSEG    (DATA)
                           000038   239 _head	=	0x0038
                           000039   240 _tail	=	0x0039
                           00003A   241 _nextChar	=	0x003a
                           00003B   242 _buffer	=	0x003b
                           000020   243 _mutex	=	0x0020
                           000021   244 _full	=	0x0021
                           000022   245 _empty	=	0x0022
                                    246 ;--------------------------------------------------------
                                    247 ; overlayable items in internal ram 
                                    248 ;--------------------------------------------------------
                                    249 ;--------------------------------------------------------
                                    250 ; Stack segment in internal ram 
                                    251 ;--------------------------------------------------------
                                    252 	.area	SSEG
      00000A                        253 __start__stack:
      00000A                        254 	.ds	1
                                    255 
                                    256 ;--------------------------------------------------------
                                    257 ; indirectly addressable internal ram data
                                    258 ;--------------------------------------------------------
                                    259 	.area ISEG    (DATA)
                                    260 ;--------------------------------------------------------
                                    261 ; absolute internal ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area IABS    (ABS,DATA)
                                    264 	.area IABS    (ABS,DATA)
                                    265 ;--------------------------------------------------------
                                    266 ; bit data
                                    267 ;--------------------------------------------------------
                                    268 	.area BSEG    (BIT)
                                    269 ;--------------------------------------------------------
                                    270 ; paged external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area PSEG    (PAG,XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; external ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XSEG    (XDATA)
                                    277 ;--------------------------------------------------------
                                    278 ; absolute external ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area XABS    (ABS,XDATA)
                                    281 ;--------------------------------------------------------
                                    282 ; external initialized ram data
                                    283 ;--------------------------------------------------------
                                    284 	.area XISEG   (XDATA)
                                    285 	.area HOME    (CODE)
                                    286 	.area GSINIT0 (CODE)
                                    287 	.area GSINIT1 (CODE)
                                    288 	.area GSINIT2 (CODE)
                                    289 	.area GSINIT3 (CODE)
                                    290 	.area GSINIT4 (CODE)
                                    291 	.area GSINIT5 (CODE)
                                    292 	.area GSINIT  (CODE)
                                    293 	.area GSFINAL (CODE)
                                    294 	.area CSEG    (CODE)
                                    295 ;--------------------------------------------------------
                                    296 ; interrupt vector 
                                    297 ;--------------------------------------------------------
                                    298 	.area HOME    (CODE)
      000000                        299 __interrupt_vect:
      000000 02 00 DC         [24]  300 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  301 	reti
      000004                        302 	.ds	7
      00000B 02 00 E0         [24]  303 	ljmp	_timer0_ISR
                                    304 ;--------------------------------------------------------
                                    305 ; global & static initialisations
                                    306 ;--------------------------------------------------------
                                    307 	.area HOME    (CODE)
                                    308 	.area GSINIT  (CODE)
                                    309 	.area GSFINAL (CODE)
                                    310 	.area GSINIT  (CODE)
                                    311 	.globl __sdcc_gsinit_startup
                                    312 	.globl __sdcc_program_startup
                                    313 	.globl __start__stack
                                    314 	.globl __mcs51_genXINIT
                                    315 	.globl __mcs51_genXRAMCLEAR
                                    316 	.globl __mcs51_genRAMCLEAR
                                    317 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  318 	ljmp	__sdcc_program_startup
                                    319 ;--------------------------------------------------------
                                    320 ; Home
                                    321 ;--------------------------------------------------------
                                    322 	.area HOME    (CODE)
                                    323 	.area HOME    (CODE)
      00000E                        324 __sdcc_program_startup:
      00000E 02 00 C4         [24]  325 	ljmp	_main
                                    326 ;	return from main will return to caller
                                    327 ;--------------------------------------------------------
                                    328 ; code
                                    329 ;--------------------------------------------------------
                                    330 	.area CSEG    (CODE)
                                    331 ;------------------------------------------------------------
                                    332 ;Allocation info for local variables in function 'initialize'
                                    333 ;------------------------------------------------------------
                                    334 ;	testpreempt.c:15: void initialize(){
                                    335 ;	-----------------------------------------
                                    336 ;	 function initialize
                                    337 ;	-----------------------------------------
      000014                        338 _initialize:
                           000007   339 	ar7 = 0x07
                           000006   340 	ar6 = 0x06
                           000005   341 	ar5 = 0x05
                           000004   342 	ar4 = 0x04
                           000003   343 	ar3 = 0x03
                           000002   344 	ar2 = 0x02
                           000001   345 	ar1 = 0x01
                           000000   346 	ar0 = 0x00
                                    347 ;	testpreempt.c:16: TMOD |= 0x20;
      000014 43 89 20         [24]  348 	orl	_TMOD,#0x20
                                    349 ;	testpreempt.c:17: SCON = 0x50;        
      000017 75 98 50         [24]  350 	mov	_SCON,#0x50
                                    351 ;	testpreempt.c:18: TH1 = (char) -6;            
      00001A 75 8D FA         [24]  352 	mov	_TH1,#0xfa
                                    353 ;	testpreempt.c:19: TR1 = 1;            
                                    354 ;	assignBit
      00001D D2 8E            [12]  355 	setb	_TR1
                                    356 ;	testpreempt.c:20: TI = 1;             
                                    357 ;	assignBit
      00001F D2 99            [12]  358 	setb	_TI
                                    359 ;	testpreempt.c:21: }
      000021 22               [24]  360 	ret
                                    361 ;------------------------------------------------------------
                                    362 ;Allocation info for local variables in function 'Producer'
                                    363 ;------------------------------------------------------------
                                    364 ;	testpreempt.c:23: void Producer(void) {
                                    365 ;	-----------------------------------------
                                    366 ;	 function Producer
                                    367 ;	-----------------------------------------
      000022                        368 _Producer:
                                    369 ;	testpreempt.c:24: nextChar = 'A'; // 
      000022 75 3A 41         [24]  370 	mov	_nextChar,#0x41
                                    371 ;	testpreempt.c:25: while (1) {
      000025                        372 00105$:
                                    373 ;	testpreempt.c:26: SemaphoreWait(empty);
      000025                        374 		0$:
      000025 E5 22            [12]  375 	MOV A, _empty 
      000027 60 FC            [24]  376 	JZ 0$ 
      000029 20 E7 F9         [24]  377 	JB ACC.7, 0$ 
      00002C 15 22            [12]  378 	DEC _empty 
                                    379 ;	testpreempt.c:27: SemaphoreWait(mutex);
      00002E                        380 		1$:
      00002E E5 20            [12]  381 	MOV A, _mutex 
      000030 60 FC            [24]  382 	JZ 1$ 
      000032 20 E7 F9         [24]  383 	JB ACC.7, 1$ 
      000035 15 20            [12]  384 	DEC _mutex 
                                    385 ;	testpreempt.c:33: }
      000037 7F 01            [12]  386 	mov	r7,#0x01
      000039 10 AF 02         [24]  387 	jbc	ea,00117$
      00003C 7F 00            [12]  388 	mov	r7,#0x00
      00003E                        389 00117$:
                                    390 ;	testpreempt.c:29: buffer[head] = nextChar;
      00003E E5 38            [12]  391 	mov	a,_head
      000040 24 3B            [12]  392 	add	a,#_buffer
      000042 F8               [12]  393 	mov	r0,a
      000043 A6 3A            [24]  394 	mov	@r0,_nextChar
                                    395 ;	testpreempt.c:30: if (head == 2) head = 0;
      000045 74 02            [12]  396 	mov	a,#0x02
      000047 B5 38 05         [24]  397 	cjne	a,_head,00102$
      00004A 75 38 00         [24]  398 	mov	_head,#0x00
      00004D 80 06            [24]  399 	sjmp	00103$
      00004F                        400 00102$:
                                    401 ;	testpreempt.c:31: else head = (head + 1);
      00004F E5 38            [12]  402 	mov	a,_head
      000051 FE               [12]  403 	mov	r6,a
      000052 04               [12]  404 	inc	a
      000053 F5 38            [12]  405 	mov	_head,a
      000055                        406 00103$:
                                    407 ;	testpreempt.c:32: nextChar = (nextChar - 'A' + 1) % 26 + 'A';
      000055 AD 3A            [24]  408 	mov	r5,_nextChar
      000057 7E 00            [12]  409 	mov	r6,#0x00
      000059 74 C0            [12]  410 	mov	a,#0xc0
      00005B 2D               [12]  411 	add	a,r5
      00005C F5 82            [12]  412 	mov	dpl,a
      00005E 74 FF            [12]  413 	mov	a,#0xff
      000060 3E               [12]  414 	addc	a,r6
      000061 F5 83            [12]  415 	mov	dph,a
      000063 75 08 1A         [24]  416 	mov	__modsint_PARM_2,#0x1a
                                    417 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000066 8E 09            [24]  418 	mov	(__modsint_PARM_2 + 1),r6
      000068 C0 07            [24]  419 	push	ar7
      00006A 12 04 07         [24]  420 	lcall	__modsint
      00006D AD 82            [24]  421 	mov	r5,dpl
      00006F AE 83            [24]  422 	mov	r6,dph
      000071 D0 07            [24]  423 	pop	ar7
      000073 74 41            [12]  424 	mov	a,#0x41
      000075 2D               [12]  425 	add	a,r5
      000076 F5 3A            [12]  426 	mov	_nextChar,a
      000078 EF               [12]  427 	mov	a,r7
      000079 13               [12]  428 	rrc	a
      00007A 92 AF            [24]  429 	mov	ea,c
                                    430 ;	testpreempt.c:34: SemaphoreSignal(mutex);
      00007C 05 20            [12]  431 	INC _mutex 
                                    432 ;	testpreempt.c:35: SemaphoreSignal(full);
      00007E 05 21            [12]  433 	INC _full 
                                    434 ;	testpreempt.c:37: }
      000080 80 A3            [24]  435 	sjmp	00105$
                                    436 ;------------------------------------------------------------
                                    437 ;Allocation info for local variables in function 'Consumer'
                                    438 ;------------------------------------------------------------
                                    439 ;	testpreempt.c:39: void Consumer(void) {
                                    440 ;	-----------------------------------------
                                    441 ;	 function Consumer
                                    442 ;	-----------------------------------------
      000082                        443 _Consumer:
                                    444 ;	testpreempt.c:40: initialize();
      000082 12 00 14         [24]  445 	lcall	_initialize
                                    446 ;	testpreempt.c:41: while (1) {
      000085                        447 00108$:
                                    448 ;	testpreempt.c:42: SemaphoreWait(full);
      000085                        449 		2$:
      000085 E5 21            [12]  450 	MOV A, _full 
      000087 60 FC            [24]  451 	JZ 2$ 
      000089 20 E7 F9         [24]  452 	JB ACC.7, 2$ 
      00008C 15 21            [12]  453 	DEC _full 
                                    454 ;	testpreempt.c:43: SemaphoreWait(mutex);
      00008E                        455 		3$:
      00008E E5 20            [12]  456 	MOV A, _mutex 
      000090 60 FC            [24]  457 	JZ 3$ 
      000092 20 E7 F9         [24]  458 	JB ACC.7, 3$ 
      000095 15 20            [12]  459 	DEC _mutex 
                                    460 ;	testpreempt.c:44: while (!TI); // 等待傳輸完成
      000097                        461 00101$:
      000097 30 99 FD         [24]  462 	jnb	_TI,00101$
                                    463 ;	testpreempt.c:52: }
      00009A 7F 01            [12]  464 	mov	r7,#0x01
      00009C 10 AF 02         [24]  465 	jbc	ea,00129$
      00009F 7F 00            [12]  466 	mov	r7,#0x00
      0000A1                        467 00129$:
                                    468 ;	testpreempt.c:46: SBUF = buffer[tail];
      0000A1 E5 39            [12]  469 	mov	a,_tail
      0000A3 24 3B            [12]  470 	add	a,#_buffer
      0000A5 F9               [12]  471 	mov	r1,a
      0000A6 87 99            [24]  472 	mov	_SBUF,@r1
                                    473 ;	testpreempt.c:47: TI = 0; // mark done
                                    474 ;	assignBit
      0000A8 C2 99            [12]  475 	clr	_TI
                                    476 ;	testpreempt.c:48: if (tail == 2) tail = 0;
      0000AA 74 02            [12]  477 	mov	a,#0x02
      0000AC B5 39 05         [24]  478 	cjne	a,_tail,00105$
      0000AF 75 39 00         [24]  479 	mov	_tail,#0x00
      0000B2 80 06            [24]  480 	sjmp	00106$
      0000B4                        481 00105$:
                                    482 ;	testpreempt.c:49: else tail = tail + 1;
      0000B4 E5 39            [12]  483 	mov	a,_tail
      0000B6 FE               [12]  484 	mov	r6,a
      0000B7 04               [12]  485 	inc	a
      0000B8 F5 39            [12]  486 	mov	_tail,a
      0000BA                        487 00106$:
      0000BA EF               [12]  488 	mov	a,r7
      0000BB 13               [12]  489 	rrc	a
      0000BC 92 AF            [24]  490 	mov	ea,c
                                    491 ;	testpreempt.c:53: SemaphoreSignal(mutex);
      0000BE 05 20            [12]  492 	INC _mutex 
                                    493 ;	testpreempt.c:54: SemaphoreSignal(empty);
      0000C0 05 22            [12]  494 	INC _empty 
                                    495 ;	testpreempt.c:56: }
      0000C2 80 C1            [24]  496 	sjmp	00108$
                                    497 ;------------------------------------------------------------
                                    498 ;Allocation info for local variables in function 'main'
                                    499 ;------------------------------------------------------------
                                    500 ;	testpreempt.c:58: void main(void) {
                                    501 ;	-----------------------------------------
                                    502 ;	 function main
                                    503 ;	-----------------------------------------
      0000C4                        504 _main:
                                    505 ;	testpreempt.c:62: SemaphoreCreate(mutex, 1);
      0000C4 75 20 01         [24]  506 	mov	_mutex,#0x01
                                    507 ;	testpreempt.c:63: SemaphoreCreate(full, 0);
      0000C7 75 21 00         [24]  508 	mov	_full,#0x00
                                    509 ;	testpreempt.c:64: SemaphoreCreate(empty, 3);
      0000CA 75 22 03         [24]  510 	mov	_empty,#0x03
                                    511 ;	testpreempt.c:67: head = tail = 0;
      0000CD 75 39 00         [24]  512 	mov	_tail,#0x00
      0000D0 75 38 00         [24]  513 	mov	_head,#0x00
                                    514 ;	testpreempt.c:68: ThreadCreate(Producer); // 
      0000D3 90 00 22         [24]  515 	mov	dptr,#_Producer
      0000D6 12 01 10         [24]  516 	lcall	_ThreadCreate
                                    517 ;	testpreempt.c:69: Consumer(); // 
                                    518 ;	testpreempt.c:70: }
      0000D9 02 00 82         [24]  519 	ljmp	_Consumer
                                    520 ;------------------------------------------------------------
                                    521 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    522 ;------------------------------------------------------------
                                    523 ;	testpreempt.c:72: void _sdcc_gsinit_startup(void) {
                                    524 ;	-----------------------------------------
                                    525 ;	 function _sdcc_gsinit_startup
                                    526 ;	-----------------------------------------
      0000DC                        527 __sdcc_gsinit_startup:
                                    528 ;	testpreempt.c:75: __endasm;
      0000DC 02 00 E7         [24]  529 	LJMP	_Bootstrap
                                    530 ;	testpreempt.c:76: }
      0000DF 22               [24]  531 	ret
                                    532 ;------------------------------------------------------------
                                    533 ;Allocation info for local variables in function 'timer0_ISR'
                                    534 ;------------------------------------------------------------
                                    535 ;	testpreempt.c:77: void timer0_ISR(void) __interrupt(1) {
                                    536 ;	-----------------------------------------
                                    537 ;	 function timer0_ISR
                                    538 ;	-----------------------------------------
      0000E0                        539 _timer0_ISR:
                                    540 ;	testpreempt.c:80: __endasm;
      0000E0 02 02 3E         [24]  541 	LJMP	_myTimer0Handler
                                    542 ;	testpreempt.c:81: }
      0000E3 32               [24]  543 	reti
                                    544 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    545 ;	eliminated unneeded push/pop psw
                                    546 ;	eliminated unneeded push/pop dpl
                                    547 ;	eliminated unneeded push/pop dph
                                    548 ;	eliminated unneeded push/pop b
                                    549 ;	eliminated unneeded push/pop acc
                                    550 ;------------------------------------------------------------
                                    551 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    552 ;------------------------------------------------------------
                                    553 ;	testpreempt.c:83: void _mcs51_genRAMCLEAR(void) {}
                                    554 ;	-----------------------------------------
                                    555 ;	 function _mcs51_genRAMCLEAR
                                    556 ;	-----------------------------------------
      0000E4                        557 __mcs51_genRAMCLEAR:
      0000E4 22               [24]  558 	ret
                                    559 ;------------------------------------------------------------
                                    560 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    561 ;------------------------------------------------------------
                                    562 ;	testpreempt.c:84: void _mcs51_genXINIT(void) {}
                                    563 ;	-----------------------------------------
                                    564 ;	 function _mcs51_genXINIT
                                    565 ;	-----------------------------------------
      0000E5                        566 __mcs51_genXINIT:
      0000E5 22               [24]  567 	ret
                                    568 ;------------------------------------------------------------
                                    569 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    570 ;------------------------------------------------------------
                                    571 ;	testpreempt.c:85: void _mcs51_genXRAMCLEAR(void) {}
                                    572 ;	-----------------------------------------
                                    573 ;	 function _mcs51_genXRAMCLEAR
                                    574 ;	-----------------------------------------
      0000E6                        575 __mcs51_genXRAMCLEAR:
      0000E6 22               [24]  576 	ret
                                    577 	.area CSEG    (CODE)
                                    578 	.area CONST   (CODE)
                                    579 	.area XINIT   (CODE)
                                    580 	.area CABS    (ABS,CODE)
