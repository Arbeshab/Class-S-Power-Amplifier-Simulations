 
 
 





--------------------------------------------------------------------------------
--
-- BLK MEM GEN v7_3 Core - Synthesizable Testbench
--
--------------------------------------------------------------------------------
--
-- (c) Copyright 2006_3010 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.

--------------------------------------------------------------------------------
--
-- Filename: lut_sine_fine_256_vals_synth.vhd
--
-- Description:
--  Synthesizable Testbench
--------------------------------------------------------------------------------
-- Author: IP Solutions Division
--
-- History: Sep 12, 2011 - First Release
--------------------------------------------------------------------------------
--
--------------------------------------------------------------------------------
-- Library Declarations
--------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_MISC.ALL;

LIBRARY STD;
USE STD.TEXTIO.ALL;

--LIBRARY unisim;
--USE unisim.vcomponents.ALL;

LIBRARY work;
USE work.ALL;
USE work.BMG_TB_PKG.ALL;

ENTITY lut_sine_fine_256_vals_synth IS
GENERIC ( 
   C_ROM_SYNTH : INTEGER := 1
   );
PORT(
	CLK_IN     : IN  STD_LOGIC;
    RESET_IN   : IN  STD_LOGIC;
    STATUS     : OUT STD_LOGIC_VECTOR(8 DOWNTO 0) := (OTHERS => '0')   --ERROR STATUS OUT OF FPGA
    );
END ENTITY;

ARCHITECTURE lut_sine_fine_256_vals_synth_ARCH OF lut_sine_fine_256_vals_synth IS


COMPONENT lut_sine_fine_256_vals_exdes 
  PORT (
      --Inputs - Port A
    ADDRA          : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    DOUTA          : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
    CLKA       : IN STD_LOGIC


  );

END COMPONENT;


  SIGNAL CLKA: STD_LOGIC := '0';
  SIGNAL RSTA: STD_LOGIC := '0';
  SIGNAL ADDRA: STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL ADDRA_R: STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL DOUTA: STD_LOGIC_VECTOR(5 DOWNTO 0);
  SIGNAL CHECKER_EN : STD_LOGIC:='0';
  SIGNAL CHECKER_EN_R : STD_LOGIC:='0';
  SIGNAL STIMULUS_FLOW : STD_LOGIC_VECTOR(22 DOWNTO 0) := (OTHERS =>'0');
  SIGNAL clk_in_i: STD_LOGIC;
 
  SIGNAL RESET_SYNC_R1 : STD_LOGIC:='1';
  SIGNAL RESET_SYNC_R2 : STD_LOGIC:='1';
  SIGNAL RESET_SYNC_R3 : STD_LOGIC:='1';

  SIGNAL ITER_R0 : STD_LOGIC := '0';
  SIGNAL ITER_R1 : STD_LOGIC := '0';
  SIGNAL ITER_R2 : STD_LOGIC := '0';

  SIGNAL ISSUE_FLAG : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');
  SIGNAL ISSUE_FLAG_STATUS : STD_LOGIC_VECTOR(7 DOWNTO 0) := (OTHERS => '0');

  BEGIN

--  clk_buf: bufg
--    PORT map(
--      i => CLK_IN,
--      o => clk_in_i
--    );
   clk_in_i <= CLK_IN;
   CLKA <= clk_in_i;

   RSTA <= RESET_SYNC_R3 AFTER 50 ns;


   PROCESS(clk_in_i)
   BEGIN
      IF(RISING_EDGE(clk_in_i)) THEN
		 RESET_SYNC_R1 <= RESET_IN;
		 RESET_SYNC_R2 <= RESET_SYNC_R1;
		 RESET_SYNC_R3 <= RESET_SYNC_R2;
	  END IF;
   END PROCESS;


PROCESS(CLKA)
BEGIN
  IF(RISING_EDGE(CLKA)) THEN
    IF(RESET_SYNC_R3='1') THEN
        ISSUE_FLAG_STATUS<= (OTHERS => '0'); 
	  ELSE
        ISSUE_FLAG_STATUS <= ISSUE_FLAG_STATUS OR ISSUE_FLAG;
   END IF;
  END IF;
END PROCESS;

STATUS(7 DOWNTO 0) <= ISSUE_FLAG_STATUS;





 BMG_STIM_GEN_INST:ENTITY work.BMG_STIM_GEN
    GENERIC MAP(  C_ROM_SYNTH => C_ROM_SYNTH
              )

     PORT MAP(
                CLK => clk_in_i,
            	RST => RSTA,
                ADDRA  => ADDRA,
				DATA_IN => DOUTA,
				STATUS => ISSUE_FLAG(0)
             );

      PROCESS(CLKA)
      BEGIN
        IF(RISING_EDGE(CLKA)) THEN
		  IF(RESET_SYNC_R3='1') THEN
			STATUS(8) <= '0';
			iter_r2 <= '0';
			iter_r1 <= '0';
			iter_r0 <= '0';
		  ELSE
			STATUS(8) <= iter_r2;
			iter_r2 <= iter_r1;
			iter_r1 <= iter_r0;
			iter_r0 <= STIMULUS_FLOW(8);
	      END IF;
	    END IF;
      END PROCESS;

      PROCESS(CLKA)
      BEGIN
        IF(RISING_EDGE(CLKA)) THEN
		  IF(RESET_SYNC_R3='1') THEN
		      STIMULUS_FLOW <= (OTHERS => '0'); 
           ELSIF(ADDRA(0)='1') THEN
		      STIMULUS_FLOW <= STIMULUS_FLOW+1;
         END IF;
	    END IF;
      END PROCESS;


      PROCESS(CLKA)
      BEGIN
        IF(RISING_EDGE(CLKA)) THEN
		  IF(RESET_SYNC_R3='1') THEN
          

           ELSE

         END IF;
	    END IF;
      END PROCESS;


      PROCESS(CLKA)
      BEGIN
        IF(RISING_EDGE(CLKA)) THEN
		  IF(RESET_SYNC_R3='1') THEN
            ADDRA_R <= (OTHERS=> '0') AFTER 50 ns;
          ELSE
            ADDRA_R <= ADDRA AFTER 50 ns;
          END IF;
	    END IF;
      END PROCESS;


    BMG_PORT: lut_sine_fine_256_vals_exdes PORT MAP ( 
      --Port A
      ADDRA      => ADDRA_R,
      DOUTA      => DOUTA,
      CLKA       => CLKA

    );
END ARCHITECTURE;
