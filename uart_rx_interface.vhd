----------------------------------------------------------------------------------
-- Company: 		Christopher Hicks
-- Engineer:		UoB 
-- Create Date:   19:59:47 01/11/2015 
-- Module Name:   uart_rx_interface - Behavioral 
-- Description: 	A flip flop and one word buffer, prevents the same uart rx
--						word from being received multiple times.
-- Modified and inspired from: (FSM model used for design)
-- http://academic.csuohio.edu/chu_p/rtl/fpga_vhdl_book/fpga_vhdl_sample_chapter.pdf
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity uart_rx_interface is
    Port ( clk : in  STD_LOGIC;
           clear_flag : in  STD_LOGIC;
           set_flag : in  STD_LOGIC;
           rx_word_in : in  std_logic_vector (7 downto 0);
           rx_word_out : out  std_logic_vector (7 downto 0);
           ready : out  STD_LOGIC);
end uart_rx_interface;

architecture Behavioral of uart_rx_interface is
	signal bufferReg, bufferNext: std_logic_vector(7 downto 0);	--Buffer space for uart_rx_word
	signal flagReg, flagNext: std_logic;						--Buffer space for word_ready
begin

	--Flip flop and register
	process(clk)
	begin
		if rising_edge(clk) then
			bufferReg <= bufferNext;
			flagReg <= flagNext;
		end if;
	end process;
	
	--Next state logic
	process(bufferReg, flagReg, set_flag, clear_flag, rx_word_in)
	begin
		bufferNext <= bufferReg;
		flagNext <= flagReg;
		if set_flag = '1' then
			bufferNext <= rx_word_in;
			flagNext <= '1';
		elsif clear_flag = '1' then
			flagNext <= '0';
		end if;
	end process;
	
	--Output logic
	rx_word_out <= bufferReg;
	ready <= flagReg;

end Behavioral;

