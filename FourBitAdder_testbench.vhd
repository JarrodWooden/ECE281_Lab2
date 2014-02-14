--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:42:48 02/10/2014
-- Design Name:   
-- Module Name:   C:/Users/C16Jarrod.Wooden/Documents/ECE281/Lab2_Wooden/FourBitAdder_testbench.vhd
-- Project Name:  Lab2_Wooden
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: FourBitAdder
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
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY FourBitAdder_testbench IS
END FourBitAdder_testbench;
 
ARCHITECTURE behavior OF FourBitAdder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT FourBitAdder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
			Cin : in STD_LOGIC;
         Sum : OUT  std_logic_vector(3 downto 0);
			C4 : OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
	signal Cin : std_logic := '0';

 	--Outputs
   signal Sum : std_logic_vector(3 downto 0);
	signal C4 : std_logic;
	signal Bc : std_logic_vector (3 downto 0);
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: FourBitAdder PORT MAP (
          A => A,
          B => B,
			 Cin => Cin,
          Sum => Sum,
			 C4 => C4
        );
		  
		  
 
   -- Stimulus process
   stim_proc: process
   begin	 
	
	--BELOW IS THE ADDITION TEST PORTION
	--I WOULD SWITCH BETWEEN ADDING AND SUBTRACTING TEST BENCHES BY COMMENTING OUT
	--OR RECOMMENTING BACK IN.
	
		report "Everything Worked!!!";

--		A <= "0000";
--		B <= "0000";
--		Cin <= '0';
--		
--		--Need to test all cases of A and B
--		--Check every case of A
--		for I in 0 to 15 loop
--		
--			--Go through all cases of B
--			for J in 0 to 15 loop 
--			
--				--wait
--				wait for 2ns;
--				--check values
--				assert (Sum = A + B) report "Jk.. It didn't work the expected value for " &
--					integer'image(to_integer(unsigned((A+B)))) & " for A = " &
--					integer'image(to_integer(unsigned((A)))) & " for B = " &
--					integer'image(to_integer(unsigned((B)))) & "but instead was " &
--					integer'image(to_integer(unsigned((Sum)))) severity ERROR;
--					
--					assert (C4 = '0') report "This is where an overflow occured check if it is right: " & " for A = " &
--					STD_LOGIC'image(A(3)) & " for B = " &
--					STD_LOGIC'image(B(3)) & "and the sum was " &
--					STD_LOGIC'image(Sum(3)) severity NOTE;
--					
--					--increment value of B
--					B <= B + "0001";
--				end loop; 
--				
--				--increment value of A
--				A <= A+"0001";
--			end loop;


		--BELOW IS THE SUBTRACTING TEST BENCH
		report "THIS IS THE SUBRACTING CASE, TAKE TWO's COMPLEMENT OF B";
			
			
		A <= "0000";
		B <= "0000";
		Cin <= '1';
		
		--Need to test all cases of A and B
		--Check every case of A
		for I in 0 to 15 loop
		
			--Go through all cases of B
			for J in 0 to 15 loop
			
				--wait
				wait for 2ns;
				--check values
				assert (Sum = A - B) report "JK.. it didn't work the expected value for " &
					integer'image(to_integer(unsigned((A-B)))) & " for A = " &
					integer'image(to_integer(unsigned((A)))) & " for B = " &
					integer'image(to_integer(unsigned((B)))) & "but instead was " &
					integer'image(to_integer(unsigned((Sum)))) severity ERROR;
					
					Bc <= std_logic_vector(unsigned(not B + 1));
					
					assert (C4 = '0') report "This is where an overflow occured check if it is right: " & " for A = " &
					STD_LOGIC'image(A(3)) & STD_LOGIC'image(A(2)) & STD_LOGIC'image(A(1)) & STD_LOGIC'image(A(0)) & " for B = " &
					STD_LOGIC'image(Bc(3)) & STD_LOGIC'image(Bc(2)) & STD_LOGIC'image(Bc(1)) & STD_LOGIC'image(Bc(0)) & "and the sum was " &
					STD_LOGIC'image(Sum(3)) & STD_LOGIC'image(Sum(2)) & STD_LOGIC'image(Sum(1)) & STD_LOGIC'image(Sum(0)) severity NOTE;
					 
					 
					--increment value of B
					B <= B + "0001";
				end loop;
				
				--increment value of A
				A <= A+"0001";
			end loop;
			
			report "Test completed";
			
			wait;
   end process;

END;
