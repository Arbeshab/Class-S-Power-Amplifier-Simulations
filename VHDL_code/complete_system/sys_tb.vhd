--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:01:33 12/13/2022
-- Design Name:   
-- Module Name:   /home/ise/projects/complete_system_mash222_freq_synth/sys_tb.vhd
-- Project Name:  complete_system_mash222_freq_synth
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: modulator_synth_sys
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
use std.textio.all;
use IEEE.std_logic_signed.all; 
 
ENTITY sys_tb IS
END sys_tb;
 
ARCHITECTURE behavior OF sys_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT modulator_synth_sys
    PORT(
         clk_in : IN  std_logic;
         tx_out_p : OUT  std_logic;
         tx_out_n : OUT  std_logic;
         enable_transmission : IN  std_logic;
         choose_signal : IN  std_logic;
         freq_sel : IN  std_logic_vector(1 downto 0);
         choose_input : IN  std_logic;
			synth_out: out std_logic_vector(11 downto 0);
			mod_out: out std_logic;
			clk_out: out std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal clk_in : std_logic := '0';
   signal enable_transmission : std_logic := '1';
   signal choose_signal : std_logic := '0';
   signal freq_sel : std_logic_vector(1 downto 0) := "11";
   signal choose_input : std_logic := '1';

 	--Outputs
   signal tx_out_p : std_logic;
   signal tx_out_n : std_logic;

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
 
	-- output signal of subsystems 
	signal synth_out_x: std_logic_vector(11 downto 0) := (others => '0');
	signal synth_out_expanded: std_logic_vector(12 downto 0) := (others => '0');
	signal mod_out_x: std_logic := '0';
	signal mod_out_expanded: std_logic_vector(1 downto 0) := "00";
	
	signal clk_out_sim: std_logic:= '0';
 
BEGIN
 
	synth_out_expanded(11 downto 0) <= synth_out_x;
	mod_out_expanded(0) <= mod_out_x;
 
	-- Instantiate the Unit Under Test (UUT)
   uut: modulator_synth_sys PORT MAP (
          clk_in => clk_in,
          tx_out_p => tx_out_p,
          tx_out_n => tx_out_n,
          enable_transmission => enable_transmission,
          choose_signal => choose_signal,
          freq_sel => freq_sel,
          choose_input => choose_input,
			 synth_out => synth_out_x,
			 mod_out => mod_out_x,
			 clk_out => clk_out_sim
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 
	OUTFILE_synth : process (clk_out_sim) is
		variable L_OUT      : line;
		variable CHAR_SPACE : character := ',';  -- character between two values
		file STIM_OUT       : text open WRITE_MODE is "/home/ise/austausch/complete_sys/freq_one_cycle_29_31MHz.csv";
	begin  -- process OUTFILE
		if falling_edge(clk_out_sim) then
			write (L_OUT, now);
			write (L_OUT, CHAR_SPACE);
			write (L_OUT, conv_integer(synth_out_expanded));
			writeline (STIM_OUT, L_OUT);
		end if;
	end process OUTFILE_synth;
	
	OUTFILE_mod : process (clk_out_sim) is
		variable L_OUT      : line;
		variable CHAR_SPACE : character := ',';  -- character between two values
		file STIM_OUT       : text open WRITE_MODE is "/home/ise/austausch/complete_sys/mod_out_29_31MHz.csv";
	begin  -- process OUTFILE
		if falling_edge(clk_out_sim) then
			write (L_OUT, now);
			write (L_OUT, CHAR_SPACE);
			write (L_OUT, conv_integer(mod_out_expanded));
			writeline (STIM_OUT, L_OUT);
		end if;
	end process OUTFILE_mod;

END;
