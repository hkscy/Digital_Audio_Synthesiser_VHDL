--------------------------------------------------------------------------------
-- Company: UoB
-- Engineer: Christopher Hicks
--
-- VHDL Test Bench Created by ISE for module: audioClock
--
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY audioClock_tb IS
END audioClock_tb;
 
ARCHITECTURE behavior OF audioClock_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT audioClock
    PORT(
         clk_in2 : IN  std_logic;
         clk_out2 : OUT  std_logic
        );
    END COMPONENT;    

   --Inputs
   signal clk_in2 : std_logic := '0';

 	--Outputs
   signal clk_out2 : std_logic;

   -- Clock period definitions
   constant clk_in2_period : time := 44.291 ns; -- Simulate 2.882Mhz input
   --constant clk_out2_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: audioClock PORT MAP (
          clk_in2 => clk_in2,
          clk_out2 => clk_out2
        );

   -- Clock process definitions
   clk_in2_process :process
   begin
		clk_in2 <= '0';
		wait for clk_in2_period/2;
		clk_in2 <= '1';
		wait for clk_in2_period/2;
   end process;

   -- Stimulus process
   stim_proc: process
   begin		

      wait;
   end process;

END;
