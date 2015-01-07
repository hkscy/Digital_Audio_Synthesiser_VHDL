----------------------------------------------------------------------------------
-- 
-- Create Date:    19:11:12 12/24/2014 
-- Design Name: 	 display_driver.vhd
-- Module Name:    display_driver - Behavioral 
-- Project Name: 	 Digital_audio_synthesiser.
-- Target Devices: Nexys3 development board.
-- Tool versions: 
-- Description: Generates apropriate display segments given an input number.
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_driver is
    Port ( mode : in std_logic_vector(1 downto 0); --00 Off, 01 Numbers, 10 Letters , 11 On.
			number : in  STD_LOGIC_VECTOR (3 downto 0);	  
           segs : out  STD_LOGIC_VECTOR (7 downto 0));
end display_driver;

architecture Behavioral of display_driver is			
	signal digit: std_logic_vector(5 downto 0) := "000000";
begin
--HEX-to-seven-segment decoder
--   HEX:   in    STD_LOGIC_VECTOR (3 downto 0);
--   LED:   out   STD_LOGIC_VECTOR (6 downto 0);
-- 
-- display segment encoding
--      0
--     ---  
--  5 |   | 1
--     ---   <- 6  
--  4 |   | 2
--     ---
--      3
	process(mode)
	begin 
		case mode is
			when "00" => -- Display off.
				digit(5 downto 0) <= "000000";
			when "01" => -- Display numbers.
				digit(5 downto 4) <= "01";
				digit(3 downto 0) <= number(3 downto 0);
			when "10" => -- Display letters.
				digit(5 downto 4) <= "10";
				digit(3 downto 0) <= number(3 downto 0);
			when "11" => -- Display on.
				digit(5 downto 0) <= "111111";
			when others =>	
				digit(5 downto 0) <= "000000";
		end case;
	end process;
		
	with digit select
	segs(7 downto 0) <= "11111111" when "000000", -- Off mode.
							  -- Number mode.
							  "11000000" when "010000",	--0
							  "11111001" when "010001",   --1
							  "10100100" when "010010",   --2
							  "10110000" when "010011",   --3
							  "10011001" when "010100",   --4
							  "10010010" when "010101",   --5
							  "10000010" when "010110",   --6
							  "11111000" when "010111",   --7
							  "10000000" when "011000",   --8
							  "10010000" when "011001",   --9
							  "10001000" when "011010",   --A
							  "10000011" when "011011",   --b
							  "10100111" when "011100",   --c
							  "10100001" when "011101",   --D
							  "10000110" when "011110",   --E
							  "10001110" when "011111",   --F
							  -- Letters mode
							  "10011000" when "100000",	--g
							  "10001011" when "100001",	--h
							  "11001111" when "100010",	--I
							  "11000111" when "100011",	--J
							  "10001111" when "100100",	--k
							  "11000111" when "100101",	--L
							  "10101010" when "100110",	--m		
							  "10101011" when "100111",	--n	
							  "10100011" when "101000",	--o
							  "10001100" when "101001",	--P
							  "10010010" when "101010",	--s
							  "10101111" when "101011",	--r
							  "10000111" when "101100",	--t
							  "11100011" when "101101",	--u
							  "10010001" when "101110",	--y
							  "10100100" when "101111",	--z
							  -- On mode.
							  "00000000" when "111111",	--Switch all of the segments on.
							  "11111111" when others;   	--Switch off the display if unknown.
end Behavioral;