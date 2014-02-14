----------------------------------------------------------------------------------
-- Company:  USAFA
-- Engineer:  Jarrod Wooden
-- 
-- Create Date:    10:55:40 02/10/2014 
-- Design Name: 		Four Bit Adder and Subtracter
-- Module Name:    FourBitAdder - Structural 
-- Project Name: 		Four Bit Adder and Subtracter
-- Target Devices: 	FPGA NEXYS 2
-- Revision 0.01 - File Created: February 13, 2013
-- Additional Comments: This adder subtractor is awesome.
--
----------------------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;

LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FourBitAdder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
			  Cin : in STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
			  C4 : out STD_LOGIC);
			 end FourBitAdder;

architecture Structural of FourBitAdder is

	SIGNAL C0: std_logic;
	SIGNAL C1: std_logic;
	SIGNAL C2: std_logic;
	SIGNAL C3: std_logic;
	SIGNAL Bc: std_logic_vector (3 downto 0);
	SIGNAL Bfinal : std_logic_vector (3 downto 0);
	SIGNAL Ocheck : std_logic_vector (3 downto 0);



	COMPONENT Full_Adder
		Port (
			A : IN std_logic;
			B : IN std_logic;
			Cin : IN std_logic;
			Sum : OUT std_logic;
			Cout: OUT std_logic
			);
			END COMPONENT;	
			
	COMPONENT multiplexer_2_1
		PORT (
			Cin : IN std_logic; 
			Bc : IN std_logic_vector (3 downto 0);
			B : IN std_logic_vector (3 downto 0);
			Co : OUT std_logic_vector (3 downto 0)
			);
			END COMPONENT;
			
	COMPONENT OverflowMux
		PORT (
			A : IN std_logic_vector (3 downto 0);
			B : IN std_logic_vector (3 downto 0);
			Bc : IN std_logic_vector (3 downto 0);
			Co : OUT std_logic
			);
			END COMPONENT;

begin
		
		Bc <= not B;
		
		AddorSub: multiplexer_2_1 PORT MAP (Cin, Bc, B, Bfinal);
	
		--comment Alt, C         uncomment Alt, Shift, C
--		mux: process (Cin)
--		begin
--		if (Cin = '1') then 
--		
--				Bc <= std_logic_vector(unsigned(not B + 1));
--				
--				subA0_B0: Full_Adder PORT MAP (A(0) , Bc(0), '0', Sum(0), C0); 
--		
--				subA1_B1: Full_Adder PORT MAP (A(1) , Bc(1), C0, Sum(1), C1); 
--		
--				--changed "C0" below to test by testbench, make sure it's working properly
--				subA2_B2: Full_Adder PORT MAP (A(2) , Bc(2), C1, Sum(2), C2); 
--		
--				subA3_B3: Full_Adder PORT MAP (A(3) , Bc(3), C2, Sum(3), C3);
--				
--		end if;
--		
--		end process mux;
		
		
				A0_B0: Full_Adder PORT MAP (A(0) , Bfinal(0), Cin, Ocheck(0), C0); 
		
				A1_B1: Full_Adder PORT MAP (A(1) , Bfinal(1), C0, Ocheck(1), C1); 
		
				--changed "C0" below to test by testbench, make sure it's working properly
				A2_B2: Full_Adder PORT MAP (A(2) , Bfinal(2), C1, Ocheck(2), C2); 
		
				A3_B3: Full_Adder PORT MAP (A(3) , Bfinal(3), C2, Ocheck(3), C3); 
				
				Sum <= Ocheck;
				
				
				Overflow: OverflowMux PORT MAP (A, Bfinal, Ocheck, C4);
		



end Structural;

