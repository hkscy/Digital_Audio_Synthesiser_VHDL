-----------------------------------------------------------------------------------
-- Company: 		 UoB
-- Engineer: 		 Christopher Hicks
-- Create Date:    20:55:56 12/29/2014 
-- Module Name:    hundredmsClock - Behavioral 
-- Project Name: 	 Digital_audio_synthesiser
-- Target Devices: Nexys3 board.
-- Description: 	 Takes a 2.8224Mhz clock in and outputs 10Hz.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity hundredmsClock is
    Port ( clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end hundredmsClock;

architecture Behavioral of hundredmsClock is
	signal counter : std_logic_vector(18 downto 0) := "1000100111010000000";
begin
	process(clk_in)
	begin
		if rising_edge(clk_in) then -- Only count rising edges.
			counter <= counter - 1;	
		end if;
		if counter = 0 then
			clk_out <= '1';	-- Output a heart beat.
			counter <= "1000100111010000000"; -- Reset the counter.
		else
			clk_out <= '0';
		end if;
	end process;
end Behavioral;

