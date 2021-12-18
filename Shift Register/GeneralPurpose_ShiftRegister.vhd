-- A General Purpose Shift Register with Shift-to-left, Shift-to-right, Reset, and Counter abilities 

---------------------------------------
--#File: GeneralPurpose_ShiftRegister.vhd
--#Author: Parsa KamaliPour
--#Sudent_ID: 97149081
--#Contact: parsakamalipour@gmail.com
---------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

--------------------------------------

entity GeneralPurpose_ShiftRegister is
    port (
        Data_input: in std_logic_vector(15 downto 0);
        Clock, Reset, Set: in std_logic;
        Mode: in std_logic_vector(1 downto 0); -- 0: No OP, 1: shift left, 2: shift right, 3: count
        Data_out: out std_logic_vector(15 downto 0)
    );
end entity GeneralPurpose_ShiftRegister;

---------------------------------------


architecture behavior of GeneralPurpose_ShiftRegister is

    signal Data: std_logic_vector(15 downto 0) := (others => '0');
    signal Temp_var: std_logic;

begin
    
    logic : process( Clock, Reset, Set, Mode, Data, Data_input )
    begin
        
        if Reset = '1' then
        
            Data <= (others => '0');
    
        elsif Set = '1' then
            
            Data <= Data_input;
    
        elsif rising_edge(Clock) then
    
            case Mode is

                when "00" => -- no op
                    null;

                when "01" => -- shift left
                    Temp_var <= Data(15);
                    for i in 14 downto 0 loop
                        
                        Data(i+1) <= Data(i);

                    end loop;
                    Data(0) <= Temp_var;

                when "10" => -- shift right
                    Temp_var <= Data(0);
                    for i in 1 to 15 loop
                        
                        Data(i-1) <= Data(i);

                    end loop;
                    Data(15) <= Temp_var;

                when "11" => -- count
                    Data <= Data + 1;
            
                when others =>
                    null;
                    
            end case;

        end if;
        
    end process ; -- logic

    Data_out <= Data;

end architecture behavior;