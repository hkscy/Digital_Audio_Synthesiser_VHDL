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
library IEEE;
USE ieee.std_logic_1164.ALL; 
use ieee.std_logic_unsigned.all;

entity fmOp is
    Port ( centre_freq : in  std_logic_vector(23 downto 0); --Centre of oscillation
           clk : in  STD_LOGIC;
           fmOut : out  std_logic_vector(23 downto 0));
end fmOp;

architecture Behavioral of fmOp is
		
begin
	fmOut <= centre_freq;
	
end Behavioral;