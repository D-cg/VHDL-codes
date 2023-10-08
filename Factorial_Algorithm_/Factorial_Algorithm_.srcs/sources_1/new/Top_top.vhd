----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 18:58:47
-- Design Name: 
-- Module Name: Top_top - Behavioral
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


entity Top_top is
Port ( CLK : in STD_logic;
       btn3 : in std_logic; --go 
       btn0 : in std_logic; -- clr
       n: in std_logic_vector(2 downto 0);
       a_to_g: out std_logic_vector(6 downto 0);
       an: out std_logic_vector(3 downto 0);
       done_led:out  std_logic);

end Top_top;

architecture Behavioral of Top_top is
signal clock_1hz, btn3_debounced, go_signal: std_logic;
signal factn: STD_logic_vector(15 downto 0);
begin
U1: entity work.debounce port map(
      cclk => clock_1hz,
      clr => btn0, 
      inp => btn3,
      outp => btn3_debounced 
    );
U2: entity work.clk_divisor port map(
    clk => CLK,
    clk_1hz => clock_1hz
);

U3: entity work.clk_pulse port map(
        inp => btn3_debounced,
        cclk => clock_1hz,
        clr => btn0,
        outp => go_signal   
);
 
U4: entity work.top_algorithm port map(
        gobtn => go_signal, 
        clk => clock_1hz,
        clr => btn0, 
        n => n,  
        facout =>factn,
        doneled=> done_led
);

U5: entity work.X7seg port map(
         xin => factn,
        cclk => clock_1hz,
        clr => btn0,
        a_to_g => a_to_g,
        an => an
);


end Behavioral;
