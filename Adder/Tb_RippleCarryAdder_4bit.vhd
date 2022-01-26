library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Tb_RippleCarryAdder_4bit is
end entity Tb_RippleCarryAdder_4bit;

architecture rtl of Tb_RippleCarryAdder_4bit is
    
    component RippleCarryAdder_4bit
        port (
            A, B: in std_logic_vector(3 downto 0);
            Cin: in std_logic;
            S: out std_logic_vector(3 downto 0);
            Cout: out std_logic
        );
    end component;

    signal A, B: std_logic_vector(3 downto 0) := (others => '0');
    signal Cin: std_logic := '0';

    signal S: std_logic_vector(3 downto 0);
    signal Cout: std_logic;

begin
    
    uut: RippleCarryAdder_4bit port map(
        A => A,
        B => B,
        Cin => Cin,
        S => S,
        Cout => Cout
    );

    stim_proc : process
    begin
        
        wait for 100 ns;
        A <= "0110";
        B <= "1100";

        wait for 100 ns;
        A <= "1111";
        B <= "1100";

        wait for 100 ns;
        A <= "0110";
        B <= "1110";

        wait for 100 ns;
        A <= "1111";
        B <= "1111";

        wait;


    end process ; -- stim_proc
    
end architecture rtl;