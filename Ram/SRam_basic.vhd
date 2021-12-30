library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------------------------------------- Entity definition

entity SRam_basic is

    generic(

        width: integer:= 4;
        depth: integer:= 4;
        addr: integer:= 2

    );

    port (
        
        Clock, Enable, Read, Write: in std_logic;
        Read_Addr: in std_logic_vector(addr-1 downto 0);
        Write_Addr: in std_logic_vector(addr-1 downto 0);
        Data_in: in std_logic_vector(width-1 downto 0);
        Data_out: out std_logic_vector(width-1 downto 0)

    );

end entity SRam_basic;

------------------------------------------------------------------- Architecture definition

architecture behavior of SRam_basic is
    
    type ram_type is array (0 to depth-1) of std_logic_vector(width-1 downto 0);  
    signal tmp_ram: ram_type;

begin
    
    -- Read functional Section
    read_func : process( Clock, Read )
    begin

        if rising_edge(Clock) then
            
            if Enable = '1' then
                
                if Read = '1' then
                    
                    Data_out <= tmp_ram(conv_integer(Read_Addr));

                else

                    Data_out <= (Data_out'range => 'Z');

                end if;

            end if;

        end if;
        
    end process ; -- read_func

    -- Write functional Section
    write_func : process( Clock, Write )
    begin
        
        if rising_edge(Clock) then
            
            if Enable = '1' then
                
                if Write = '1' then
                    
                    tmp_ram(conv_integer(Write_Addr)) <= Data_in;

                end if;

            end if;

        end if;

    end process ; -- write_func

    
end architecture behavior;