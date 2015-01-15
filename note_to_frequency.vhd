----------------------------------------------------------------------------------
-- Company: UoB
-- Engineer: Christopher Hicks
-- Create Date:    23:19:54 01/08/2015 
-- Module Name:    note_to_frequency - Behavioral 
-- Project Name: 	 Digital_Audio_Synthesiser
-- Description: 	 This takes a note input as an 8bit binary number, and outputs
--						 the frequency which this note represents.
--						 Frequencies from:
--						 http://www.sengpielaudio.com/calculator-notenames.htm
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity note_to_frequency is
    Port ( note : in  STD_LOGIC_VECTOR (7 downto 0);
           frequency : out  STD_LOGIC_VECTOR (14 downto 0));
end note_to_frequency;

	--Using bin(int(pow(2,21)/(1/((2*f)/(22.581e6))))) = scaled frequency.
	architecture Behavioral of note_to_frequency is
		constant C2: std_logic_vector(14 downto 0) := "000000011000010"; --130.813
	constant Csh2: std_logic_vector(14 downto 0) := "000000011001101"; --138.591
	constant D2: std_logic_vector(14 downto 0) := "000000011011010"; --146.832
	constant Dsh2: std_logic_vector(14 downto 0) := "000000011100111"; --155.563
	constant E2: std_logic_vector(14 downto 0) := "000000011110100"; --164.814
	constant F2: std_logic_vector(14 downto 0) := "000000100000011"; --174.614
	constant Fsh2: std_logic_vector(14 downto 0) := "000000100010010"; --184.997
	constant G2: std_logic_vector(14 downto 0) := "000000100100011"; --195.998
	constant Gsh2: std_logic_vector(14 downto 0) := "000000100110100"; --207.652
	constant A3: std_logic_vector(14 downto 0) := "000000101000110"; --220.000
	constant Ash3: std_logic_vector(14 downto 0) := "000000101011010"; --233.082
	constant B3: std_logic_vector(14 downto 0) := "000000101101110"; --246.942
	constant C3: std_logic_vector(14 downto 0) := "000000110000100"; --261.626Hz Middle C
	constant Csh3: std_logic_vector(14 downto 0) := "000000110011011"; --277.183
	constant D3: std_logic_vector(14 downto 0) := "000000110110100"; --293.665
	constant Dsh3: std_logic_vector(14 downto 0) := "000000111001110"; --311.127
	constant E3: std_logic_vector(14 downto 0) := "000000111101001"; --329.628
	constant F3: std_logic_vector(14 downto 0) := "000001000000110"; --349.228
	constant Fsh3: std_logic_vector(14 downto 0) := "000001000100101"; --369.994
	constant G3: std_logic_vector(14 downto 0) := "000001001000110"; --391.995
	constant Gsh3: std_logic_vector(14 downto 0) := "000001001101001"; --415.305
	constant A4: std_logic_vector(14 downto 0) := "000001010001101"; --440.000 Concert Pitch
	constant Ash4: std_logic_vector(14 downto 0) := "000001010110100"; --466.164
	constant B4: std_logic_vector(14 downto 0) := "000001011011101"; --493.883
	constant C4: std_logic_vector(14 downto 0) := "000001100001001"; --523.251
	constant Csh4: std_logic_vector(14 downto 0) := "000001100110111"; --554.365
	constant D4: std_logic_vector(14 downto 0) := "000001101101000"; --587.330
	constant Dsh4: std_logic_vector(14 downto 0) := "000001110011100"; --622.254
	constant E4: std_logic_vector(14 downto 0) := "000001111010011"; --659.255
	constant F4: std_logic_vector(14 downto 0) := "000010000001101"; --698.456
	constant Fsh4: std_logic_vector(14 downto 0) := "000010001001011"; --739.989
	constant G4: std_logic_vector(14 downto 0) := "000010010001100"; --783.991
	constant Gsh4: std_logic_vector(14 downto 0) := "000010011010010"; --830.609
	constant A5: std_logic_vector(14 downto 0) := "000010100011011"; --880.000
	
	constant Ash5: std_logic_vector(14 downto 0) := "000000101101001";	--932.328
	constant B5: std_logic_vector(14 downto 0) := "000010110111011";		--987.767
	constant C5: std_logic_vector(14 downto 0) := "000011000010010";		--1046.50
	constant Csh5: std_logic_vector(14 downto 0) := "000011001101111";	--1108.73
	constant D5: std_logic_vector(14 downto 0) := "000011011010001";		--1174.66
	constant Dsh5: std_logic_vector(14 downto 0) := "000011100111001";	--1244.51
	constant E5: std_logic_vector(14 downto 0) := "000011110100111";		--1318.51
	constant F5: std_logic_vector(14 downto 0) := "000100000011011";		--1396.91
	constant Fsh5: std_logic_vector(14 downto 0) := "000100010010111";	--1479.98
	constant G5: std_logic_vector(14 downto 0) := "000100100011001";		--1567.98
	constant Gsh5: std_logic_vector(14 downto 0) := "000100110100100";	--1661.22
	constant A6: std_logic_vector(14 downto 0) := "000101000110111";		--1760.00
	constant Ash6: std_logic_vector(14 downto 0) := "000101011010010";	--1864.66
	constant B6: std_logic_vector(14 downto 0) := "000101101110111";		--1975.53
	constant C6: std_logic_vector(14 downto 0) := "000110000100101";		--2093.00
	constant Csh6: std_logic_vector(14 downto 0) := "000110011011110";	--2217.46
	constant D6: std_logic_vector(14 downto 0) := "000110110100010";		--2349.32
	constant Dsh6: std_logic_vector(14 downto 0) := "000111001110010";	--2489.02
	constant E6: std_logic_vector(14 downto 0) := "000111101001110";		--2637.02
	constant F6: std_logic_vector(14 downto 0) := "001000000110111";		--2793.83
	constant Fsh6: std_logic_vector(14 downto 0) := "001000100101110";	--2959.96
	constant G6: std_logic_vector(14 downto 0) := "001001000110011";		--3135.96
	constant Gsh6: std_logic_vector(14 downto 0) := "001001101001000";	--3322.44
begin

	with note select
	frequency(14 downto 0) <= C2 when "00110000", --48
									Csh2 when "00110001", --49
									  D2 when "00110010", --50
									Dsh2 when "00110011", --51
									  E2 when "00110100", --52
									  F2 when "00110101", --53
									Fsh2 when "00110110", --54
									  G2 when "00110111", --55
									Gsh2 when "00111000", --56
									  A3 when "00111001", --57
									Ash3 when "00111010", --58
									  B3 when "00111011", --59
									  C3 when "00111100", --60 Middle C
									Csh3 when "00111101", --61
									  D3 when "00111110", --62
									Dsh3 when "00111111", --63
									  E3 when "01000000", --64
									  F3 when "01000001", --65
									Fsh3 when "01000010", --66
									  G3 when "01000011", --67
									Gsh3 when "01000100", --68
									  A4 when "01000101", --69 Concert Pitch 440Hz
									Ash4 when "01000110", --70
									  B4 when "01000111", --71
									  C4 when "01001000", --72
									Csh4 when "01001001", --73
									  D4 when "01001010", --74
									Dsh4 when "01001011", --75
									  E4 when "01001100", --76
									  F4 when "01001101", --77
									Fsh4 when "01001110", --78
									  G4 when "01001111", --79
									Gsh4 when "01010000", --80
									  A5 when "01010001", --81
									Ash5 when "01010010", --82
									  B5 when "01010011", --83
									  C5 when "01010100", --84
									Csh5 when "01010101", --85
									  D5 when "01010110", --86
									Dsh5 when "01010111", --87
									  E5 when "01011000", --88
									  F5 when "01011001", --89
									Fsh5 when "01011010", --90
									  G5 when "01011011", --91
									Gsh5 when "01011100", --92
									  A6 when "01011101", --93
									Ash6 when "01011110", --94
									  B6 when "01011111", --95
									  C6 when "01100000", --96
									Csh6 when "01100001", --97
									  D6 when "01100010", --98
									Dsh6 when "01100011", --99
									  E6 when "01100100", --100
									  F6 when "01100101", --101
									Fsh6 when "01100110", --102
									  G6 when "01100111", --103
									Gsh6 when "01101000", --104							
					 (others => '0') when others;

end Behavioral;

