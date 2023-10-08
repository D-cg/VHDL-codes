----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 19:08:05
-- Design Name: 
-- Module Name: fact_mux - Behavioral
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

entity fact_mux is
Port (  n: in STD_LOGIC_vector(3 downto 0); 
        y : in STD_LOGIC_VECTOR(15 downto 0);
        sel : in STD_LOGIC;
        muxout : out STD_LOGIC_VECTOR (15 downto 0));
end fact_mux;
architecture Behavioral of fact_mux is
begin
process(sel)
begin
if sel = '0' then 
    muxout <= ("000000000000" & n);
   else
   muxout <= y;
end if; 
end process;
end Behavioral;
