----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:00:24 12/13/2022 
-- Design Name: 
-- Module Name:    modulator_synth_sys - Behavioral 
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
--library UNISIM;
--use UNISIM.VComponents.all;

entity modulator_synth_sys is
	port(
		clk_in 	 	 			: in  STD_LOGIC;
		-- output signals
		tx_out_p 				: out std_logic;
		tx_out_n	 				: out std_logic;
		-- additional switches for setting operating mode and frequency
		enable_transmission 	: in  STD_LOGIC;
		choose_signal 			: in  STD_LOGIC;
		freq_sel	 				: in  std_logic_vector(1 downto 0);
		-- switch for choosing between two tone test and single tone
		choose_input			: in 	std_logic
	);
end modulator_synth_sys;

architecture Behavioral of modulator_synth_sys is
	
	component mod_top_level
	port (
		clk_in 	 	 			: in  STD_LOGIC;
		clk_out					: out std_logic;
		-- input signal
		data_in 					: in 	std_logic_vector(11 downto 0);
		-- output signals
		tx_out_p 				: out std_logic;
		tx_out_n	 				: out std_logic;
		-- additional switches for setting operating mode and frequency
		enable_transmission 	: in  STD_LOGIC;
		choose_signal 			: in  STD_LOGIC;
		freq_sel	 				: in  std_logic_vector(1 downto 0)
	);
	end component; 
	
	component synth
	port (
		clk_in : in  STD_LOGIC;
		k_in : in  STD_LOGIC_VECTOR(14 downto 0); -- max value 2^14, so that f = 1/(4T)
		sin_out : out  STD_LOGIC_VECTOR(11 downto 0)
	);
	end component;
	
	signal pll_clk_to_synth: std_logic := '0';
	signal data_to_mod: std_logic_vector(11 downto 0) := (others => '0');
	signal data_to_mod_buf: std_logic_vector(11 downto 0) := (others => '0');
	
	signal data_synth1: std_logic_vector(11 downto 0) := (others => '0');
	signal data_synth2: std_logic_vector(11 downto 0) := (others => '0');
	
	signal data_synth_combined: std_logic_vector(12 downto 0) := (others => '0');
	
	signal k1: std_logic_vector(14 downto 0) := (others => '0');
	
	--constant k2: std_logic_vector(14 downto 0) := "100001000100010"; -- corresponds to 16930, or 30.999755 MHz
	constant k2: std_logic_vector(14 downto 0) := "100000001101101"; -- corresponds to 16493, or 30.199584 MHz
	
	signal bit_out: std_logic := '0';
	
	
begin

	buf_synth_output: process(pll_clk_to_synth) is 
	begin
		if rising_edge(pll_clk_to_synth) then 
			data_to_mod_buf <= data_to_mod;
		end if;
	end process buf_synth_output;

	-- choose right k1
	k1 <= "100000000000000" when choose_input = '0' else -- corresponds to 2^13 or 30MHz
			--"011110111011110"; -- corresponds to 15838, or 29.000244 MHz
			"011111110010011"; -- corresponds to 16275, or 29.800415 MHz
	-- combine synth signals 
	data_synth_combined <= std_logic_vector((resize(unsigned(data_synth1), 13) + resize(unsigned(data_synth2), 13)));
	
	-- choose synth signal 
	data_to_mod <= data_synth1 when choose_input = '0' else
						data_synth_combined(12 downto 1);


	synth_inst_1: synth
	port map(
		clk_in	=> pll_clk_to_synth,
		k_in		=> k1,
		sin_out	=> data_synth1
	);
	
	synth_inst_2: synth
	port map(
		clk_in	=> pll_clk_to_synth,
		k_in		=> k2,
		sin_out	=> data_synth2
	);

	modulator_inst: mod_top_level
	port map(
		clk_in 					=>	clk_in,
		clk_out					=> pll_clk_to_synth,
		data_in					=> data_to_mod,
		tx_out_p					=> tx_out_p,
		tx_out_n					=> tx_out_n,
		enable_transmission	=> enable_transmission,
		choose_signal			=> choose_signal,
		freq_sel					=> freq_sel
	);

	
		
end Behavioral;

