library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Adder_Subtractor is
    port (
        OP: in std_logic;
        A, B: in std_logic_vector(3 downto 0);
        R: out std_logic_vector(3 downto 0);
        Cout, OVERFLOW: out std_logic
    );
end entity Adder_Subtractor;

architecture struct of Adder_Subtractor is
    
    component FullAdder_component is

        port(
            A, B, C: in std_logic;
            SUM, CARRY: out std_logic
        );

    end component;

    signal C1, C2, C3, C4: std_logic;
    signal TMP: std_logic_vector(3 downto 0);

begin
    
    TMP <= A xor B;
    FA0: FullAdder_component port map(A(0), TMP(0), OP, R(0), C1);
    FA1: FullAdder_component port map(A(1), TMP(1), C1, R(1), C2);
    FA2: FullAdder_component port map(A(2), TMP(2), C2, R(2), C3);
    FA3: FullAdder_component port map(A(3), TMP(3), C3, R(3), C4);
    OVERFLOW <= C3 xor C4;
    Cout <= C4;
    
end architecture struct;