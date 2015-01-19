--------------------------------------------------------------------------------
-- Company: University of Birmingham
-- Engineer: Tim Collins
--
-- Create Date:   10/22/2014
-- Module Name:   sincos_tb.vhd
-- Project Name:  SineTest
-- 
-- VHDL Test Bench Created by ISE for module: SinCos
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL; 
USE IEEE.STD_LOGIC_ARITH.ALL;
USE std.textio.all;

ENTITY sincos_tb IS
END sincos_tb;
 
ARCHITECTURE behavior OF sincos_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT) 
    COMPONENT SinCos
    PORT(
         s_axis_phase_tvalid : IN  std_logic;
         s_axis_phase_tdata : IN  std_logic_vector(23 downto 0);
         m_axis_dout_tvalid : OUT  std_logic;
         m_axis_dout_tdata : OUT  std_logic_vector(47 downto 0)
        );
    END COMPONENT;
	 
   --Inputs
   signal s_axis_phase_tvalid : std_logic := '1';
   signal s_axis_phase_tdata : std_logic_vector(23 downto 0) := (others => '0');
	
 	--Outputs
   signal m_axis_dout_tvalid : std_logic;
   signal m_axis_dout_tdata : std_logic_vector(47 downto 0);
	--File of test vectors
	file testFile: TEXT OPEN READ_MODE IS "sincosVerification.dat";
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: SinCos PORT MAP (
          s_axis_phase_tvalid => s_axis_phase_tvalid,
          s_axis_phase_tdata => s_axis_phase_tdata,
          m_axis_dout_tvalid => m_axis_dout_tvalid,
          m_axis_dout_tdata => m_axis_dout_tdata
        );
   -- Stimulus process
   stim_proc: process
		variable buff : line;
		variable iphase, isin, iout : integer;
   begin		
		while not endfile(testFile) loop
			-- Read next line of test data and extract input and expected output
			readline(testFile, buff);
			read(buff, iphase);
			read(buff, isin);
			-- Convert integer input to std_logic_vector and apply to uut input
			s_axis_phase_tdata <= conv_std_logic_vector(iphase, 24);
			-- Wait
			wait for 10 ns;	
			iout := conv_integer(signed(m_axis_dout_tdata(47 downto 24)));
			-- Compare expected output from file with actual output
			assert abs(isin - iout) <= 2 -- Only report errors where value differs > 2.
			report "Incorrect sine value generated: phase = " & integer'image(iphase) & ", sin expected = " & integer'image(isin) & ", sin output = " & integer'image(iout)
			severity warning;
		end loop;
		wait;
   end process;
END;
