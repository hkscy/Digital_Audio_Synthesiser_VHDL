----------------------------------------------------------------------------------
-- Company: UoB	
-- Engineer: Christopher Hicks
-- 
-- Create Date:    19:06:00 01/07/2015 
-- Module Name:    UART_RX_CTRL - Behavioral 
-- Project Name: 	 Digital_Audio_Synthesiser
-- Description: 	 UART RX component, clock @ 100MHz for 31250 baud. 
-- Modified and inspired from: (FSM model used for design)
-- http://academic.csuohio.edu/chu_p/rtl/fpga_vhdl_book/fpga_vhdl_sample_chapter.pdf
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity UART_RX_CTRL is
    Port ( clk 			: in  STD_LOGIC;							 --22.582Mhz clock in.
           uart_rx 		: in  STD_LOGIC;							 --Serial UART RX
           uart_rx_word : out  STD_LOGIC_VECTOR (7 downto 0);--8Bit output word.
			  word_ready	: out	std_logic );						 --High when word ready.
end UART_RX_CTRL;

architecture Behavioral of UART_RX_CTRL is
	-- Counter constants
	constant OVER_CNT_MAX : std_logic_vector(5 downto 0) := "101011";--44 = 16*32077 baud
	
	-- This signal hosts the counter from which the oversampling and baud ticks are derived.
	signal overcounter : std_logic_vector(5 downto 0) := (others => '0');
	signal overclk		 : std_logic;

	--State machine states and signals.
	type state_type is (idle, start, data, stop);
	signal state, state_next: state_type;		  --Current state, next state
	signal nticks, nticks_next: unsigned(3 downto 0); --Number of sampling ticks.
	signal nbits, nbits_next: unsigned(2 downto 0); --Number of data bits received
	signal bits, bits_next: std_logic_vector(7 downto 0); --Retreived bits buffered.
	
begin

	oversmpclkgen: process(clk) --Generates the oversampling clock which ticks at 16*32077 baud
	begin
		if rising_edge(clk) then -- Only count rising edges.
			if overcounter = OVER_CNT_MAX then --After 43 roll back round to 0.
				overcounter <= (others => '0');
				overclk <= '1';
			else
				overcounter <= overcounter + 1;
				overclk <= '0';
			end if;
		end if;
	end process oversmpclkgen;	
	
	--Finite State Machine progression@ 16Xbaud rate
	fsm: process(clk)
	begin	
		if rising_edge(clk) then 
			state <= state_next;
			nticks <= nticks_next;
			nbits <= nbits_next;
			bits <= bits_next;
		end if;
	end process fsm;
	
	--FSM data path routing
	process(overclk, uart_rx, state, nticks, nbits, bits)
	begin
		state_next <= state;	
		nticks_next <= nticks;	
		nbits_next <= nbits;
		bits_next <= bits;
		word_ready <= '0';

		case state is
			when idle => --Wait for start bit
				if uart_rx = '0' then 				  --Start bit detected.
					state_next <= start;				  --Move to start state.
					nticks_next <= (others => '0'); --Reset tick counter for oversampling.
				end if;
			when start => --Synchronise clocks
				if overclk = '1' then
					if nticks = 7 then					  --Count to 7 in start state (half way through bit)
						state_next <= data;				  --Start bit detected, move on to reading data
						nticks_next <= (others => '0'); --Ready FSM for data state
						nbits_next <=  (others => '0'); --Ready FSM for data state.
					else
						nticks_next <= nticks +1; 		  --Increment tick counter
					end if;
				end if;
			when data => --Read in the 8 bits of data		
				if overclk = '1' then 
					if nticks = 15 then --i.e. Next bit available baud rate. (Divide by 16)
						nticks_next <= (others => '0'); --Roll counter back round to 0.
						bits_next <= uart_rx & bits(7 downto 1); --Shift this bit into register.
						if nbits = 7 then	--Have we read the whole word?
							state_next <= stop; --If yes then Stop reading bits
						else
							nbits_next <= nbits +1; --Else increment nbits.
						end if;
					else
						nticks_next <= nticks + 1;		  --Increment tick counter.
					end if;
				end if;		
			when stop =>
				if overclk = '1' then
					if nticks = 15 then --Sample stop bit at baud rate.
						state_next <= idle; --Return to ready state.
						word_ready <= '1';	--Signal word is ready
					else
						nticks_next <= nticks + 1;
					end if;
				end if;
		end case;
	end process;

	--Finally, copy the data onto the output.
	uart_rx_word <= bits;
	
end Behavioral;

