library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lookAheadComp is
    Port ( CarryI, P, G : in STD_LOGIC; CarryO : out STD_LOGIC);
end lookAheadComp;

architecture Behavioral of lookAheadComp is

begin
    CarryO <= (CarryI and P) or G;

end Behavioral;