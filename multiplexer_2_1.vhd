----------------------------------------------------------------------------------
-- Company:  USAFA	
-- Engineer:  Jarrod Wooden
-- 
-- Create Date:    20:28:52 02/10/2014 
-- Design Name: 		mux: chosing adder or subtractor
-- Module Name:    multiplexer_2_1 - Behavioral 

-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer_2_1 is
    Port ( Cin : in  STD_LOGIC;
				Bc : in STD_LOGIC_VECTOR (3 downto 0);
				B : in STD_LOGIC_VECTOR (3 downto 0);
           Co : out  STD_LOGIC_VECTOR (3 downto 0));
end multiplexer_2_1;

architecture Behavioral of multiplexer_2_1 is

begin

	Co <= Bc when Cin = '1' else B;


end Behavioral;

