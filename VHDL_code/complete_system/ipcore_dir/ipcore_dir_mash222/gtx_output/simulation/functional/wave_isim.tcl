###############################################################################
##$Date: 2010/03/03 07:21:19 $
##$Revision: 1.2 $
###############################################################################
## wave_isim.tcl
###############################################################################

wcfg new
divider add "Loopback and Powerdown Ports"
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/LOOPBACK0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/LOOPBACK1_IN
divider add "Receive Ports - Comma Detection and Alignment"
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENMCOMMAALIGN0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENMCOMMAALIGN1_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENPCOMMAALIGN0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENPCOMMAALIGN1_IN
divider add "Receive Ports - RX Data Path interface"
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXRESET0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXRESET1_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXUSRCLK0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXUSRCLK1_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXUSRCLK20_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXUSRCLK21_IN
divider add "Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR"
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXN0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXN1_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXP0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXP1_IN
divider add "Receive Ports - RX Oversampling"
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENSAMPLEALIGN0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXENSAMPLEALIGN1_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXOVERSAMPLEERR0_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RXOVERSAMPLEERR1_OUT
divider add "Shared Ports - Tile and PLL Ports"
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/CLKIN_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/GTXRESET_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/PLLLKDET_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/REFCLKOUT_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RESETDONE0_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/RESETDONE1_OUT
divider add "Transmit Ports - TX Data Path interface"
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXDATA0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXDATA1_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXOUTCLK0_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXOUTCLK1_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXUSRCLK0_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXUSRCLK1_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXUSRCLK20_IN
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXUSRCLK21_IN
divider add "Transmit Ports - TX Driver and OOB signalling"
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXN0_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXN1_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXP0_OUT
wave add /DEMO_TB/gtx_output_top_i/gtx_output_i/tile0_gtx_output_i/TXP1_OUT

ntrace start
run 50us
quit

