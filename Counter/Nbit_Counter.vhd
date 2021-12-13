-- N-bit Counter
-----------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

-----------------------------------

entity Nbit_Counter is
    generic(n: natural := 2);
    port (
        clock, clear, count: in std_logic;
        Q: out std_logic_vector(n-1 downto 0)
    );
end entity Nbit_Counter;

-----------------------------------

architecture rtl of Nbit_Counter is
    signal Pre_Q: std_logic_vector(n-1 downto 0);
begin
    counter : process( clock, count, clear )
    begin
        if clear = '1' then
            
            Pre_Q <= (others => '0');

        elsif rising_edge(clock) then

            if count = '1' then
                
                Pre_Q <= Pre_Q + 1;

            end if;

        end if;

    end process ; -- counter
    
    Q <= Pre_Q;
    
end architecture rtl;