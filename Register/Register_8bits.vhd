library IEEE;
use IEEE.std_logic_1164.all;

-------------------------------

entity Register_8bits is
    port (
        data: in std_logic_vector(7 downto 0);
        clk, reset: in std_logic;
        q: out std_logic_vector(7 downto 0)
    );
end entity Register_8bits;

--------------------------------

architecture rtl of Register_8bits is
    
begin
    
    reg : process( clk, reset )
    begin
        
        if (reset = '0') then
            
            q <= "00000000";

        elsif (rising_edge(clk)) then
            
            q <= data;

        end if;

    end process ; -- reg
    
end architecture rtl;