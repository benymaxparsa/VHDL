library IEEE;
use IEEE.std_logic_1164.all;

-------------------------------------

entity dFlipFlop_sync_reset is
    port (
        data: in std_logic;
        clk: in std_logic;
        reset: in std_logic;
        q: out std_logic
    );
end entity dFlipFlop_sync_reset;

-------------------------------------

architecture rtl of dFlipFlop_sync_reset is
    
begin
    
    dff : process( clk, reset )
    begin
        
        if (clk'event and clk = '1') then
            
            if (reset = '0') then
                
                q <= '0';

            else
                
                q <= data;

            end if;

        end if;

    end process ; -- dff
    
end architecture rtl;