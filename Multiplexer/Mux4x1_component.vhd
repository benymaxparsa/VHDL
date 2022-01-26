library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4x1_component is
    port (
        A,B,C,D: in std_logic;
        S0,S1: in std_logic;
        Z: out std_logic
    );
end entity Mux4x1_component;

architecture behavioral of Mux4x1_component is
    
    component Mux2x1_module
        port(
            x, y, s: in std_logic;
            z: out std_logic
        );
    end component;

    signal m1, m2: std_logic;

begin
    
    c1: Mux2x1_module port map(A, B, S0, m1);
    c2: Mux2x1_module port map(C, D, S0, m2);
    c3: Mux2x1_module port map(m1, m2, S1, Z);
    
end architecture behavioral;