--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:43:40 02/09/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Jarrod.Wooden/Documents/ECE281/Lab2_Wooden/Full_Adder_testbench.vhd
-- Project Name:  Lab2_Wooden
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Full_Adder
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Full_Adder_testbench IS
END Full_Adder_testbench;
 
ARCHITECTURE behavior OF Full_Adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Full_Adder
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         Cin : IN  std_logic;
         Sum : OUT  std_logic;
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic;
   signal Cout : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Full_Adder PORT MAP (
          A => A,
          B => B,
          Cin => Cin,
          Sum => Sum,
          Cout => Cout
        );

 stim_proc: process
 begin		
      -- hold reset state for 100 ns.
      -- First line of truth table
		A <= '0';
		B <= '0';
		Cin <= '0';
		wait for 100 ns;	
		
		-- Second line of truth table
		A <= '0';
		B <= '0';
		Cin <= '1';
		wait for 100 ns;	
		
		-- Complete_ the rest of the truth table below:
		-- Third line of truth table
		A <= '0';
		B <= '1';
		Cin <= '0';
		
		wait for 100 ns;
		
		-- Fourth line of truth table
		A <= '0';
		B <= '1';
		Cin <= '1';
		
		wait for 100 ns;
		
		-- Fifth line of truth table
		A <= '1';
		B <= '0';
		Cin <= '0';
		
		wait for 100 ns;
		
		-- Sixth line of truth table
		A <= '1';
		B <= '0';
		Cin <= '1';
		
		wait for 100 ns;
		
		-- Seventh line of truth table
		A <= '1';
		B <= '1';
		Cin <= '0';
		
		wait for 100 ns;
		
		-- Eigth line of truth table
		A <= '1';
		B <= '1';
		Cin <= '1';
		
		wait for 100 ns;

      wait;
   end process;

END;
