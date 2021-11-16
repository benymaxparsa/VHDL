library IEEE;
use IEEE.std_logic_1164.all;

-----------------------------------

entity Mux4x1_whenElse is
    port (
        I3, I2, I1, I0: in std_logic;
        S: in std_logic_vector(1 downto 0);
        O: out std_logic
    );
end entity Mux4x1_whenElse;

--------------------------------------------


architecture rtl of Mux4x1_whenElse is
    
begin
    
    O <= I0 when S="00" else
        I1 when S="01" else
        I2 when S="10" else
        I3;
    
end architecture rtl;