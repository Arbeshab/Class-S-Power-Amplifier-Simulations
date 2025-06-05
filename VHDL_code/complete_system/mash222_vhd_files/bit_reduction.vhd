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
	subtype internal_int is integer range -64 to 63;
	
	constant N_in: positive := 4;
	
	signal data_in_int: internal_int := 0;
	signal data_in_buf: std_logic_vector(N_in-1 downto 0) := (others => '0');
	signal res1: internal_int := 0; 
	signal res2: internal_int := 0;
	signal res2_d: internal_int := 0;
	signal res2_dd: internal_int := 0;
	signal res2_d3: internal_int := 0;
	signal res2_d4: internal_int := 0;
	
	signal v: internal_int := 0;
	
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
	
	data_in_int <= to_integer(unsigned(data_in_buf));
	
	res1 <= data_in_int - res2_d4 - 2*res2_dd;
	res2 <= res1 - v;
	
	v <= 1 when res1 > 0 else 
		  0;
		  
	data_out <= '1' when v = 1 else 
					'0';

end Behavioral;

