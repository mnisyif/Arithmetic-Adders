library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carryLookahead_16Bit is
    Port ( X, Y : in std_logic_vector(15 downto 0);
           Cin : in std_logic; Cout: out std_logic;
           Sout : out std_logic_vector(15 downto 0));
end carryLookahead_16Bit;

architecture Behavioral of carryLookahead_16Bit is
    component half_adder
        port( A, B, Cin : in STD_LOGIC; Sout, P, G : out STD_LOGIC );
    end component;
    
    component lookAheadComp
        Port ( CarryI, P, G : in STD_LOGIC; CarryO : out STD_LOGIC);
    end component;
 
    signal Carry, P, G : std_logic_vector(15 downto 0);
begin
--partial adders setup
    HA00 : half_adder port map(X(0), Y(0), Carry(0), Sout(0), P(0), G(0));
    HA01 : half_adder port map(X(1), Y(1), Carry(1), Sout(1), P(1), G(1));
    HA02 : half_adder port map(X(2), Y(2), Carry(2), Sout(2), P(2), G(2));
    HA03 : half_adder port map(X(3), Y(3), Carry(3), Sout(3), P(3), G(3));
    
    HA04 : half_adder port map(X(4), Y(4), Carry(4), Sout(4), P(4), G(4));
    HA05 : half_adder port map(X(5), Y(5), Carry(5), Sout(5), P(5), G(5));
    HA06 : half_adder port map(X(6), Y(6), Carry(6), Sout(6), P(6), G(6));
    HA07 : half_adder port map(X(7), Y(7), Carry(7), Sout(7), P(7), G(7));
    
    HA08 : half_adder port map(X(8), Y(8), Carry(8), Sout(8), P(8), G(8));
    HA09 : half_adder port map(X(9), Y(9), Carry(9), Sout(9), P(9), G(9));
    HA10 : half_adder port map(X(10), Y(10), Carry(10), Sout(10), P(10), G(10));
    HA11 : half_adder port map(X(11), Y(11), Carry(11), Sout(11), P(11), G(11));
    
    HA12 : half_adder port map(X(12), Y(12), Carry(12), Sout(12), P(12), G(12));
    HA13 : half_adder port map(X(13), Y(13), Carry(13), Sout(13), P(13), G(13));
    HA14 : half_adder port map(X(14), Y(14), Carry(14), Sout(14), P(14), G(14));
    HA15 : half_adder port map(X(15), Y(15), Carry(15), Sout(15), P(15), G(15));

--Look ahead carry setup
    Carry(0) <= Cin;
    look00: lookAheadComp port map(Carry(0), P(0), G(0), Carry(1));
    look01: lookAheadComp port map(Carry(1), P(1), G(1), Carry(2));
    look02: lookAheadComp port map(Carry(2), P(2), G(2), Carry(3));
    look03: lookAheadComp port map(Carry(3), P(3), G(3), Carry(4));
    
    look04: lookAheadComp port map(Carry(4), P(4), G(4), Carry(5));
    look05: lookAheadComp port map(Carry(5), P(5), G(5), Carry(6));
    look06: lookAheadComp port map(Carry(6), P(6), G(6), Carry(7));
    look07: lookAheadComp port map(Carry(7), P(7), G(7), Carry(8));
    
    look08: lookAheadComp port map(Carry(8), P(8), G(8), Carry(9));
    look09: lookAheadComp port map(Carry(9), P(9), G(9), Carry(10));
    look10: lookAheadComp port map(Carry(10), P(10), G(10), Carry(11));
    look11: lookAheadComp port map(Carry(11), P(11), G(11), Carry(12));
    
    look12: lookAheadComp port map(Carry(12), P(12), G(12), Carry(13));
    look13: lookAheadComp port map(Carry(13), P(13), G(13), Carry(14));
    look14: lookAheadComp port map(Carry(14), P(14), G(14), Carry(15));
    look15: lookAheadComp port map(Carry(15), P(15), G(15), Cout);
    
end Behavioral;
