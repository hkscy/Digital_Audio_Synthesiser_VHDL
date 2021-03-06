----------------------------------------------------------------------------------
-- Company: 		 UoB
-- Engineer: 		 Christopher Hicks
-- 
-- Create Date:    19:30:31 12/27/2014 
-- Design Name: 	 sineGen.vhd
-- Module Name:    sineGen - Behavioral 
-- Project Name: 	 Digital Audio Synthesiser
-- Target Devices: Nexys3.
-- Description: 	 A phase counter that will increment a phase signal vector by an
--						 amount proportional to the desired frequency once every sample
--						 clock. The counter will need to wrap round from +pi to -pi
--						 radians.
----------------------------------------------------------------------------------
library IEEE;
use ieee.std_logic_unsigned.all;
USE ieee.std_logic_1164.ALL; 
use ieee.std_logic_arith.all;

entity sineGen is
    Port ( phaseInc : in  std_logic_vector(23 downto 0); -- s = sin(2πf) = sin(2πfi/fs)
												 -- i.e 40kHz on a 100Mhz clock = sin(2π40000i/10^8)
           clk : in  std_logic;
           output : out  std_logic_vector(23 downto 0));
end sineGen;

architecture Behavioral of sineGen is
	signal phaseCounter : std_logic_vector(23 downto 0) := (others => '0');
	signal sincosout : std_logic_vector(47 downto 0) := (others => '0');
	component SinCos
		port (
			s_axis_phase_tvalid : in std_logic;
			s_axis_phase_tdata  : in std_logic_vector(23 downto 0);
			m_axis_dout_tvalid : out std_logic;
			m_axis_dout_tdata   : out std_logic_vector(47 downto 0)
			);
	end component;
begin

	sc: SinCos port map( s_axis_phase_tvalid => '1',
								s_axis_phase_tdata => std_logic_vector(conv_signed(signed(phaseCounter(21 downto 0)), 24)),
							-- The conv_signed fn is used to extend the lower 22 bits of phaseCounter to 24 bits,
							-- meaning that the most positive phase value presented to the CORDIC will be X"1FFFFF"
								m_axis_dout_tdata => sincosout ); -- output
								
	process ( clk )
	begin
		if rising_edge(clk) then
			phaseCounter <= phaseCounter + phaseInc;
		end if;
	end process;
	
	output <= std_logic_vector(sincosout(47 downto 24));
	
end Behavioral;