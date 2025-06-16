*** 3-input XOR ***
.subckt hw2_XOR A B C S vdd vss
** Your code **
** Inverter **
mp9  A_INV A vdd vdd P_18 w=2u l=0.18u
mn9  A_INV A vss gnd N_18 w=1u l=0.18u
mp10 B_INV B vdd vdd P_18 w=2u l=0.18u
mn10 B_INV B vss gnd N_18 w=1u l=0.18u
mp11 C_INV C vdd vdd P_18 w=2u l=0.18u
mn11 C_INV C vss gnd N_18 w=1u l=0.18u

** connection **
mp1 out1  A     vdd  vdd P_18 w=2u l=0.18u
mp2 out2  A_INV vdd  vdd P_18 w=2u l=0.18u
mp3 out3  B     out1 vdd P_18 w=2u l=0.18u
mp4 out3  B_INV out2 vdd P_18 w=2u l=0.18u
mp5 out4  B_INV out1 vdd P_18 w=2u l=0.18u
mp6 out4  B     out2 vdd P_18 w=2u l=0.18u
mp7 S     C_INV out3 vdd P_18 w=2u l=0.18u
mp8 S     C     out4 vdd P_18 w=2u l=0.18u
mn1 out5  A     vss  gnd N_18 w=1u l=0.18u
mn2 out6  A_INV vss  gnd N_18 w=1u l=0.18u
mn3 out7  B     out5 gnd N_18 w=1u l=0.18u
mn4 out7  B_INV out6 gnd N_18 w=1u l=0.18u
mn5 out8  B_INV out5 gnd N_18 w=1u l=0.18u
mn6 out8  B     out6 gnd N_18 w=1u l=0.18u
mn7 S     C_INV out7 gnd N_18 w=1u l=0.18u
mn8 S     C     out8 gnd N_18 w=1u l=0.18u
.ends hw2_XOR