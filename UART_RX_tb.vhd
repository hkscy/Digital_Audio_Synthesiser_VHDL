--------------------------------------------------------------------------------
-- Company: 		UoB
-- Engineer:		Christopher hicks
-- Create Date:   14:06:16 01/12/2015  
-- Module Name:   UART_RX_tb.vhd
-- Project Name:  Digital_Audio_Synthesiser
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UART_RX_CTRL, UART_RX_INTERFACE
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
 
ENTITY UART_RX_tb IS
END UART_RX_tb;
 
ARCHITECTURE behavior OF UART_RX_tb IS 
 
    -- Component Declaration for the Unit(s) Under Test (UUT)
    COMPONENT UART_RX_CTRL	--Deals with the raw UART_RX data arriving.
    PORT(
         clk : IN  std_logic;												--22.582Mhz clock in.
         uart_rx : IN  std_logic;										--Directly connected to HW pin.
         uart_rx_word : OUT  std_logic_vector(7 downto 0);		--8 bits compiled from uart_rx.
         word_ready : OUT  std_logic									--8 bits are valid to read.
        );
    END COMPONENT;
	 
	 component uart_rx_interface --One-word Buffer and FF for received data.
	 port(
			clk 		  	: in  STD_LOGIC;									--22.582Mhz clock in.
         clear_flag 	: in  STD_LOGIC;									--Set high one clock cycle after reading data.
         set_flag   	: in  STD_LOGIC;									--Set high with word_ready from uart_rx_ctrl.
         rx_word_in 	: in  STD_LOGIC_VECTOR (7 downto 0);		--UART_RX_word assembled by uart_rx_ctrl.
         rx_word_out : out STD_LOGIC_VECTOR (7 downto 0);		--8 bit data word ready to be used
         ready 		: out STD_LOGIC									--Indicates rx_word_out is ready.
		);
	 end component;
	 
	 component MIDI_parser	--Reads 8 bit words in MIDI format of status byte, data byte1, data byte 2
    port(
			clk 		  : in  STD_LOGIC;									--22.582Mhz clock in.
         data_ready : in  STD_LOGIC;									--Lets us know rx_word availability.
         data 		  : in  STD_LOGIC_VECTOR (7 downto 0);			--Most recent word received.
         frequency  : out STD_LOGIC_VECTOR (14 downto 0)			--Frequency we should be producing.
		);
	 end component;
	 
	--Note length define
	constant NOTE_LENGTH: integer := 8;

   --Inputs
   signal clk : std_logic := '0';		--22.582Mhz clock for processes.
	signal uart_clk : std_logic := '0';	--31250Hz clock for serial data
   signal uart_rx : std_logic := '1';	--Incoming 31250 8N1 RS232 data. always high to start.
	
	--Intermediate
	signal uart_rx_word : std_logic_vector(7 downto 0) := (others => '0');
	signal clear_flag : std_logic := '0';
	signal word_ready : std_logic	:= '0';
	signal rx_data : std_logic_vector(7 downto 0) := (others => '0');
	signal data_ready: std_logic := '0';
	
 	--Outputs
	signal frequency: std_logic_vector(14 downto 0) := (others => '0');

   -- Clock period definitions
   constant clk_period : time := 44.283 ns;	--22.581Mhz clock. 
	constant uart_period: time := 31.175 us;	--32077 ~MIDI baud. (closest to w\above clock) 31250 is MIDI. 2.6% out.
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut1: UART_RX_CTRL PORT MAP ( clk => clk,
									  uart_rx => uart_rx,
								uart_rx_word => uart_rx_word,
								  word_ready => word_ready );
	
	uut2: uart_rx_interface port map ( clk => clk,
										 clear_flag => clear_flag,
											set_flag => word_ready,
										 rx_word_in => uart_rx_word,
										rx_word_out => rx_data,
												ready => data_ready );
								 
	uut3: MIDI_parser port map ( clk => clk,
								 data_ready => data_ready,
										 data => rx_data,
								  frequency => frequency );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	clearFlag: process(word_ready, clk)
	begin
		if rising_edge(word_ready) then	--When new serial word is made available.
			clear_flag <= '1';				--Set clear one clock cycle after reading data
		end if;	
	end process clearFlag;          

   -- Stimulus process
   stim_proc: process
		--Simulation shift register for rx bits
		variable temp: std_logic_vector(9 downto 0); --Used to store the next serial message.
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		for note in 48 to 104 loop	--Test each available note, first turning it on then off.
			
			-- MIDI NOTE ON STATUS
			temp := "1100100000";
			for i in 0 to 9 loop
				uart_rx <= temp(i);
				wait for uart_period;
			end loop;
			
			-- MIDI DATA byte 1
			temp := "1" &  std_logic_vector(to_unsigned(note, NOTE_LENGTH)) & "0";
			for i in 0 to 9 loop
				uart_rx <= temp(i);
				wait for uart_period;
			end loop;
			
			-- MIDI DATA byte 2, velocity = 0x0
			temp := "1000000000";
			for i in 0 to 9 loop
				uart_rx <= temp(i);
				wait for uart_period;
			end loop;

			-- MIDI NOTE OFF STATUS
			temp := "1100000000";
			for i in 0 to 9 loop
				uart_rx <= temp(i);
				wait for uart_period;
			end loop;
			
			-- MIDI DATA byte 1
			temp := "1" & std_logic_vector(to_unsigned(note, NOTE_LENGTH)) & "0";
			for i in 0 to 9 loop
				uart_rx <= temp(i);
				wait for uart_period;
			end loop;
			
			-- MIDI DATA byte 2, velocity = 0x0
			temp := "1000000000";
			for i in 0 to 9 loop
				uart_rx <= temp(i);
				wait for uart_period;
			end loop;
			
		end loop; --Big loop which goes through all of the possible notes.
      wait;
	end process;

END;
