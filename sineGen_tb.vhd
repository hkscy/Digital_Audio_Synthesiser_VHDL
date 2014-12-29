--------------------------------------------------------------------------------
-- Company: UoB
-- Engineer: Christopher Hicks
--
-- Create Date:   20:20:32 12/27/2014
-- Design Name:   sineGen_tb
-- Module Name:   /home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/sineGen_tb.vhd
-- Project Name:  Digital_Audio_Synthesiser
-- Target Device:  
-- Description:   Uses the textio package to write two cycles worth of oscillations to a file.
-- 
-- VHDL Test Bench Created by ISE for module: sineGen
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all; 
USE ieee.std_logic_arith.all;
USE std.textio.all;
 
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
	
	--File of test vectors
	file testFile: text open write_mode IS "sineGenValidation.txt";

   -- Clock period definitions
   constant clk_period : time := 10 ns;
	shared variable time_elapsed : time := 0 ns;
 
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
		time_elapsed := time_elapsed + clk_period/2;
		clk <= '1';
		wait for clk_period/2;
		time_elapsed := time_elapsed + clk_period/2;
   end process; 

   -- Stimulus process
   stim_proc: process
   begin	 
		
      -- hold reset state for 100 ns.
      wait for clk_period*10;

      -- insert stimulus here 
		phaseInc <= (others => '0');
		phaseInc(10 downto 0) <= "11010001110";

      wait;
   end process;
	
	process(clk)
		variable line_buff : line;
		variable intOut : integer;
		variable timeElapsed : integer;
	begin
		-- write output to file
		write( line_buff, conv_integer(signed(output)) ); --write the y coordinate value.
		write( line_buff, ht ); --write tab to file.
		write( line_buff, time_elapsed ); --write the x coordinate value
      writeline (testFile, line_buff); --write the contents into the file.
	end process;

END;
