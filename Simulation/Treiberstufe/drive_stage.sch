<QucsStudio Schematic 3.3.2>
<Properties>
View=-206,-302,1740,714,0.87767,111,0
Grid=10,10,1
DataSet=*.dat
DataDisplay=*.dpl
OpenDisplay=0
showFrame=0
FrameText0=Titel
FrameText1=Gezeichnet von:
FrameText2=Datum:
FrameText3=Revision:
</Properties>
<Symbol>
</Symbol>
<Components>
IProbe I_choke 1 320 170 36 -11 0 3
Vdc V1 1 320 -70 -75 -25 0 2 "Vdd" 1 "battery" 0 "SIL-2" 0
GND * 1 320 -100 0 0 0 2
IProbe I_DD 1 320 -10 40 -8 0 3
IProbe I_C 1 270 120 -13 16 0 0
GND * 1 320 500 0 0 0 0
IProbe I_D 1 320 350 -41 -9 0 3
GND * 1 520 360 0 0 0 0
IProbe I_G2 1 470 300 -15 16 0 0
C CL 1 520 330 17 -26 0 1 "40 pF" 1 "0" 0 "" 0 "neutral" 0 "SMD0603" 0
.TR TR1 1 590 -40 0 63 0 0 "lin" 0 "0" 0 "3 us" 1 "30001" 1 "Gear3" 1 "1e-16" 0 "500" 0 "0.001" 0 "1 µV" 0 "yes" 0 "none" 0
R RL 1 390 300 -26 15 0 0 "1 Ω" 1 "26.85" 0 "0" 0 "0" 0 "26.85" 0 "european" 0 "SMD0603" 0
Sub WE_CBF_470R_0805 1 320 70 20 -12 0 3 "WE_CBF_ferrite_bead_742792036_470ohm_0805.sch" 0
Eqn Versorgungsspannung 1 590 120 0 8 0 0 "Vdd=6=" 1 "yes" 0
IProbe I_G 1 150 400 -12 16 0 0
Sub WCAP_CSGP_33nF 1 190 140 -78 19 0 0 "WCAP-CSGP_0805_33nF.sch" 0
GND * 1 120 120 0 0 0 3
Sub WCAP_ASLI_100uF 1 190 100 -74 -37 0 0 "WCAP_ASLI_100uF_50V.sch" 0
GND * 1 60 560 0 0 0 0
R RD 1 320 230 15 -26 0 1 "10 Ω" 1 "26.85" 0 "0" 0 "0" 0 "26.85" 0 "european" 0 "SMD0603" 0
Vdc V7 1 60 510 18 -26 0 0 "0" 1 "battery" 0 "SIL-2" 0
Vfile V6 1 60 430 16 -712 0 0 "C:/Users/studm/PycharmProjects/genpurpose/Include/MasterArbeit/thesis_plots/simTreiberstufe/simOutputEingang125MHz_cutforQucs.csv" 1 "volts.Vt" 0 "linear" 0 "no" 0 "1" 0 "0" 0
Sub RFM01U7P 1 290 430 26 -12 1 2 "RFM01U7P.sch" 0
</Components>
<Wires>
320 260 320 300 "" 0 0 0 ""
320 100 320 120 "V_choke" 350 90 20 ""
320 20 320 40 "" 0 0 0 ""
320 120 320 140 "" 0 0 0 ""
300 120 320 120 "" 0 0 0 ""
220 120 240 120 "" 0 0 0 ""
420 300 440 300 "" 0 0 0 ""
320 300 320 320 "" 0 0 0 ""
320 300 360 300 "V_DS" 370 250 18 ""
320 460 320 500 "" 0 0 0 ""
320 380 320 400 "" 0 0 0 ""
500 300 520 300 "" 0 0 0 ""
180 400 260 400 "V_IN" 230 360 38 ""
220 100 220 120 "" 0 0 0 ""
220 120 220 140 "" 0 0 0 ""
120 120 160 120 "" 0 0 0 ""
160 100 160 120 "" 0 0 0 ""
160 120 160 140 "" 0 0 0 ""
60 540 60 560 "" 0 0 0 ""
60 460 60 480 "" 0 0 0 ""
60 400 120 400 "" 0 0 0 ""
520 300 520 300 "V_G2" 550 250 0 ""
</Wires>
<Diagrams>
<Rect 960 20 700 240 31 #c0c0c0 1 00 2 4.09322e-08 5e-09 1.06939e-07 1 0 0 0 1 -1 0.5 0.5 315 0 225 "Zeit" "" "">
	<Legend 10 -100 0>
	<"I_G2.It" "" #ff00ff 0 3 0 0 0 0 "">
	  <Mkr 5.89e-08 250 -280 3 1 0 0 0 50>
</Rect>
<Rect 960 620 700 240 31 #c0c0c0 1 00 2 1.92857e-07 1e-08 3e-07 2 -0.303276 0.2 0.492629 1 0 0 0 315 0 225 "Zeit" "" "">
	<Legend 10 -100 0>
	<"I_DD.It" "" #0000ff 0 3 0 0 0 0 "">
	  <Mkr 2.626e-07 470 40 3 1 0 0 0 50>
	<"I_choke.It" "" #ff0000 0 3 0 0 0 0 "">
	<"I_C.It" "" #ff00ff 0 3 0 0 0 0 "">
</Rect>
<Tab 42 654 524 56 71 #c0c0c0 1 00 1 0 1 1 1 0 1 1 1 0 1 1 315 0 225 "" "" "">
	<"average(range(Vdd*I_DD.It, 2.5e-6, 3e-6))" "" #0000ff 0 3 1 0 0 1 "average power from supply [W]">
	<"average(range(I_choke.It*(V_choke.Vt-V_DS.Vt), 2.5e-6, 3e-6))" "" #0000ff 0 3 1 0 0 1 "average power over drain resistor [W]">
</Tab>
<Rect 960 340 700 240 31 #c0c0c0 1 00 2 1.71735e-08 2e-09 3.73776e-08 2 0.837786 2 6.16754 2 -2.63714 10 36.7135 315 0 225 "Zeit" "" "">
	<Legend 10 -100 0>
	<"V_G2.Vt" "" #0000ff 0 3 0 0 0 0 "">
	<"V_IN.Vt" "" #ff0000 0 3 0 0 1 0 "">
	  <Mkr 2.49e-08 270 -100 3 1 0 0 0 50>
	  <Mkr 2.11e-08 140 -130 3 1 0 0 0 50>
</Rect>
</Diagrams>
<Paintings>
Text 75 -229 12 #000000 0 "Autor: Alex Putzer \n Letzte Änderung: 14.03.2023 \n "
</Paintings>
