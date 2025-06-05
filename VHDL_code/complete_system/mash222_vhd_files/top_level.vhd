----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:23:24 12/01/2022 
-- Design Name: 
-- Module Name:    mod_top_level - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity mod_top_level is
    Port (clk_in 	 	 			: in  STD_LOGIC;
			 clk_out					: out std_logic;
			 -- input signal
			 data_in 				: in std_logic_vector(11 downto 0);
			 -- output signals
			 tx_out_p 				: out std_logic;
			 tx_out_n	 			: out std_logic;
			 -- additional switches for setting operating mode and frequency
			 enable_transmission : in  STD_LOGIC;
          choose_signal 		: in  STD_LOGIC;
			 freq_sel	 			: in  std_logic_vector(1 downto 0)
			 );
end mod_top_level;

architecture Behavioral of mod_top_level is

	component mash_222
	port (clk_in 			: in  STD_LOGIC;
			data_in_uint 	: in  unsigned(11 downto 0);
			data_out 		: out std_logic_vector(3 downto 0));
	end component;
	
	component bit_reduction
	Port (clk_in 	: in  STD_LOGIC;
		   data_in 	: in  std_logic_vector(3 downto 0);
		   data_out : out  STD_LOGIC);
	end component;

	component output_buffer is
   Port (clk_in 			: in  STD_LOGIC; 
			clk_in_div16 	: in  STD_LOGIC;
         data_bit_in	: in  STD_LOGIC;
         data_word_out : out  STD_LOGIC_VECTOR(0 to 15)
   );
	end component;
	
	COMPONENT pll_clock
	PORT(
		CLKIN1_IN : IN std_logic;
		RST_IN : IN std_logic;          
		CLKOUT0_OUT : OUT std_logic;
		CLKOUT1_OUT : OUT std_logic;
		CLKOUT2_OUT : OUT std_logic;
		CLKOUT3_OUT : OUT std_logic;
		LOCKED_OUT : OUT std_logic
	);
	END COMPONENT;
	
	component GTX_OUTPUT 
	generic
	(
		 -- Simulation attributes
		 WRAPPER_SIM_GTXRESET_SPEEDUP    : integer   := 0; -- Set to 1 to speed up sim reset
		 WRAPPER_SIM_PLL_PERDIV2         : bit_vector:= x"0d0" -- Set to the VCO Unit Interval time
	);
	port
	(	 --TILE0  (Location)
		 ------------------------ Loopback and Powerdown Ports ----------------------
		 TILE0_LOOPBACK0_IN                      : in   std_logic_vector(2 downto 0);
		 TILE0_LOOPBACK1_IN                      : in   std_logic_vector(2 downto 0);
		 --------------- Receive Ports - Comma Detection and Alignment --------------
		 TILE0_RXENMCOMMAALIGN0_IN               : in   std_logic;
		 TILE0_RXENMCOMMAALIGN1_IN               : in   std_logic;
		 TILE0_RXENPCOMMAALIGN0_IN               : in   std_logic;
		 TILE0_RXENPCOMMAALIGN1_IN               : in   std_logic;
		 ------------------- Receive Ports - RX Data Path interface -----------------
		 TILE0_RXRESET0_IN                       : in   std_logic;
		 TILE0_RXRESET1_IN                       : in   std_logic;
		 TILE0_RXUSRCLK0_IN                      : in   std_logic;
		 TILE0_RXUSRCLK1_IN                      : in   std_logic;
		 TILE0_RXUSRCLK20_IN                     : in   std_logic;
		 TILE0_RXUSRCLK21_IN                     : in   std_logic;
		 ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
		 TILE0_RXN0_IN                           : in   std_logic;
		 TILE0_RXN1_IN                           : in   std_logic;
		 TILE0_RXP0_IN                           : in   std_logic;
		 TILE0_RXP1_IN                           : in   std_logic;
		 ---------------------- Receive Ports - RX Oversampling ---------------------
		 TILE0_RXENSAMPLEALIGN0_IN               : in   std_logic;
		 TILE0_RXENSAMPLEALIGN1_IN               : in   std_logic;
		 TILE0_RXOVERSAMPLEERR0_OUT              : out  std_logic;
		 TILE0_RXOVERSAMPLEERR1_OUT              : out  std_logic;
		 --------------------- Shared Ports - Tile and PLL Ports --------------------
		 TILE0_CLKIN_IN                          : in   std_logic;
		 TILE0_GTXRESET_IN                       : in   std_logic;
		 TILE0_PLLLKDET_OUT                      : out  std_logic;
		 TILE0_REFCLKOUT_OUT                     : out  std_logic;
		 TILE0_RESETDONE0_OUT                    : out  std_logic;
		 TILE0_RESETDONE1_OUT                    : out  std_logic;
		 ------------------ Transmit Ports - TX Data Path interface -----------------
		 TILE0_TXDATA0_IN                        : in   std_logic_vector(15 downto 0);
		 TILE0_TXDATA1_IN                        : in   std_logic_vector(15 downto 0);
		 TILE0_TXOUTCLK0_OUT               		  : out 	std_logic;
       TILE0_TXOUTCLK1_OUT							  : out 	std_logic;
		 TILE0_TXUSRCLK0_IN                      : in   std_logic;
		 TILE0_TXUSRCLK1_IN                      : in   std_logic;
		 TILE0_TXUSRCLK20_IN                     : in   std_logic;
		 TILE0_TXUSRCLK21_IN                     : in   std_logic;
		 --------------- Transmit Ports - TX Driver and OOB signalling --------------
		 TILE0_TXN0_OUT                          : out  std_logic;
		 TILE0_TXN1_OUT                          : out  std_logic;
		 TILE0_TXP0_OUT                          : out  std_logic;
		 TILE0_TXP1_OUT                          : out  std_logic
	);
	end component;

	constant N: positive := 12;
	constant data_const: std_logic_vector(N-1 downto 0) := "001000000000";
	
	subtype uint_n is unsigned(N-1 downto 0);
	subtype uint_n_plus_1 is unsigned(N downto 0);
	
	signal mash_output: std_logic_vector(3 downto 0) := "0000";
	signal data_in_uint: uint_n := (others => '1');
	signal bit_red_output: std_logic := '0';
	
	-- signals for gtx transceiver
	signal 	data_out: std_logic_vector(15 downto 0) := (others => '0');
	signal 	gtx_input_vec: std_logic_vector(15 downto 0) := (others => '0');
	constant sig_low: std_logic := '0';
	constant sig_low_2bit: std_logic_vector(1 downto 0) := (others => '0');
	constant sig_low_3bit: std_logic_vector(2 downto 0) := (others => '0');
	constant sig_low_16bit: std_logic_vector(15 downto 0) := (others => '0');

	-- clock signal coming from TXOUTCLKi, has to be routed to TXUSRCLKij
	signal clk_out_usr0_15MHz	: std_logic;
	signal clk_out_usr1_15MHz	: std_logic;
	
	signal pll_clk_freq			: std_logic;
	signal pll_clk_240MHz		: std_logic;
	signal pll_clk_120MHz		: std_logic;
	signal pll_clk_80MHz			: std_logic;
	signal pll_clk_60MHz			: std_logic;
	signal buf_to_gtx_clk		: std_logic;
	
	-- 240 MHz clock for operations on the fpga
	signal my_clk_in	: std_logic;
	
begin
	
	clk_out <= my_clk_in;
	
	-- connect rom according to settings
	data_out <= gtx_input_vec			when (enable_transmission = '1') and (choose_signal = '1') else
					"1010101010101010"	when (enable_transmission = '1') and (choose_signal = '0') else
					"1010000000000001";
	
	-- choose the desired clock frequency of the output block
	pll_clk_freq <= pll_clk_60MHz		when (freq_sel = "00") else
						 pll_clk_80MHz		when (freq_sel = "01") else
						 pll_clk_120MHz	when (freq_sel = "10") else
						 pll_clk_240MHz;
	
	cast_input: process(my_clk_in) is 
	begin
		if rising_edge(my_clk_in) then
			data_in_uint <= unsigned(data_in);
		end if; 
	end process;
	
	my_output_buffer: output_buffer 
   port map(clk_in 			=> my_clk_in,
				clk_in_div16 	=> clk_out_usr0_15MHz,
				data_bit_in		=> bit_red_output,
				data_word_out 	=> gtx_input_vec
   );

	mash_222_inst: mash_222
	port map(clk_in 			=> my_clk_in,
				data_in_uint 	=> data_in_uint,
				data_out 		=> mash_output
	);

	bit_reduction_inst: bit_reduction
	port map(clk_in	=> my_clk_in,
				data_in => mash_output,
				data_out => bit_red_output
	);
	
	my_pll_clock: pll_clock PORT MAP(
		CLKIN1_IN => clk_in,
		RST_IN => sig_low,
		CLKOUT0_OUT => pll_clk_240MHz,
		CLKOUT1_OUT => pll_clk_120MHz,
		CLKOUT2_OUT => pll_clk_80MHz,
		CLKOUT3_OUT => pll_clk_60MHz,
		LOCKED_OUT => open
	);
	
	gtx_output_i : GTX_OUTPUT
    generic map
    (
        WRAPPER_SIM_GTXRESET_SPEEDUP    =>      1,
        WRAPPER_SIM_PLL_PERDIV2         =>      x"0d0"
    )
    port map
    (   --TILE0  (X0Y5)
        ------------------------ Loopback and Powerdown Ports ----------------------
        TILE0_LOOPBACK0_IN              =>      sig_low_3bit,
        TILE0_LOOPBACK1_IN              =>      sig_low_3bit,
        --------------- Receive Ports - Comma Detection and Alignment --------------
        TILE0_RXENMCOMMAALIGN0_IN       =>      sig_low,
        TILE0_RXENMCOMMAALIGN1_IN       =>      sig_low,
        TILE0_RXENPCOMMAALIGN0_IN       =>      sig_low,
        TILE0_RXENPCOMMAALIGN1_IN       =>      sig_low,
        ------------------- Receive Ports - RX Data Path interface -----------------
        TILE0_RXRESET0_IN               =>      sig_low,
        TILE0_RXRESET1_IN               =>      sig_low,
        TILE0_RXUSRCLK0_IN              =>      clk_out_usr0_15MHz,
        TILE0_RXUSRCLK1_IN              =>      clk_out_usr1_15MHz,
        TILE0_RXUSRCLK20_IN             =>      clk_out_usr0_15MHz,
        TILE0_RXUSRCLK21_IN             =>      clk_out_usr1_15MHz,
        ------- Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR ------
        TILE0_RXN0_IN                   =>      sig_low,
        TILE0_RXN1_IN                   =>      sig_low,
        TILE0_RXP0_IN                   =>      sig_low,
        TILE0_RXP1_IN                   =>      sig_low,
        ---------------------- Receive Ports - RX Oversampling ---------------------
        TILE0_RXENSAMPLEALIGN0_IN       =>      sig_low,
        TILE0_RXENSAMPLEALIGN1_IN       =>      sig_low,
        TILE0_RXOVERSAMPLEERR0_OUT      =>      open,
        TILE0_RXOVERSAMPLEERR1_OUT      =>      open,
        --------------------- Shared Ports - Tile and PLL Ports --------------------
        TILE0_CLKIN_IN                  =>      buf_to_gtx_clk,
        TILE0_GTXRESET_IN               =>      sig_low,
        TILE0_PLLLKDET_OUT              =>      open,
        TILE0_REFCLKOUT_OUT             =>      my_clk_in,
        TILE0_RESETDONE0_OUT            =>      open,
        TILE0_RESETDONE1_OUT            =>      open,
        ------------------ Transmit Ports - TX Data Path interface -----------------
        TILE0_TXDATA0_IN                =>      sig_low_16bit,
        TILE0_TXDATA1_IN                =>      data_out,
        TILE0_TXOUTCLK0_OUT             =>      clk_out_usr0_15MHz,
		  TILE0_TXOUTCLK1_OUT             =>      clk_out_usr1_15MHz,
		  TILE0_TXUSRCLK0_IN              =>      clk_out_usr0_15MHz,
        TILE0_TXUSRCLK1_IN              =>      clk_out_usr1_15MHz,
        TILE0_TXUSRCLK20_IN             =>      clk_out_usr0_15MHz,
        TILE0_TXUSRCLK21_IN             =>      clk_out_usr1_15MHz,
        --------------- Transmit Ports - TX Driver and OOB signalling --------------
        TILE0_TXN0_OUT                  =>      open,
        TILE0_TXN1_OUT                  =>      tx_out_n,
        TILE0_TXP0_OUT                  =>      open,
        TILE0_TXP1_OUT                  =>      tx_out_p
    );
	
	 my_clk_buffer: BUFG
    port map
    (
        O                               =>      buf_to_gtx_clk,
        I                               =>      pll_clk_freq
    );
	 
end Behavioral;

