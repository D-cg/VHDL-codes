----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 19:40:08
-- Design Name: 
-- Module Name: test2 - Behavioral
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

entity test2 is
Port (  n: in STD_lOGIC_Vector(3 downto 0);
        i: in STD_lOGIC_Vector(3 downto 0);
        nequalifl:out std_logic := '0';
        nnotequalifl:out std_logic := '0');
end test2;
architecture Behavioral of test2 is
begin
process(n, i)
begin 
    if n = i then 
        nequalifl <= '1';
    else
        nnotequalifl <= '1';
    end if; 
end process;
end Behavioral;
