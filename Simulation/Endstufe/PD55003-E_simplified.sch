<QucsStudio Schematic 3.3.2>
<Properties>
View=-41,-34,1020,920,1,0,0
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
Port P1 1 180 80 -9 -47 0 3 "1" 0 "analog" 0 "TESTPOINT" 0
Port P2 1 300 160 33 -7 0 2 "2" 0 "analog" 0 "TESTPOINT" 0
Port P3 1 180 300 -9 32 0 1 "3" 0 "analog" 0 "TESTPOINT" 0
C Cgd2 1 300 130 17 -26 0 1 "2.4 pF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
C Cgs2 1 300 270 17 -26 0 1 "33.6 pF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
C Cds2 1 80 230 -90 -24 1 1 "21.6 pF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
Relais S1 1 210 190 -119 -22 1 2 "3 V" 1 "0.2 V" 0 "0.75" 1 "1e12" 0 "26.85" 0 "TRANSF-MICRO" 0
</Components>
<Wires>
300 80 300 100 "" 0 0 0 ""
300 160 300 240 "" 0 0 0 ""
80 80 180 80 "" 0 0 0 ""
80 80 80 200 "" 0 0 0 ""
80 260 80 300 "" 0 0 0 ""
80 300 180 300 "" 0 0 0 ""
180 80 300 80 "" 0 0 0 ""
180 300 240 300 "" 0 0 0 ""
240 300 300 300 "" 0 0 0 ""
240 220 240 300 "" 0 0 0 ""
180 220 180 300 "" 0 0 0 ""
180 80 180 160 "" 0 0 0 ""
240 160 300 160 "" 0 0 0 ""
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
