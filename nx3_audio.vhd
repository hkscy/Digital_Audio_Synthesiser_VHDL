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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity nx3_audio is
  Port ( clk      : in  STD_LOGIC;
         buttons  : in  STD_LOGIC_VECTOR (4 downto 0);
         switches : in  STD_LOGIC_VECTOR (7 downto 0);  
         leds     : out  STD_LOGIC_VECTOR (7 downto 0);
         digit    : out  STD_LOGIC_VECTOR (3 downto 0);
         segments : out  STD_LOGIC_VECTOR (7 downto 0);
         audioOut : out  STD_LOGIC_VECTOR (1 downto 0));
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
	END COMPONENT;
begin
	sc: SinCos port map( s_axis_phase_tvalid => '1',
									  s_axis_phase_tdata => phase,
									  -- m_axis_dout_tvalid => , unconnected.
									   m_axis_dout_tdata => sincosout );
	-- Audio output pins (set to zero for now)
	audioOut <= "00";
	
	-- Test the SinCos core using switches.
	phase(23 downto 16) <= switches;
	phase(15 downto 0) <= (others => '0');
	leds(7 downto 0) <= sincosout(47 downto 40);
	
	digit <= "1110";           -- Address the rightmost 7-segment display
	segments <= "11111111";    -- Switch off the 7 segment display addressed by "digit" 
end Behavioral;   