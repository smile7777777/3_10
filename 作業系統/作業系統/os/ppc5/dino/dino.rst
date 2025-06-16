                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module dino
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _game_ctrl
                                     18 	.globl _end_game
                                     19 	.globl _move_dinosaur
                                     20 	.globl _update_cactus
                                     21 	.globl _init
                                     22 	.globl _render_task
                                     23 	.globl _keypad_ctrl
                                     24 	.globl _LCD_ready
                                     25 	.globl _delay
                                     26 	.globl _LCD_write_char
                                     27 	.globl _LCD_IRWrite
                                     28 	.globl _LCD_Init
                                     29 	.globl _ButtonToChar
                                     30 	.globl _AnyButtonPressed
                                     31 	.globl _AnyKeyPressed
                                     32 	.globl _KeyToChar
                                     33 	.globl _Init_Keypad
                                     34 	.globl _ThreadExit
                                     35 	.globl _ThreadYield
                                     36 	.globl _ThreadCreate
                                     37 	.globl _CY
                                     38 	.globl _AC
                                     39 	.globl _F0
                                     40 	.globl _RS1
                                     41 	.globl _RS0
                                     42 	.globl _OV
                                     43 	.globl _F1
                                     44 	.globl _P
                                     45 	.globl _PS
                                     46 	.globl _PT1
                                     47 	.globl _PX1
                                     48 	.globl _PT0
                                     49 	.globl _PX0
                                     50 	.globl _RD
                                     51 	.globl _WR
                                     52 	.globl _T1
                                     53 	.globl _T0
                                     54 	.globl _INT1
                                     55 	.globl _INT0
                                     56 	.globl _TXD
                                     57 	.globl _RXD
                                     58 	.globl _P3_7
                                     59 	.globl _P3_6
                                     60 	.globl _P3_5
                                     61 	.globl _P3_4
                                     62 	.globl _P3_3
                                     63 	.globl _P3_2
                                     64 	.globl _P3_1
                                     65 	.globl _P3_0
                                     66 	.globl _EA
                                     67 	.globl _ES
                                     68 	.globl _ET1
                                     69 	.globl _EX1
                                     70 	.globl _ET0
                                     71 	.globl _EX0
                                     72 	.globl _P2_7
                                     73 	.globl _P2_6
                                     74 	.globl _P2_5
                                     75 	.globl _P2_4
                                     76 	.globl _P2_3
                                     77 	.globl _P2_2
                                     78 	.globl _P2_1
                                     79 	.globl _P2_0
                                     80 	.globl _SM0
                                     81 	.globl _SM1
                                     82 	.globl _SM2
                                     83 	.globl _REN
                                     84 	.globl _TB8
                                     85 	.globl _RB8
                                     86 	.globl _TI
                                     87 	.globl _RI
                                     88 	.globl _P1_7
                                     89 	.globl _P1_6
                                     90 	.globl _P1_5
                                     91 	.globl _P1_4
                                     92 	.globl _P1_3
                                     93 	.globl _P1_2
                                     94 	.globl _P1_1
                                     95 	.globl _P1_0
                                     96 	.globl _TF1
                                     97 	.globl _TR1
                                     98 	.globl _TF0
                                     99 	.globl _TR0
                                    100 	.globl _IE1
                                    101 	.globl _IT1
                                    102 	.globl _IE0
                                    103 	.globl _IT0
                                    104 	.globl _P0_7
                                    105 	.globl _P0_6
                                    106 	.globl _P0_5
                                    107 	.globl _P0_4
                                    108 	.globl _P0_3
                                    109 	.globl _P0_2
                                    110 	.globl _P0_1
                                    111 	.globl _P0_0
                                    112 	.globl _B
                                    113 	.globl _ACC
                                    114 	.globl _PSW
                                    115 	.globl _IP
                                    116 	.globl _P3
                                    117 	.globl _IE
                                    118 	.globl _P2
                                    119 	.globl _SBUF
                                    120 	.globl _SCON
                                    121 	.globl _P1
                                    122 	.globl _TH1
                                    123 	.globl _TH0
                                    124 	.globl _TL1
                                    125 	.globl _TL0
                                    126 	.globl _TMOD
                                    127 	.globl _TCON
                                    128 	.globl _PCON
                                    129 	.globl _DPH
                                    130 	.globl _DPL
                                    131 	.globl _SP
                                    132 	.globl _P0
                                    133 	.globl _diff
                                    134 	.globl _flag
                                    135 	.globl _pre_score
                                    136 	.globl _cactus_pos
                                    137 	.globl _k
                                    138 	.globl _j
                                    139 	.globl _i
                                    140 	.globl _game_over
                                    141 	.globl _score
                                    142 	.globl _dino_pos
                                    143 	.globl _cur_input
                                    144 	.globl _prev_input
                                    145 	.globl _iter
                                    146 	.globl _full
                                    147 	.globl _mutex
                                    148 	.globl _buffer
                                    149 ;--------------------------------------------------------
                                    150 ; special function registers
                                    151 ;--------------------------------------------------------
                                    152 	.area RSEG    (ABS,DATA)
      000000                        153 	.org 0x0000
                           000080   154 _P0	=	0x0080
                           000081   155 _SP	=	0x0081
                           000082   156 _DPL	=	0x0082
                           000083   157 _DPH	=	0x0083
                           000087   158 _PCON	=	0x0087
                           000088   159 _TCON	=	0x0088
                           000089   160 _TMOD	=	0x0089
                           00008A   161 _TL0	=	0x008a
                           00008B   162 _TL1	=	0x008b
                           00008C   163 _TH0	=	0x008c
                           00008D   164 _TH1	=	0x008d
                           000090   165 _P1	=	0x0090
                           000098   166 _SCON	=	0x0098
                           000099   167 _SBUF	=	0x0099
                           0000A0   168 _P2	=	0x00a0
                           0000A8   169 _IE	=	0x00a8
                           0000B0   170 _P3	=	0x00b0
                           0000B8   171 _IP	=	0x00b8
                           0000D0   172 _PSW	=	0x00d0
                           0000E0   173 _ACC	=	0x00e0
                           0000F0   174 _B	=	0x00f0
                                    175 ;--------------------------------------------------------
                                    176 ; special function bits
                                    177 ;--------------------------------------------------------
                                    178 	.area RSEG    (ABS,DATA)
      000000                        179 	.org 0x0000
                           000080   180 _P0_0	=	0x0080
                           000081   181 _P0_1	=	0x0081
                           000082   182 _P0_2	=	0x0082
                           000083   183 _P0_3	=	0x0083
                           000084   184 _P0_4	=	0x0084
                           000085   185 _P0_5	=	0x0085
                           000086   186 _P0_6	=	0x0086
                           000087   187 _P0_7	=	0x0087
                           000088   188 _IT0	=	0x0088
                           000089   189 _IE0	=	0x0089
                           00008A   190 _IT1	=	0x008a
                           00008B   191 _IE1	=	0x008b
                           00008C   192 _TR0	=	0x008c
                           00008D   193 _TF0	=	0x008d
                           00008E   194 _TR1	=	0x008e
                           00008F   195 _TF1	=	0x008f
                           000090   196 _P1_0	=	0x0090
                           000091   197 _P1_1	=	0x0091
                           000092   198 _P1_2	=	0x0092
                           000093   199 _P1_3	=	0x0093
                           000094   200 _P1_4	=	0x0094
                           000095   201 _P1_5	=	0x0095
                           000096   202 _P1_6	=	0x0096
                           000097   203 _P1_7	=	0x0097
                           000098   204 _RI	=	0x0098
                           000099   205 _TI	=	0x0099
                           00009A   206 _RB8	=	0x009a
                           00009B   207 _TB8	=	0x009b
                           00009C   208 _REN	=	0x009c
                           00009D   209 _SM2	=	0x009d
                           00009E   210 _SM1	=	0x009e
                           00009F   211 _SM0	=	0x009f
                           0000A0   212 _P2_0	=	0x00a0
                           0000A1   213 _P2_1	=	0x00a1
                           0000A2   214 _P2_2	=	0x00a2
                           0000A3   215 _P2_3	=	0x00a3
                           0000A4   216 _P2_4	=	0x00a4
                           0000A5   217 _P2_5	=	0x00a5
                           0000A6   218 _P2_6	=	0x00a6
                           0000A7   219 _P2_7	=	0x00a7
                           0000A8   220 _EX0	=	0x00a8
                           0000A9   221 _ET0	=	0x00a9
                           0000AA   222 _EX1	=	0x00aa
                           0000AB   223 _ET1	=	0x00ab
                           0000AC   224 _ES	=	0x00ac
                           0000AF   225 _EA	=	0x00af
                           0000B0   226 _P3_0	=	0x00b0
                           0000B1   227 _P3_1	=	0x00b1
                           0000B2   228 _P3_2	=	0x00b2
                           0000B3   229 _P3_3	=	0x00b3
                           0000B4   230 _P3_4	=	0x00b4
                           0000B5   231 _P3_5	=	0x00b5
                           0000B6   232 _P3_6	=	0x00b6
                           0000B7   233 _P3_7	=	0x00b7
                           0000B0   234 _RXD	=	0x00b0
                           0000B1   235 _TXD	=	0x00b1
                           0000B2   236 _INT0	=	0x00b2
                           0000B3   237 _INT1	=	0x00b3
                           0000B4   238 _T0	=	0x00b4
                           0000B5   239 _T1	=	0x00b5
                           0000B6   240 _WR	=	0x00b6
                           0000B7   241 _RD	=	0x00b7
                           0000B8   242 _PX0	=	0x00b8
                           0000B9   243 _PT0	=	0x00b9
                           0000BA   244 _PX1	=	0x00ba
                           0000BB   245 _PT1	=	0x00bb
                           0000BC   246 _PS	=	0x00bc
                           0000D0   247 _P	=	0x00d0
                           0000D1   248 _F1	=	0x00d1
                           0000D2   249 _OV	=	0x00d2
                           0000D3   250 _RS0	=	0x00d3
                           0000D4   251 _RS1	=	0x00d4
                           0000D5   252 _F0	=	0x00d5
                           0000D6   253 _AC	=	0x00d6
                           0000D7   254 _CY	=	0x00d7
                                    255 ;--------------------------------------------------------
                                    256 ; overlayable register banks
                                    257 ;--------------------------------------------------------
                                    258 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        259 	.ds 8
                                    260 ;--------------------------------------------------------
                                    261 ; internal ram data
                                    262 ;--------------------------------------------------------
                                    263 	.area DSEG    (DATA)
                           000039   264 _buffer	=	0x0039
                           00003A   265 _mutex	=	0x003a
                           00003B   266 _full	=	0x003b
                           00003C   267 _iter	=	0x003c
                           00003E   268 _prev_input	=	0x003e
                           00003F   269 _cur_input	=	0x003f
                           000020   270 _dino_pos	=	0x0020
                           00002E   271 _score	=	0x002e
                           000023   272 _game_over	=	0x0023
                           000024   273 _i	=	0x0024
                           000025   274 _j	=	0x0025
                           000026   275 _k	=	0x0026
                           000029   276 _cactus_pos	=	0x0029
                           000027   277 _pre_score	=	0x0027
                           000028   278 _flag	=	0x0028
                           00002F   279 _diff	=	0x002f
                                    280 ;--------------------------------------------------------
                                    281 ; overlayable items in internal ram 
                                    282 ;--------------------------------------------------------
                                    283 ;--------------------------------------------------------
                                    284 ; Stack segment in internal ram 
                                    285 ;--------------------------------------------------------
                                    286 	.area	SSEG
      00000D                        287 __start__stack:
      00000D                        288 	.ds	1
                                    289 
                                    290 ;--------------------------------------------------------
                                    291 ; indirectly addressable internal ram data
                                    292 ;--------------------------------------------------------
                                    293 	.area ISEG    (DATA)
                                    294 ;--------------------------------------------------------
                                    295 ; absolute internal ram data
                                    296 ;--------------------------------------------------------
                                    297 	.area IABS    (ABS,DATA)
                                    298 	.area IABS    (ABS,DATA)
                                    299 ;--------------------------------------------------------
                                    300 ; bit data
                                    301 ;--------------------------------------------------------
                                    302 	.area BSEG    (BIT)
                                    303 ;--------------------------------------------------------
                                    304 ; paged external ram data
                                    305 ;--------------------------------------------------------
                                    306 	.area PSEG    (PAG,XDATA)
                                    307 ;--------------------------------------------------------
                                    308 ; external ram data
                                    309 ;--------------------------------------------------------
                                    310 	.area XSEG    (XDATA)
                                    311 ;--------------------------------------------------------
                                    312 ; absolute external ram data
                                    313 ;--------------------------------------------------------
                                    314 	.area XABS    (ABS,XDATA)
                                    315 ;--------------------------------------------------------
                                    316 ; external initialized ram data
                                    317 ;--------------------------------------------------------
                                    318 	.area XISEG   (XDATA)
                                    319 	.area HOME    (CODE)
                                    320 	.area GSINIT0 (CODE)
                                    321 	.area GSINIT1 (CODE)
                                    322 	.area GSINIT2 (CODE)
                                    323 	.area GSINIT3 (CODE)
                                    324 	.area GSINIT4 (CODE)
                                    325 	.area GSINIT5 (CODE)
                                    326 	.area GSINIT  (CODE)
                                    327 	.area GSFINAL (CODE)
                                    328 	.area CSEG    (CODE)
                                    329 ;--------------------------------------------------------
                                    330 ; interrupt vector 
                                    331 ;--------------------------------------------------------
                                    332 	.area HOME    (CODE)
      000000                        333 __interrupt_vect:
      000000 02 06 E1         [24]  334 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  335 	reti
      000004                        336 	.ds	7
      00000B 02 06 E8         [24]  337 	ljmp	_timer0_ISR
                                    338 ;--------------------------------------------------------
                                    339 ; global & static initialisations
                                    340 ;--------------------------------------------------------
                                    341 	.area HOME    (CODE)
                                    342 	.area GSINIT  (CODE)
                                    343 	.area GSFINAL (CODE)
                                    344 	.area GSINIT  (CODE)
                                    345 	.globl __sdcc_gsinit_startup
                                    346 	.globl __sdcc_program_startup
                                    347 	.globl __start__stack
                                    348 	.globl __mcs51_genXINIT
                                    349 	.globl __mcs51_genXRAMCLEAR
                                    350 	.globl __mcs51_genRAMCLEAR
                                    351 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  352 	ljmp	__sdcc_program_startup
                                    353 ;--------------------------------------------------------
                                    354 ; Home
                                    355 ;--------------------------------------------------------
                                    356 	.area HOME    (CODE)
                                    357 	.area HOME    (CODE)
      00000E                        358 __sdcc_program_startup:
      00000E 02 06 47         [24]  359 	ljmp	_main
                                    360 ;	return from main will return to caller
                                    361 ;--------------------------------------------------------
                                    362 ; code
                                    363 ;--------------------------------------------------------
                                    364 	.area CSEG    (CODE)
                                    365 ;------------------------------------------------------------
                                    366 ;Allocation info for local variables in function 'keypad_ctrl'
                                    367 ;------------------------------------------------------------
                                    368 ;	dino.c:27: void keypad_ctrl(void) {
                                    369 ;	-----------------------------------------
                                    370 ;	 function keypad_ctrl
                                    371 ;	-----------------------------------------
      000014                        372 _keypad_ctrl:
                           000007   373 	ar7 = 0x07
                           000006   374 	ar6 = 0x06
                           000005   375 	ar5 = 0x05
                           000004   376 	ar4 = 0x04
                           000003   377 	ar3 = 0x03
                           000002   378 	ar2 = 0x02
                           000001   379 	ar1 = 0x01
                           000000   380 	ar0 = 0x00
                                    381 ;	dino.c:28: while (1) {
      000014                        382 00121$:
                                    383 ;	dino.c:29: if (game_over) {ThreadExit(); return;}
      000014 E5 23            [12]  384 	mov	a,_game_over
      000016 60 03            [24]  385 	jz	00102$
      000018 02 08 A2         [24]  386 	ljmp	_ThreadExit
      00001B                        387 00102$:
                                    388 ;	dino.c:30: if (AnyButtonPressed()) {
      00001B 12 0B 5B         [24]  389 	lcall	_AnyButtonPressed
      00001E E5 82            [12]  390 	mov	a,dpl
      000020 60 1D            [24]  391 	jz	00118$
                                    392 ;	dino.c:31: cur_input = ButtonToChar();
      000022 12 0B 61         [24]  393 	lcall	_ButtonToChar
      000025 85 82 3F         [24]  394 	mov	_cur_input,dpl
                                    395 ;	dino.c:32: if (cur_input != prev_input && prev_input == 0x00) {
      000028 E5 3E            [12]  396 	mov	a,_prev_input
      00002A B5 3F 02         [24]  397 	cjne	a,_cur_input,00167$
      00002D 80 E5            [24]  398 	sjmp	00121$
      00002F                        399 00167$:
      00002F E5 3E            [12]  400 	mov	a,_prev_input
      000031 70 E1            [24]  401 	jnz	00121$
                                    402 ;	dino.c:33: EA = 0; 
                                    403 ;	assignBit
      000033 C2 AF            [12]  404 	clr	_EA
                                    405 ;	dino.c:34: buffer = cur_input; 
      000035 85 3F 39         [24]  406 	mov	_buffer,_cur_input
                                    407 ;	dino.c:35: prev_input = cur_input; 
      000038 85 3F 3E         [24]  408 	mov	_prev_input,_cur_input
                                    409 ;	dino.c:36: EA = 1;
                                    410 ;	assignBit
      00003B D2 AF            [12]  411 	setb	_EA
      00003D 80 D5            [24]  412 	sjmp	00121$
      00003F                        413 00118$:
                                    414 ;	dino.c:39: else if (AnyKeyPressed()) {
      00003F 12 0B F3         [24]  415 	lcall	_AnyKeyPressed
      000042 E5 82            [12]  416 	mov	a,dpl
      000044 70 03            [24]  417 	jnz	00169$
      000046 02 00 CD         [24]  418 	ljmp	00115$
      000049                        419 00169$:
                                    420 ;	dino.c:40: cur_input = KeyToChar();
      000049 12 0B FE         [24]  421 	lcall	_KeyToChar
      00004C 85 82 3F         [24]  422 	mov	_cur_input,dpl
                                    423 ;	dino.c:41: if (cur_input != prev_input && prev_input == 0x00) {
      00004F E5 3E            [12]  424 	mov	a,_prev_input
      000051 B5 3F 02         [24]  425 	cjne	a,_cur_input,00170$
      000054 80 BE            [24]  426 	sjmp	00121$
      000056                        427 00170$:
      000056 E5 3E            [12]  428 	mov	a,_prev_input
      000058 70 BA            [24]  429 	jnz	00121$
                                    430 ;	dino.c:42: EA = 0;
                                    431 ;	assignBit
      00005A C2 AF            [12]  432 	clr	_EA
                                    433 ;	dino.c:43: buffer = cur_input; 
      00005C 85 3F 39         [24]  434 	mov	_buffer,_cur_input
                                    435 ;	dino.c:44: if (buffer == '2' ) { // Move up
      00005F 74 32            [12]  436 	mov	a,#0x32
      000061 B5 39 2F         [24]  437 	cjne	a,_buffer,00109$
                                    438 ;	dino.c:45: LCD_cursorGoTo(dino_pos, 0); 
      000064 E5 20            [12]  439 	mov	a,_dino_pos
      000066 03               [12]  440 	rr	a
      000067 03               [12]  441 	rr	a
      000068 54 C0            [12]  442 	anl	a,#0xc0
      00006A FF               [12]  443 	mov	r7,a
      00006B 74 80            [12]  444 	mov	a,#0x80
      00006D 4F               [12]  445 	orl	a,r7
      00006E F5 82            [12]  446 	mov	dpl,a
      000070 12 09 9B         [24]  447 	lcall	_LCD_IRWrite
                                    448 ;	dino.c:46: LCD_write_char(' ');
      000073 75 82 20         [24]  449 	mov	dpl,#0x20
      000076 12 09 E7         [24]  450 	lcall	_LCD_write_char
                                    451 ;	dino.c:47: dino_pos = 0;
      000079 75 20 00         [24]  452 	mov	_dino_pos,#0x00
                                    453 ;	dino.c:48: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
      00007C E5 20            [12]  454 	mov	a,_dino_pos
      00007E 03               [12]  455 	rr	a
      00007F 03               [12]  456 	rr	a
      000080 54 C0            [12]  457 	anl	a,#0xc0
      000082 FF               [12]  458 	mov	r7,a
      000083 74 80            [12]  459 	mov	a,#0x80
      000085 4F               [12]  460 	orl	a,r7
      000086 F5 82            [12]  461 	mov	dpl,a
      000088 12 09 9B         [24]  462 	lcall	_LCD_IRWrite
                                    463 ;	dino.c:49: LCD_write_char(0x00);
      00008B 75 82 00         [24]  464 	mov	dpl,#0x00
      00008E 12 09 E7         [24]  465 	lcall	_LCD_write_char
      000091 80 32            [24]  466 	sjmp	00110$
      000093                        467 00109$:
                                    468 ;	dino.c:50: } else if (buffer == '8') { // Move down
      000093 74 38            [12]  469 	mov	a,#0x38
      000095 B5 39 2D         [24]  470 	cjne	a,_buffer,00110$
                                    471 ;	dino.c:51: LCD_cursorGoTo(dino_pos, 0); 
      000098 E5 20            [12]  472 	mov	a,_dino_pos
      00009A 03               [12]  473 	rr	a
      00009B 03               [12]  474 	rr	a
      00009C 54 C0            [12]  475 	anl	a,#0xc0
      00009E FF               [12]  476 	mov	r7,a
      00009F 74 80            [12]  477 	mov	a,#0x80
      0000A1 4F               [12]  478 	orl	a,r7
      0000A2 F5 82            [12]  479 	mov	dpl,a
      0000A4 12 09 9B         [24]  480 	lcall	_LCD_IRWrite
                                    481 ;	dino.c:52: LCD_write_char(' ');
      0000A7 75 82 20         [24]  482 	mov	dpl,#0x20
      0000AA 12 09 E7         [24]  483 	lcall	_LCD_write_char
                                    484 ;	dino.c:53: dino_pos = 1;
      0000AD 75 20 01         [24]  485 	mov	_dino_pos,#0x01
                                    486 ;	dino.c:54: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
      0000B0 E5 20            [12]  487 	mov	a,_dino_pos
      0000B2 03               [12]  488 	rr	a
      0000B3 03               [12]  489 	rr	a
      0000B4 54 C0            [12]  490 	anl	a,#0xc0
      0000B6 FF               [12]  491 	mov	r7,a
      0000B7 74 80            [12]  492 	mov	a,#0x80
      0000B9 4F               [12]  493 	orl	a,r7
      0000BA F5 82            [12]  494 	mov	dpl,a
      0000BC 12 09 9B         [24]  495 	lcall	_LCD_IRWrite
                                    496 ;	dino.c:55: LCD_write_char(0x00);
      0000BF 75 82 00         [24]  497 	mov	dpl,#0x00
      0000C2 12 09 E7         [24]  498 	lcall	_LCD_write_char
      0000C5                        499 00110$:
                                    500 ;	dino.c:57: prev_input = cur_input; 
      0000C5 85 3F 3E         [24]  501 	mov	_prev_input,_cur_input
                                    502 ;	dino.c:58: EA = 1;
                                    503 ;	assignBit
      0000C8 D2 AF            [12]  504 	setb	_EA
      0000CA 02 00 14         [24]  505 	ljmp	00121$
      0000CD                        506 00115$:
                                    507 ;	dino.c:62: prev_input = 0x00; 
      0000CD 75 3E 00         [24]  508 	mov	_prev_input,#0x00
                                    509 ;	dino.c:65: }
      0000D0 02 00 14         [24]  510 	ljmp	00121$
                                    511 ;------------------------------------------------------------
                                    512 ;Allocation info for local variables in function 'render_task'
                                    513 ;------------------------------------------------------------
                                    514 ;	dino.c:67: void render_task(void) {
                                    515 ;	-----------------------------------------
                                    516 ;	 function render_task
                                    517 ;	-----------------------------------------
      0000D3                        518 _render_task:
                                    519 ;	dino.c:69: while (1) {
      0000D3                        520 00131$:
                                    521 ;	dino.c:70: if (game_over) {ThreadExit(); return;}
      0000D3 E5 23            [12]  522 	mov	a,_game_over
      0000D5 60 03            [24]  523 	jz	00102$
      0000D7 02 08 A2         [24]  524 	ljmp	_ThreadExit
      0000DA                        525 00102$:
                                    526 ;	dino.c:72: SemaphoreWait(mutex);
      0000DA                        527 		0$:
      0000DA E5 3A            [12]  528 	MOV A, _mutex 
      0000DC 60 FC            [24]  529 	JZ 0$ 
      0000DE 20 E7 F9         [24]  530 	JB ACC.7, 0$ 
      0000E1 15 3A            [12]  531 	DEC _mutex 
                                    532 ;	dino.c:77: EA = 0;
                                    533 ;	assignBit
      0000E3 C2 AF            [12]  534 	clr	_EA
                                    535 ;	dino.c:78: if(!k){;
      0000E5 E5 26            [12]  536 	mov	a,_k
      0000E7 60 03            [24]  537 	jz	00184$
      0000E9 02 02 05         [24]  538 	ljmp	00129$
      0000EC                        539 00184$:
                                    540 ;	dino.c:79: k = 1;
      0000EC 75 26 01         [24]  541 	mov	_k,#0x01
                                    542 ;	dino.c:80: LCD_cursorGoTo(0, cactus_pos[0]);
      0000EF 74 80            [12]  543 	mov	a,#0x80
      0000F1 45 29            [12]  544 	orl	a,_cactus_pos
      0000F3 F5 82            [12]  545 	mov	dpl,a
      0000F5 12 09 9B         [24]  546 	lcall	_LCD_IRWrite
                                    547 ;	dino.c:81: LCD_write_char(' ');
      0000F8 75 82 20         [24]  548 	mov	dpl,#0x20
      0000FB 12 09 E7         [24]  549 	lcall	_LCD_write_char
                                    550 ;	dino.c:82: LCD_cursorGoTo(1, cactus_pos[1]);
      0000FE 74 40            [12]  551 	mov	a,#0x40
      000100 25 2A            [12]  552 	add	a,(_cactus_pos + 0x0001)
      000102 44 80            [12]  553 	orl	a,#0x80
      000104 F5 82            [12]  554 	mov	dpl,a
      000106 12 09 9B         [24]  555 	lcall	_LCD_IRWrite
                                    556 ;	dino.c:83: LCD_write_char(' ');
      000109 75 82 20         [24]  557 	mov	dpl,#0x20
      00010C 12 09 E7         [24]  558 	lcall	_LCD_write_char
                                    559 ;	dino.c:84: LCD_cursorGoTo(0, cactus_pos[2]);
      00010F 74 80            [12]  560 	mov	a,#0x80
      000111 45 2B            [12]  561 	orl	a,(_cactus_pos + 0x0002)
      000113 F5 82            [12]  562 	mov	dpl,a
      000115 12 09 9B         [24]  563 	lcall	_LCD_IRWrite
                                    564 ;	dino.c:85: LCD_write_char(' ');
      000118 75 82 20         [24]  565 	mov	dpl,#0x20
      00011B 12 09 E7         [24]  566 	lcall	_LCD_write_char
                                    567 ;	dino.c:86: LCD_cursorGoTo(1, cactus_pos[3]);
      00011E 74 40            [12]  568 	mov	a,#0x40
      000120 25 2C            [12]  569 	add	a,(_cactus_pos + 0x0003)
      000122 44 80            [12]  570 	orl	a,#0x80
      000124 F5 82            [12]  571 	mov	dpl,a
      000126 12 09 9B         [24]  572 	lcall	_LCD_IRWrite
                                    573 ;	dino.c:87: LCD_write_char(' ');
      000129 75 82 20         [24]  574 	mov	dpl,#0x20
      00012C 12 09 E7         [24]  575 	lcall	_LCD_write_char
                                    576 ;	dino.c:88: LCD_cursorGoTo(0, cactus_pos[4]);
      00012F 74 80            [12]  577 	mov	a,#0x80
      000131 45 2D            [12]  578 	orl	a,(_cactus_pos + 0x0004)
      000133 F5 82            [12]  579 	mov	dpl,a
      000135 12 09 9B         [24]  580 	lcall	_LCD_IRWrite
                                    581 ;	dino.c:89: LCD_write_char(' ');
      000138 75 82 20         [24]  582 	mov	dpl,#0x20
      00013B 12 09 E7         [24]  583 	lcall	_LCD_write_char
                                    584 ;	dino.c:91: if(game_over) {return;}
      00013E E5 23            [12]  585 	mov	a,_game_over
      000140 60 01            [24]  586 	jz	00104$
      000142 22               [24]  587 	ret
      000143                        588 00104$:
                                    589 ;	dino.c:93: if (cactus_pos[0] == 0) cactus_pos[0] = 15;
      000143 E5 29            [12]  590 	mov	a,_cactus_pos
      000145 70 05            [24]  591 	jnz	00106$
      000147 75 29 0F         [24]  592 	mov	_cactus_pos,#0x0f
      00014A 80 06            [24]  593 	sjmp	00107$
      00014C                        594 00106$:
                                    595 ;	dino.c:94: else cactus_pos[0] = cactus_pos[0] - 1;
      00014C E5 29            [12]  596 	mov	a,_cactus_pos
      00014E FF               [12]  597 	mov	r7,a
      00014F 14               [12]  598 	dec	a
      000150 F5 29            [12]  599 	mov	_cactus_pos,a
      000152                        600 00107$:
                                    601 ;	dino.c:95: if (cactus_pos[1] == 0) cactus_pos[1] = 15;
      000152 E5 2A            [12]  602 	mov	a,(_cactus_pos + 0x0001)
      000154 70 05            [24]  603 	jnz	00109$
      000156 75 2A 0F         [24]  604 	mov	(_cactus_pos + 0x0001),#0x0f
      000159 80 06            [24]  605 	sjmp	00110$
      00015B                        606 00109$:
                                    607 ;	dino.c:96: else cactus_pos[1] = cactus_pos[1] - 1;
      00015B E5 2A            [12]  608 	mov	a,(_cactus_pos + 0x0001)
      00015D FF               [12]  609 	mov	r7,a
      00015E 14               [12]  610 	dec	a
      00015F F5 2A            [12]  611 	mov	(_cactus_pos + 0x0001),a
      000161                        612 00110$:
                                    613 ;	dino.c:97: if (cactus_pos[2] == 0) cactus_pos[2] = 15;
      000161 E5 2B            [12]  614 	mov	a,(_cactus_pos + 0x0002)
      000163 70 05            [24]  615 	jnz	00112$
      000165 75 2B 0F         [24]  616 	mov	(_cactus_pos + 0x0002),#0x0f
      000168 80 06            [24]  617 	sjmp	00113$
      00016A                        618 00112$:
                                    619 ;	dino.c:98: else cactus_pos[2] = cactus_pos[2] - 1;
      00016A E5 2B            [12]  620 	mov	a,(_cactus_pos + 0x0002)
      00016C FF               [12]  621 	mov	r7,a
      00016D 14               [12]  622 	dec	a
      00016E F5 2B            [12]  623 	mov	(_cactus_pos + 0x0002),a
      000170                        624 00113$:
                                    625 ;	dino.c:99: if (cactus_pos[3] == 0) cactus_pos[3] = 15;
      000170 E5 2C            [12]  626 	mov	a,(_cactus_pos + 0x0003)
      000172 70 05            [24]  627 	jnz	00115$
      000174 75 2C 0F         [24]  628 	mov	(_cactus_pos + 0x0003),#0x0f
      000177 80 06            [24]  629 	sjmp	00116$
      000179                        630 00115$:
                                    631 ;	dino.c:100: else cactus_pos[3] = cactus_pos[3] - 1;
      000179 E5 2C            [12]  632 	mov	a,(_cactus_pos + 0x0003)
      00017B FF               [12]  633 	mov	r7,a
      00017C 14               [12]  634 	dec	a
      00017D F5 2C            [12]  635 	mov	(_cactus_pos + 0x0003),a
      00017F                        636 00116$:
                                    637 ;	dino.c:101: if (cactus_pos[4] == 0) cactus_pos[4] = 15;
      00017F E5 2D            [12]  638 	mov	a,(_cactus_pos + 0x0004)
      000181 70 05            [24]  639 	jnz	00118$
      000183 75 2D 0F         [24]  640 	mov	(_cactus_pos + 0x0004),#0x0f
      000186 80 06            [24]  641 	sjmp	00119$
      000188                        642 00118$:
                                    643 ;	dino.c:102: else cactus_pos[4] = cactus_pos[4] - 1;
      000188 E5 2D            [12]  644 	mov	a,(_cactus_pos + 0x0004)
      00018A FF               [12]  645 	mov	r7,a
      00018B 14               [12]  646 	dec	a
      00018C F5 2D            [12]  647 	mov	(_cactus_pos + 0x0004),a
      00018E                        648 00119$:
                                    649 ;	dino.c:108: if(game_over) { 
      00018E E5 23            [12]  650 	mov	a,_game_over
      000190 60 01            [24]  651 	jz	00126$
                                    652 ;	dino.c:109: return;
      000192 22               [24]  653 	ret
      000193                        654 00126$:
                                    655 ;	dino.c:112: if(!flag){
      000193 E5 28            [12]  656 	mov	a,_flag
      000195 70 16            [24]  657 	jnz	00124$
                                    658 ;	dino.c:113: if (score == 9){
      000197 74 09            [12]  659 	mov	a,#0x09
      000199 B5 2E 0B         [24]  660 	cjne	a,_score,00121$
                                    661 ;	dino.c:114: score = 0;
      00019C 75 2E 00         [24]  662 	mov	_score,#0x00
                                    663 ;	dino.c:115: pre_score = pre_score + 1;
      00019F E5 27            [12]  664 	mov	a,_pre_score
      0001A1 FF               [12]  665 	mov	r7,a
      0001A2 04               [12]  666 	inc	a
      0001A3 F5 27            [12]  667 	mov	_pre_score,a
      0001A5 80 06            [24]  668 	sjmp	00124$
      0001A7                        669 00121$:
                                    670 ;	dino.c:118: score = score + 1;
      0001A7 E5 2E            [12]  671 	mov	a,_score
      0001A9 FF               [12]  672 	mov	r7,a
      0001AA 04               [12]  673 	inc	a
      0001AB F5 2E            [12]  674 	mov	_score,a
      0001AD                        675 00124$:
                                    676 ;	dino.c:121: flag = 1;
      0001AD 75 28 01         [24]  677 	mov	_flag,#0x01
                                    678 ;	dino.c:122: LCD_cursorGoTo(0, cactus_pos[0]);
      0001B0 74 80            [12]  679 	mov	a,#0x80
      0001B2 45 29            [12]  680 	orl	a,_cactus_pos
      0001B4 F5 82            [12]  681 	mov	dpl,a
      0001B6 12 09 9B         [24]  682 	lcall	_LCD_IRWrite
                                    683 ;	dino.c:123: LCD_write_char(0x01);
      0001B9 75 82 01         [24]  684 	mov	dpl,#0x01
      0001BC 12 09 E7         [24]  685 	lcall	_LCD_write_char
                                    686 ;	dino.c:124: LCD_cursorGoTo(1, cactus_pos[1]);
      0001BF 74 40            [12]  687 	mov	a,#0x40
      0001C1 25 2A            [12]  688 	add	a,(_cactus_pos + 0x0001)
      0001C3 44 80            [12]  689 	orl	a,#0x80
      0001C5 F5 82            [12]  690 	mov	dpl,a
      0001C7 12 09 9B         [24]  691 	lcall	_LCD_IRWrite
                                    692 ;	dino.c:125: LCD_write_char(0x01);
      0001CA 75 82 01         [24]  693 	mov	dpl,#0x01
      0001CD 12 09 E7         [24]  694 	lcall	_LCD_write_char
                                    695 ;	dino.c:126: LCD_cursorGoTo(0, cactus_pos[2]);
      0001D0 74 80            [12]  696 	mov	a,#0x80
      0001D2 45 2B            [12]  697 	orl	a,(_cactus_pos + 0x0002)
      0001D4 F5 82            [12]  698 	mov	dpl,a
      0001D6 12 09 9B         [24]  699 	lcall	_LCD_IRWrite
                                    700 ;	dino.c:127: LCD_write_char(0x01);
      0001D9 75 82 01         [24]  701 	mov	dpl,#0x01
      0001DC 12 09 E7         [24]  702 	lcall	_LCD_write_char
                                    703 ;	dino.c:128: LCD_cursorGoTo(1, cactus_pos[3]);
      0001DF 74 40            [12]  704 	mov	a,#0x40
      0001E1 25 2C            [12]  705 	add	a,(_cactus_pos + 0x0003)
      0001E3 44 80            [12]  706 	orl	a,#0x80
      0001E5 F5 82            [12]  707 	mov	dpl,a
      0001E7 12 09 9B         [24]  708 	lcall	_LCD_IRWrite
                                    709 ;	dino.c:129: LCD_write_char(0x01);
      0001EA 75 82 01         [24]  710 	mov	dpl,#0x01
      0001ED 12 09 E7         [24]  711 	lcall	_LCD_write_char
                                    712 ;	dino.c:130: LCD_cursorGoTo(0, cactus_pos[4]);
      0001F0 74 80            [12]  713 	mov	a,#0x80
      0001F2 45 2D            [12]  714 	orl	a,(_cactus_pos + 0x0004)
      0001F4 F5 82            [12]  715 	mov	dpl,a
      0001F6 12 09 9B         [24]  716 	lcall	_LCD_IRWrite
                                    717 ;	dino.c:131: LCD_write_char(0x01);
      0001F9 75 82 01         [24]  718 	mov	dpl,#0x01
      0001FC 12 09 E7         [24]  719 	lcall	_LCD_write_char
                                    720 ;	dino.c:132: LCD_returnHome();
      0001FF 75 82 02         [24]  721 	mov	dpl,#0x02
      000202 12 09 9B         [24]  722 	lcall	_LCD_IRWrite
      000205                        723 00129$:
                                    724 ;	dino.c:137: EA = 1;
                                    725 ;	assignBit
      000205 D2 AF            [12]  726 	setb	_EA
                                    727 ;	dino.c:139: SemaphoreSignal(mutex);
      000207 05 3A            [12]  728 	INC _mutex 
                                    729 ;	dino.c:145: ThreadYield(); 
      000209 12 07 8F         [24]  730 	lcall	_ThreadYield
                                    731 ;	dino.c:147: }
      00020C 02 00 D3         [24]  732 	ljmp	00131$
                                    733 ;------------------------------------------------------------
                                    734 ;Allocation info for local variables in function 'init'
                                    735 ;------------------------------------------------------------
                                    736 ;	dino.c:149: void init(void) {
                                    737 ;	-----------------------------------------
                                    738 ;	 function init
                                    739 ;	-----------------------------------------
      00020F                        740 _init:
                                    741 ;	dino.c:150: TMOD |= 0x20;
      00020F 43 89 20         [24]  742 	orl	_TMOD,#0x20
                                    743 ;	dino.c:151: SCON = 0x50;        
      000212 75 98 50         [24]  744 	mov	_SCON,#0x50
                                    745 ;	dino.c:152: TH1 = (char) -6;            
      000215 75 8D FA         [24]  746 	mov	_TH1,#0xfa
                                    747 ;	dino.c:153: TR1 = 1;            
                                    748 ;	assignBit
      000218 D2 8E            [12]  749 	setb	_TR1
                                    750 ;	dino.c:154: TI = 1;
                                    751 ;	assignBit
      00021A D2 99            [12]  752 	setb	_TI
                                    753 ;	dino.c:155: dino_pos = 0; // Dinosaur starts at row 0
      00021C 75 20 00         [24]  754 	mov	_dino_pos,#0x00
                                    755 ;	dino.c:156: score = 0;      // Reset score
      00021F 75 2E 00         [24]  756 	mov	_score,#0x00
                                    757 ;	dino.c:157: pre_score = 0;
      000222 75 27 00         [24]  758 	mov	_pre_score,#0x00
                                    759 ;	dino.c:158: game_over = 0;  // Game is running
      000225 75 23 00         [24]  760 	mov	_game_over,#0x00
                                    761 ;	dino.c:159: cactus_pos[0] = 4;
      000228 75 29 04         [24]  762 	mov	_cactus_pos,#0x04
                                    763 ;	dino.c:160: cactus_pos[1] = 6;
      00022B 75 2A 06         [24]  764 	mov	(_cactus_pos + 0x0001),#0x06
                                    765 ;	dino.c:161: cactus_pos[2] = 8;
      00022E 75 2B 08         [24]  766 	mov	(_cactus_pos + 0x0002),#0x08
                                    767 ;	dino.c:162: cactus_pos[3] = 12;
      000231 75 2C 0C         [24]  768 	mov	(_cactus_pos + 0x0003),#0x0c
                                    769 ;	dino.c:163: cactus_pos[4] = 14;  
      000234 75 2D 0E         [24]  770 	mov	(_cactus_pos + 0x0004),#0x0e
                                    771 ;	dino.c:164: k = 0;;
      000237 75 26 00         [24]  772 	mov	_k,#0x00
                                    773 ;	dino.c:165: flag = 1;
      00023A 75 28 01         [24]  774 	mov	_flag,#0x01
                                    775 ;	dino.c:166: LCD_cursorGoTo(0, 0); // 固定在第 0 列
      00023D 75 82 80         [24]  776 	mov	dpl,#0x80
      000240 12 09 9B         [24]  777 	lcall	_LCD_IRWrite
                                    778 ;	dino.c:167: LCD_write_char(0x00);
      000243 75 82 00         [24]  779 	mov	dpl,#0x00
      000246 12 09 E7         [24]  780 	lcall	_LCD_write_char
                                    781 ;	dino.c:168: LCD_cursorGoTo(0, cactus_pos[0]);
      000249 74 80            [12]  782 	mov	a,#0x80
      00024B 45 29            [12]  783 	orl	a,_cactus_pos
      00024D F5 82            [12]  784 	mov	dpl,a
      00024F 12 09 9B         [24]  785 	lcall	_LCD_IRWrite
                                    786 ;	dino.c:169: LCD_write_char(0x01);
      000252 75 82 01         [24]  787 	mov	dpl,#0x01
      000255 12 09 E7         [24]  788 	lcall	_LCD_write_char
                                    789 ;	dino.c:170: LCD_cursorGoTo(1, cactus_pos[1]);
      000258 74 40            [12]  790 	mov	a,#0x40
      00025A 25 2A            [12]  791 	add	a,(_cactus_pos + 0x0001)
      00025C 44 80            [12]  792 	orl	a,#0x80
      00025E F5 82            [12]  793 	mov	dpl,a
      000260 12 09 9B         [24]  794 	lcall	_LCD_IRWrite
                                    795 ;	dino.c:171: LCD_write_char(0x01);
      000263 75 82 01         [24]  796 	mov	dpl,#0x01
      000266 12 09 E7         [24]  797 	lcall	_LCD_write_char
                                    798 ;	dino.c:172: LCD_cursorGoTo(0, cactus_pos[2]);
      000269 74 80            [12]  799 	mov	a,#0x80
      00026B 45 2B            [12]  800 	orl	a,(_cactus_pos + 0x0002)
      00026D F5 82            [12]  801 	mov	dpl,a
      00026F 12 09 9B         [24]  802 	lcall	_LCD_IRWrite
                                    803 ;	dino.c:173: LCD_write_char(0x01);
      000272 75 82 01         [24]  804 	mov	dpl,#0x01
      000275 12 09 E7         [24]  805 	lcall	_LCD_write_char
                                    806 ;	dino.c:174: LCD_cursorGoTo(1, cactus_pos[3]);
      000278 74 40            [12]  807 	mov	a,#0x40
      00027A 25 2C            [12]  808 	add	a,(_cactus_pos + 0x0003)
      00027C 44 80            [12]  809 	orl	a,#0x80
      00027E F5 82            [12]  810 	mov	dpl,a
      000280 12 09 9B         [24]  811 	lcall	_LCD_IRWrite
                                    812 ;	dino.c:175: LCD_write_char(0x01);
      000283 75 82 01         [24]  813 	mov	dpl,#0x01
      000286 12 09 E7         [24]  814 	lcall	_LCD_write_char
                                    815 ;	dino.c:176: LCD_cursorGoTo(0, cactus_pos[4]);
      000289 74 80            [12]  816 	mov	a,#0x80
      00028B 45 2D            [12]  817 	orl	a,(_cactus_pos + 0x0004)
      00028D F5 82            [12]  818 	mov	dpl,a
      00028F 12 09 9B         [24]  819 	lcall	_LCD_IRWrite
                                    820 ;	dino.c:177: LCD_write_char(0x01);
      000292 75 82 01         [24]  821 	mov	dpl,#0x01
      000295 12 09 E7         [24]  822 	lcall	_LCD_write_char
                                    823 ;	dino.c:178: diff = 0;
      000298 75 2F 00         [24]  824 	mov	_diff,#0x00
                                    825 ;	dino.c:179: i = 0;
      00029B 75 24 00         [24]  826 	mov	_i,#0x00
                                    827 ;	dino.c:181: }
      00029E 22               [24]  828 	ret
                                    829 ;------------------------------------------------------------
                                    830 ;Allocation info for local variables in function 'update_cactus'
                                    831 ;------------------------------------------------------------
                                    832 ;	dino.c:183: void update_cactus(void) {
                                    833 ;	-----------------------------------------
                                    834 ;	 function update_cactus
                                    835 ;	-----------------------------------------
      00029F                        836 _update_cactus:
                                    837 ;	dino.c:185: if(game_over) {
      00029F E5 23            [12]  838 	mov	a,_game_over
      0002A1 60 01            [24]  839 	jz	00102$
                                    840 ;	dino.c:186: return;}
      0002A3 22               [24]  841 	ret
      0002A4                        842 00102$:
                                    843 ;	dino.c:187: SemaphoreWait(mutex);
      0002A4                        844 		1$:
      0002A4 E5 3A            [12]  845 	MOV A, _mutex 
      0002A6 60 FC            [24]  846 	JZ 1$ 
      0002A8 20 E7 F9         [24]  847 	JB ACC.7, 1$ 
      0002AB 15 3A            [12]  848 	DEC _mutex 
                                    849 ;	dino.c:189: if (k) {
      0002AD E5 26            [12]  850 	mov	a,_k
      0002AF 60 03            [24]  851 	jz	00104$
                                    852 ;	dino.c:190: k = 0;
      0002B1 75 26 00         [24]  853 	mov	_k,#0x00
      0002B4                        854 00104$:
                                    855 ;	dino.c:193: SemaphoreSignal(mutex); 
      0002B4 05 3A            [12]  856 	INC _mutex 
                                    857 ;	dino.c:195: }
      0002B6 22               [24]  858 	ret
                                    859 ;------------------------------------------------------------
                                    860 ;Allocation info for local variables in function 'move_dinosaur'
                                    861 ;------------------------------------------------------------
                                    862 ;	dino.c:198: void move_dinosaur(void) {
                                    863 ;	-----------------------------------------
                                    864 ;	 function move_dinosaur
                                    865 ;	-----------------------------------------
      0002B7                        866 _move_dinosaur:
                                    867 ;	dino.c:199: if(game_over) return;
      0002B7 E5 23            [12]  868 	mov	a,_game_over
      0002B9 60 01            [24]  869 	jz	00102$
      0002BB 22               [24]  870 	ret
      0002BC                        871 00102$:
                                    872 ;	dino.c:201: dino_pos = dino_pos;
      0002BC 85 20 20         [24]  873 	mov	_dino_pos,_dino_pos
                                    874 ;	dino.c:204: if (dino_pos != 0 && dino_pos != 1) {
      0002BF E5 20            [12]  875 	mov	a,_dino_pos
      0002C1 60 09            [24]  876 	jz	00107$
      0002C3 74 01            [12]  877 	mov	a,#0x01
      0002C5 B5 20 01         [24]  878 	cjne	a,_dino_pos,00123$
      0002C8 22               [24]  879 	ret
      0002C9                        880 00123$:
                                    881 ;	dino.c:205: dino_pos = 0; // 回到安全值 0
      0002C9 75 20 00         [24]  882 	mov	_dino_pos,#0x00
      0002CC                        883 00107$:
                                    884 ;	dino.c:207: }
      0002CC 22               [24]  885 	ret
                                    886 ;------------------------------------------------------------
                                    887 ;Allocation info for local variables in function 'end_game'
                                    888 ;------------------------------------------------------------
                                    889 ;	dino.c:209: void end_game(void) {
                                    890 ;	-----------------------------------------
                                    891 ;	 function end_game
                                    892 ;	-----------------------------------------
      0002CD                        893 _end_game:
                                    894 ;	dino.c:210: i = 0;
      0002CD 75 24 00         [24]  895 	mov	_i,#0x00
                                    896 ;	dino.c:211: j = 0;
      0002D0 75 25 00         [24]  897 	mov	_j,#0x00
                                    898 ;	dino.c:213: while(1){
      0002D3                        899 00104$:
                                    900 ;	dino.c:214: LCD_cursorGoTo(i, j);
      0002D3 E5 24            [12]  901 	mov	a,_i
      0002D5 03               [12]  902 	rr	a
      0002D6 03               [12]  903 	rr	a
      0002D7 54 C0            [12]  904 	anl	a,#0xc0
      0002D9 FF               [12]  905 	mov	r7,a
      0002DA E5 25            [12]  906 	mov	a,_j
      0002DC 2F               [12]  907 	add	a,r7
      0002DD FF               [12]  908 	mov	r7,a
      0002DE 74 80            [12]  909 	mov	a,#0x80
      0002E0 4F               [12]  910 	orl	a,r7
      0002E1 F5 82            [12]  911 	mov	dpl,a
      0002E3 12 09 9B         [24]  912 	lcall	_LCD_IRWrite
                                    913 ;	dino.c:215: LCD_write_char(' ');
      0002E6 75 82 20         [24]  914 	mov	dpl,#0x20
      0002E9 12 09 E7         [24]  915 	lcall	_LCD_write_char
                                    916 ;	dino.c:216: j = j + 1;
      0002EC E5 25            [12]  917 	mov	a,_j
      0002EE FF               [12]  918 	mov	r7,a
      0002EF 04               [12]  919 	inc	a
      0002F0 F5 25            [12]  920 	mov	_j,a
                                    921 ;	dino.c:217: if(j == 16){ j = 0; break;}
      0002F2 74 10            [12]  922 	mov	a,#0x10
      0002F4 B5 25 DC         [24]  923 	cjne	a,_j,00104$
      0002F7 75 25 00         [24]  924 	mov	_j,#0x00
                                    925 ;	dino.c:219: i = i + 1;
      0002FA E5 24            [12]  926 	mov	a,_i
      0002FC FF               [12]  927 	mov	r7,a
      0002FD 04               [12]  928 	inc	a
      0002FE F5 24            [12]  929 	mov	_i,a
                                    930 ;	dino.c:220: if(i == 2)break;
      000300 74 02            [12]  931 	mov	a,#0x02
      000302 B5 24 CE         [24]  932 	cjne	a,_i,00104$
                                    933 ;	dino.c:222: i = 0;
      000305 75 24 00         [24]  934 	mov	_i,#0x00
                                    935 ;	dino.c:223: j = 0;
      000308 75 25 00         [24]  936 	mov	_j,#0x00
                                    937 ;	dino.c:224: LCD_cursorGoTo(0, 0);
      00030B 75 82 80         [24]  938 	mov	dpl,#0x80
      00030E 12 09 9B         [24]  939 	lcall	_LCD_IRWrite
                                    940 ;	dino.c:225: j = 'G';
      000311 75 25 47         [24]  941 	mov	_j,#0x47
                                    942 ;	dino.c:226: LCD_write_char(j);
      000314 85 25 82         [24]  943 	mov	dpl,_j
      000317 12 09 E7         [24]  944 	lcall	_LCD_write_char
                                    945 ;	dino.c:227: LCD_cursorGoTo(0, 1);
      00031A 75 82 81         [24]  946 	mov	dpl,#0x81
      00031D 12 09 9B         [24]  947 	lcall	_LCD_IRWrite
                                    948 ;	dino.c:228: j = 'a';
      000320 75 25 61         [24]  949 	mov	_j,#0x61
                                    950 ;	dino.c:229: LCD_write_char(j);
      000323 85 25 82         [24]  951 	mov	dpl,_j
      000326 12 09 E7         [24]  952 	lcall	_LCD_write_char
                                    953 ;	dino.c:230: LCD_cursorGoTo(0, 2);
      000329 75 82 82         [24]  954 	mov	dpl,#0x82
      00032C 12 09 9B         [24]  955 	lcall	_LCD_IRWrite
                                    956 ;	dino.c:231: j = 'm';
      00032F 75 25 6D         [24]  957 	mov	_j,#0x6d
                                    958 ;	dino.c:232: LCD_write_char(j);
      000332 85 25 82         [24]  959 	mov	dpl,_j
      000335 12 09 E7         [24]  960 	lcall	_LCD_write_char
                                    961 ;	dino.c:233: LCD_cursorGoTo(0, 3);
      000338 75 82 83         [24]  962 	mov	dpl,#0x83
      00033B 12 09 9B         [24]  963 	lcall	_LCD_IRWrite
                                    964 ;	dino.c:234: j = 'e';
      00033E 75 25 65         [24]  965 	mov	_j,#0x65
                                    966 ;	dino.c:235: LCD_write_char(j);
      000341 85 25 82         [24]  967 	mov	dpl,_j
      000344 12 09 E7         [24]  968 	lcall	_LCD_write_char
                                    969 ;	dino.c:236: LCD_cursorGoTo(0, 4);
      000347 75 82 84         [24]  970 	mov	dpl,#0x84
      00034A 12 09 9B         [24]  971 	lcall	_LCD_IRWrite
                                    972 ;	dino.c:237: j = ' ';
      00034D 75 25 20         [24]  973 	mov	_j,#0x20
                                    974 ;	dino.c:238: LCD_write_char(j);
      000350 85 25 82         [24]  975 	mov	dpl,_j
      000353 12 09 E7         [24]  976 	lcall	_LCD_write_char
                                    977 ;	dino.c:239: LCD_cursorGoTo(0, 5);
      000356 75 82 85         [24]  978 	mov	dpl,#0x85
      000359 12 09 9B         [24]  979 	lcall	_LCD_IRWrite
                                    980 ;	dino.c:240: j = 'o';
      00035C 75 25 6F         [24]  981 	mov	_j,#0x6f
                                    982 ;	dino.c:241: LCD_write_char(j);
      00035F 85 25 82         [24]  983 	mov	dpl,_j
      000362 12 09 E7         [24]  984 	lcall	_LCD_write_char
                                    985 ;	dino.c:242: LCD_cursorGoTo(0, 6);
      000365 75 82 86         [24]  986 	mov	dpl,#0x86
      000368 12 09 9B         [24]  987 	lcall	_LCD_IRWrite
                                    988 ;	dino.c:243: j = 'v';
      00036B 75 25 76         [24]  989 	mov	_j,#0x76
                                    990 ;	dino.c:244: LCD_write_char(j);
      00036E 85 25 82         [24]  991 	mov	dpl,_j
      000371 12 09 E7         [24]  992 	lcall	_LCD_write_char
                                    993 ;	dino.c:245: LCD_cursorGoTo(0, 7);
      000374 75 82 87         [24]  994 	mov	dpl,#0x87
      000377 12 09 9B         [24]  995 	lcall	_LCD_IRWrite
                                    996 ;	dino.c:246: j = 'e';
      00037A 75 25 65         [24]  997 	mov	_j,#0x65
                                    998 ;	dino.c:247: LCD_write_char(j);
      00037D 85 25 82         [24]  999 	mov	dpl,_j
      000380 12 09 E7         [24] 1000 	lcall	_LCD_write_char
                                   1001 ;	dino.c:248: LCD_cursorGoTo(0, 8);
      000383 75 82 88         [24] 1002 	mov	dpl,#0x88
      000386 12 09 9B         [24] 1003 	lcall	_LCD_IRWrite
                                   1004 ;	dino.c:249: j = 'r';
      000389 75 25 72         [24] 1005 	mov	_j,#0x72
                                   1006 ;	dino.c:250: LCD_write_char(j);
      00038C 85 25 82         [24] 1007 	mov	dpl,_j
      00038F 12 09 E7         [24] 1008 	lcall	_LCD_write_char
                                   1009 ;	dino.c:251: LCD_cursorGoTo(1, 0);
      000392 75 82 C0         [24] 1010 	mov	dpl,#0xc0
      000395 12 09 9B         [24] 1011 	lcall	_LCD_IRWrite
                                   1012 ;	dino.c:252: j = 'S';
      000398 75 25 53         [24] 1013 	mov	_j,#0x53
                                   1014 ;	dino.c:253: LCD_write_char(j);
      00039B 85 25 82         [24] 1015 	mov	dpl,_j
      00039E 12 09 E7         [24] 1016 	lcall	_LCD_write_char
                                   1017 ;	dino.c:254: LCD_cursorGoTo(1, 1);
      0003A1 75 82 C1         [24] 1018 	mov	dpl,#0xc1
      0003A4 12 09 9B         [24] 1019 	lcall	_LCD_IRWrite
                                   1020 ;	dino.c:255: j = 'c';
      0003A7 75 25 63         [24] 1021 	mov	_j,#0x63
                                   1022 ;	dino.c:256: LCD_write_char(j);
      0003AA 85 25 82         [24] 1023 	mov	dpl,_j
      0003AD 12 09 E7         [24] 1024 	lcall	_LCD_write_char
                                   1025 ;	dino.c:257: LCD_cursorGoTo(1, 2);
      0003B0 75 82 C2         [24] 1026 	mov	dpl,#0xc2
      0003B3 12 09 9B         [24] 1027 	lcall	_LCD_IRWrite
                                   1028 ;	dino.c:258: j = 'o';
      0003B6 75 25 6F         [24] 1029 	mov	_j,#0x6f
                                   1030 ;	dino.c:259: LCD_write_char(j);
      0003B9 85 25 82         [24] 1031 	mov	dpl,_j
      0003BC 12 09 E7         [24] 1032 	lcall	_LCD_write_char
                                   1033 ;	dino.c:260: LCD_cursorGoTo(1, 3);
      0003BF 75 82 C3         [24] 1034 	mov	dpl,#0xc3
      0003C2 12 09 9B         [24] 1035 	lcall	_LCD_IRWrite
                                   1036 ;	dino.c:261: j = 'r';
      0003C5 75 25 72         [24] 1037 	mov	_j,#0x72
                                   1038 ;	dino.c:262: LCD_write_char(j);
      0003C8 85 25 82         [24] 1039 	mov	dpl,_j
      0003CB 12 09 E7         [24] 1040 	lcall	_LCD_write_char
                                   1041 ;	dino.c:263: LCD_cursorGoTo(1, 4);
      0003CE 75 82 C4         [24] 1042 	mov	dpl,#0xc4
      0003D1 12 09 9B         [24] 1043 	lcall	_LCD_IRWrite
                                   1044 ;	dino.c:264: j = 'e';
      0003D4 75 25 65         [24] 1045 	mov	_j,#0x65
                                   1046 ;	dino.c:265: LCD_write_char(j);
      0003D7 85 25 82         [24] 1047 	mov	dpl,_j
      0003DA 12 09 E7         [24] 1048 	lcall	_LCD_write_char
                                   1049 ;	dino.c:266: LCD_cursorGoTo(1, 5);
      0003DD 75 82 C5         [24] 1050 	mov	dpl,#0xc5
      0003E0 12 09 9B         [24] 1051 	lcall	_LCD_IRWrite
                                   1052 ;	dino.c:267: j = ' ';
      0003E3 75 25 20         [24] 1053 	mov	_j,#0x20
                                   1054 ;	dino.c:268: LCD_write_char(j);
      0003E6 85 25 82         [24] 1055 	mov	dpl,_j
      0003E9 12 09 E7         [24] 1056 	lcall	_LCD_write_char
                                   1057 ;	dino.c:269: LCD_cursorGoTo(1, 6);
      0003EC 75 82 C6         [24] 1058 	mov	dpl,#0xc6
      0003EF 12 09 9B         [24] 1059 	lcall	_LCD_IRWrite
                                   1060 ;	dino.c:270: j = ':';
      0003F2 75 25 3A         [24] 1061 	mov	_j,#0x3a
                                   1062 ;	dino.c:271: LCD_write_char(j);
      0003F5 85 25 82         [24] 1063 	mov	dpl,_j
      0003F8 12 09 E7         [24] 1064 	lcall	_LCD_write_char
                                   1065 ;	dino.c:272: LCD_cursorGoTo(1, 7);
      0003FB 75 82 C7         [24] 1066 	mov	dpl,#0xc7
      0003FE 12 09 9B         [24] 1067 	lcall	_LCD_IRWrite
                                   1068 ;	dino.c:273: j = ' ';
      000401 75 25 20         [24] 1069 	mov	_j,#0x20
                                   1070 ;	dino.c:274: LCD_write_char(j);
      000404 85 25 82         [24] 1071 	mov	dpl,_j
      000407 12 09 E7         [24] 1072 	lcall	_LCD_write_char
                                   1073 ;	dino.c:275: LCD_cursorGoTo(1, 8);
      00040A 75 82 C8         [24] 1074 	mov	dpl,#0xc8
      00040D 12 09 9B         [24] 1075 	lcall	_LCD_IRWrite
                                   1076 ;	dino.c:276: j = pre_score % 10 + '0';
      000410 AE 27            [24] 1077 	mov	r6,_pre_score
      000412 7F 00            [12] 1078 	mov	r7,#0x00
      000414 75 0B 0A         [24] 1079 	mov	__modsint_PARM_2,#0x0a
                                   1080 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      000417 8F 0C            [24] 1081 	mov	(__modsint_PARM_2 + 1),r7
      000419 8E 82            [24] 1082 	mov	dpl,r6
      00041B 8F 83            [24] 1083 	mov	dph,r7
      00041D 12 0C E3         [24] 1084 	lcall	__modsint
      000420 AE 82            [24] 1085 	mov	r6,dpl
      000422 74 30            [12] 1086 	mov	a,#0x30
      000424 2E               [12] 1087 	add	a,r6
      000425 F5 25            [12] 1088 	mov	_j,a
                                   1089 ;	dino.c:277: LCD_write_char(j); // 
      000427 85 25 82         [24] 1090 	mov	dpl,_j
      00042A 12 09 E7         [24] 1091 	lcall	_LCD_write_char
                                   1092 ;	dino.c:278: LCD_cursorGoTo(1, 9);
      00042D 75 82 C9         [24] 1093 	mov	dpl,#0xc9
      000430 12 09 9B         [24] 1094 	lcall	_LCD_IRWrite
                                   1095 ;	dino.c:279: j = score % 10 + '0';
      000433 AE 2E            [24] 1096 	mov	r6,_score
      000435 7F 00            [12] 1097 	mov	r7,#0x00
      000437 75 0B 0A         [24] 1098 	mov	__modsint_PARM_2,#0x0a
                                   1099 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      00043A 8F 0C            [24] 1100 	mov	(__modsint_PARM_2 + 1),r7
      00043C 8E 82            [24] 1101 	mov	dpl,r6
      00043E 8F 83            [24] 1102 	mov	dph,r7
      000440 12 0C E3         [24] 1103 	lcall	__modsint
      000443 AE 82            [24] 1104 	mov	r6,dpl
      000445 74 30            [12] 1105 	mov	a,#0x30
      000447 2E               [12] 1106 	add	a,r6
      000448 F5 25            [12] 1107 	mov	_j,a
                                   1108 ;	dino.c:280: LCD_write_char(j); //
      00044A 85 25 82         [24] 1109 	mov	dpl,_j
      00044D 12 09 E7         [24] 1110 	lcall	_LCD_write_char
                                   1111 ;	dino.c:281: delay(40);     
      000450 75 82 28         [24] 1112 	mov	dpl,#0x28
      000453 12 0A 46         [24] 1113 	lcall	_delay
                                   1114 ;	dino.c:282: LCD_returnHome();
      000456 75 82 02         [24] 1115 	mov	dpl,#0x02
                                   1116 ;	dino.c:283: return;
                                   1117 ;	dino.c:284: }
      000459 02 09 9B         [24] 1118 	ljmp	_LCD_IRWrite
                                   1119 ;------------------------------------------------------------
                                   1120 ;Allocation info for local variables in function 'game_ctrl'
                                   1121 ;------------------------------------------------------------
                                   1122 ;	dino.c:287: void game_ctrl(void) {
                                   1123 ;	-----------------------------------------
                                   1124 ;	 function game_ctrl
                                   1125 ;	-----------------------------------------
      00045C                       1126 _game_ctrl:
                                   1127 ;	dino.c:290: while (1) {
      00045C                       1128 00146$:
                                   1129 ;	dino.c:292: if (LCD_ready()) {
      00045C 12 09 66         [24] 1130 	lcall	_LCD_ready
      00045F E5 82            [12] 1131 	mov	a,dpl
      000461 60 F9            [24] 1132 	jz	00146$
                                   1133 ;	dino.c:294: update_cactus();
      000463 12 02 9F         [24] 1134 	lcall	_update_cactus
                                   1135 ;	dino.c:296: flag = 1;
      000466 75 28 01         [24] 1136 	mov	_flag,#0x01
                                   1137 ;	dino.c:297: EA = 0;
                                   1138 ;	assignBit
      000469 C2 AF            [12] 1139 	clr	_EA
                                   1140 ;	dino.c:298: i = 0;
      00046B 75 24 00         [24] 1141 	mov	_i,#0x00
                                   1142 ;	dino.c:299: while(1){
      00046E                       1143 00111$:
                                   1144 ;	dino.c:300: if (i == 5){ break;}
      00046E 74 05            [12] 1145 	mov	a,#0x05
      000470 B5 24 02         [24] 1146 	cjne	a,_i,00231$
      000473 80 3D            [24] 1147 	sjmp	00112$
      000475                       1148 00231$:
                                   1149 ;	dino.c:301: if((cactus_pos[i] == 0)){
      000475 E5 24            [12] 1150 	mov	a,_i
      000477 24 29            [12] 1151 	add	a,#_cactus_pos
      000479 F9               [12] 1152 	mov	r1,a
      00047A E7               [12] 1153 	mov	a,@r1
                                   1154 ;	dino.c:302: if((i-dino_pos) % 2 == 0){
      00047B 70 2D            [24] 1155 	jnz	00109$
      00047D AE 24            [24] 1156 	mov	r6,_i
      00047F FF               [12] 1157 	mov	r7,a
      000480 AC 20            [24] 1158 	mov	r4,_dino_pos
      000482 FD               [12] 1159 	mov	r5,a
      000483 EE               [12] 1160 	mov	a,r6
      000484 C3               [12] 1161 	clr	c
      000485 9C               [12] 1162 	subb	a,r4
      000486 F5 82            [12] 1163 	mov	dpl,a
      000488 EF               [12] 1164 	mov	a,r7
      000489 9D               [12] 1165 	subb	a,r5
      00048A F5 83            [12] 1166 	mov	dph,a
      00048C 75 0B 02         [24] 1167 	mov	__modsint_PARM_2,#0x02
                                   1168 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      00048F 8F 0C            [24] 1169 	mov	(__modsint_PARM_2 + 1),r7
      000491 12 0C E3         [24] 1170 	lcall	__modsint
      000494 E5 82            [12] 1171 	mov	a,dpl
      000496 85 83 F0         [24] 1172 	mov	b,dph
      000499 45 F0            [12] 1173 	orl	a,b
      00049B 70 06            [24] 1174 	jnz	00106$
                                   1175 ;	dino.c:303: game_over = 1; 
      00049D 75 23 01         [24] 1176 	mov	_game_over,#0x01
                                   1177 ;	dino.c:304: EA = 1;
                                   1178 ;	assignBit
      0004A0 D2 AF            [12] 1179 	setb	_EA
                                   1180 ;	dino.c:305: return;        
      0004A2 22               [24] 1181 	ret
      0004A3                       1182 00106$:
                                   1183 ;	dino.c:306: }else if(flag){
      0004A3 E5 28            [12] 1184 	mov	a,_flag
      0004A5 60 03            [24] 1185 	jz	00109$
                                   1186 ;	dino.c:307: flag = 0;
      0004A7 75 28 00         [24] 1187 	mov	_flag,#0x00
      0004AA                       1188 00109$:
                                   1189 ;	dino.c:310: i = i + 1;
      0004AA E5 24            [12] 1190 	mov	a,_i
      0004AC FF               [12] 1191 	mov	r7,a
      0004AD 04               [12] 1192 	inc	a
      0004AE F5 24            [12] 1193 	mov	_i,a
      0004B0 80 BC            [24] 1194 	sjmp	00111$
      0004B2                       1195 00112$:
                                   1196 ;	dino.c:312: i = 0;
      0004B2 75 24 00         [24] 1197 	mov	_i,#0x00
                                   1198 ;	dino.c:313: j = 20 - 2*diff;
      0004B5 E5 2F            [12] 1199 	mov	a,_diff
      0004B7 25 E0            [12] 1200 	add	a,acc
      0004B9 FF               [12] 1201 	mov	r7,a
      0004BA 74 14            [12] 1202 	mov	a,#0x14
      0004BC C3               [12] 1203 	clr	c
      0004BD 9F               [12] 1204 	subb	a,r7
      0004BE F5 25            [12] 1205 	mov	_j,a
                                   1206 ;	dino.c:314: while(1){
      0004C0                       1207 00139$:
                                   1208 ;	dino.c:315: delay(255); // Control game speed
      0004C0 75 82 FF         [24] 1209 	mov	dpl,#0xff
      0004C3 12 0A 46         [24] 1210 	lcall	_delay
                                   1211 ;	dino.c:316: delay(255);
      0004C6 75 82 FF         [24] 1212 	mov	dpl,#0xff
      0004C9 12 0A 46         [24] 1213 	lcall	_delay
                                   1214 ;	dino.c:317: delay(255);
      0004CC 75 82 FF         [24] 1215 	mov	dpl,#0xff
      0004CF 12 0A 46         [24] 1216 	lcall	_delay
                                   1217 ;	dino.c:318: delay(255);
      0004D2 75 82 FF         [24] 1218 	mov	dpl,#0xff
      0004D5 12 0A 46         [24] 1219 	lcall	_delay
                                   1220 ;	dino.c:319: delay(255);
      0004D8 75 82 FF         [24] 1221 	mov	dpl,#0xff
      0004DB 12 0A 46         [24] 1222 	lcall	_delay
                                   1223 ;	dino.c:321: delay(255);
      0004DE 75 82 FF         [24] 1224 	mov	dpl,#0xff
      0004E1 12 0A 46         [24] 1225 	lcall	_delay
                                   1226 ;	dino.c:322: delay(255);
      0004E4 75 82 FF         [24] 1227 	mov	dpl,#0xff
      0004E7 12 0A 46         [24] 1228 	lcall	_delay
                                   1229 ;	dino.c:323: delay(255);
      0004EA 75 82 FF         [24] 1230 	mov	dpl,#0xff
      0004ED 12 0A 46         [24] 1231 	lcall	_delay
                                   1232 ;	dino.c:324: delay(255);
      0004F0 75 82 FF         [24] 1233 	mov	dpl,#0xff
      0004F3 12 0A 46         [24] 1234 	lcall	_delay
                                   1235 ;	dino.c:325: delay(255);
      0004F6 75 82 FF         [24] 1236 	mov	dpl,#0xff
      0004F9 12 0A 46         [24] 1237 	lcall	_delay
                                   1238 ;	dino.c:326: move_dinosaur();
      0004FC 12 02 B7         [24] 1239 	lcall	_move_dinosaur
                                   1240 ;	dino.c:327: if (AnyKeyPressed()) {
      0004FF 12 0B F3         [24] 1241 	lcall	_AnyKeyPressed
      000502 E5 82            [12] 1242 	mov	a,dpl
      000504 70 03            [24] 1243 	jnz	00235$
      000506 02 05 8C         [24] 1244 	ljmp	00122$
      000509                       1245 00235$:
                                   1246 ;	dino.c:328: cur_input = KeyToChar();
      000509 12 0B FE         [24] 1247 	lcall	_KeyToChar
      00050C 85 82 3F         [24] 1248 	mov	_cur_input,dpl
                                   1249 ;	dino.c:329: if (cur_input != prev_input && prev_input == 0x00) {
      00050F E5 3E            [12] 1250 	mov	a,_prev_input
      000511 B5 3F 03         [24] 1251 	cjne	a,_cur_input,00236$
      000514 02 05 8F         [24] 1252 	ljmp	00123$
      000517                       1253 00236$:
      000517 E5 3E            [12] 1254 	mov	a,_prev_input
      000519 60 03            [24] 1255 	jz	00237$
      00051B 02 05 8F         [24] 1256 	ljmp	00123$
      00051E                       1257 00237$:
                                   1258 ;	dino.c:330: buffer = cur_input; 
      00051E 85 3F 39         [24] 1259 	mov	_buffer,_cur_input
                                   1260 ;	dino.c:331: if (buffer == '2' ) { // Move up
      000521 74 32            [12] 1261 	mov	a,#0x32
      000523 B5 39 2F         [24] 1262 	cjne	a,_buffer,00116$
                                   1263 ;	dino.c:332: LCD_cursorGoTo(dino_pos, 0); 
      000526 E5 20            [12] 1264 	mov	a,_dino_pos
      000528 03               [12] 1265 	rr	a
      000529 03               [12] 1266 	rr	a
      00052A 54 C0            [12] 1267 	anl	a,#0xc0
      00052C FF               [12] 1268 	mov	r7,a
      00052D 74 80            [12] 1269 	mov	a,#0x80
      00052F 4F               [12] 1270 	orl	a,r7
      000530 F5 82            [12] 1271 	mov	dpl,a
      000532 12 09 9B         [24] 1272 	lcall	_LCD_IRWrite
                                   1273 ;	dino.c:333: LCD_write_char(' ');
      000535 75 82 20         [24] 1274 	mov	dpl,#0x20
      000538 12 09 E7         [24] 1275 	lcall	_LCD_write_char
                                   1276 ;	dino.c:334: dino_pos = 0;
      00053B 75 20 00         [24] 1277 	mov	_dino_pos,#0x00
                                   1278 ;	dino.c:335: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
      00053E E5 20            [12] 1279 	mov	a,_dino_pos
      000540 03               [12] 1280 	rr	a
      000541 03               [12] 1281 	rr	a
      000542 54 C0            [12] 1282 	anl	a,#0xc0
      000544 FF               [12] 1283 	mov	r7,a
      000545 74 80            [12] 1284 	mov	a,#0x80
      000547 4F               [12] 1285 	orl	a,r7
      000548 F5 82            [12] 1286 	mov	dpl,a
      00054A 12 09 9B         [24] 1287 	lcall	_LCD_IRWrite
                                   1288 ;	dino.c:336: LCD_write_char(0x00);
      00054D 75 82 00         [24] 1289 	mov	dpl,#0x00
      000550 12 09 E7         [24] 1290 	lcall	_LCD_write_char
      000553 80 32            [24] 1291 	sjmp	00117$
      000555                       1292 00116$:
                                   1293 ;	dino.c:337: } else if (buffer == '8') { // Move down
      000555 74 38            [12] 1294 	mov	a,#0x38
      000557 B5 39 2D         [24] 1295 	cjne	a,_buffer,00117$
                                   1296 ;	dino.c:338: LCD_cursorGoTo(dino_pos, 0); 
      00055A E5 20            [12] 1297 	mov	a,_dino_pos
      00055C 03               [12] 1298 	rr	a
      00055D 03               [12] 1299 	rr	a
      00055E 54 C0            [12] 1300 	anl	a,#0xc0
      000560 FF               [12] 1301 	mov	r7,a
      000561 74 80            [12] 1302 	mov	a,#0x80
      000563 4F               [12] 1303 	orl	a,r7
      000564 F5 82            [12] 1304 	mov	dpl,a
      000566 12 09 9B         [24] 1305 	lcall	_LCD_IRWrite
                                   1306 ;	dino.c:339: LCD_write_char(' ');
      000569 75 82 20         [24] 1307 	mov	dpl,#0x20
      00056C 12 09 E7         [24] 1308 	lcall	_LCD_write_char
                                   1309 ;	dino.c:340: dino_pos = 1;
      00056F 75 20 01         [24] 1310 	mov	_dino_pos,#0x01
                                   1311 ;	dino.c:341: LCD_cursorGoTo(dino_pos, 0); // 固定在第 0 列
      000572 E5 20            [12] 1312 	mov	a,_dino_pos
      000574 03               [12] 1313 	rr	a
      000575 03               [12] 1314 	rr	a
      000576 54 C0            [12] 1315 	anl	a,#0xc0
      000578 FF               [12] 1316 	mov	r7,a
      000579 74 80            [12] 1317 	mov	a,#0x80
      00057B 4F               [12] 1318 	orl	a,r7
      00057C F5 82            [12] 1319 	mov	dpl,a
      00057E 12 09 9B         [24] 1320 	lcall	_LCD_IRWrite
                                   1321 ;	dino.c:342: LCD_write_char(0x00);
      000581 75 82 00         [24] 1322 	mov	dpl,#0x00
      000584 12 09 E7         [24] 1323 	lcall	_LCD_write_char
      000587                       1324 00117$:
                                   1325 ;	dino.c:344: prev_input = cur_input; 
      000587 85 3F 3E         [24] 1326 	mov	_prev_input,_cur_input
      00058A 80 03            [24] 1327 	sjmp	00123$
      00058C                       1328 00122$:
                                   1329 ;	dino.c:348: prev_input = 0x00; 
      00058C 75 3E 00         [24] 1330 	mov	_prev_input,#0x00
      00058F                       1331 00123$:
                                   1332 ;	dino.c:350: iter = 0;
      00058F 75 3C 00         [24] 1333 	mov	_iter,#0x00
                                   1334 ;	dino.c:351: while(1){
      000592                       1335 00134$:
                                   1336 ;	dino.c:352: if (iter == 5){ break;}
      000592 74 05            [12] 1337 	mov	a,#0x05
      000594 B5 3C 02         [24] 1338 	cjne	a,_iter,00242$
      000597 80 3D            [24] 1339 	sjmp	00135$
      000599                       1340 00242$:
                                   1341 ;	dino.c:353: if((cactus_pos[iter] == 0)){
      000599 E5 3C            [12] 1342 	mov	a,_iter
      00059B 24 29            [12] 1343 	add	a,#_cactus_pos
      00059D F9               [12] 1344 	mov	r1,a
      00059E E7               [12] 1345 	mov	a,@r1
                                   1346 ;	dino.c:354: if((iter-dino_pos) % 2 == 0){
      00059F 70 2D            [24] 1347 	jnz	00132$
      0005A1 AE 3C            [24] 1348 	mov	r6,_iter
      0005A3 FF               [12] 1349 	mov	r7,a
      0005A4 AC 20            [24] 1350 	mov	r4,_dino_pos
      0005A6 FD               [12] 1351 	mov	r5,a
      0005A7 EE               [12] 1352 	mov	a,r6
      0005A8 C3               [12] 1353 	clr	c
      0005A9 9C               [12] 1354 	subb	a,r4
      0005AA F5 82            [12] 1355 	mov	dpl,a
      0005AC EF               [12] 1356 	mov	a,r7
      0005AD 9D               [12] 1357 	subb	a,r5
      0005AE F5 83            [12] 1358 	mov	dph,a
      0005B0 75 0B 02         [24] 1359 	mov	__modsint_PARM_2,#0x02
                                   1360 ;	1-genFromRTrack replaced	mov	(__modsint_PARM_2 + 1),#0x00
      0005B3 8F 0C            [24] 1361 	mov	(__modsint_PARM_2 + 1),r7
      0005B5 12 0C E3         [24] 1362 	lcall	__modsint
      0005B8 E5 82            [12] 1363 	mov	a,dpl
      0005BA 85 83 F0         [24] 1364 	mov	b,dph
      0005BD 45 F0            [12] 1365 	orl	a,b
      0005BF 70 06            [24] 1366 	jnz	00129$
                                   1367 ;	dino.c:355: game_over = 1; 
      0005C1 75 23 01         [24] 1368 	mov	_game_over,#0x01
                                   1369 ;	dino.c:356: EA = 1;
                                   1370 ;	assignBit
      0005C4 D2 AF            [12] 1371 	setb	_EA
                                   1372 ;	dino.c:357: return;        
      0005C6 22               [24] 1373 	ret
      0005C7                       1374 00129$:
                                   1375 ;	dino.c:358: }else if(flag){
      0005C7 E5 28            [12] 1376 	mov	a,_flag
      0005C9 60 03            [24] 1377 	jz	00132$
                                   1378 ;	dino.c:359: flag = 0;
      0005CB 75 28 00         [24] 1379 	mov	_flag,#0x00
      0005CE                       1380 00132$:
                                   1381 ;	dino.c:362: iter = iter + 1;
      0005CE E5 3C            [12] 1382 	mov	a,_iter
      0005D0 FF               [12] 1383 	mov	r7,a
      0005D1 04               [12] 1384 	inc	a
      0005D2 F5 3C            [12] 1385 	mov	_iter,a
      0005D4 80 BC            [24] 1386 	sjmp	00134$
      0005D6                       1387 00135$:
                                   1388 ;	dino.c:364: delay(255);
      0005D6 75 82 FF         [24] 1389 	mov	dpl,#0xff
      0005D9 12 0A 46         [24] 1390 	lcall	_delay
                                   1391 ;	dino.c:365: delay(255);
      0005DC 75 82 FF         [24] 1392 	mov	dpl,#0xff
      0005DF 12 0A 46         [24] 1393 	lcall	_delay
                                   1394 ;	dino.c:366: delay(255);
      0005E2 75 82 FF         [24] 1395 	mov	dpl,#0xff
      0005E5 12 0A 46         [24] 1396 	lcall	_delay
                                   1397 ;	dino.c:367: delay(255);
      0005E8 75 82 FF         [24] 1398 	mov	dpl,#0xff
      0005EB 12 0A 46         [24] 1399 	lcall	_delay
                                   1400 ;	dino.c:368: delay(255);
      0005EE 75 82 FF         [24] 1401 	mov	dpl,#0xff
      0005F1 12 0A 46         [24] 1402 	lcall	_delay
                                   1403 ;	dino.c:370: delay(255);
      0005F4 75 82 FF         [24] 1404 	mov	dpl,#0xff
      0005F7 12 0A 46         [24] 1405 	lcall	_delay
                                   1406 ;	dino.c:371: delay(255);
      0005FA 75 82 FF         [24] 1407 	mov	dpl,#0xff
      0005FD 12 0A 46         [24] 1408 	lcall	_delay
                                   1409 ;	dino.c:372: delay(255);
      000600 75 82 FF         [24] 1410 	mov	dpl,#0xff
      000603 12 0A 46         [24] 1411 	lcall	_delay
                                   1412 ;	dino.c:373: delay(255);
      000606 75 82 FF         [24] 1413 	mov	dpl,#0xff
      000609 12 0A 46         [24] 1414 	lcall	_delay
                                   1415 ;	dino.c:374: delay(255);
      00060C 75 82 FF         [24] 1416 	mov	dpl,#0xff
      00060F 12 0A 46         [24] 1417 	lcall	_delay
                                   1418 ;	dino.c:376: i = i + 1;
      000612 E5 24            [12] 1419 	mov	a,_i
      000614 04               [12] 1420 	inc	a
      000615 F5 24            [12] 1421 	mov	_i,a
                                   1422 ;	dino.c:377: if ((j-i) == 0) break;
      000617 AE 25            [24] 1423 	mov	r6,_j
      000619 7F 00            [12] 1424 	mov	r7,#0x00
      00061B AC 24            [24] 1425 	mov	r4,_i
      00061D 7D 00            [12] 1426 	mov	r5,#0x00
      00061F EE               [12] 1427 	mov	a,r6
      000620 C3               [12] 1428 	clr	c
      000621 9C               [12] 1429 	subb	a,r4
      000622 FE               [12] 1430 	mov	r6,a
      000623 EF               [12] 1431 	mov	a,r7
      000624 9D               [12] 1432 	subb	a,r5
      000625 FF               [12] 1433 	mov	r7,a
      000626 4E               [12] 1434 	orl	a,r6
      000627 60 03            [24] 1435 	jz	00246$
      000629 02 04 C0         [24] 1436 	ljmp	00139$
      00062C                       1437 00246$:
                                   1438 ;	dino.c:381: EA = 1;
                                   1439 ;	assignBit
      00062C D2 AF            [12] 1440 	setb	_EA
                                   1441 ;	dino.c:383: if (game_over == 1) {
      00062E 74 01            [12] 1442 	mov	a,#0x01
      000630 B5 23 02         [24] 1443 	cjne	a,_game_over,00247$
      000633 80 03            [24] 1444 	sjmp	00248$
      000635                       1445 00247$:
      000635 02 04 5C         [24] 1446 	ljmp	00146$
      000638                       1447 00248$:
                                   1448 ;	dino.c:384: LCD_clearScreen();
      000638 75 82 01         [24] 1449 	mov	dpl,#0x01
      00063B 12 09 9B         [24] 1450 	lcall	_LCD_IRWrite
                                   1451 ;	dino.c:385: delay(300);
      00063E 75 82 2C         [24] 1452 	mov	dpl,#0x2c
      000641 12 0A 46         [24] 1453 	lcall	_delay
                                   1454 ;	dino.c:386: ThreadExit();
                                   1455 ;	dino.c:387: return; // Exit the loop
                                   1456 ;	dino.c:392: }
      000644 02 08 A2         [24] 1457 	ljmp	_ThreadExit
                                   1458 ;------------------------------------------------------------
                                   1459 ;Allocation info for local variables in function 'main'
                                   1460 ;------------------------------------------------------------
                                   1461 ;	dino.c:394: void main(void) {
                                   1462 ;	-----------------------------------------
                                   1463 ;	 function main
                                   1464 ;	-----------------------------------------
      000647                       1465 _main:
                                   1466 ;	dino.c:395: LCD_Init();
      000647 12 09 6A         [24] 1467 	lcall	_LCD_Init
                                   1468 ;	dino.c:396: Init_Keypad();
      00064A 12 0B ED         [24] 1469 	lcall	_Init_Keypad
                                   1470 ;	dino.c:397: SemaphoreCreate(mutex,1);
      00064D 75 3A 01         [24] 1471 	mov	_mutex,#0x01
                                   1472 ;	dino.c:398: SemaphoreCreate(full,0);
      000650 75 3B 00         [24] 1473 	mov	_full,#0x00
                                   1474 ;	dino.c:400: init();
      000653 12 02 0F         [24] 1475 	lcall	_init
                                   1476 ;	dino.c:402: while(1){
      000656                       1477 00124$:
                                   1478 ;	dino.c:403: if (AnyButtonPressed()) {
      000656 12 0B 5B         [24] 1479 	lcall	_AnyButtonPressed
      000659 E5 82            [12] 1480 	mov	a,dpl
      00065B 60 1A            [24] 1481 	jz	00119$
                                   1482 ;	dino.c:404: cur_input = ButtonToChar();
      00065D 12 0B 61         [24] 1483 	lcall	_ButtonToChar
      000660 85 82 3F         [24] 1484 	mov	_cur_input,dpl
                                   1485 ;	dino.c:405: if (cur_input != prev_input && prev_input == 0x00 && diff == 0){
      000663 E5 3E            [12] 1486 	mov	a,_prev_input
      000665 B5 3F 02         [24] 1487 	cjne	a,_cur_input,00200$
      000668 80 4E            [24] 1488 	sjmp	00120$
      00066A                       1489 00200$:
      00066A E5 3E            [12] 1490 	mov	a,_prev_input
      00066C 70 4A            [24] 1491 	jnz	00120$
      00066E E5 2F            [12] 1492 	mov	a,_diff
      000670 70 46            [24] 1493 	jnz	00120$
                                   1494 ;	dino.c:406: i = cur_input;
      000672 85 3F 24         [24] 1495 	mov	_i,_cur_input
      000675 80 41            [24] 1496 	sjmp	00120$
      000677                       1497 00119$:
                                   1498 ;	dino.c:409: else if (AnyKeyPressed()) {
      000677 12 0B F3         [24] 1499 	lcall	_AnyKeyPressed
      00067A E5 82            [12] 1500 	mov	a,dpl
      00067C 60 37            [24] 1501 	jz	00116$
                                   1502 ;	dino.c:410: cur_input = KeyToChar();
      00067E 12 0B FE         [24] 1503 	lcall	_KeyToChar
      000681 85 82 3F         [24] 1504 	mov	_cur_input,dpl
                                   1505 ;	dino.c:411: if (cur_input != prev_input && prev_input == 0x00) {
      000684 E5 3E            [12] 1506 	mov	a,_prev_input
      000686 B5 3F 02         [24] 1507 	cjne	a,_cur_input,00204$
      000689 80 2D            [24] 1508 	sjmp	00120$
      00068B                       1509 00204$:
      00068B E5 3E            [12] 1510 	mov	a,_prev_input
      00068D 70 29            [24] 1511 	jnz	00120$
                                   1512 ;	dino.c:412: if(!diff){
      00068F E5 2F            [12] 1513 	mov	a,_diff
      000691 70 1D            [24] 1514 	jnz	00111$
                                   1515 ;	dino.c:413: if ('1' <= i && i <= '9' && cur_input == '#') {
      000693 74 CF            [12] 1516 	mov	a,#0x100 - 0x31
      000695 25 24            [12] 1517 	add	a,_i
      000697 50 14            [24] 1518 	jnc	00106$
      000699 E5 24            [12] 1519 	mov	a,_i
      00069B 24 C6            [12] 1520 	add	a,#0xff - 0x39
      00069D 40 0E            [24] 1521 	jc	00106$
      00069F 74 23            [12] 1522 	mov	a,#0x23
      0006A1 B5 3F 09         [24] 1523 	cjne	a,_cur_input,00106$
                                   1524 ;	dino.c:414: diff = i - '0';
      0006A4 E5 24            [12] 1525 	mov	a,_i
      0006A6 FF               [12] 1526 	mov	r7,a
      0006A7 24 D0            [12] 1527 	add	a,#0xd0
      0006A9 F5 2F            [12] 1528 	mov	_diff,a
      0006AB 80 03            [24] 1529 	sjmp	00111$
      0006AD                       1530 00106$:
                                   1531 ;	dino.c:416: i = cur_input;
      0006AD 85 3F 24         [24] 1532 	mov	_i,_cur_input
      0006B0                       1533 00111$:
                                   1534 ;	dino.c:419: prev_input = cur_input; 
      0006B0 85 3F 3E         [24] 1535 	mov	_prev_input,_cur_input
      0006B3 80 03            [24] 1536 	sjmp	00120$
      0006B5                       1537 00116$:
                                   1538 ;	dino.c:423: prev_input = 0x00; 
      0006B5 75 3E 00         [24] 1539 	mov	_prev_input,#0x00
      0006B8                       1540 00120$:
                                   1541 ;	dino.c:425: if(diff) break;
      0006B8 E5 2F            [12] 1542 	mov	a,_diff
      0006BA 60 9A            [24] 1543 	jz	00124$
                                   1544 ;	dino.c:427: ThreadCreate(keypad_ctrl);
      0006BC 90 00 14         [24] 1545 	mov	dptr,#_keypad_ctrl
      0006BF 12 07 18         [24] 1546 	lcall	_ThreadCreate
                                   1547 ;	dino.c:429: if (!game_over)
      0006C2 E5 23            [12] 1548 	mov	a,_game_over
      0006C4 70 06            [24] 1549 	jnz	00127$
                                   1550 ;	dino.c:430: ThreadCreate(render_task);
      0006C6 90 00 D3         [24] 1551 	mov	dptr,#_render_task
      0006C9 12 07 18         [24] 1552 	lcall	_ThreadCreate
      0006CC                       1553 00127$:
                                   1554 ;	dino.c:432: if (!game_over) 
      0006CC E5 23            [12] 1555 	mov	a,_game_over
      0006CE 70 03            [24] 1556 	jnz	00129$
                                   1557 ;	dino.c:433: game_ctrl();
      0006D0 12 04 5C         [24] 1558 	lcall	_game_ctrl
      0006D3                       1559 00129$:
                                   1560 ;	dino.c:436: end_game(); 
      0006D3 12 02 CD         [24] 1561 	lcall	_end_game
                                   1562 ;	dino.c:437: game_over = 0;  
      0006D6 75 23 00         [24] 1563 	mov	_game_over,#0x00
                                   1564 ;	dino.c:438: score = 0;
      0006D9 75 2E 00         [24] 1565 	mov	_score,#0x00
                                   1566 ;	dino.c:439: pre_score = 0;
      0006DC 75 27 00         [24] 1567 	mov	_pre_score,#0x00
                                   1568 ;	dino.c:440: while(1);
      0006DF                       1569 00131$:
                                   1570 ;	dino.c:441: }
      0006DF 80 FE            [24] 1571 	sjmp	00131$
                                   1572 ;------------------------------------------------------------
                                   1573 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                   1574 ;------------------------------------------------------------
                                   1575 ;	dino.c:443: void _sdcc_gsinit_startup(void) {
                                   1576 ;	-----------------------------------------
                                   1577 ;	 function _sdcc_gsinit_startup
                                   1578 ;	-----------------------------------------
      0006E1                       1579 __sdcc_gsinit_startup:
                                   1580 ;	dino.c:446: __endasm;
      0006E1 02 06 EC         [24] 1581 	ljmp	_Bootstrap
                                   1582 ;	dino.c:447: }
      0006E4 22               [24] 1583 	ret
                                   1584 ;------------------------------------------------------------
                                   1585 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                   1586 ;------------------------------------------------------------
                                   1587 ;	dino.c:449: void _mcs51_genRAMCLEAR(void) {}
                                   1588 ;	-----------------------------------------
                                   1589 ;	 function _mcs51_genRAMCLEAR
                                   1590 ;	-----------------------------------------
      0006E5                       1591 __mcs51_genRAMCLEAR:
      0006E5 22               [24] 1592 	ret
                                   1593 ;------------------------------------------------------------
                                   1594 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                   1595 ;------------------------------------------------------------
                                   1596 ;	dino.c:450: void _mcs51_genXINIT(void) {}
                                   1597 ;	-----------------------------------------
                                   1598 ;	 function _mcs51_genXINIT
                                   1599 ;	-----------------------------------------
      0006E6                       1600 __mcs51_genXINIT:
      0006E6 22               [24] 1601 	ret
                                   1602 ;------------------------------------------------------------
                                   1603 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                   1604 ;------------------------------------------------------------
                                   1605 ;	dino.c:451: void _mcs51_genXRAMCLEAR(void) {}
                                   1606 ;	-----------------------------------------
                                   1607 ;	 function _mcs51_genXRAMCLEAR
                                   1608 ;	-----------------------------------------
      0006E7                       1609 __mcs51_genXRAMCLEAR:
      0006E7 22               [24] 1610 	ret
                                   1611 ;------------------------------------------------------------
                                   1612 ;Allocation info for local variables in function 'timer0_ISR'
                                   1613 ;------------------------------------------------------------
                                   1614 ;	dino.c:453: void timer0_ISR(void) __interrupt(1) {
                                   1615 ;	-----------------------------------------
                                   1616 ;	 function timer0_ISR
                                   1617 ;	-----------------------------------------
      0006E8                       1618 _timer0_ISR:
                                   1619 ;	dino.c:456: __endasm;
      0006E8 02 08 53         [24] 1620 	ljmp	_myTimer0Handler
                                   1621 ;	dino.c:457: }
      0006EB 32               [24] 1622 	reti
                                   1623 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                   1624 ;	eliminated unneeded push/pop psw
                                   1625 ;	eliminated unneeded push/pop dpl
                                   1626 ;	eliminated unneeded push/pop dph
                                   1627 ;	eliminated unneeded push/pop b
                                   1628 ;	eliminated unneeded push/pop acc
                                   1629 	.area CSEG    (CODE)
                                   1630 	.area CONST   (CODE)
                                   1631 	.area XINIT   (CODE)
                                   1632 	.area CABS    (ABS,CODE)
