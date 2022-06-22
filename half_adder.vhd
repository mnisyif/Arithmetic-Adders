library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity half_adder is
    Port ( A, B, Cin : in STD_LOGIC; Sout, P, G : out STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is

begin
    Sout <= ((A xor B) xor Cin);
    P <= A xor B;
    G <= A and B;

end Behavioral;
