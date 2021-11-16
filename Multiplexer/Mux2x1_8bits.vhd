library ieee;
use IEEE.std_logic_1164.all;

------------------------------

entity Mux2x1_8bits is
    port (
        A, B: in std_logic_vector(7 downto 0);
        Sel: in std_logic;
        Y: out std_logic_vector(7 downto 0)
    );
end entity Mux2x1_8bits;

-------------------------------


architecture rtl of Mux2x1_8bits is
    
begin
    
    behavior : process( Sel, A, B )
    begin
        if (Sel = '1') then
            Y <= B;
        else
            Y <= A;    
        end if;
    end process ; -- behavior
    
end architecture rtl;
