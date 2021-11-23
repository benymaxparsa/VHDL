library IEEE;
use IEEE.std_logic_1164.all;

-------------------------------

entity Register_8bits_multiplePin is
    port (
        data: in std_logic_vector(7 downto 0);
        clk, set, load, reset: in std_logic;
        q: out std_logic_vector(7 downto 0)
    );
end entity Register_8bits_multiplePin;

--------------------------------

architecture rtl of Register_8bits_multiplePin is
    
begin
    
    reg : process( clk, set, load, reset )
    begin
        
        if (reset = '0') then
            
            q <= (others => '0');

        elsif (rising_edge(clk)) then
            
            if (set = '0') then
                
                q <= (others => '1');

            elsif (load = '1') then
                
                q <= data;

            end if;

        end if;

    end process ; -- reg
    
end architecture rtl;