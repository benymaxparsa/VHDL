library IEEE;
use IEEE.std_logic_1164.all;

------------------------------

entity dFlipFlop_async_reset is
    port (
        data, clk, reset: in std_logic;
        q: out std_logic
    );
end entity dFlipFlop_async_reset;

----------------------------------

architecture rtl of dFlipFlop_async_reset is
    
begin
    
    dff : process( clk, reset )
    begin
        
        if (reset = '0') then
            
            q <= '0';

        elsif (clk'event and clk = '0') then

            q <= data;

        end if;

    end process ; -- dff
    
end architecture rtl;