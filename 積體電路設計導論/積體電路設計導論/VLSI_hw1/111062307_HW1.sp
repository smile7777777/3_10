** 111062307_HW1 **
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

*** logic function ***
.subckt logic A B C D F vdd vss
** Your code **
Xinv3 B negB      vdd vss INV
Xor   A negB  out vdd vss OR2
Xand  C out   F   vdd vss AND2
.ends

Xlogic A B C D F vdd gnd logic
Xor A B OR vdd gnd OR2
Xand A B AND vdd gnd AND2
Xinv A inverter vdd gnd INV 

**** vlotage source setting ***
*** Vname node1 node2 pulse (V1 V2 delay time_rise time_fall pulse_width period) ***
Vin1 A gnd pulse(1.8v 0v 0 0.1n 0.1n  64n 128n)   
Vin2 B gnd pulse(1.8v 0v 0 0.1n 0.1n  32n  64n)  
Vin3 C gnd pulse(1.8v 0v 0 0.1n 0.1n  16n  32n)  
Vin4 D gnd pulse(1.8v 0v 0 0.1n 0.1n   8n  16n) 

.tran 0.01n 130n
.unprotect 
.tem 30
.option post
.op
.end