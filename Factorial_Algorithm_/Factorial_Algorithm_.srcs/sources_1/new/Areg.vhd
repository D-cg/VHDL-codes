----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 19:17:18
-- Design Name: 
-- Module Name: Areg - Behavioral
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
entity Areg is
Port (  clr: in std_logic;
        clk: in std_logic;
        factload: in std_logic;
        factin : in STD_LOGIC_VECTOR(15 downto 0);
        factout :out STD_LOGIC_VECTOR(15 downto 0));
end Areg;
architecture Behavioral of Areg is
begin
process(clr, clk, factload)
begin
    if clr = '1' then    
        factout <= "0000000000000000";
    elsif rising_edge(clk) then
        if factload = '1' then 
            factout <= factin;
        end if;
    end if; 
end process;
end Behavioral;
