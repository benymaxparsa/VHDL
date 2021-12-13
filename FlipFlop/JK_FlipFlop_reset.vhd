-- JK Flip-Flop with reset

------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

------------------------------------

entity JK_FlipFlop_reset is
  port (
    clock, J, K, reset: in std_logic;
    Q, Qbar: out std_logic
  ) ;
end JK_FlipFlop_reset;

------------------------------------

architecture rtl of JK_FlipFlop_reset is
    
    signal state: std_logic;
    signal input: std_logic_vector(1 downto 0);

begin
    
    input <= J & K;

    p : process( clock, reset )
    begin
        
        if (reset = '1') then
            state <= '0';

        elsif (rising_edge(clock)) then
            
            case (input) is
                when "11" =>
                    state <= not state;    

                when "10" =>
                    state <= '1';
                    
                when "01" =>
                    state <= '0';
            
                when others =>
                    null;
            
            end case;
        
        end if;

    end process ; -- p

    Q <= state;
    Qbar <= not state;
    
end architecture rtl;