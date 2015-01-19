----------------------------------------------------------------------------------
-- Company: 		 UoB
-- Engineer: 		 Christopher Hicks
-- 
-- Create Date:    01/14/2015 
-- Design Name: 	 fmOperator.vhd
-- Module Name:    fmOperator - Behavioral 
-- Project Name: 	 Digital Audio Synthesiser
-- Target Devices: Nexys3.
-- Description: 	 An FM operator module
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fmOp is
	port (
		osc_freq   : in unsigned(23 downto 0); --Oscillator period	
		modulator  : in signed(23 downto 0); --Modulating signal
		amplitude  : in signed(4 downto 0);
		m_axis_dout_tdata   : in std_logic_vector(47 downto 0);
		s_axis_phase_tdata  : out std_logic_vector(23 downto 0);
		clk 		  : in std_logic;
		fmOut 	  : out std_logic_vector(23 downto 0)
		
	);
end fmOp;

architecture behavioural of fmOp is
	signal phaseCounter : signed(23 downto 0) := (others => '0');
	signal sincosout : unsigned(47 downto 0) := (others => '0');

begin
	s_axis_phase_tdata <= std_logic_vector(to_signed(to_integer(modulator(21 downto 0) + amplitude*phaseCounter(21 downto 0)), 24));
							-- The conv_signed fn is used to extend the lower 22 bits of phaseCounter to 24 bits,
							-- meaning that the most positive phase value presented to the CORDIC will be X"1FFFFF"
	--Generate wave form	
	fmOut <= std_logic_vector( sincosout(47 downto 24) ); 
	
	process ( clk )
	begin
		if rising_edge(clk) then
			phaseCounter <= phaseCounter + signed(osc_freq);
			sincosout <= unsigned(m_axis_dout_tdata);
		end if;
	end process;

end architecture behavioural;