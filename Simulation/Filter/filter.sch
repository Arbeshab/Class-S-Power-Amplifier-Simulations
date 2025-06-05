<QucsStudio Schematic 3.3.2>
<Properties>
View=0,-29,1398,931,1,0,0
Grid=10,10,1
DataSet=*.dat
DataDisplay=*.dpl
OpenDisplay=0
showFrame=0
FrameText0=Title
FrameText1=Drawn By:
FrameText2=Date:
FrameText3=Revision:
</Properties>
<Symbol>
</Symbol>
<Components>
GND * 1 140 210 0 0 0 0
GND * 1 290 210 0 0 0 0
Eqn Eqn1 1 320 297 0 8 0 0 "S21_dB=dB(S[2,1])=" 1 "S11_dB=dB(S[1,1])=" 1 "S21_phase=wphase(S[2,1])=" 1 "yes" 0
GND * 1 610 210 0 0 0 0
Pac P2 1 710 180 18 -26 0 0 "2" 1 "100" 1 "0" 0 "1 GHz" 0 "26.85" 0 "SUBCLICK" 0
GND * 1 710 210 0 0 0 0
.SP SP1 1 160 280 0 67 0 0 "log" 1 "20MHz" 1 "40MHz" 1 "6001" 1 "no" 0 "1" 0 "2" 0 "none" 0
C C2 1 430 100 -26 -55 0 2 "10 nF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
L L1 1 610 160 10 -26 0 1 "9.25 nH" 1 "0" 0 "" 0 "SELF-WE-PD3S" 0
C C1 1 290 130 17 -26 0 1 "4.4 nF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
Pac P1 1 140 180 18 -26 0 0 "1" 1 "40" 1 "0 dBm" 0 "1 GHz" 0 "26.85" 0 "SUBCLICK" 0
</Components>
<Wires>
140 100 140 150 "" 0 0 0 ""
140 100 290 100 "" 0 0 0 ""
290 160 290 210 "" 0 0 0 ""
460 100 610 100 "" 0 0 0 ""
710 100 710 150 "" 0 0 0 ""
610 100 710 100 "" 0 0 0 ""
610 100 610 130 "" 0 0 0 ""
610 190 610 210 "" 0 0 0 ""
290 100 400 100 "" 0 0 0 ""
</Wires>
<Diagrams>
<Rect 830 400 360 220 31 #c0c0c0 1 10 2 2.41732e+07 5e+07 3.7106e+07 2 -23.022 10 1.92075 1 0 0 0 315 0 225 "" "" "">
	<Legend 10 -100 0>
	<"dB(S[1,1])" "" #0000ff 0 3 0 0 0 0 "">
	<"dB(S[2,1])" "" #ff0000 0 3 0 0 0 0 "">
	  <Mkr 3.05076e+07 360 -280 4 1 0 0 0 50>
	  <Mkr 2.99938e+07 150 -300 6 1 0 0 0 50>
	  <Mkr 2.93664e+07 -70 -290 3 1 0 0 0 50>
</Rect>
</Diagrams>
<Paintings>
</Paintings>
