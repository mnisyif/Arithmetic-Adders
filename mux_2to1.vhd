library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2to1 is
    Port ( In1 : in STD_LOGIC;
           In2 : in STD_LOGIC;
           Sel : in STD_LOGIC;
           Sout : out STD_LOGIC);
end mux_2to1;

architecture Behavioral of mux_2to1 is

begin
    process(In1, In2, Sel)
    begin
        if Sel = '0' then
            Sout <= In1;
        else 
            Sout <= In2;
        end if;
    end process;
end Behavioral;
