----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.09.2023 20:07:09
-- Design Name: 
-- Module Name: mux2_display - Behavioral
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

entity mux2_display is
  Port (y : in STD_LOGIC_VECTOR(3 downto 0);
        sel : in STD_LOGIC;
        muxout : out STD_LOGIC_VECTOR (3 downto 0));
end mux2_display;
architecture Behavioral of mux2_display is
begin
process(sel)
begin
if sel = '0' then 
    muxout <= "0001";
   else
   muxout <= y;
end if;             
end process;    
end Behavioral;



