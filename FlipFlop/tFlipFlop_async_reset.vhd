library IEEE;
use IEEE.std_logic_1164.all;

-----------------------------

entity tFlipFlop_async_reset is
    port (
        data, clk, reset: in std_logic;
        q: out std_logic
    );
end entity tFlipFlop_async_reset;

-------------------------------

architecture rtl of tFlipFlop_async_reset is
    
    signal t: std_logic;

begin
    
    tff : process( clk, reset )
    begin
        
        if (reset = '0') then
            
            t <= '0';

        elsif (falling_edge(clk)) then
            
            t <= not t;

        end if;

    end process ; -- tff

    q <= t;
    
end architecture rtl;