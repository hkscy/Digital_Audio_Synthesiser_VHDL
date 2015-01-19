----------------------------------------------------------------------------------
-- Company: 		UoB
-- Engineer: 		Christopher Hicks
-- Create Date:   14:51:36 01/15/2015 
-- Design Name: 	fmSynth
-- Module Name:   fmSynth - Behavioral 
-- Project Name: 	Digital Audio Synthesiser
-- Target Devices: Nexys3
-- Description: Multiplexes access to the CORDIC core between two FM operands.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity fmSynth is
    Port ( note_frequency : in  unsigned (23 downto 0); --Angular frequency of the note to play.
			  modAmplitude: in signed(4 downto 0);			  --Fed to the modulating operand, determines it's amplitude
			  carrierAmplitude: in signed(4 downto 0);	  --Fed to the carrier operand, determines it's amplitude
           clk : in  STD_LOGIC;								  --Input clock, expected 2.8228Mhz
           fmOut : out  STD_LOGIC_VECTOR (23 downto 0));--FM output signal.
end fmSynth;

architecture Behavioral of fmSynth is

	component SinCos
		port (
			s_axis_phase_tvalid : in std_logic;
			s_axis_phase_tdata  : in std_logic_vector(23 downto 0); --Angle in scaled radians
			m_axis_dout_tdata   : out std_logic_vector(47 downto 0) --Cos(angle)sin(angle)
			);
	end component;
	
	component fmOp
		port (
			osc_freq   			: in unsigned(23 downto 0); --Oscillator period	
			modulator			: in signed(23 downto 0);
			amplitude			: in signed(4 downto 0);
			m_axis_dout_tdata	: in std_logic_vector(47 downto 0); --sin(s_axis_phase_tdata)
			clk 		  			: in std_logic;
			s_axis_phase_tdata: out std_logic_vector(23 downto 0); --Scaled angle in radians
			fmOut 	  			: out std_logic_vector(23 downto 0)	
		);
	end component;
	
	signal cordicOut 			: std_logic_vector(47 downto 0);
	signal cordicCarrierOut : std_logic_vector(47 downto 0);
	signal cordicModOut		: std_logic_vector(47 downto 0);
	
	signal cordicIn 			: std_logic_vector(23 downto 0);
	signal cordicCarrierIn  : std_logic_vector(23 downto 0);
	signal cordicModIn		: std_logic_vector(23 downto 0);
	
	signal modOut : std_logic_vector(23 downto 0) := (others => '0');
	
	signal multiplex: std_logic := '0';

begin

	sc: SinCos port map( s_axis_phase_tvalid => '1',		--Input is valid
								s_axis_phase_tdata => cordicIn,  --Angle in scaled radians
								m_axis_dout_tdata => cordicOut );--cos(angle)sin(angle)

	modulator:	fmOp port map( osc_freq => note_frequency,		  --Input is note frequency	--
										modulator => (others => '0'),
										amplitude => modAmplitude,
										m_axis_dout_tdata => cordicModOut, --Cordic output, is input here.
										s_axis_phase_tdata => cordicModIn, --Output from mod is input to cordic
										clk => clk,
										fmOut => modOut);					  --mod signal out.
										
	carrier:	fmOp port map( osc_freq => note_frequency,
									modulator => signed(modOut),
									amplitude => carrierAmplitude,
									m_axis_dout_tdata => cordicCarrierOut,
									s_axis_phase_tdata => cordicCarrierIn,
									clk => clk,
									fmOut => fmOut);
									
	-- Alternate between serving the modulator and the carrier with the CORDIC								
	process(clk)
	begin
		if rising_edge(clk) then		--Serve the modulating operator
			if multiplex = '0' then
				cordicIn <= cordicModIn;
				cordicModOut <= cordicOut;
				multiplex <= not multiplex;
			else			
				cordicIn <= cordicCarrierIn;
				cordicCarrierOut <= cordicOut;
				multiplex <= not multiplex;
			end if;
		end if;
	end process;
	
end Behavioral;

