----------------------------------------------------------------------------------
-- Company:        University of Birmingham
-- Engineer:       Christopher Hicks
-- Create Date:    20/12/2014
-- Design Name:    Lab 3 
-- Module Name:    nx3_audio - Behavioral 
-- Project Name:   Lab 3
-- Target Devices: xc6slx16
-- Description:    First complete test system. 
--						 Uses the same parameters as the Direct Stream Digital system used
--						 by Super Audio CDs. i.e. One bit sampled at 2.8224Mhz.
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.ALL;

entity nx3_audio is
  Port ( clk      : in  std_logic; 								--100Mhz board clock.
         buttons  : in  std_logic_vector (4 downto 0);	--Buttons
         switches : in  std_logic_vector (7 downto 0);   --8-bit Switches 
         leds     : out  std_logic_vector (7 downto 0);	--LEDs
         digit    : out  std_logic_vector (3 downto 0);	--Display digits.
         segments : out  std_logic_vector (7 downto 0);	--Display segments.
         audioOut : out  std_logic_vector (1 downto 0);	--Connected to 3.5mm jack.
			uart_tx	: out	 std_logic;								--Serial transmit pin.
			uart_rx	: in	 std_logic );							--Serial receive pin.
end nx3_audio;

architecture Behavioral of nx3_audio is
	-- Sound generating constants
	constant MAX_FREQUENCY: std_logic_vector(23 downto 0) := "000000000111111110110001"; --22kHz.
	
	-- Button macros
	constant CENTRE_BUTTON : std_logic_vector(4 downto 0) := "10000";
	constant LEFT_BUTTON   : std_logic_vector(4 downto 0) := "01000";
	constant UP_BUTTON     : std_logic_vector(4 downto 0) := "00100";
	constant RIGHT_BUTTON  : std_logic_vector(4 downto 0) := "00010";
	constant DOWN_BUTTON   : std_logic_vector(4 downto 0) := "00001";
	
	-- Sound generating signals.
	signal frequency: std_logic_vector(23 downto 0) := (others => '0');
	signal freqSweep: std_logic_vector(14 downto 0) := (others => '0');
	signal sineGenOut: std_logic_vector(23 downto 0);
	
	-- Timing signals.
	signal sampleClock: std_logic := '0'; --@22.528Mhz
	signal pdmClock: std_logic := '0'; --@2.8228Mhz
	signal msclk: std_logic := '0'; --@100Hz, 10ms.
	
	-- Audio signals.
	signal audioOutMono: std_logic := '0';
	
	-- Input buttons signal
	signal buttons_deb: std_logic_vector(4 downto 0);
	
	-- Asynchronous control signals.
	--signal sweep_trigger: std_logic := '0';
	
	-- Display driving signals.
	signal displayBigCount: std_logic_vector(14 downto 0); --Controls the display refresh rate.
	signal displaySmallCount: std_logic_vector(1 downto 0); --bigCount subset which multiplexes display digits.
	signal modeVector: std_logic_vector(7 downto 0) := "00000000"; --So we can alternatley display numbers and letters.
	signal mode: std_logic_vector(1 downto 0) := "00"; --00 Off, 01 Numbers, 10 Letters , 11 On.
	signal number: std_logic_vector(15 downto 0) := (others => '0');
	signal num: std_logic_vector(3 downto 0) := "0000";
	
	-- UART signals
	signal uart_rx_word: std_logic_vector(7 downto 0);
	signal word_ready: std_logic;
	
	--MIDI note constants
	constant NOTE_ON: std_logic_vector(7 downto 0) := "10010000";
	constant NOTE_OFF: std_logic_vector(7 downto 0) := "10000000";
	
	--MIDI FSM signals.
	type state_type is (status, data1_on, data1_off, data2);
	signal midi_state: state_type := status;	--Current state
	signal midi_state_n: state_type;				--Next state
	signal note: std_logic_vector(7 downto 0) := (others => '0');
	signal note_frequency: std_logic_vector(14 downto 0) := (others => '0');
	
	component dcm --22.5792MHz sample clock, 22.582Mhz actual.
		port (
			clk_in1  : in std_logic;
			clk_out1 : out std_logic );
	end component;
	
	component audioClock --Divides by 8, yields 2.8224 Mhz, 2.8228Mhz actual
		port (
			clk_in2	: in std_logic;
			clk_out2	: out std_logic );
	end component;
	
	component msClock -- Divives it's input by 28220, used here for ~100Hz (10ms)
		port (
			clk_in3  : in std_logic;
			clk_out3 : out std_logic);
	end component;
	
	component counter	-- Generic counter of N bits.
		generic(N : integer);
		port(
			clock: in std_logic;
			count: inout std_logic_vector(N-1 downto 0));
	end component counter;
	
	component sineGen --Sine Wave Oscillator
		port (
			phaseInc : in  std_logic_vector(23 downto 0); --s = sin(2πfi/system_clk_Hz)
				  clk : in  STD_LOGIC;
			  output : out  STD_LOGIC_VECTOR(23 downto 0));
	end component sineGen;
	
	component pdmModule -- PDM output
		port (
			sineIn 	 : in  std_logic_vector(23 downto 0);
         clk 		 : in  std_logic;
         pdmOutput : out  std_logic);
	end component;
	
	component display_driver -- Converts numbers to display segments.
		port(
			mode: in std_logic_vector(1 downto 0); --00 Off, 01 Numbers, 10 Letters , 11 On.
			number: in std_logic_vector(3 downto 0);
			segs	: out std_logic_vector(7 downto 0));
	end component display_driver;
	
	component btn_debounce -- Debounces the on-board 5-direction buttons.
		port(
			btn_i : in std_logic_vector(4 downto 0);
			clk : in std_logic;          
			btn_o : out std_logic_vector(4 downto 0));
	end component btn_debounce;
	
	component UART_RX_CTRL -- Asynchronous receiver turns rx serial into 8bit words.
		port(
			clk 			 : in std_logic;
			uart_rx 		 : in std_logic;
			uart_rx_word : out std_logic_vector(7 downto 0);
			word_ready	 : out std_logic);
	end component UART_RX_CTRL;
	
	component note_to_frequency --Converts note numbers (48-104) to scaled frequencies.
		port(
			note			: in std_logic_vector(7 downto 0);
			frequency	: out std_logic_vector(14 downto 0));
	end component note_to_frequency;
		
begin
	sample_clock: dcm port map( clk_in1 => clk, -- Create sample clock @ 22.5792Mhz.
										clk_out1 => sampleClock );
	
	dcm_clock: audioClock port map ( clk_in2 => sampleClock,
											  clk_out2 => pdmClock ); -- Derive pdm clock @ 2.8224Mhz.

--	ms_clk: msClock port map ( clk_in3 => pdmClock,
--											clk_out3 => msclk ); -- 1kHz clock.

	dd: display_driver port map( mode => mode,
										  number => num, 
											 segs => segments );

	c: counter generic map( N => 15 ) -- Counter controls display refresh rate.
				  port map ( clock => sampleClock,
								 count => displayBigCount );

	sGen: sineGen port map( phaseInc => frequency, --Generates sine wave at given frequency.
										  clk => pdmClock,
									  output => sineGenOut );
	
	pdm: pdmModule port map( sineIn => sineGenOut, -- Generates PDM signal for audio out.
										 clk => pdmClock,
								 pdmOutput => audioOutMono );
								 
	button_debounce: btn_debounce port map( btn_i => buttons, -- Debounces the buttons
															clk => pdmClock,
														 btn_o => buttons_deb );
														 
	uartrx: UART_RX_CTRL port map( clk => sampleClock,
										uart_rx => uart_rx,
								 uart_rx_word => uart_rx_word,
									word_ready => word_ready );					
	
	n2f: note_to_frequency port map ( note => note,
										  frequency => note_frequency );
									
	process(buttons_deb)
	begin
		case buttons_deb is
			when CENTRE_BUTTON =>
				--leds(7 downto 0) <= (others => '1'); -- light 'em up!
				number <= X"0DC1"; --"0"-"u"-"c"-"h" 
				modeVector <= "01100110"; -- number-letter-number-letter	
			when LEFT_BUTTON =>
				--leds(7 downto 0) <= "11110000";
				number <= X"5EFC"; --"L"-"e"-"f"-"t" 
				modeVector <= "10010110"; -- let-num-num-let
			when RIGHT_BUTTON =>
				--leds(7 downto 0) <= "00001111";
				number <= X"B2CE"; --"r"-"I"-"t"-"E" 
				modeVector <= "10101001"; -- let-let-let-num
			when others =>
				--leds(7 downto 0) <= (others => '0');
				number <= X"0087"; --OffOff"o""n"
				modeVector <= "00001010"; -- off-off-letter-letter
		end case;
	end process;
	
	--Make some noise! 
--	noisy : process(msclk)
--	begin
--		if sweep_trigger = '1' then	
--			if rising_edge(msclk) then
--				freqSweep <= freqSweep + 10;
--				if freqSweep < MAX_FREQUENCY then
--					frequency(14 downto 0) <= freqSweep;	
--				else
--					freqSweep <= (others => '0');
--				end if;
--			end if;
--		else --Not pressing button
--			freqSweep <= (others => '0');
--			frequency(14 downto 0) <= freqSweep;
--		end if;	
--	end process noisy;
	
	-- Control the seven segment display output defined by number and modeVector.
	displaySmallCount <= displayBigCount(14 downto 13);
	multiplex_display: process( displaySmallCount, number, modeVector )
	begin
		case displaySmallCount is
			when "00" =>
				mode <= modeVector(1 downto 0);
				num <= number(3 downto 0);
				digit <= "1110";
			when "01" =>
				mode <= modeVector(3 downto 2);
				num <= number(7 downto 4);
				digit <= "1101";
			when "10" =>
				mode <= modeVector(5 downto 4);
				num <= number(11 downto 8);
				digit <= "1011";
			when "11" =>
				mode <= modeVector(7 downto 6);
				num <= number(15 downto 12);
				digit <= "0111";
			when others =>
				digit <= "1111";
			end case;
	end process multiplex_display;
	
--	midi_fsm: process(sampleClock)
--	begin	
--		if rising_edge(sampleClock) then 
--			midi_state <= midi_state_n; 
--		end if;
--	end process midi_fsm;
--	
--	process(word_ready)
--	begin
--		case midi_state is
--			when status => --Waiting for a new MIDI note/Incoming MIDI note status byte (On/Off)
--				leds <= "11000000";
--				if word_ready = '1' then
--					if (uart_rx_word = NOTE_ON) then
--						midi_state_n <= data1_on;
--					elsif uart_rx_word = NOTE_OFF then
--						midi_state_n <= data1_off;
--					else
--						midi_state_n <= status;
--					end if;
--				end if;
--			when data1_on =>	--Incoming MIDI data byte 1, contains note number to turn ON.
--				if word_ready = '1' then
--					leds <= "00110000";
--					note <= uart_rx_word;
--					frequency(23 downto 15) <= (others => '0');
--					frequency(14 downto 0) <= note_frequency;
--					midi_state_n <= data2;
--				end if;
--			when data1_off =>	--Incoming MIDI data byte 1, contains note number to turn OFF.
--				if word_ready = '1' then
--					leds <= "00001100";
--					if (note = uart_rx_word) then --If we're currently playing this note,
--							note <= (others => '0'); --Turn the note off.
--							frequency(23 downto 15) <= (others => '0');
--							frequency(14 downto 0) <= note_frequency;
--					end if;
--					midi_state_n <= data2;
--				end if;
--			when data2 =>	--Incoming MIDI data byte 2, contains velocity.
--				leds <= "00000011";
--				if word_ready = '1' then
--					-- In future check that this = '0' and do something useful if not.
--					midi_state_n <= status;
--				end if;
--		end case;	
--	end process;

	rx_word: process(word_ready)
	begin
		if rising_edge(word_ready) then
			leds <= uart_rx_word;
			note <= uart_rx_word;
			frequency(23 downto 15) <= (others => '0');
			frequency(14 downto 0) <= note_frequency;
		end if;
	end process rx_word;
	
--	process(sampleClock)
--	begin
--		if rising_edge(sampleClock) then
--			frequency(24 downto 15) <= (others => '0');
--			frequency(14 downto 0) <= note_frequency;
--		end if;
--	end process;
	
	-- Audio output pins, output the PDM signal both left and right.
	audioOut(0) <= audioOutMono;
	audioOut(1) <= audioOutMono;
	
	-- Keep the compiler happy with the below statements.
	uart_tx <= '0';

end Behavioral;   