-- 3 bit Shift Register/Shifter

-----------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-----------------------------------

entity ShiftRegister_3bit is
    port (
        I, clock, shift: in std_logic;
        Q: out std_logic
    );
end entity ShiftRegister_3bit;

architecture rtl of ShiftRegister_3bit is
    signal S: std_logic_vector(2 downto 0) := "111";
begin
    
    ShiftReg : process( I, clock, shift, S )
    begin
        
        if (rising_edge(clock)) then

            if shift = '1' then

                S <= I & S(2 downto 1);

            end if;

        end if;

    end process ; -- ShiftReg

    Q <= S(0);
    
end architecture rtl;
