library IEEE;
use IEEE.std_logic_1164.all;

entity RippleCarryAdder_4bit is
    port (
        A, B: in std_logic_vector(3 downto 0);
        Cin: in std_logic;
        S: out std_logic_vector(3 downto 0);
        Cout: out std_logic
    );
end entity RippleCarryAdder_4bit;

architecture Behavioral of RippleCarryAdder_4bit is
    
    component FullAdder_component
        port(
            A, B, C: in std_logic;
            SUM, CARRY: out std_logic
        );
    end component;

    signal c1, c2, c3: std_logic;

begin
    
    FA1: FullAdder_component port map(A(0), B(0), Cin, S(0), c1);
    FA2: FullAdder_component port map(A(1), B(1), c1, S(1), c2);
    FA3: FullAdder_component port map(A(2), B(2), c2, S(2), c3);
    FA4: FullAdder_component port map(A(3), B(3), c3, S(3), Cout);
    
end architecture Behavioral;