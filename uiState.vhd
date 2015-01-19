----------------------------------------------------------------------------------
-- Company: 		 UoB
-- Engineer: 		 Christopher Hicks
-- Create Date:    13:02:47 01/16/2015 
-- Design Name: 	 uiState
-- Module Name:    uiState - Behavioral 
-- Project Name: 	 Digital_Audio_synthesiser
-- Target Devices: Nexys3
-- Description: 	 UI state machine controller.
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uiState is
    Port ( buttons 	 		 : in  std_logic_vector (4 downto 0); --Input from user.
			  clk			 		 : in  std_logic;							  --Clock
           number 	 		 : out std_logic_vector (15 downto 0);--Digits to display, 3 bits for each digit.
           modeVector 		 : out std_logic_vector (7 downto 0); --Interpret number as.
			  modAmplitude 	 : out signed(4 downto 0);			  	  --Modulating operand amplitude.
			  carrierAmplitude : out signed(4 downto 0));	  	  	  --Carrier operand amplitude.
end uiState;

architecture Behavioral of uiState is

	--Registers which store the aplitude of the FM operands.
	signal modAmpReg, modAmpRegNext  : signed(4 downto 0) := "00011";
	signal modAttack, modAttackNext  : unsigned(3 downto 0) := "0000";
	signal modRelease, modReleaseNext: unsigned(3 downto 0) := "0000";
	
	signal carAmpReg, carAmpRegNext  : signed(4 downto 0) := "00001";
	signal carAttack, carAttackNext  : signed(3 downto 0) := "0000";
	signal carRelease, carReleaseNext: signed(3 downto 0) := "0000";

	--Button macros
	constant CENTRE_BUTTON : std_logic_vector(4 downto 0) := "10000";
	constant LEFT_BUTTON   : std_logic_vector(4 downto 0) := "01000";
	constant UP_BUTTON     : std_logic_vector(4 downto 0) := "00100";
	constant RIGHT_BUTTON  : std_logic_vector(4 downto 0) := "00010";
	constant DOWN_BUTTON   : std_logic_vector(4 downto 0) := "00001";
	
	--Buffer the last button press, so that holding down == pressing once.
	signal buttonReg: std_logic_vector(4 downto 0) := (others => '0');
	
	--State signals.
	type state_type is (idle, carrier, carUp, carDown, carAtck, carRel, 
	modulator, modUp, modDown, modAtck, modRel);
	signal state, state_next : state_type := idle;
	
begin

	modAmplitude <= modAmpReg;
	carrierAmplitude <= carAmpReg;

	process(clk)
	begin
		if rising_edge(clk) then
			state <= state_next;
			buttonReg <= buttons;
			
			modAmpReg <= modAmpRegNext;
			modAttack <= modAttackNext;
			modRelease<= modReleaseNext;
			
			carAmpReg <= carAmpRegNext;
			carAttack <= carAttackNext;
			carRelease<= carReleaseNext;		
		end if;
	end process;

	process(buttons, state, modAmpReg, modAttack, modRelease, carAmpReg, carAttack, carRelease)
	begin
		state_next <= state;
		modAmpRegNext <= modAmpReg;
		modAttackNext <= modAttack;
		modReleaseNext <= modRelease;
		carAmpRegNext <= carAmpReg;
		carAttackNext <= carAttack;
		carReleaseNext <= carRelease;
		
		case state is
			when idle =>
				number <= X"0087"; 		  -- OffOff"o""n"
				modeVector <= "00001010"; -- off-off-letter-letter
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= modulator;
				end if;
			when carrier =>
				number <= X"0cab"; 		  -- Off"c""a""r"
				modeVector <= "00010110"; -- off-Number-Number-letter
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= idle;
				elsif buttons /= buttonReg and buttons = UP_BUTTON then
					state_next <= carUp;
				elsif buttons /= buttonReg and buttons = DOWN_BUTTON then
					state_next <= carDown;
				elsif buttons /= buttonReg and buttons = LEFT_BUTTON then  --modify attack
					state_next <= carAtck;
				elsif buttons /= buttonReg and buttons = RIGHT_BUTTON then --modify release
					state_next <= carRel;
				end if;
			when carUp =>
				number <= std_logic_vector("00000000000" & carAmpReg);
				modeVector <= "00000101"; --off,off,num,num
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= carrier;
				elsif buttons /= buttonReg and buttons = UP_BUTTON then
					carAmpRegNext <= carAmpReg + 1;
				end if;
			when carDown =>
				number <= std_logic_vector("00000000000" & carAmpReg);
				modeVector <= "00000101"; --off,off,num,num
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= carrier;
				elsif buttons /= buttonReg and buttons = DOWN_BUTTON then
					carAmpRegNext <= carAmpReg - 1;
				end if;
			when carAtck =>
				number <= std_logic_vector( X"000" & carAttack );
				modeVector <= "00000101"; --off,off,num,num
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= carrier;
				elsif buttons /= buttonReg and buttons = LEFT_BUTTON then
					carAttackNext <= carAttack + 1;
				end if;
			when carRel =>
				number <= std_logic_vector( X"000" & carRelease );
				modeVector <= "00000101"; --off,off,num,num
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= carrier;
				elsif buttons /= buttonReg and buttons = RIGHT_BUTTON then
					carReleaseNext <= carRelease + 1;
				end if;
			when modulator =>
				number <= X"068d"; 		  -- Off"m""o""d"
				modeVector <= "00101001"; -- off-letter-letter-number
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= carrier;
				elsif buttons /= buttonReg and buttons = UP_BUTTON then
					state_next <= modUp;
				elsif buttons /= buttonReg and buttons = DOWN_BUTTON then
					state_next <= modDown;
				elsif buttons /= buttonReg and buttons = LEFT_BUTTON then  --modify attack
					state_next <= modAtck;
				elsif buttons /= buttonReg and buttons = RIGHT_BUTTON then --modify release
					state_next <= modRel;
				end if;
			when modUp =>
				number <= std_logic_vector("00000000000" & unsigned(modAmpReg));
				modeVector <= "00000101"; --off,off,num,num
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= modulator;
				elsif buttons /= buttonReg and buttons = UP_BUTTON then
					modAmpRegNext <= modAmpReg + 1;
				end if;
			when modDown =>
				number <= std_logic_vector("00000000000" & unsigned(modAmpReg));
				modeVector <= "00000101"; --off,off,num,num
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= modulator;
				elsif buttons /= buttonReg and buttons = DOWN_BUTTON then
					modAmpRegNext <= modAmpReg - 1;
				end if;
			when modAtck =>
				number <= std_logic_vector( X"000" & modAttack );
				modeVector <= "00000101"; --off,off,num,num
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= modulator;
				elsif buttons /= buttonReg and buttons = LEFT_BUTTON then
					modAttackNext <= modAttack + 1;
				end if;
			when modRel =>
				number <= std_logic_vector( X"000" & modRelease );
				modeVector <= "00000101"; --off,off,num,num
				if buttons /= buttonReg and buttons = CENTRE_BUTTON then
					state_next <= modulator;
				elsif buttons /= buttonReg and buttons = RIGHT_BUTTON then
					modReleaseNext <= modRelease + 1;
				end if;
		end case;
	end process;

end Behavioral;

