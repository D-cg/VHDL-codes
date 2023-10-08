----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.10.2023 01:42:50
-- Design Name: 
-- Module Name: Top_top_TB - Behavioral
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

entity Top_top_TB is
end entity;
architecture Behavioral of Top_top_TB is

component Top_top
Port ( CLK : in STD_logic;
       btn3 : in std_logic; --go 
       btn0 : in std_logic; -- clr
       n: in std_logic_vector(2 downto 0);
       a_to_g: out std_logic_vector(6 downto 0);
       an: out std_logic_vector(3 downto 0);
       done_led:out  std_logic);
end component; 
 signal btn3: std_logic:='0';
 signal btn0: std_logic:='0';
 signal n: std_logic_vector(2 downto 0):="000";
signal a_to_g: std_logic_vector(6 downto 0);
 signal an: std_logic_vector(3 downto 0);
 signal done_led: std_logic:='0';
begin
pm: Top_top port map(
        btn3=> btn3,
        btn0=> btn0,
       n=> n,
       a_to_g=> a_to_g,
       an=> an,
       done_led=> done_led
);
P1: process
begin
    btn3<='1';
    btn0<='1';
    n<="111'";
    wait for 100 ns;
    btn3<='1';
    btn0<='0';
    n<="000";
    wait for 100 ns;
    btn3<='0';
    btn0<='1';
    n<="000";
    wait for 100 ns;
    btn3<='1';
    btn0<='0';
    n<="010";
    wait;
end process;      
end Behavioral;
