--------------------------------------------------------------------------------
-- Company: UoB
-- Engineer: Christopher Hicks
--
-- Create Date:   20:20:32 12/27/2014
-- Design Name:   sineGen_tb
-- Module Name:   /home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/sineGen_tb.vhd
-- Project Name:  Digital_Audio_Synthesiser
-- Target Device:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sineGen
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
--USE ieee.numeric_std.ALL;
 
ENTITY sineGen_tb IS
END sineGen_tb;
 
ARCHITECTURE behavior OF sineGen_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT sineGen
    PORT(
         phaseInc : IN  std_logic_vector(23 downto 0);
         clk : IN  std_logic;
         output : OUT  std_logic_vector(23 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal phaseInc : std_logic_vector(23 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(23 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sineGen PORT MAP (
          phaseInc => phaseInc,
          clk => clk,
          output => output
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
