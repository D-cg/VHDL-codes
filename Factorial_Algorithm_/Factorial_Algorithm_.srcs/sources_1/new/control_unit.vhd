----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.10.2023 21:33:22
-- Design Name: 
-- Module Name: control_unit - Behavioral
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

entity control_unit is
Port (
        nequal0fl: in std_logic;
        nnotequal0fl: in std_logic;
        nequalifl: in std_logic; 
        nnotequalifl: in std_logic;  
        clk: in STD_logic;        
        clr: in STD_logic;
        gobtn: in STD_logic;
        outload, nload, factload, doneled, iload, isel, factsel, test1fl, test2fl: out std_logic  );
end control_unit;
architecture Behavioral of control_unit is
type state_type is (go, input, test1,test2,operation, done);
signal present_state, next_state: state_type;
begin
---proceso sequencial 
state_register: process(clk, clr)
begin 
        if (clr = '1') then
            present_state <= go;
        elsif (rising_edge(clk)) then 
            present_state <= next_state;
        end if; 
end process state_register; 
--- proceso combinacional 1
C1: process (present_state, clr, gobtn, nequal0fl, nnotequal0fl, nequalifl, nnotequalifl)
begin 
        case present_state is 
            when go =>
                if (gobtn ='1') then
                    next_state <= input;
                    nload <= '1'; 
                else 
                    next_state <= go;
                end if; 
             when input =>
                if (clr = '0') then
                    next_state <= test1;
                else
                    next_state <= go;
                end if; 
              when test1 =>
                if (nequal0fl = '1')then 
                    next_state <= done; 
                elsif (nnotequal0fl = '1') then 
                    next_state <= test2;
                     iload <= '1';
                     factload <= '1';            
                end if;
              when test2 => 
                 if (nequalifl = '1') then
                    next_state <= done; 
                 elsif (nnotequalifl = '1') then 
                    next_state <= operation;
                    factsel <= '1';
                    isel <= '1';
                 end if; 
              when done => 
                 if (clr = '1') then 
                    next_state <= go;
                 else 
                     next_state <= done; 
                     outload <= '1';
                     if (nequal0fl ='1') then 
                        test1fl <= '1';
                     elsif (nequalifl = '1') then 
                        test2fl <= '1';
                     end if;                    
                 end if;
              when others =>
                    null;
          end case; 
end process C1; 

Seq2: process (clk, clr)
    begin
        if (clr = '1') then 
            outload <= '0';
         elsif (rising_edge(clk)) then
            if  (present_state= done) then 
                doneled <= '1'; 
            else 
                doneled <= '0';
        end if;
      end if; 
  end process Seq2;                                                             
end Behavioral;
