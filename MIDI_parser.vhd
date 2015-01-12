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
use ieee.std_logic_unsigned.all;

entity MIDI_parser is
    Port ( clk : in  STD_LOGIC;										--22.582Mhz clock in.
           data_ready : in  STD_LOGIC;								--Lets us know rx_word availability.
           data : in  STD_LOGIC_VECTOR (7 downto 0);			--Most recent word received.
           frequency : out  STD_LOGIC_VECTOR (14 downto 0));--Frequency we should be producing.
end MIDI_parser;

architecture Behavioral of MIDI_parser is
	type state_type is (idle, status, data1_on, data1_off, data2);
	signal state, state_next : state_type := status;
	signal note: std_logic_vector(7 downto 0) := (others => '0');
	signal velocity: std_logic_vector(7 downto 0) := (others => '0');
	
	component note_to_frequency --Converts note numbers (48-104) to scaled frequencies.
		port(
			note			: in std_logic_vector(7 downto 0);
			frequency	: out std_logic_vector(14 downto 0));
	end component note_to_frequency;
	
begin
	n2f: note_to_frequency port map ( note => note,
										  frequency => frequency );
										  
	process(clk)
	begin
		if rising_edge(clk) then
			state <= state_next;
		end if;
	end process;
	
	process(data_ready, state)
	begin
		state_next <= state;
		case state is
			when idle =>	--Waiting for a new note.
				if data_ready = '1' then
					state_next <= status;
				end if;
			when status => --Waiting for a new MIDI note/Incoming MIDI note status byte (On/Off)
				if data = "10010000" then
					state_next <= data1_on;	--Note on.
				elsif data = "10000000" then
					state_next <= data1_off;	--Note off.
				else
					state_next <= idle; --Return to idle.
				end if;
			when data1_on =>	--Incoming MIDI data byte 1, contains note number to turn ON.
				if data_ready = '1' then
					note <= data;
					state_next <= data2;
				end if;
			when data1_off =>	--Incoming MIDI data byte 1, contains note number to turn OFF.
				if data_ready = '1' then
					note <= (others => '0');
					state_next <= idle;
				end if;
			when data2 =>	--Incoming MIDI data byte 2, contains velocity.
				if data_ready = '1' then
					velocity <= data;
					state_next <= idle;
				end if;
		end case;	
	end process;

end Behavioral;

