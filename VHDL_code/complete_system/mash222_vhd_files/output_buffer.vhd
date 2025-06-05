----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:15:50 12/08/2022 
-- Design Name: 
-- Module Name:    output_buffer - Behavioral 
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
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity output_buffer is
    Port (clk_in 			: in  STD_LOGIC; 
			 clk_in_div16 	: in  STD_LOGIC;
          data_bit_in	: in  STD_LOGIC;
          data_word_out : out  STD_LOGIC_VECTOR(0 to 15)
    );
end output_buffer;

architecture Behavioral of output_buffer is
	signal internal_word: bit_vector(0 to 15) := (others => '0');
	constant sv: natural := 1;
begin
	
	process(clk_in) is 
	begin
		if rising_edge(clk_in) then 
			internal_word <= internal_word srl sv;
			internal_word(0) <= to_bit(data_bit_in);
		end if;
	end process;
	
	process(clk_in_div16) is 
	begin
		if rising_edge(clk_in_div16) then 
			data_word_out <= to_stdlogicvector(internal_word);
		end if;
	end process;
	
end Behavioral;

