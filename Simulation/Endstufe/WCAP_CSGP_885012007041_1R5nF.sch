<QucsStudio Schematic 3.3.2>
<Properties>
View=0,0,800,800,1,0,0
Grid=10,10,1
DataSet=*.dat
DataDisplay=*.dpl
OpenDisplay=1
showFrame=0
FrameText0=Titel
FrameText1=Gezeichnet von:
FrameText2=Datum:
FrameText3=Revision:
</Properties>
<Symbol>
.PortSym 40 20 1 0
.PortSym 40 60 2 0
</Symbol>
<Components>
Port P_net1 1 50 50 -23 12 0 0 "1" 0 "analog" 0 "TESTPOINT" 0
Port P_net2 1 150 50 -23 12 0 0 "2" 0 "analog" 0 "TESTPOINT" 0
R RSER 1 250 50 10 15 0 0 "0.0403337" 0 "26.85" 0 "0" 0 "0" 0 "26.85" 0 "european" 0 "SMD0603" 0
L LSER 1 350 50 10 15 0 0 "2.89715e-010" 0 "0" 0 "" 0 "SELF-WE-PD3S" 0
R RPAR 1 550 50 10 15 0 0 "1e+010" 0 "26.85" 0 "0" 0 "0" 0 "26.85" 0 "european" 0 "SMD0603" 0
C C1 1 450 50 10 15 0 0 "1.5e-009" 0 "0" 0 "5" 0 "neutral" 0 "SMD0603" 0
</Components>
<Wires>
50 50 50 50 "net1" 60 20 0 ""
150 50 150 50 "net2" 160 20 0 ""
220 50 220 50 "net1" 230 20 0 ""
280 50 280 50 "net3" 290 20 0 ""
320 50 320 50 "net2" 330 20 0 ""
380 50 380 50 "net4" 390 20 0 ""
520 50 520 50 "net3" 530 20 0 ""
580 50 580 50 "net4" 590 20 0 ""
420 50 420 50 "net3" 430 20 0 ""
480 50 480 50 "net4" 490 20 0 ""
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
