----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 19:20:40
-- Design Name: 
-- Module Name: Nregister - Behavioral
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

entity Nregister is
Port (
        clr: in std_logic;
        clk: in std_logic;
        nload: in std_logic;
        nin: in STD_LOGIC_VECTOR(2 downto 0);
        nout: out STD_LOGIC_VECTOR(3 downto 0));
end Nregister;

architecture Behavioral of Nregister is

begin
process(clr, clk, nload)
begin
    if clr = '1' then    
        nout <= "0000";
    elsif rising_edge(clk) then
        if nload = '1' then 
            nout <= ('0' & nin);
        end if;
    end if; 
end process; 
end Behavioral;
