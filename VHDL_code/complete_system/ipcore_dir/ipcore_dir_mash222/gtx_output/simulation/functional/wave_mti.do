###############################################################################
##$Date: 2009/11/11 05:22:01 $
##$Revision: 1.1 $
###############################################################################
## wave_mti.do
###############################################################################
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {TILE0_GTX_OUTPUT }
add wave -noupdate -divider {Loopback and Powerdown Ports }
add wave -noupdate -format Literal -radix hexadecimal /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/LOOPBACK0_IN
add wave -noupdate -format Literal -radix hexadecimal /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/LOOPBACK1_IN
add wave -noupdate -divider {Receive Ports - Comma Detection and Alignment }
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENMCOMMAALIGN0_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENMCOMMAALIGN1_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENPCOMMAALIGN0_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENPCOMMAALIGN1_IN
add wave -noupdate -divider {Receive Ports - RX Data Path interface }
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXRESET0_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXRESET1_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXUSRCLK0_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXUSRCLK1_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXUSRCLK20_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXUSRCLK21_IN
add wave -noupdate -divider {Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR }
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXN0_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXN1_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXP0_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXP1_IN
add wave -noupdate -divider {Receive Ports - RX Oversampling }
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENSAMPLEALIGN0_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENSAMPLEALIGN1_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXOVERSAMPLEERR0_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXOVERSAMPLEERR1_OUT
add wave -noupdate -divider {Shared Ports - Tile and PLL Ports }
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/CLKIN_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/GTXRESET_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/PLLLKDET_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/REFCLKOUT_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RESETDONE0_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RESETDONE1_OUT
add wave -noupdate -divider {Transmit Ports - TX Data Path interface }
add wave -noupdate -format Literal -radix hexadecimal /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXDATA0_IN
add wave -noupdate -format Literal -radix hexadecimal /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXDATA1_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXOUTCLK0_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXOUTCLK1_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXUSRCLK0_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXUSRCLK1_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXUSRCLK20_IN
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXUSRCLK21_IN
add wave -noupdate -divider {Transmit Ports - TX Driver and OOB signalling }
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXN0_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXN1_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXP0_OUT
add wave -noupdate -format Logic /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXP1_OUT

TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
configure wave -namecolwidth 282
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ps} {5236 ps}

