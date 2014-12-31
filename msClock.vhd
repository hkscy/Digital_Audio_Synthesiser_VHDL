-----------------------------------------------------------------------------------
-- Company: 		 UoB
-- Engineer: 		 Christopher Hicks
-- Create Date:    31/12/2014 
-- Module Name:    msClock - Behavioral 
-- Project Name: 	 Digital_audio_synthesiser
-- Target Devices: Nexys3 board.
-- Description: 	 Takes a 2.8224Mhz clock in and outputs 1000Hz.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity msClock is
    Port ( clk_in3 : in  STD_LOGIC;
           clk_out3 : out  STD_LOGIC);
end msClock;

architecture Behavioral of msClock is
	signal counter : std_logic_vector(11 downto 0) := "101100000110"; 
	--divide clock by 2822, gives 1000.142Hz
begin
	process(clk_in3)
	begin
		if rising_edge(clk_in3) then -- Only count rising edges.
			counter <= counter - 1;	
		end if;
		if counter = 0 then
			clk_out3 <= '1';	-- Output a heart beat.
			counter <= "101100000110"; -- Reset the counter.
		else
			clk_out3 <= '0';
		end if;
	end process;
end Behavioral;

