----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 01:34:03
-- Design Name: 
-- Module Name: test_top_top - Behavioral
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

entity test_top_top is
Port (
        CLK : in STD_logic;
       btn3 : in std_logic; --go 
       btn0 : in std_logic; -- clr
       n: in std_logic_vector(2 downto 0);
       a_to_g: out std_logic_vector(6 downto 0);
       an: out std_logic_vector(3 downto 0);
       done_led:out  std_logic);
         );
end test_top_top;

architecture Behavioral of test_top_top is

begin


end Behavioral;
