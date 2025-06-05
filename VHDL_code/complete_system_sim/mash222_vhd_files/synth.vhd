----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:56:19 12/13/2022 
-- Design Name: 
-- Module Name:    synth - Behavioral 
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

entity synth is
    Port ( clk_in : in  STD_LOGIC;
           k_in : in  STD_LOGIC_VECTOR (14 downto 0); -- max value 2^14, so that f = 1/(4T)
           sin_out : out  STD_LOGIC_VECTOR (11 downto 0));
end synth;

architecture Behavioral of synth is

	COMPONENT lut_sine_coarse_128_vals
	PORT (
		clka : IN STD_LOGIC;
		addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		douta : OUT STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
	END COMPONENT;
	
	COMPONENT lut_sine_fine_256_vals
	PORT (
		clka : IN STD_LOGIC;
		addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		douta : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
	END COMPONENT;

	signal nkc_acc: std_logic_vector(15 downto 0) := (others => '0'); 
	
	signal e: std_logic_vector(7 downto 0) := (others => '0');
	signal f: std_logic_vector(7 downto 0) := (others => '0');

	signal g: std_logic_vector(6 downto 0) := (others => '0');
	signal h: std_logic_vector(1 downto 0) := (others => '0');
	
	-- sin_f does not need a sign as it is always positive
	signal sin_e_sign: std_logic := '0';
	signal cos_e_sign: std_logic := '0';
	signal sin_e_sign_buf: std_logic := '0';
	signal cos_e_sign_buf: std_logic := '0';
	signal sin_e_sign_buf2: std_logic := '0';
	signal cos_e_sign_buf2: std_logic := '0';

	signal sin_f_index: std_logic_vector(7 downto 0) := (others => '0');
	signal sin_e_index: std_logic_vector(6 downto 0) := (others => '0');
	signal cos_e_index: std_logic_vector(6 downto 0) := (others => '0');
	
	signal sin_f_val: std_logic_vector(5 downto 0) := (others => '0');
	signal sin_e_val: std_logic_vector(11 downto 0) := (others => '0');
	signal cos_e_val: std_logic_vector(11 downto 0) := (others => '0');
	
	-- output signal is +/- a +/- (b * c) = +/- a +/- bc
	signal bc_uint: unsigned(17 downto 0) := (others => '0');
	signal bc_uint_buf: unsigned(17 downto 0) := (others => '0');
	signal bc_uint_red: unsigned(10 downto 0) := (others => '0');
	signal bc_signed: signed(11 downto 0) := (others => '0');
	signal a_signed: signed(11 downto 0) := (others => '0');
	signal a_signed_buf: signed(11 downto 0) := (others => '0');
	signal res: signed(11 downto 0) := (others => '0');
	signal res_buf: signed(11 downto 0) := (others => '0');
	signal res_offset_signed: signed(12 downto 0) := (others => '0');
	
	signal output_buf: std_logic_vector(11 downto 0) := (others => '0');
	
begin

	accumulate: process(clk_in) is 
	begin
		if rising_edge(clk_in) then
			nkc_acc <= std_logic_vector(unsigned(nkc_acc) + unsigned(k_in));
		end if; 
	end process accumulate;

	e <= nkc_acc(15 downto 8);
	f <= nkc_acc(7 downto 0);
	
	sin_f_index <= f;
	
	h <= e(7 downto 6);
	g <= e(6 downto 0);
	
	sin_e_sign <= h(1);
	cos_e_sign <= h(1) xor h(0);
	
	sin_e_index <= g; 
	cos_e_index <= g xor "1000000"; -- add 64 with overflow
	
	bc_uint <= unsigned(sin_f_val) * unsigned(cos_e_val);
	a_signed(11 downto 0) <= signed(sin_e_val(11 downto 0));
	
	buffer_mult_result: process(clk_in) is
	begin
		if rising_edge(clk_in) then 
			bc_uint_buf <= bc_uint;
			a_signed_buf <= a_signed;
			sin_e_sign_buf2 <= sin_e_sign_buf;
			cos_e_sign_buf2 <= cos_e_sign_buf;
			sin_e_sign_buf <= sin_e_sign;
			cos_e_sign_buf <= cos_e_sign;
		end if;
	end process buffer_mult_result;
	
	bc_uint_red(6 downto 0) <= bc_uint_buf(17 downto 11);
										
	bc_signed(10 downto 0) <= signed(bc_uint_red);

	res <= -a_signed_buf + bc_signed when (sin_e_sign_buf2 = '1' and cos_e_sign_buf2 = '0') else 
			  a_signed_buf - bc_signed when (sin_e_sign_buf2 = '0' and cos_e_sign_buf2 = '1') else 
			 -a_signed_buf - bc_signed when (sin_e_sign_buf2 = '1' and cos_e_sign_buf2 = '1') else 
			  a_signed_buf + bc_signed; 			 

	buffer_add_result: process(clk_in) is
	begin
		if rising_edge(clk_in) then 
			res_buf <= res; 
		end if; 
	end process buffer_add_result;

	res_offset_signed <= resize(res_buf, 13) + to_signed(2047, 13);
	
	buffer_output: process(clk_in) is 
	begin 
		if rising_edge(clk_in) then 
			output_buf <= std_logic_vector(unsigned(res_offset_signed(11 downto 0)));
		end if;
	end process buffer_output;
	
	sin_out <= output_buf(11 downto 0);
	
	lut_coarse_sin : lut_sine_coarse_128_vals
	PORT MAP (
		clka => clk_in,
		addra => sin_e_index,
		douta => sin_e_val
	);
	
	lut_coarse_cos : lut_sine_coarse_128_vals
	PORT MAP (
		clka => clk_in,
		addra => cos_e_index,
		douta => cos_e_val
	);
	
	lut_fine : lut_sine_fine_256_vals
	PORT MAP (
		clka => clk_in,
		addra => sin_f_index,
		douta => sin_f_val
	);
	

end Behavioral;

