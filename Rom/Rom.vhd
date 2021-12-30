library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------------------------------------- Entity definition

entity SRam_basic is

    generic(

        width: integer:= 8;
        depth: integer:= 32;
        addr: integer:= 5

    );

    port (
        
        Clock, Enable, Read, Reset: in std_logic;
        Read_Addr: in std_logic_vector(addr-1 downto 0);
        Data_out: out std_logic_vector(width-1 downto 0)

    );

end entity SRam_basic;

------------------------------------------------------------------- Architecture definition

architecture behavior of SRam_basic is
    
    type rom_type is array (0 to depth-1) of std_logic_vector(width-1 downto 0);  
    constant Content: ROM_Array := (
        0 => "00000001",
        others => "11111111"
    )

begin
    
    func : process( Clock, Read )
    begin

        if Reset = '1' then
            
            Data_out <= "ZZZZZZZZ";


        elsif rising_edge(Clock) then
            
            if Enable = '1' then
                
                if Read = '1' then
                    
                    Data_out <= Content(conv_integer(Read_Addr));

                else

                    Data_out <= (Data_out'range => 'Z');

                end if;

            end if;

        end if;
        
    end process ;

    
end architecture behavior;