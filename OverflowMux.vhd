----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:45:05 02/13/2014 
-- Design Name: 
-- Module Name:    OverflowMux - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
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

entity OverflowMux is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           Bc : in  STD_LOGIC_VECTOR (3 downto 0);
           Co : out  STD_LOGIC);
end OverflowMux;

architecture Behavioral of OverflowMux is

begin

	Co <= '1' when (A(3) = '1' and B(3) = '1' and Bc(3) = '0') or (A(3) = '0' and B(3) = '0' and Bc(3) = '1') else '0';

end Behavioral;

