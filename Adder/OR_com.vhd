library IEEE;
use IEEE.std_logic_1164.all;

entity OR_com is
    port (
        I1, I2: in std_logic;
        X: out std_logic
    );
end entity OR_com;

architecture rtl of OR_com is
    
begin
    
    X <= I1 or I2;
    
end architecture rtl;