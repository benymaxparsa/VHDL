library IEEE;
use IEEE.std_logic_1164.all;

entity HA is
    port (
        a, b: in std_logic;
        s, cout: out std_logic
    );
end entity HA;

architecture rtl of HA is
    
begin
    
    s <= a xor b;
    cout <= a and b;
    
end architecture rtl;