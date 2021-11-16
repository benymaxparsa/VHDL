library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

----------------------------- Code by Parsa KamaliPour - 97149081

entity Mux4x1_3bits is
    port (
        I3, I2, I1, I0: in std_logic_vector(2 downto 0);
        S: in std_logic_vector(1 downto 0);
        O: out std_logic_vector(2 downto 0)
    );
end entity Mux4x1_3bits;


----------------------------- HW1 - Question 2

architecture rtl of Mux4x1_3bits is
    
begin
    
    Logic : process( I3, I2, I1, I0, S )
    begin

        case S is
            when "00" =>
                O <= I0;

            when "01" =>
                O <= I1;

            when "10" =>
                O <= I2;

            when "11" =>
                O <= I3;
        
            when others =>
                O <= "ZZZ";
                
        end case;

    end process ; 
    
end architecture rtl;