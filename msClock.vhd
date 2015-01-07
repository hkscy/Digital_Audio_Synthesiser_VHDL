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
	constant MS_CLK_MAX : std_logic_vector(14 downto 0) := "110111000111100"; -- 28220 clock cycles per 10ms.
	signal counter : std_logic_vector(14 downto 0) := (others => '0'); 
	--divide clock by 28220, gives 100.142Hz
begin
	--counts up to 28220 and then outputs hi for one cycle.
	process(clk_in3)
	begin
		if rising_edge(clk_in3) then -- Only count rising edges.
			if counter = MS_CLK_MAX then
				counter <= (others => '0');
				clk_out3 <= '1';
			else
				counter <= counter + 1;
				clk_out3 <= '0';
			end if;
		end if;
	end process;
	
end Behavioral;

