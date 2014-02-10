----------------------------------------------------------------------------------
-- Company: USAFA
-- Engineer: Jarrod Wooden
-- 
-- Create Date:    20:39:17 02/09/2014 
-- Design Name: 	One Bit Full Adder
-- Module Name:    Full_Adder - Behavioral 
-- Project Name: 		Adding and Subtracting Basics
-- Target Devices: 	FPGA Spartan

-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments:  This is the start of Lab2_FourBitFullAdder
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Full_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end Full_Adder;

architecture Behavioral of Full_Adder is

begin

Sum <= A xor B xor Cin;
Cout <= (A and B) or (A and Cin) or (B and Cin);


end Behavioral;

