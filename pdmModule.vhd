----------------------------------------------------------------------------------
-- Company: 		 UoB	
-- Engineer: 		 Christopher Hicks
-- 
-- Create Date:    19:08:30 12/29/2014 
-- Design Name: 	 pdmModule
-- Module Name:    pdmModule - Behavioral 
-- Project Name:	 Digital_Audio_Synthesiser 	
-- Target Devices: Nexys3
-- Description: 	 Converts 24-bit sine wave samples to a PDM stream.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_signed.all;

entity pdmModule is
    Port ( sineIn : in  STD_LOGIC_VECTOR (23 downto 0);
           clk : in  STD_LOGIC;
           pdmOutput : out  STD_LOGIC);
end pdmModule;

architecture Behavioral of pdmModule is
	
begin
	sample: process(clk)
		variable pdmBit: std_logic := '1';			--mod <- '1'
		variable sigma: std_logic_vector(23 downto 0) :=  X"000000";
		variable delta: std_logic_vector(23 downto 0);
	begin
		if rising_edge(clk) then 				--loop
			if pdmBit = '1' then	 				--if mod='1' then
				delta := sineIn - X"400000";	--δ <- σ + X"400000"
			else										--else
				delta := sineIn + X"400000";	--δ <- σ + X"400000"
			end if;									--end if			
			sigma := sigma + delta;				--σ <- σ + δ
			if sigma > X"000000" then			--if σ > X"000000" then
				pdmBit := '1';						--mod <- '1'
			else										--else
				pdmBit := '0';						--mod <- '0'
			end if;									--end if	
			pdmOutput <= pdmBit;					--pdmOutput <- mod
		end if; 										--end loop.
	end process sample;
end Behavioral;