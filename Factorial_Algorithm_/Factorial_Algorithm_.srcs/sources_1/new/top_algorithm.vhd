----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 23:19:33
-- Design Name: 
-- Module Name: top_algorithm - Behavioral
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

entity top_algorithm is
Port ( 
        gobtn, clk, clr: in STD_logic;
        n : in STD_LOGIC_VECTOR(2 downto 0);
        facout : out STD_LOGIC_vector(15 downto 0);
        doneled: out STD_logic
       
);
end top_algorithm;

architecture Behavioral of top_algorithm is
signal nnotequal0fl, nequal0fl, nequalifl, nnotequalifl, test1fl, test2fl : std_logic;
signal outload, nload, factload, iload, isel, factsel: std_logic;
signal nout, newi, i_mux2reg, i_out: std_logic_vector(3 downto 0);
signal fact_mux2reg, fact_done, factout, newfact: std_logic_vector(15 downto 0);
begin

U1: entity work.control_unit port map(
        nequal0fl => nequal0fl, 
        nnotequal0fl => nnotequal0fl, 
        nequalifl => nequalifl,
        nnotequalifl => nnotequalifl, 
        clk => clk,   
        clr => clr,
        gobtn => gobtn, 
--outs        
        outload => outload,
        nload => nload, 
        factload => factload,
        doneled => doneled,
        iload => iload, 
        isel => isel,
        factsel => factsel,              
        test1fl => test1fl,
        test2fl => test2fl
);
U2: entity work.Nregister port map(
        clr => clr,
        clk => clk, 
        nload => nload,
        nin => n,
        --out
        nout => nout
); 
U3: entity work.test1 port map(
        n => nout,
        --outs
        nequal0fl => nequal0fl,
        nnotequal0fl => nnotequal0fl
);

U4: entity work.mux2_display port map(
         y => newi,
       sel => isel,
       muxout => i_mux2reg 
); 
U5: entity work.ireg port map(
        clr => clr,
        clk => clk,
        iload => iload, 
        iin => i_mux2reg, 
        i_out => i_out 
); 
U6: entity work.test2 port map(
     n => nout,
       i => i_out,
       --outs 
       nequalifl =>nequalifl,
       nnotequalifl => nnotequalifl

);
U7: entity work.fact_mux port map(
        n => nout,  
        y => newfact, 
        sel => factsel, 
        muxout => fact_mux2reg
); 
U8: entity work.Areg port map(
        clr => clr, 
        clk => clk, 
        factload => factload, 
        factin => fact_mux2reg,
        factout => factout
);

U9: entity work.operation port map(
        fact => factout,
        i => i_out,
        newi => newi, 
        newfact => newfact
);

U10: entity work.out_reg port map(
        clr => clr,
        clk => clk,
        test1fl => test1fl, 
        test2fl => test2fl, 
        outload => outload, 
        factin => factout,  
        fact_out => fact_done
);
end Behavioral;
