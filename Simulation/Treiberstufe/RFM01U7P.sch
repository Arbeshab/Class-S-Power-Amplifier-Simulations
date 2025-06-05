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
.PortSym 40 100 3 0
</Symbol>
<Components>
Port Gate 1 220 220 -68 -7 1 0 "2" 0 "analog" 0 "TESTPOINT" 0
Port Drain 1 400 160 -23 -53 1 3 "1" 0 "analog" 0 "TESTPOINT" 0
Port Source 1 400 300 -23 34 1 1 "3" 0 "analog" 0 "TESTPOINT" 0
C C_DS 1 440 230 17 -26 0 1 "12.8 pF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
C C_GD 1 220 190 16 -19 1 1 "1.3 pF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
C C_GS 1 220 270 19 -17 0 1 "6.5 pF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
Relais S1 1 370 250 -9 -55 0 0 "1.1 V" 0 "0.1 V" 0 "2.5" 0 "1e9" 0 "26.85" 0 "TRANSF-MICRO" 0
</Components>
<Wires>
220 160 400 160 "" 0 0 0 ""
440 160 440 200 "" 0 0 0 ""
440 260 440 300 "" 0 0 0 ""
400 160 440 160 "" 0 0 0 ""
400 300 440 300 "" 0 0 0 ""
400 280 400 300 "" 0 0 0 ""
400 160 400 220 "" 0 0 0 ""
220 220 340 220 "" 0 0 0 ""
340 300 400 300 "" 0 0 0 ""
340 280 340 300 "" 0 0 0 ""
220 300 340 300 "" 0 0 0 ""
220 220 220 240 "" 0 0 0 ""
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
Text 225 41 12 #000000 0 "Autor: Alex Putzer \n Letzte Änderung: 14.03.2023 \n "
</Paintings>
