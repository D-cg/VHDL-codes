----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 19:48:02
-- Design Name: 
-- Module Name: operation - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity operation is
Port (  fact: in STD_LOGIC_vector(15 downto 0);
        i : in std_logic_vector(3 downto 0);
        newi: out std_logic_vector(3 downto 0); 
        newfact: out std_logic_vector(15 downto 0));
end operation;
architecture Behavioral of operation is
begin
process(fact, i)
    variable fact_unsigned: UNSIGNED(15 downto 0);
    variable i_unsigned: UNSIGNED(3 downto 0);
    variable result_unsigned: UNSIGNED(19 downto 0);
    begin  
        fact_unsigned := UNSIGNED(fact);
        i_unsigned := UNSIGNED(i);
        result_unsigned := fact_unsigned * i_unsigned;
        newfact <= STD_LOGIC_VECTOR(result_unsigned(15 downto 0));
        newi <= STD_LOGIC_VECTOR(i_unsigned + 1);
    end process;
end Behavioral;
