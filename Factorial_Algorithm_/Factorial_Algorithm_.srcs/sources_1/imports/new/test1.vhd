----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 19:24:23
-- Design Name: 
-- Module Name: test1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test1 is
Port ( 
        n:in STD_logic_VECTOR(3 downto 0);
        nequal0fl: out STD_logic := '0';
        nnotequal0fl: out STD_logic:= '0'
);
end test1;

architecture Behavioral of test1 is

begin
process(n)
begin 

    if n = "0000" then 
        nequal0fl <= '1';
    else
        nnotequal0fl <= '1';
    end if; 
end process;


end Behavioral;
