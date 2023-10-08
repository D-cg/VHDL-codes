----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 20:52:57
-- Design Name: 
-- Module Name: out_reg - Behavioral
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
entity out_reg is
Port (  clr: in std_logic;
        clk: in std_logic;
        test1fl: in std_logic;
        test2fl: in std_logic;
        outload: in std_logic;
        factin:in STD_LOGiC_Vector(15 downto 0);
        fact_out: out STD_logic_vector(15 downto 0));
end out_reg;
architecture Behavioral of out_reg is
begin
process(clr, clk, outload)
begin
    if clr = '1' then    
        fact_out <= "0000000000000000";
    elsif rising_edge(clk) then
        if outload = '1' then
            if test1fl = '1' then 
                fact_out <= "0000000000000001" ;
            elsif test2fl = '1' then
                fact_out <= factin; 
            end if; 
        end if;
    end if; 
end process;
end Behavioral;
