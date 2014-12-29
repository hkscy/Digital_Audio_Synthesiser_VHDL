----------------------------------------------------------------------------------
-- Company:        University of Birmingham
-- Engineer:       Tim Collins
-- Create Date:    10:30 20/10/2014
-- Design Name:    Lab 3 
-- Module Name:    nx3_audio - Behavioral 
-- Project Name:   Lab 3
-- Target Devices: xc6slx16
-- Description:    Start file for lab 3 and assignment
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
	signal phase : std_logic_vector(23 downto 0);
	signal sincosout : std_logic_vector(47 downto 0);
	component SinCos
		port (
			s_axis_phase_tvalid : in std_logic;
			s_axis_phase_tdata  : in std_logic_vector(23 downto 0);
			m_axis_dout_tvalid  : out std_logic;
			m_axis_dout_tdata   : out std_logic_vector(47 downto 0)
			);
	end component;
begin
	sc: SinCos port map( s_axis_phase_tvalid => '1', -- is phase input valid?
								s_axis_phase_tdata => phase, -- input angle we want to calculate the sine and cosine of.
							-- m_axis_dout_tvalid => , unconnected, is output valid?
								m_axis_dout_tdata => sincosout ); -- sine of input (47 downto 24), cosine if input(23 downto 0)
	-- Audio output pins (set to zero for now)
	audioOut <= "00";
	
	-- Test the SinCos core using switches.
	phase(23 downto 16) <= switches;
	phase(15 downto 0) <= (others => '0');
	leds(7 downto 0) <= sincosout(47 downto 40); --8msb of sin(phase)
	
	digit <= "1110";           -- Address the rightmost 7-segment display
	segments <= "11111111";    -- Switch off the 7 segment display addressed by "digit" 
end Behavioral;   