library IEEE;
use IEEE.std_logic_1164.all;

-----------------------------

entity Mux4x1_8bits is
    port (
        I3, I2, I1, I0: in std_logic_vector(7 downto 0);
        S: in std_logic_vector(1 downto 0);
        O: out std_logic_vector(7 downto 0)
    );
end entity Mux4x1_8bits;

-----------------------------

architecture rtl of Mux4x1_8bits is
    
begin
    
    useCase : process( I3, I2, I1, I0, S )
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
        end case;
    end process ; -- useCase
    
end architecture rtl;