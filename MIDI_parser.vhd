----------------------------------------------------------------------------------
-- Company: 		 UoB	
-- Engineer: 		 Christopher Hicks
-- Create Date:    19:43:16 01/11/2015 
-- Module Name:    MIDI_parser - Behavioral 
-- Project Name: 	 Digital_Audio_synthesiser
-- Target Devices: Nexys3
-- Description:	 Reads MIDI sequence messages, outputs the frequency which should be 
--						 produced by the synthesiser.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use iee.std_logic_unsigned.all;

entity MIDI_parser is
    Port ( clk : in  STD_LOGIC;										--22.582Mhz clock in.
           data_ready : in  STD_LOGIC;								--Lets us know rx_word availability.
           rx_word : in  STD_LOGIC_VECTOR (7 downto 0);		--Most recent word received.
           frequency : out  STD_LOGIC_VECTOR (14 downto 0));--Frequency we should be producing.
end MIDI_parser;

architecture Behavioral of MIDI_parser is
	signal last_rx_word: std_logic_vector(7 downto 0);
	signal last_last_rx_word: std_logic_vector(7 downto 0);
begin

	process (word_ready)
	begin
		if rising_edge(word_ready) then  
			last_rx_word <= rx_word;
		end if;
	end process;
	
	process (last_rx_word)
	begin
		last_last_rx_word <= last_rx_word;
	end process;

end Behavioral;

