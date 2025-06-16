                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module buttonlib
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _CY
                                     12 	.globl _AC
                                     13 	.globl _F0
                                     14 	.globl _RS1
                                     15 	.globl _RS0
                                     16 	.globl _OV
                                     17 	.globl _F1
                                     18 	.globl _P
                                     19 	.globl _PS
                                     20 	.globl _PT1
                                     21 	.globl _PX1
                                     22 	.globl _PT0
                                     23 	.globl _PX0
                                     24 	.globl _RD
                                     25 	.globl _WR
                                     26 	.globl _T1
                                     27 	.globl _T0
                                     28 	.globl _INT1
                                     29 	.globl _INT0
                                     30 	.globl _TXD
                                     31 	.globl _RXD
                                     32 	.globl _P3_7
                                     33 	.globl _P3_6
                                     34 	.globl _P3_5
                                     35 	.globl _P3_4
                                     36 	.globl _P3_3
                                     37 	.globl _P3_2
                                     38 	.globl _P3_1
                                     39 	.globl _P3_0
                                     40 	.globl _EA
                                     41 	.globl _ES
                                     42 	.globl _ET1
                                     43 	.globl _EX1
                                     44 	.globl _ET0
                                     45 	.globl _EX0
                                     46 	.globl _P2_7
                                     47 	.globl _P2_6
                                     48 	.globl _P2_5
                                     49 	.globl _P2_4
                                     50 	.globl _P2_3
                                     51 	.globl _P2_2
                                     52 	.globl _P2_1
                                     53 	.globl _P2_0
                                     54 	.globl _SM0
                                     55 	.globl _SM1
                                     56 	.globl _SM2
                                     57 	.globl _REN
                                     58 	.globl _TB8
                                     59 	.globl _RB8
                                     60 	.globl _TI
                                     61 	.globl _RI
                                     62 	.globl _P1_7
                                     63 	.globl _P1_6
                                     64 	.globl _P1_5
                                     65 	.globl _P1_4
                                     66 	.globl _P1_3
                                     67 	.globl _P1_2
                                     68 	.globl _P1_1
                                     69 	.globl _P1_0
                                     70 	.globl _TF1
                                     71 	.globl _TR1
                                     72 	.globl _TF0
                                     73 	.globl _TR0
                                     74 	.globl _IE1
                                     75 	.globl _IT1
                                     76 	.globl _IE0
                                     77 	.globl _IT0
                                     78 	.globl _P0_7
                                     79 	.globl _P0_6
                                     80 	.globl _P0_5
                                     81 	.globl _P0_4
                                     82 	.globl _P0_3
                                     83 	.globl _P0_2
                                     84 	.globl _P0_1
                                     85 	.globl _P0_0
                                     86 	.globl _B
                                     87 	.globl _ACC
                                     88 	.globl _PSW
                                     89 	.globl _IP
                                     90 	.globl _P3
                                     91 	.globl _IE
                                     92 	.globl _P2
                                     93 	.globl _SBUF
                                     94 	.globl _SCON
                                     95 	.globl _P1
                                     96 	.globl _TH1
                                     97 	.globl _TH0
                                     98 	.globl _TL1
                                     99 	.globl _TL0
                                    100 	.globl _TMOD
                                    101 	.globl _TCON
                                    102 	.globl _PCON
                                    103 	.globl _DPH
                                    104 	.globl _DPL
                                    105 	.globl _SP
                                    106 	.globl _P0
                                    107 	.globl _AnyButtonPressed
                                    108 	.globl _ButtonToChar
                                    109 ;--------------------------------------------------------
                                    110 ; special function registers
                                    111 ;--------------------------------------------------------
                                    112 	.area RSEG    (ABS,DATA)
      000000                        113 	.org 0x0000
                           000080   114 _P0	=	0x0080
                           000081   115 _SP	=	0x0081
                           000082   116 _DPL	=	0x0082
                           000083   117 _DPH	=	0x0083
                           000087   118 _PCON	=	0x0087
                           000088   119 _TCON	=	0x0088
                           000089   120 _TMOD	=	0x0089
                           00008A   121 _TL0	=	0x008a
                           00008B   122 _TL1	=	0x008b
                           00008C   123 _TH0	=	0x008c
                           00008D   124 _TH1	=	0x008d
                           000090   125 _P1	=	0x0090
                           000098   126 _SCON	=	0x0098
                           000099   127 _SBUF	=	0x0099
                           0000A0   128 _P2	=	0x00a0
                           0000A8   129 _IE	=	0x00a8
                           0000B0   130 _P3	=	0x00b0
                           0000B8   131 _IP	=	0x00b8
                           0000D0   132 _PSW	=	0x00d0
                           0000E0   133 _ACC	=	0x00e0
                           0000F0   134 _B	=	0x00f0
                                    135 ;--------------------------------------------------------
                                    136 ; special function bits
                                    137 ;--------------------------------------------------------
                                    138 	.area RSEG    (ABS,DATA)
      000000                        139 	.org 0x0000
                           000080   140 _P0_0	=	0x0080
                           000081   141 _P0_1	=	0x0081
                           000082   142 _P0_2	=	0x0082
                           000083   143 _P0_3	=	0x0083
                           000084   144 _P0_4	=	0x0084
                           000085   145 _P0_5	=	0x0085
                           000086   146 _P0_6	=	0x0086
                           000087   147 _P0_7	=	0x0087
                           000088   148 _IT0	=	0x0088
                           000089   149 _IE0	=	0x0089
                           00008A   150 _IT1	=	0x008a
                           00008B   151 _IE1	=	0x008b
                           00008C   152 _TR0	=	0x008c
                           00008D   153 _TF0	=	0x008d
                           00008E   154 _TR1	=	0x008e
                           00008F   155 _TF1	=	0x008f
                           000090   156 _P1_0	=	0x0090
                           000091   157 _P1_1	=	0x0091
                           000092   158 _P1_2	=	0x0092
                           000093   159 _P1_3	=	0x0093
                           000094   160 _P1_4	=	0x0094
                           000095   161 _P1_5	=	0x0095
                           000096   162 _P1_6	=	0x0096
                           000097   163 _P1_7	=	0x0097
                           000098   164 _RI	=	0x0098
                           000099   165 _TI	=	0x0099
                           00009A   166 _RB8	=	0x009a
                           00009B   167 _TB8	=	0x009b
                           00009C   168 _REN	=	0x009c
                           00009D   169 _SM2	=	0x009d
                           00009E   170 _SM1	=	0x009e
                           00009F   171 _SM0	=	0x009f
                           0000A0   172 _P2_0	=	0x00a0
                           0000A1   173 _P2_1	=	0x00a1
                           0000A2   174 _P2_2	=	0x00a2
                           0000A3   175 _P2_3	=	0x00a3
                           0000A4   176 _P2_4	=	0x00a4
                           0000A5   177 _P2_5	=	0x00a5
                           0000A6   178 _P2_6	=	0x00a6
                           0000A7   179 _P2_7	=	0x00a7
                           0000A8   180 _EX0	=	0x00a8
                           0000A9   181 _ET0	=	0x00a9
                           0000AA   182 _EX1	=	0x00aa
                           0000AB   183 _ET1	=	0x00ab
                           0000AC   184 _ES	=	0x00ac
                           0000AF   185 _EA	=	0x00af
                           0000B0   186 _P3_0	=	0x00b0
                           0000B1   187 _P3_1	=	0x00b1
                           0000B2   188 _P3_2	=	0x00b2
                           0000B3   189 _P3_3	=	0x00b3
                           0000B4   190 _P3_4	=	0x00b4
                           0000B5   191 _P3_5	=	0x00b5
                           0000B6   192 _P3_6	=	0x00b6
                           0000B7   193 _P3_7	=	0x00b7
                           0000B0   194 _RXD	=	0x00b0
                           0000B1   195 _TXD	=	0x00b1
                           0000B2   196 _INT0	=	0x00b2
                           0000B3   197 _INT1	=	0x00b3
                           0000B4   198 _T0	=	0x00b4
                           0000B5   199 _T1	=	0x00b5
                           0000B6   200 _WR	=	0x00b6
                           0000B7   201 _RD	=	0x00b7
                           0000B8   202 _PX0	=	0x00b8
                           0000B9   203 _PT0	=	0x00b9
                           0000BA   204 _PX1	=	0x00ba
                           0000BB   205 _PT1	=	0x00bb
                           0000BC   206 _PS	=	0x00bc
                           0000D0   207 _P	=	0x00d0
                           0000D1   208 _F1	=	0x00d1
                           0000D2   209 _OV	=	0x00d2
                           0000D3   210 _RS0	=	0x00d3
                           0000D4   211 _RS1	=	0x00d4
                           0000D5   212 _F0	=	0x00d5
                           0000D6   213 _AC	=	0x00d6
                           0000D7   214 _CY	=	0x00d7
                                    215 ;--------------------------------------------------------
                                    216 ; overlayable register banks
                                    217 ;--------------------------------------------------------
                                    218 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        219 	.ds 8
                                    220 ;--------------------------------------------------------
                                    221 ; internal ram data
                                    222 ;--------------------------------------------------------
                                    223 	.area DSEG    (DATA)
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable items in internal ram 
                                    226 ;--------------------------------------------------------
                                    227 ;--------------------------------------------------------
                                    228 ; indirectly addressable internal ram data
                                    229 ;--------------------------------------------------------
                                    230 	.area ISEG    (DATA)
                                    231 ;--------------------------------------------------------
                                    232 ; absolute internal ram data
                                    233 ;--------------------------------------------------------
                                    234 	.area IABS    (ABS,DATA)
                                    235 	.area IABS    (ABS,DATA)
                                    236 ;--------------------------------------------------------
                                    237 ; bit data
                                    238 ;--------------------------------------------------------
                                    239 	.area BSEG    (BIT)
                                    240 ;--------------------------------------------------------
                                    241 ; paged external ram data
                                    242 ;--------------------------------------------------------
                                    243 	.area PSEG    (PAG,XDATA)
                                    244 ;--------------------------------------------------------
                                    245 ; external ram data
                                    246 ;--------------------------------------------------------
                                    247 	.area XSEG    (XDATA)
                                    248 ;--------------------------------------------------------
                                    249 ; absolute external ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area XABS    (ABS,XDATA)
                                    252 ;--------------------------------------------------------
                                    253 ; external initialized ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area XISEG   (XDATA)
                                    256 	.area HOME    (CODE)
                                    257 	.area GSINIT0 (CODE)
                                    258 	.area GSINIT1 (CODE)
                                    259 	.area GSINIT2 (CODE)
                                    260 	.area GSINIT3 (CODE)
                                    261 	.area GSINIT4 (CODE)
                                    262 	.area GSINIT5 (CODE)
                                    263 	.area GSINIT  (CODE)
                                    264 	.area GSFINAL (CODE)
                                    265 	.area CSEG    (CODE)
                                    266 ;--------------------------------------------------------
                                    267 ; global & static initialisations
                                    268 ;--------------------------------------------------------
                                    269 	.area HOME    (CODE)
                                    270 	.area GSINIT  (CODE)
                                    271 	.area GSFINAL (CODE)
                                    272 	.area GSINIT  (CODE)
                                    273 ;--------------------------------------------------------
                                    274 ; Home
                                    275 ;--------------------------------------------------------
                                    276 	.area HOME    (CODE)
                                    277 	.area HOME    (CODE)
                                    278 ;--------------------------------------------------------
                                    279 ; code
                                    280 ;--------------------------------------------------------
                                    281 	.area CSEG    (CODE)
                                    282 ;------------------------------------------------------------
                                    283 ;Allocation info for local variables in function 'AnyButtonPressed'
                                    284 ;------------------------------------------------------------
                                    285 ;	buttonlib.c:10: char AnyButtonPressed(void) {
                                    286 ;	-----------------------------------------
                                    287 ;	 function AnyButtonPressed
                                    288 ;	-----------------------------------------
      000B5B                        289 _AnyButtonPressed:
                           000007   290 	ar7 = 0x07
                           000006   291 	ar6 = 0x06
                           000005   292 	ar5 = 0x05
                           000004   293 	ar4 = 0x04
                           000003   294 	ar3 = 0x03
                           000002   295 	ar2 = 0x02
                           000001   296 	ar1 = 0x01
                           000000   297 	ar0 = 0x00
                                    298 ;	buttonlib.c:14: return ~P2 & 0xFF;
      000B5B E5 A0            [12]  299 	mov	a,_P2
      000B5D F4               [12]  300 	cpl	a
      000B5E F5 82            [12]  301 	mov	dpl,a
                                    302 ;	buttonlib.c:15: }
      000B60 22               [24]  303 	ret
                                    304 ;------------------------------------------------------------
                                    305 ;Allocation info for local variables in function 'ButtonToChar'
                                    306 ;------------------------------------------------------------
                                    307 ;	buttonlib.c:20: char ButtonToChar(void) {
                                    308 ;	-----------------------------------------
                                    309 ;	 function ButtonToChar
                                    310 ;	-----------------------------------------
      000B61                        311 _ButtonToChar:
                                    312 ;	buttonlib.c:21: if ((~P2) & 0x80) return '7';
      000B61 AE A0            [24]  313 	mov	r6,_P2
      000B63 7F 00            [12]  314 	mov	r7,#0x00
      000B65 EE               [12]  315 	mov	a,r6
      000B66 F4               [12]  316 	cpl	a
      000B67 FE               [12]  317 	mov	r6,a
      000B68 EF               [12]  318 	mov	a,r7
      000B69 F4               [12]  319 	cpl	a
      000B6A EE               [12]  320 	mov	a,r6
      000B6B 30 E7 04         [24]  321 	jnb	acc.7,00123$
      000B6E 75 82 37         [24]  322 	mov	dpl,#0x37
      000B71 22               [24]  323 	ret
      000B72                        324 00123$:
                                    325 ;	buttonlib.c:22: else if((~P2) & 0x40) return '6';
      000B72 AE A0            [24]  326 	mov	r6,_P2
      000B74 7F 00            [12]  327 	mov	r7,#0x00
      000B76 EE               [12]  328 	mov	a,r6
      000B77 F4               [12]  329 	cpl	a
      000B78 FE               [12]  330 	mov	r6,a
      000B79 EF               [12]  331 	mov	a,r7
      000B7A F4               [12]  332 	cpl	a
      000B7B EE               [12]  333 	mov	a,r6
      000B7C 30 E6 04         [24]  334 	jnb	acc.6,00120$
      000B7F 75 82 36         [24]  335 	mov	dpl,#0x36
      000B82 22               [24]  336 	ret
      000B83                        337 00120$:
                                    338 ;	buttonlib.c:23: else if((~P2) & 0x20) return '5';
      000B83 AE A0            [24]  339 	mov	r6,_P2
      000B85 7F 00            [12]  340 	mov	r7,#0x00
      000B87 EE               [12]  341 	mov	a,r6
      000B88 F4               [12]  342 	cpl	a
      000B89 FE               [12]  343 	mov	r6,a
      000B8A EF               [12]  344 	mov	a,r7
      000B8B F4               [12]  345 	cpl	a
      000B8C EE               [12]  346 	mov	a,r6
      000B8D 30 E5 04         [24]  347 	jnb	acc.5,00117$
      000B90 75 82 35         [24]  348 	mov	dpl,#0x35
      000B93 22               [24]  349 	ret
      000B94                        350 00117$:
                                    351 ;	buttonlib.c:24: else if((~P2) & 0x10) return '4';
      000B94 AE A0            [24]  352 	mov	r6,_P2
      000B96 7F 00            [12]  353 	mov	r7,#0x00
      000B98 EE               [12]  354 	mov	a,r6
      000B99 F4               [12]  355 	cpl	a
      000B9A FE               [12]  356 	mov	r6,a
      000B9B EF               [12]  357 	mov	a,r7
      000B9C F4               [12]  358 	cpl	a
      000B9D EE               [12]  359 	mov	a,r6
      000B9E 30 E4 04         [24]  360 	jnb	acc.4,00114$
      000BA1 75 82 34         [24]  361 	mov	dpl,#0x34
      000BA4 22               [24]  362 	ret
      000BA5                        363 00114$:
                                    364 ;	buttonlib.c:25: else if((~P2) & 0x08) return '3';
      000BA5 AE A0            [24]  365 	mov	r6,_P2
      000BA7 7F 00            [12]  366 	mov	r7,#0x00
      000BA9 EE               [12]  367 	mov	a,r6
      000BAA F4               [12]  368 	cpl	a
      000BAB FE               [12]  369 	mov	r6,a
      000BAC EF               [12]  370 	mov	a,r7
      000BAD F4               [12]  371 	cpl	a
      000BAE EE               [12]  372 	mov	a,r6
      000BAF 30 E3 04         [24]  373 	jnb	acc.3,00111$
      000BB2 75 82 33         [24]  374 	mov	dpl,#0x33
      000BB5 22               [24]  375 	ret
      000BB6                        376 00111$:
                                    377 ;	buttonlib.c:26: else if((~P2) & 0x04) return '2';
      000BB6 AE A0            [24]  378 	mov	r6,_P2
      000BB8 7F 00            [12]  379 	mov	r7,#0x00
      000BBA EE               [12]  380 	mov	a,r6
      000BBB F4               [12]  381 	cpl	a
      000BBC FE               [12]  382 	mov	r6,a
      000BBD EF               [12]  383 	mov	a,r7
      000BBE F4               [12]  384 	cpl	a
      000BBF EE               [12]  385 	mov	a,r6
      000BC0 30 E2 04         [24]  386 	jnb	acc.2,00108$
      000BC3 75 82 32         [24]  387 	mov	dpl,#0x32
      000BC6 22               [24]  388 	ret
      000BC7                        389 00108$:
                                    390 ;	buttonlib.c:27: else if((~P2) & 0x02) return '1';
      000BC7 AE A0            [24]  391 	mov	r6,_P2
      000BC9 7F 00            [12]  392 	mov	r7,#0x00
      000BCB EE               [12]  393 	mov	a,r6
      000BCC F4               [12]  394 	cpl	a
      000BCD FE               [12]  395 	mov	r6,a
      000BCE EF               [12]  396 	mov	a,r7
      000BCF F4               [12]  397 	cpl	a
      000BD0 EE               [12]  398 	mov	a,r6
      000BD1 30 E1 04         [24]  399 	jnb	acc.1,00105$
      000BD4 75 82 31         [24]  400 	mov	dpl,#0x31
      000BD7 22               [24]  401 	ret
      000BD8                        402 00105$:
                                    403 ;	buttonlib.c:28: else if((~P2) & 0x01) return '0';
      000BD8 AE A0            [24]  404 	mov	r6,_P2
      000BDA 7F 00            [12]  405 	mov	r7,#0x00
      000BDC EE               [12]  406 	mov	a,r6
      000BDD F4               [12]  407 	cpl	a
      000BDE FE               [12]  408 	mov	r6,a
      000BDF EF               [12]  409 	mov	a,r7
      000BE0 F4               [12]  410 	cpl	a
      000BE1 EE               [12]  411 	mov	a,r6
      000BE2 30 E0 04         [24]  412 	jnb	acc.0,00102$
      000BE5 75 82 30         [24]  413 	mov	dpl,#0x30
      000BE8 22               [24]  414 	ret
      000BE9                        415 00102$:
                                    416 ;	buttonlib.c:29: else return '\0';
      000BE9 75 82 00         [24]  417 	mov	dpl,#0x00
                                    418 ;	buttonlib.c:33: }
      000BEC 22               [24]  419 	ret
                                    420 	.area CSEG    (CODE)
                                    421 	.area CONST   (CODE)
                                    422 	.area XINIT   (CODE)
                                    423 	.area CABS    (ABS,CODE)
