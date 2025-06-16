** DCIM **
*************************
** Environment setting **
*************************
.ic V(Xdcim.Xcontrol_out1.P10)=0v V(Xdcim.Xcontrol_out1.P11)=0v V(Xdcim.Xcontrol_out1.P12)=0v V(Xdcim.Xcontrol_out1.P13)=0v V(Xdcim.Xcontrol_out1.P14)=0v 
.ic V(Xdcim.Xcontrol_out1.P15)=0v V(Xdcim.Xcontrol_out1.P16)=0v V(Xdcim.Xcontrol_out1.P17)=0v V(Xdcim.Xcontrol_out1.P18)=0v V(Xdcim.Xcontrol_out1.P19)=0v
.ic V(Xdcim.Xcontrol_out2.P20)=0v V(Xdcim.Xcontrol_out2.P21)=0v V(Xdcim.Xcontrol_out2.P22)=0v V(Xdcim.Xcontrol_out2.P23)=0v V(Xdcim.Xcontrol_out2.P24)=0v
.ic V(Xdcim.Xcontrol_out2.P25)=0v V(Xdcim.Xcontrol_out2.P26)=0v V(Xdcim.Xcontrol_out2.P27)=0v V(Xdcim.Xcontrol_out2.P28)=0v V(Xdcim.Xcontrol_out2.P29)=0v

.ic V(Xdcim.P10_s)=0v V(Xdcim.P11_s)=0v V(Xdcim.P12_s)=0v V(Xdcim.P13_s)=0v V(Xdcim.P14_s)=0v 
.ic V(Xdcim.P15_s)=0v V(Xdcim.P16_s)=0v V(Xdcim.P17_s)=0v V(Xdcim.P18_s)=0v V(Xdcim.P19_s)=0v

.ic V(Xdcim.OUT_VAL)=0v

.ic V(Xdcim.Xcontrol_in.ii1)=0 V(Xdcim.Xcontrol_in.ii2)=0 V(Xdcim.Xcontrol_in.ii3)=0 V(Xdcim.Xcontrol_in.ii4)=0

.ic V(Xdcim.XW111.w111)=1.8v V(Xdcim.XW112.w112)=0v V(Xdcim.XW113.w113)=0v V(Xdcim.XW114.w114)=0v          **1
.ic V(Xdcim.XW121.w121)=1.8v V(Xdcim.XW122.w122)=1.8v V(Xdcim.XW123.w123)=0v V(Xdcim.XW124.w124)=0v        **3
.ic V(Xdcim.XW131.w131)=1.8v V(Xdcim.XW132.w132)=1.8v V(Xdcim.XW133.w133)=1.8v V(Xdcim.XW134.w134)=0v      **7
.ic V(Xdcim.XW141.w141)=1.8v V(Xdcim.XW142.w142)=1.8v V(Xdcim.XW143.w143)=1.8v V(Xdcim.XW144.w144)=1.8v    **15

.ic V(Xdcim.XW211.w211)=0 V(Xdcim.XW212.w212)=1.8v V(Xdcim.XW213.w213)=0 V(Xdcim.XW214.w214)=0     **2
.ic V(Xdcim.XW221.w221)=0 V(Xdcim.XW222.w222)=1.8v V(Xdcim.XW223.w223)=1.8v V(Xdcim.XW224.w224)=0  **6
.ic V(Xdcim.XW231.w231)=0 V(Xdcim.XW232.w232)=0 V(Xdcim.XW233.w233)=0 V(Xdcim.XW234.w234)=1.8v     **8
.ic V(Xdcim.XW241.w241)=0 V(Xdcim.XW242.w242)=0 V(Xdcim.XW243.w243)=1.8v V(Xdcim.XW244.w244)=1.8v  **12

.tran 0.01n 26n
.option POST
.protect
.temp 30
.lib "/usr/cad/cic018.l" tt
.unprotect

*********************
** Clock Parameter **
*********************
.param    CLK_Period = 2n
.param    CLK_Period_2 = 'CLK_Period/2'
.param    r_time = 1p
.param    f_time = 1p
.param    SupplyV = 1.8v

********************
* voltage setting **
********************
.global vdd gnd
Vvdd vdd 0 DC=+1.8v
Vgnd gnd 0 DC=0v

**********************************************
*** Don't modify the pin name in this file ***
**********************************************

*****************
*** call cell ***
*****************
Xdcim I1 I2 I3 I4 IN_VAL CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 OUT_VAL DCIM

******************
*** DCIM block ***
******************
.subckt DCIM I1 I2 I3 I4 IN_VAL CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 OUT_VAL

** Your code **
Xcontrol_in I1 I2 I3 I4 CLK IN_VAL ii1 ii2 ii3 ii4 CON_IN

XW111 ii1 a0 BUFFER
XW112 gnd a1 BUFFER
XW113 gnd a2 BUFFER
XW114 gnd a3 BUFFER
XW121 ii2 b0 BUFFER
XW122 ii2 b1 BUFFER
XW123 gnd b2 BUFFER
XW124 gnd b3 BUFFER
XW131 ii3 d0 BUFFER
XW132 ii3 d1 BUFFER
XW133 ii3 d2 BUFFER
XW134 gnd d3 BUFFER
XW141 ii4 e0 BUFFER
XW142 ii4 e1 BUFFER
XW143 ii4 e2 BUFFER
XW144 ii4 e3 BUFFER

XW211 gnd u0 BUFFER
XW212 ii1 u1 BUFFER
XW213 gnd u2 BUFFER
XW214 gnd u3 BUFFER
XW221 gnd v0 BUFFER
XW222 ii2 v1 BUFFER
XW223 ii2 v2 BUFFER
XW224 gnd v3 BUFFER
XW231 gnd x0 BUFFER
XW232 gnd x1 BUFFER
XW233 gnd x2 BUFFER
XW234 ii3 x3 BUFFER
XW241 gnd y0 BUFFER
XW242 gnd y1 BUFFER
XW243 ii4 y2 BUFFER
XW244 ii4 y3 BUFFER

XADDER_5b1 a0 a1 a2 a3 b0 b1 b2 b3 c0 c1 c2 c3 c4 ADDER_05b
XADDER_5b2 d0 d1 d2 d3 e0 e1 e2 e3 f0 f1 f2 f3 f4 ADDER_05b
XADDER_6b1 c0 c1 c2 c3 c4 f0 f1 f2 f3 f4 r0 r1 r2 r3 r4 r5 ADDER_06b

XADDER_5b3 u0 u1 u2 u3 v0 v1 v2 v3 m0 m1 m2 m3 m4 ADDER_05b
XADDER_5b4 x0 x1 x2 x3 y0 y1 y2 y3 n0 n1 n2 n3 n4 ADDER_05b
XADDER_6b2 m0 m1 m2 m3 m4 n0 n1 n2 n3 n4 z0 z1 z2 z3 z4 z5 ADDER_06b

Xbuffers1 r0 r1 r2 r3 r4 b_r0 b_r1 b_r2 b_r3 b_r4 BUFFERS
XBUF1 r5 b_r5 BUFFER
Xbuffers4 z0 z1 z2 z3 z4 b_z0 b_z1 b_z2 b_z3 b_z4 BUFFERS
XBUF2 z5 b_z5 BUFFER

XADDER_10b1 b_r0 b_r1 b_r2 b_r3 b_r4 b_r5 P10_s P11_s P12_s P13_s P14_s P15_s P16_s P17_s P18_s P19_s P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 ADDER_10b
XADDER_10b2 b_z0 b_z1 b_z2 b_z3 b_z4 b_z5 P20_s P21_s P22_s P23_s P24_s P25_s P26_s P27_s P28_s P29_s P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 ADDER_10b

Xcontrol_out1 P10 P11 P12 P13 P14 P15 P16 P17 P18 P19 CLK RST O10 O11 O12 O13 O14 O15 O16 O17 O18 O19 CON_OUT

Xbuffers2 O10 O11 O12 O13 O14 P11_s P12_s P13_s P14_s P15_s BUFFERS
Xbuffers3 O15 O16 O17 O18 gnd P16_s P17_s P18_s P19_s P10_s BUFFERS

Xcontrol_out2 P20 P21 P22 P23 P24 P25 P26 P27 P28 P29 CLK RST O20 O21 O22 O23 O24 O25 O26 O27 O28 O29 CON_OUT

Xbuffers5 O20 O21 O22 O23 O24 P21_s P22_s P23_s P24_s P25_s BUFFERS
Xbuffers6 O25 O26 O27 O28 gnd P26_s P27_s P28_s P29_s P20_s BUFFERS

XDFF2 IN_VAL OUT_tmp vdd vdd CLK vdd gnd DFF
XINV OUT_tmp OUT_VAL INV
.ends

************************
*** input controller ***
************************
.subckt CON_IN I1 I2 I3 I4 CLK IN_VAL ii1 ii2 ii3 ii4 
*** Your code ***
XDFF1 I1 ii1 vdd IN_VAL CLK vdd gnd DFF
XDFF2 I2 ii2 vdd IN_VAL CLK vdd gnd DFF
XDFF3 I3 ii3 vdd IN_VAL CLK vdd gnd DFF
XDFF4 I4 ii4 vdd IN_VAL CLK vdd gnd DFF
.ends

*************************
*** output controller ***
*************************
.subckt CON_OUT P0 P1 P2 P3 P4 P5 P6 P7 P8 P9 CLK RST O0 O1 O2 O3 O4 O5 O6 O7 O8 O9
XDFF0 P0 O0 RST vdd CLK vdd gnd DFF
XDFF1 P1 O1 RST vdd CLK vdd gnd DFF
XDFF2 P2 O2 RST vdd CLK vdd gnd DFF
XDFF3 P3 O3 RST vdd CLK vdd gnd DFF
XDFF4 P4 O4 RST vdd CLK vdd gnd DFF
XDFF5 P5 O5 RST vdd CLK vdd gnd DFF
XDFF6 P6 O6 RST vdd CLK vdd gnd DFF
XDFF7 P7 O7 RST vdd CLK vdd gnd DFF
XDFF8 P8 O8 RST vdd CLK vdd gnd DFF
XDFF9 P9 O9 RST vdd CLK vdd gnd DFF
*** Your code ***
.ends

*******************
*** Your subckt ***
*******************

******************
*** full adder ***
******************
.subckt ADDER_05b a0 a1 a2 a3 b0 b1 b2 b3 o0 o1 o2 o3 o4
Xadder0 a0 b0 gnd o0 c1 FADDER
Xadder1 a1 b1 c1  o1 c2 FADDER
Xadder2 a2 b2 c2  o2 c3 FADDER
Xadder3 a3 b3 c3  o3 o4 FADDER
.ends

.subckt ADDER_06b a0 a1 a2 a3 a4 b0 b1 b2 b3 b4 o0 o1 o2 o3 o4 o5
Xadder0 a0 b0 gnd o0 c1 FADDER
Xadder1 a1 b1 c1  o1 c2 FADDER
Xadder2 a2 b2 c2  o2 c3 FADDER
Xadder3 a3 b3 c3  o3 c4 FADDER
Xadder4 a4 b4 c4  o4 o5 FADDER
.ends

.subckt ADDER_10b a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5 b6 b7 b8 b9 o0 o1 o2 o3 o4 o5 o6 o7 o8 o9
Xadder0 a0 b0 gnd o0 c1 FADDER
Xadder1 a1 b1 c1  o1 c2 FADDER
Xadder2 a2 b2 c2  o2 c3 FADDER
Xadder3 a3 b3 c3  o3 c4 FADDER
Xadder4 a4 b4 c4  o4 c5 FADDER
Xadder5 a5 b5 c5  o5 c6 FADDER
Xsum6  b6 c6 o6 vdd gnd XOR2
XCout6 b6 c6 c7 vdd gnd AND2
Xsum7  b7 c7 o7 vdd gnd XOR2
XCout7 b7 c7 c8 vdd gnd AND2
Xsum8  b8 c8 o8 vdd gnd XOR2
XCout8 b8 c8 c9 vdd gnd AND2
Xsum9  b9 c9 o9 vdd gnd XOR2
.ends

**************
*** buffer ***
**************
.subckt BUFFER a0 a1 
Xinv1 a0   temp INV
Xinv2 temp a1   INV
.ends

***************
*** buffers ***
***************
.subckt BUFFERS b0 b1 b2 b3 b4 bb0 bb1 bb2 bb3 bb4
XBUF0 b0 bb0 BUFFER
XBUF1 b1 bb1 BUFFER
XBUF2 b2 bb2 BUFFER
XBUF3 b3 bb3 BUFFER
XBUF4 b4 bb4 BUFFER
XBUF5 b5 bb5 BUFFER
.ends

****************
*** Inverter ***
****************
.subckt INV in inv_out 
mp1 inv_out in vdd vdd P_18 w=0.72u l=0.18u
mn1 inv_out in gnd gnd N_18 w=0.36u l=0.18u
.ends

************
*** NOR2 ***
************
.subckt NOR2 x y NOR vdd vss
** Your code **
mpx1 out x vdd vdd P_18 w=0.72u l=0.18u
mpy1 NOR y out vdd P_18 w=0.72u l=0.18u
mnx1 NOR x vss gnd N_18 w=0.36u l=0.18u
mny1 NOR y vss gnd N_18 w=0.36u l=0.18u
.ends

*************
*** NAND2 ***
*************
.subckt NAND2 x y NAND vdd vss
** Your code **
mpx2 NAND x vdd  vdd P_18 w=0.72u l=0.18u
mpy2 NAND y vdd  vdd P_18 w=0.72u l=0.18u
mnx2 out1 x vss  gnd N_18 w=0.36u l=0.18u
mny2 NAND y out1 gnd N_18 w=0.36u l=0.18u
.ends

***********
*** OR2 ***
***********
.subckt OR2 in2 in3 OR vdd vss
** Your code **
Xnor1 in2 in3 out_nor vdd vss NOR2
Xinv1 out_nor OR      INV
.ends

************
*** AND2 ***
************
.subckt AND2 in4 in5 AND vdd vss
** Your code **
Xnand1 in4  in5 out_nand vdd vss NAND2
Xinv2  out_nand AND      INV
.ends

***************
*** XOR2 ***
***************
.subckt XOR2 A B Y vdd vss

Xinv1 A A_INV INV
Xinv2 B B_INV INV

mp1 out1  A_INV vdd  vdd P_18 w=0.72u l=0.18u
mp3 out1  B_INV vdd  vdd P_18 w=0.72u l=0.18u
mp2 Y     A     out1 vdd P_18 w=0.72u l=0.18u
mp4 Y     B     out1 vdd P_18 w=0.72u l=0.18u

mn1 out3  A     vss  gnd N_18 w=0.36u l=0.18u
mn2 out4  A_INV vss  gnd N_18 w=0.36u l=0.18u
mn3 Y     B     out3 gnd N_18 w=0.36u l=0.18u
mn4 Y     B_INV out4 gnd N_18 w=0.36u l=0.18u
.ends

******************
*** 2 to 1 MUX ***
******************
.subckt MUX2 A i1 i2 Y vdd vss 
** Your code **
Xinv  A     invA        INV
Xand1 invA  i1    andA1 vdd vss AND2
Xand2 A     i2    andA2 vdd vss AND2
Xor   andA1 AndA2 Y     vdd vss OR2 
.ends

*********************
*** full adder ***
*********************
.subckt FADDER a b cin s cout
Xxor0 a    b    net0 vdd gnd XOR2
Xxor1 net0 cin  s    vdd gnd XOR2
Xand0 net0 cin  net2 vdd gnd AND2
Xand1 a    b    net3 vdd gnd AND2
Xor0  net2 net3 cout vdd gnd OR2
.ends

*******************
*** D flip flop ***
*******************
.subckt DFF D Q RST val CLK vdd vss
Xinv  CLK CLK_INV  INV
Xinv2 RST RST_INV  INV 

Xnand0 CLK RST_INV RST_syn vdd vss NAND2

Xmux   val  Q        D    net0 vdd  vss MUX2

mn1    net1 CLK_INV   net0 gnd  N_18 w=0.36u l=0.18u

Xnand1 net1 RST_syn   net2 vdd  vss  NAND2 
Xinv3  net2 net3      INV

mn2    net1 CLK net3  gnd N_18 w=0.36u l=0.18u
mn3    net4 CLK net2  gnd N_18 w=0.36u l=0.18u

Xinv4  net4 Q       INV
Xnand4 Q    RST_syn Q_inv vdd vss NAND2

mn4    net4 CLK_INV Q_inv gnd N_18 w=0.36u l=0.18u  
.ends


*******************
*** Measurement ***
*******************
.measure TRAN td 
+ TRIG V(Xdcim.ii1) VAL=0.9 RISE=1
+ TARG V(Xdcim.P10)  VAL=0.9 RISE=1

.measure TRAN pwr AVG POWER
