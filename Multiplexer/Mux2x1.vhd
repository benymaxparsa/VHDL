library ieee;
use IEEE.std_logic_1164.all;

----------------------------------

entity Mux2x1 is
    port (
        I1, I0, S: in std_logic;
        O: out std_logic
    );
end entity Mux2x1;

-----------------------------------


architecture rtl of Mux2x1 is
    
begin
    
    O <= (I0 and (not(S))) or (I0 and S);
    
end architecture rtl;

