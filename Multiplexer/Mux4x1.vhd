library IEEE;
use IEEE.std_logic_1164.all;

------------------------------------

entity Mux4x1 is
    port (
        S1, S0, D3, D2, D1, D0: in std_logic;
        Y: out std_logic
    );
end entity Mux4x1;

--------------------------------------


architecture rtl of Mux4x1 is
    
begin
    
    Y <= (D0 and (not(S1)) and (not(S0))) or
        (D1 and (not(S1)) and S0) or
        (D2 and S1 and (not(S0))) or
        (D3 and S1 and S0);
    
end architecture rtl;
