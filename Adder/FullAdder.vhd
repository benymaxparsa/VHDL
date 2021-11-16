library IEEE;
use IEEE.std_logic_1164.all;

-----------------------------------

entity FullAdder is
    port (
        A, B, Cin: in std_logic;
        Cout, S: out std_logic
    );
end entity FullAdder;

------------------------------------

architecture rtl of FullAdder is
    
    signal WIRE_1 : std_logic;
    signal WIRE_2 : std_logic;
    signal WIRE_3 : std_logic;

begin
    
    WIRE_1 <= A xor B;
    S <= Cin xor WIRE_1;
    WIRE_2 <= WIRE_1 and Cin;
    WIRE_3 <= A and B;
    Cout <= WIRE_2 or WIRE_3;
    
end architecture rtl;