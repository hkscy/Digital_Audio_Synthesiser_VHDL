----------------------------------------------------------------------------------
-- Company: UoB
-- Engineer: Christopher Hicks
-- 
-- Create Date:    13:09:17 12/26/2014 
-- Design Name: 	 counter.vhd
-- Module Name:    counter - Behavioral 
-- Project Name: 	 Lab_Two
-- Target Devices: Nexys3
-- Description: 	 Counter for lab 2 EE4G.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity counter is
	generic (N : integer); -- Generics pass specific information into an entity.
	port ( clock : in  std_logic;
			 count : inout  std_logic_vector(N-1 downto 0));
end counter;

architecture Behavioral of counter is
begin
	process(clock)
	begin
		if rising_edge(clock) then
			count <= count + 1;
		end if;
	end process;
end Behavioral;