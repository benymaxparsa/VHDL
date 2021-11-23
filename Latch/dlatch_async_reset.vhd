library IEEE;
use IEEE.std_logic_1164.all;

------------------------------

entity dlatch_async_reset is
    port (
        data: in std_logic;
        clk: in std_logic;
        reset: in std_logic;
        q: out std_logic
    );
end entity dlatch_async_reset;

----------------------------------

architecture rtl of dlatch_async_reset is
    
begin
    
    dlatch : process( clk, reset )
    begin
        
        if (reset = '0') then
            
            q <= '0';

        elsif (clk = '1') then

            q <= data;

        end if;

    end process ; -- dlatch
    
end architecture rtl;