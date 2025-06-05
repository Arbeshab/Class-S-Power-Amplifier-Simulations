----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:24:44 12/01/2022 
-- Design Name: 
-- Module Name:    mash-1-1 - Behavioral 
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

entity mash_222 is
    Port ( clk_in 		: in  STD_LOGIC;
           data_in_uint : in  unsigned(11 downto 0);
           data_out 		: out std_logic_vector(3 downto 0)
			  );
end mash_222;

architecture Behavioral of mash_222 is
	
	-- pre and post quantizer data widths
	constant N		: positive := 12;
	constant Nout	: positive := 4;
	
	-- types for internal values
	subtype uint_nout is unsigned(Nout-1 downto 0);
	subtype uint_n is unsigned(N-1 downto 0);
	subtype uint_n_plus_1 is unsigned(N downto 0);
	
	-- initialization value for all internal values
	constant init_val: std_logic := '0';
	
	-- mash stages
	signal y1		: uint_n_plus_1 	:= (others => init_val);
	signal e1		: uint_n				:= (others => init_val);
	signal e1d		: uint_n				:= (others => init_val);
	signal e1dd		: uint_n				:= (others => init_val);
	signal v1		: uint_nout			:= (0 => init_val, others => '0');
	
	signal y2		: uint_n_plus_1 	:= (others => init_val);
	signal e2		: uint_n				:= (others => init_val);
	signal e2d		: uint_n				:= (others => init_val);
	signal e2dd		: uint_n				:= (others => init_val);
	signal v2		: uint_nout			:= (0 => init_val, others => '0');
	signal v23	 	: uint_nout			:= (0 => init_val, others => '0');
	signal v23d 	: uint_nout			:= (0 => init_val, others => '0');
	signal v23dd 	: uint_nout			:= (0 => init_val, others => '0');
	
	signal y3		: uint_n_plus_1 	:= (others => init_val);
	signal e3		: uint_n				:= (others => init_val);
	signal e3d		: uint_n				:= (others => init_val);
	signal e3dd		: uint_n				:= (others => init_val);
	signal v3		: uint_nout			:= (0 => init_val, others => '0');
	signal v3d		: uint_nout			:= (0 => init_val, others => '0');
	signal v3dd		: uint_nout			:= (0 => init_val, others => '0');
	signal v3d3		: uint_nout			:= (0 => init_val, others => '0');
	signal v3d4		: uint_nout			:= (0 => init_val, others => '0');
	signal v3sum	: uint_nout			:= (0 => init_val, others => '0');
	
	signal v			: uint_nout			:= (0 => init_val, others => '0');
	
begin

	delays: process(clk_in) is
	begin
		if rising_edge(clk_in) then
			v23dd <= v23d;
			v23d	<= v23;
			v3d4 	<= v3d3;
			v3d3	<= v3dd;
			v3dd	<= v3d;
			v3d	<= v3;
			e3dd	<= e3d;
			e3d	<= e3;
			e2dd	<= e2d;
			e2d	<= e2;
			e1dd	<= e1d;
			e1d	<=	e1;
		end if;
	end process delays;
	
	-- split y signals, effectively quantizing the signal 
	v1(0) <= y1(N);
	e1 	<= y1(N-1 downto 0);
	v2(0)	<= y2(N);
	e2 	<= y2(N-1 downto 0);
	v3(0)	<= y3(N);
	e3 	<= y3(N-1 downto 0);
	
	-- perform addition with delayed error
	y1 <= resize(data_in_uint, N+1) - resize(e1dd, N+1);
	y2 <= resize(e1, N+1) - resize(e2dd, N+1);
	y3 <= resize(e2, N+1) - resize(e3dd, N+1);
	
	-- sum up output
	v3sum <= resize(v3 + 2*v3dd + v3d4, 4);
	v23 	<= v2 + v3sum;
	v 		<= v23 + v23dd + v1; 
	
	-- connect to output port 
	data_out <= std_logic_vector(unsigned(v));
	
end Behavioral;

