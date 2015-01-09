----------------------------------------------------------------------------------
-- Company: UoB
-- Engineer: Christopher Hicks
-- Create Date:    23:19:54 01/08/2015 
-- Module Name:    note_to_frequency - Behavioral 
-- Project Name: 	 Digital_Audio_Synthesiser
-- Description: 	 This takes a note input as an 8bit binary number, and outputs
--						 the frequency which this note represents.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity note_to_frequency is
    Port ( note : in  STD_LOGIC_VECTOR (7 downto 0);
           frequency : out  STD_LOGIC_VECTOR (14 downto 0));
end note_to_frequency;

architecture Behavioral of note_to_frequency is
	constant C2: std_logic_vector(14 downto 0) := "000000110000101";		--130.813
	constant Csh2: std_logic_vector(14 downto 0) := "000000110000101"; 	--138.591
	constant D2: std_logic_vector(14 downto 0) := "000000110000101"; 		--146.832
	constant Dsh2: std_logic_vector(14 downto 0) := "000000110000101";	--155.563
	constant E2: std_logic_vector(14 downto 0) := "000000110000101";		--164.814
	constant F2: std_logic_vector(14 downto 0) := "000000110000101";		--174.614
	constant Fsh2: std_logic_vector(14 downto 0) := "000000110000101";	--184.997
	constant G2: std_logic_vector(14 downto 0) := "000000110000101";		--195.998
	constant Gsh2: std_logic_vector(14 downto 0) := "000000110000101";	--207.652
	constant A3: std_logic_vector(14 downto 0) := "000000110000101";		--220.000
	constant Ash3: std_logic_vector(14 downto 0) := "000000110000101";	--233.082
	constant B3: std_logic_vector(14 downto 0) := "000000110000101";		--246.942
	constant C3: std_logic_vector(14 downto 0) := "000000110000101";		--261.626Hz Middle C
	constant Csh3: std_logic_vector(14 downto 0) := "000000110000101"; 	--277.183
	constant D3: std_logic_vector(14 downto 0) := "000000110000101"; 		--293.665
	constant Dsh3: std_logic_vector(14 downto 0) := "000000110000101";	--311.127
	constant E3: std_logic_vector(14 downto 0) := "000000110000101";		--329.628
	constant F3: std_logic_vector(14 downto 0) := "000000110000101";		--349.228
	constant Fsh3: std_logic_vector(14 downto 0) := "000000110000101";	--369.994
	constant G3: std_logic_vector(14 downto 0) := "000000110000101";		--391.995
	constant Gsh3: std_logic_vector(14 downto 0) := "000000110000101";	--415.305
	constant A4: std_logic_vector(14 downto 0) := "000000110000101";		--440.000 Concert Pitch
	constant Ash4: std_logic_vector(14 downto 0) := "000000110000101";	--466.164
	constant B4: std_logic_vector(14 downto 0) := "000000110000101";		--493.883
	constant C4: std_logic_vector(14 downto 0) := "000000110000101";		--523.251
	constant Csh4: std_logic_vector(14 downto 0) := "000000110000101";	--554.365
	constant D4: std_logic_vector(14 downto 0) := "000000110000101";		--587.330
	constant Dsh4: std_logic_vector(14 downto 0) := "000000110000101";	--622.254
	constant E4: std_logic_vector(14 downto 0) := "000000110000101";		--659.255
	constant F4: std_logic_vector(14 downto 0) := "000000110000101";		--698.456
	constant Fsh4: std_logic_vector(14 downto 0) := "000000110000101";	--739.989
	constant G4: std_logic_vector(14 downto 0) := "000000110000101";		--783.991
	constant Gsh4: std_logic_vector(14 downto 0) := "000000110000101";	--830.609
	constant A5: std_logic_vector(14 downto 0) := "000000110000101";		--880.000
	constant Ash5: std_logic_vector(14 downto 0) := "000000110000101";	--932.328
	constant B5: std_logic_vector(14 downto 0) := "000000110000101";
	constant C5: std_logic_vector(14 downto 0) := "000000110000101";
	constant Csh5: std_logic_vector(14 downto 0) := "000000110000101";
	constant D5: std_logic_vector(14 downto 0) := "000000110000101";
	constant Dsh5: std_logic_vector(14 downto 0) := "000000110000101";
	constant E5: std_logic_vector(14 downto 0) := "000000110000101";
	constant F5: std_logic_vector(14 downto 0) := "000000110000101";
	constant Fsh5: std_logic_vector(14 downto 0) := "000000110000101";
	constant G5: std_logic_vector(14 downto 0) := "000000110000101";
	constant Gsh5: std_logic_vector(14 downto 0) := "000000110000101";
	constant A6: std_logic_vector(14 downto 0) := "000000110000101";
	constant Ash6: std_logic_vector(14 downto 0) := "000000110000101";
	constant B6: std_logic_vector(14 downto 0) := "000000110000101";
	constant C6: std_logic_vector(14 downto 0) := "000000110000101";
	constant Csh6: std_logic_vector(14 downto 0) := "000000110000101";
	constant D6: std_logic_vector(14 downto 0) := "000000110000101";
	constant Dsh6: std_logic_vector(14 downto 0) := "000000110000101";
	constant E6: std_logic_vector(14 downto 0) := "000000110000101";
	constant F6: std_logic_vector(14 downto 0) := "000000110000101";
	constant Fsh6: std_logic_vector(14 downto 0) := "000000110000101";
	constant G6: std_logic_vector(14 downto 0) := "000000110000101";
	constant Gsh6: std_logic_vector(14 downto 0) := "000000110000101";
begin

	with note select
	frequency(14 downto 0) <= C3 when "00111100", --60
					 (others => '0') when others;

end Behavioral;

