library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FullAdder_component is
    port (
        A, B, C: in std_logic;
        SUM, CARRY: out std_logic
    );
end entity FullAdder_component;

architecture structure of FullAdder_component is

    signal S1,C1,C2: std_logic;

    component HA
        port(
            a, b: in std_logic;
            s, cout: out std_logic
        );
    end component;

    component OR_com
        port(
            I1, I2: in std_logic;
            X: out std_logic
        );
    end component;

begin
    
    INST_HA1: HA port map(
        a => B,
        b => C,
        s => S1,
        cout => C1
    );

    INST_HA2: HA port map(
        a => A,
        b => S1,
        s => SUM,
        cout => C2
    );

    INST_OR: OR_com port map(
        I1 => C2,
        I2 => C1,
        X => CARRY
    );

    
end architecture structure;