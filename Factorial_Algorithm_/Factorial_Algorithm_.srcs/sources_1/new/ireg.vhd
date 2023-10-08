----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 19:13:16
-- Design Name: 
-- Module Name: ireg - Behavioral
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

entity ireg is
Port (  clr: in std_logic;
        clk: in std_logic;
        iload: in std_logic;
        iin: in STD_LOGIC_VECTOR(3 downto 0);
        i_out: out STD_LOGIC_VECTOR(3 downto 0));
end ireg;
architecture Behavioral of ireg is
begin
process(clr, clk, iload)
begin
    if clr = '1' then    
        i_out <= "0000";
    elsif rising_edge(clk) then
        if iload = '1' then 
            i_out <= iin;
        end if;
    end if; 
end process; 

end Behavioral;
