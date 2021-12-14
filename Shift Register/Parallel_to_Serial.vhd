library IEEE;
use IEEE.std_logic_1164.all;

-----------------------------------

entity Parallel_to_Serial is
    port (
        DIN: in std_logic_vector(7 downto 0);
        MODE: in std_logic_vector(1 downto 0);
        CLK, RESET: in std_logic;
        SDOUT: out std_logic
    );
end entity Parallel_to_Serial;

-----------------------------------

architecture rtl of Parallel_to_Serial is
    
    signal IDATA: std_logic_vector(7 downto 0);

begin
    
    PAR2SER : process( CLK, RESET )
    begin
        
        if RESET = '1' then
            
            SDOUT <= '0';
            IDATA <= (others => '0');

        elsif rising_edge(CLK) then
            
            case MODE is

                when "00" =>
                    null;

                when "01" =>
                    IDATA <= DIN;

                when "10" =>
                    SDOUT <= IDATA(7);

                    for i in 6 downto 0 loop
                        
                        IDATA(i + 1) <= IDATA(i);

                    end loop;
            
                when others =>
                        null;
            
            end case;

        end if;

    end process ; -- PAR2SER
    
end architecture rtl;