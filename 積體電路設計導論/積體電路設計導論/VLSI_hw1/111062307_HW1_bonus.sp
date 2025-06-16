** 111062307_HW1_bonus **
** Environment setting **
*************************
*      Your code        *
.protect
.lib "/usr/cad/cic018.l" tt
.unprotect

.global vdd gnd
Vdd vdd 0 DC=+1.8v
Vgnd gnd 0 DC=0v

*************************

*** Inverter ***
.subckt INV in1 inv_out vdd vss
** Your code **
mp1 inv_out in1 vdd vdd P_18 w=0.5u  l=0.18u
mn1 inv_out in1 vss gnd N_18 w=0.25u l=0.18u
.ends

*** NOR ***
.subckt NOR2 x y NOR vdd vss
** Your code **
mpx1 out x vdd vdd P_18 w=0.5u  l=0.18u
mpy1 NOR y out vdd P_18 w=0.5u  l=0.18u
mnx1 NOR x vss gnd N_18 w=0.25u l=0.18u
mny1 NOR y vss gnd N_18 w=0.25u l=0.18u
.ends

*** NAND ***
.subckt NAND2 x y NAND vdd vss
** Your code **
mpx2 NAND x vdd  vdd P_18 w=0.5u  l=0.18u
mpy2 NAND y vdd  vdd P_18 w=0.5u  l=0.18u
mnx2 out1 x vss  gnd N_18 w=0.25u l=0.18u
mny2 NAND y out1 gnd N_18 w=0.25u l=0.18u
.ends

*** OR ***
.subckt OR2 in2 in3 OR vdd vss
** Your code **
Xnor1 in2 in3 out_nor vdd vss NOR2
Xinv1 out_nor OR      vdd vss INV
.ends

*** AND ***
.subckt AND2 in4 in5 AND vdd vss
** Your code **
Xnand1 in4  in5 out_nand vdd vss NAND2
Xinv2  out_nand AND      vdd vss INV
.ends

*** 2 to 1 MUX ***
.subckt MUX2 A i1 i2 Y vdd vss 
** Your code **
Xinv  A     invA        vdd vss INV
Xand1 invA  i1    andA1 vdd vss AND2
Xand2 A     i2    andA2 vdd vss AND2
Xor   andA1 AndA2 Y     vdd vss OR2 
.ends

*** 4 to 1 MUX ***
.subckt MUX S0 S1 D0 D1 D2 D3 Y vdd vss
Xmux1 S1 D0 D1 out1    vdd vss MUX2
Xmux2 S1 D2 D3 out2    vdd vss MUX2
Xmux3 S0 out1  out2 Y  vdd vss MUX2
** Your code **
.ends

Xmux S0 S1 I0 I1 I2 I3 Y vdd gnd MUX

**** vlotage source setting ***
*** Vname node1 node2 pulse (V1 V2 delay time_rise time_fall pulse_width period) ***
Vin1 S0 gnd pulse(1.8v 0v 0 0.1n 0.1n  256n 512n)  
Vin2 S1 gnd pulse(1.8v 0v 0 0.1n 0.1n  128n 256n) 
Vin3 I0 gnd pulse(1.8v 0v 0 0.1n 0.1n   64n 128n)   
Vin4 I1 gnd pulse(1.8v 0v 0 0.1n 0.1n   32n  64n)  
Vin5 I2 gnd pulse(1.8v 0v 0 0.1n 0.1n   16n  32n)  
Vin6 I3 gnd pulse(1.8v 0v 0 0.1n 0.1n    8n  16n) 

.tran 0.01n 515n
.unprotect 
.tem 30
.option post
.op
.end
…