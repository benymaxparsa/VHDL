-- Simple ALU Module
------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

------------------------------

entity Simple_ALU is
    port (
        A, B, Sel: in std_logic_vector(1 downto 0);
        Res: out std_logic_vector(1 downto 0)
    );
end entity Simple_ALU;

architecture rtl of Simple_ALU is
    
begin
    
    alu : process( A, B, Sel )
    begin
        
        case Sel is

            when "00" =>        
                Res <= A + B;

            when "01" =>
                Res <= A + (not B) + 1;
                
            when "10" =>
                Res <= A and B;    

            when "11" =>
                Res <= A or B;
        
            when others =>
                Res <= "XX";
        
        end case;

    end process ; -- alu
    
end architecture rtl;
