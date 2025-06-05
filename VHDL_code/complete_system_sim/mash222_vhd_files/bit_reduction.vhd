----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:26:24 12/01/2022 
-- Design Name: 
-- Module Name:    bit_reduction - Behavioral 
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

entity bit_reduction is
    Port ( clk_in : in  STD_LOGIC;
           data_in : in  std_logic_vector(3 downto 0);
           data_out : out  STD_LOGIC);
end bit_reduction;

architecture Behavioral of bit_reduction is

	constant N_in: positive := 4;
	constant N_internal: positive := 10;

	subtype internal_int is signed(N_internal-1 downto 0);
	
	signal data_in_int: internal_int := (others => '0');
	signal data_in_buf: std_logic_vector(N_in-1 downto 0) := (others => '0');
	signal res1: 		internal_int := (others => '0'); 
	signal res1_exp:	signed(19 downto 0) := (others => '0'); 
	signal res2: 		internal_int := (others => '0');
	signal res2_d: 	internal_int := (others => '0');
	signal res2_dd: 	internal_int := (others => '0');
	signal res2_d3: 	internal_int := (others => '0');
	signal res2_d4: 	internal_int := (others => '0');
	
	signal v: 			internal_int := (others => '0');
	
	-- signals to determine min/max of internal states
	signal res1_min:	signed(19 downto 0) := (others => '0'); 
	signal res1_max:	signed(19 downto 0) := (others => '0'); 
	
begin

	delay_res2: process(clk_in) is
	begin
		if rising_edge(clk_in) then
			res2_d <= res2;
			res2_dd <= res2_d;
			res2_d3 <= res2_dd;
			res2_d4 <= res2_d3;
			data_in_buf <= data_in;
		end if;
	end process delay_res2;
	
	data_in_int <= resize(signed(data_in_buf), N_internal);
	
	res1_exp <= data_in_int - res2_d4 - 2*res2_dd;
	res1(9 downto 0) <= res1_exp(9 downto 0);
	res2 <= res1 - v;
	
	v(0) <= '1' when res1 > 0 else 
			  '0';
			  
	res1_min <= res1_min when res1_min < res1_exp else 
					res1_exp;
	res1_max <= res1_max when res1_max > res1_exp else 
					res1_exp;
		  
	data_out <= v(0);

end Behavioral;

