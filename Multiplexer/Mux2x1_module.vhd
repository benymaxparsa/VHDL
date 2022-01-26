library IEEE;
use IEEE.std_logic_1164.all;


entity Mux2x1_module is

    port (
        x, y, s: in std_logic;
        z: out std_logic
    );

end entity Mux2x1_module;

architecture Behavioral of Mux2x1_module is
    
begin
    
    behave : process( x, y, s )
    begin
        
        if s='0' then
            
            z <= x;

        else

            z <= y;

        end if;

    end process ; -- behave
    
end architecture Behavioral;