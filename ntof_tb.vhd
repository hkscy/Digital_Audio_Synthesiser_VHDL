--------------------------------------------------------------------------------
-- Company: UoB	
-- Engineer: Christopher Hicks
--
-- Create Date:   10:01:14 01/10/2015
-- Design Name:   
-- Module Name:   /home/meccastreissand/Documents/Fourth Year/EE4G - VHDL assignment/designs/Digital_Audio_Synthesiser/ntof_tb.vhd
-- Project Name:  Digital_Audio_Synthesiser
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: note_to_frequency
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ntof_tb IS
END ntof_tb;
 
ARCHITECTURE behavior OF ntof_tb IS 
	 -- Test constants.
	 constant LOWEST_NOTE : std_logic_vector(7 downto 0) := "00110000";	--48
	 constant HIGHEST_NOTE : std_logic_vector(7 downto 0) := "01101000"; --104
 
    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT note_to_frequency
    PORT(
         note : IN  std_logic_vector(7 downto 0);
         frequency : OUT  std_logic_vector(14 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal note : std_logic_vector(7 downto 0) := (others => '0');
 	--Outputs
   signal frequency : std_logic_vector(14 downto 0);
	
	signal clock_period: time := 100ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: note_to_frequency PORT MAP (
          note => note,
          frequency => frequency);

	stim_proc: process
		variable note_counter: std_logic_vector(7 downto 0) := LOWEST_NOTE;
   begin		
		wait for 50ns;
      -- insert stimulus here 
		while note_counter < HIGHEST_NOTE loop
			note <= note_counter;
			note_counter := note_counter + 1;
			wait for clock_period;
		end loop;

      wait;
   end process stim_proc;

END;
