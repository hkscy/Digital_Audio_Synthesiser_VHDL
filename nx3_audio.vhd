----------------------------------------------------------------------------------
-- Company:        University of Birmingham
-- Engineer:       Christopher Hicks
-- Create Date:    20/12/2014
-- Design Name:    Lab 3 
-- Module Name:    nx3_audio - Behavioral 
-- Project Name:   Lab 3
-- Target Devices: xc6slx16
-- Description:    First complete test system. 
--						 Uses the same parameters as the Direct Stream Digital system used
--						 by Super Audio CDs. i.e. One bit sampled at 2.8224Mhz.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity nx3_audio is
  Port ( clk      : in  std_logic;
         buttons  : in  std_logic_vector (4 downto 0);
         switches : in  std_logic_vector (7 downto 0);  
         leds     : out  std_logic_vector (7 downto 0);
         digit    : out  std_logic_vector (3 downto 0);
         segments : out  std_logic_vector (7 downto 0);
         audioOut : out  std_logic_vector (1 downto 0));
end nx3_audio;

architecture Behavioral of nx3_audio is
	signal frequency: std_logic_vector(23 downto 0);-- := "111010000011000000000000"; --5kHz
	signal freqSweep: std_logic_vector(18 downto 0) := (others => '0');
	signal sineGenOut: std_logic_vector(23 downto 0);
	
	signal sampleClock : std_logic := '0'; --@22.5792Mhz
	signal pdmClock: std_logic := '0'; --@2.8224Mhz
	signal msclk: std_logic := '0'; --@1kHz
	
	signal audioOutMono: std_logic := '0';
	
	component dcm --22.5792MHz sample clock
		port (
			clk_in1  : in std_logic;
			clk_out1 : out std_logic );
	end component;
	
	component audioClock --Divides it's input clock by 8, yields 2.8224 Mhz.
		port (
			clk_in2	: in std_logic;
			clk_out2	: out std_logic );
	end component;
	
	component msClock -- Divives it's input by 2822, used here for ~1000Hz
		port (
			clk_in3  : in std_logic;
			clk_out3 : out std_logic );
	end component;
	
	component sineGen --Sine Wave Oscillator
		port (
			phaseInc : in  std_logic_vector(23 downto 0); --s = sin(2πfi/system_clk_Hz)
				  clk : in  STD_LOGIC;
			  output : out  STD_LOGIC_VECTOR(23 downto 0));
	end component sineGen;
	
	component pdmModule --PDM output
		port (
			sineIn 	 : in  std_logic_vector(23 downto 0);
         clk 		 : in  std_logic;
         pdmOutput : out  std_logic );
	end component;
	
begin
	sample_clock: dcm port map( clk_in1 => clk,	-- Create sample clock @ 22.5792Mhz.
										clk_out1 => sampleClock );
	
	dcm_clock: audioClock port map ( clk_in2 => sampleClock,
											  clk_out2 => pdmClock ); -- Derive pdm clock @ 2.8224Mhz.

	ms_clk: msClock port map ( clk_in3 => pdmClock,
											clk_out3 => msclk ); -- 1kHz clock.

	sGen: sineGen port map( phaseInc => frequency,
										  clk => pdmClock,
									  output => sineGenOut );
	
	pdm: pdmModule port map( sineIn => sineGenOut,
										 clk => pdmClock,
								 pdmOutput => audioOutMono );
	
	-- Audio output pins (set to zero for now)
	audioOut(0) <= audioOutMono;
	audioOut(1) <= audioOutMono;
	
	--Sweep audible spectrum. 
	-- 20Hz  = 0b111010000000000000000000
	-- 5kHz =  0b111010000011000000000000
	-- 20kHz = 0b111010000011010000000000
	frequency(23 downto 0) <= "000000000001110100000110";
--	process(msclk)
--	begin
--		frequency(18 downto 0) <= freqSweep;
--	end process;
	
	-- Test the SinCos core using switches.
	--frequency(23 downto 16) <= switches;
	--frequency(15 downto 0) <= (others => '0');
	leds(7 downto 0) <= sineGenOut(23 downto 16); --8 msb of sin(phase)
	
	digit <= "1110";           -- Address the rightmost 7-segment display
	segments <= "11111111";    -- Switch off the 7 segment display addressed by "digit" 
end Behavioral;   