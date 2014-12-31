-----------------------------------------------------------------------------------
-- Company: 		 UoB
-- Engineer: 		 Christopher Hicks
-- Create Date:    20:55:56 12/29/2014 
-- Module Name:    audioClock - Behavioral 
-- Project Name: 	 Digital_audio_synthesiser
-- Target Devices: Nexys3 board.
-- Description: 	 Takes a clock signal in and divides it by eight.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity audioClock is
    Port ( clk_in2 : in  std_logic;
           clk_out2 : out  std_logic);
end audioClock;

architecture Behavioral of audioClock is
	signal counter : std_logic_vector(2 downto 0) := "000";
begin
	process(clk_in2)
	begin
		if rising_edge(clk_in2) then -- Only count rising edges.
			counter <= counter + 1;
		end if;
		if counter = "111" then
			clk_out2 <= '1';
			counter <= "000";
		else
			clk_out2 <= '0';
		end if;
	end process;
end Behavioral;