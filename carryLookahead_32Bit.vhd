library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carryLookahead_16Bit is
    Port ( X, Y : in std_logic_vector(31 downto 0);
           Cin : in std_logic; Cout: out std_logic;
           Sout : out std_logic_vector(31 downto 0));
end carryLookahead_16Bit;

architecture Behavioral of carryLookahead_16Bit is
    component half_adder
        port( A, B, Cin : in STD_LOGIC; Sout, P, G : out STD_LOGIC );
    end component;

    component lookAheadComp
        Port ( CarryI, P, G : in STD_LOGIC; CarryO : out STD_LOGIC);
    end component;
 
    signal Carry, P, G : std_logic_vector(31 downto 0);
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
    
    HA16 : half_adder port map(X(16), Y(16), Carry(16), Sout(16), P(16), G(16));
    HA17 : half_adder port map(X(17), Y(17), Carry(17), Sout(17), P(17), G(17));
    HA18 : half_adder port map(X(18), Y(18), Carry(18), Sout(18), P(18), G(18));
    HA19 : half_adder port map(X(19), Y(19), Carry(19), Sout(19), P(19), G(19));

    HA20 : half_adder port map(X(20), Y(20), Carry(20), Sout(20), P(20), G(20));
    HA21 : half_adder port map(X(21), Y(21), Carry(21), Sout(21), P(21), G(21));
    HA22 : half_adder port map(X(22), Y(22), Carry(22), Sout(22), P(22), G(22));
    HA23 : half_adder port map(X(23), Y(23), Carry(23), Sout(23), P(23), G(23));

    HA24 : half_adder port map(X(24), Y(24), Carry(24), Sout(24), P(24), G(24));
    HA25 : half_adder port map(X(25), Y(25), Carry(25), Sout(25), P(25), G(25));
    HA26 : half_adder port map(X(26), Y(26), Carry(26), Sout(26), P(26), G(26));
    HA27 : half_adder port map(X(27), Y(27), Carry(27), Sout(27), P(27), G(27));

    HA28 : half_adder port map(X(28), Y(28), Carry(28), Sout(28), P(28), G(28));
    HA29 : half_adder port map(X(29), Y(29), Carry(29), Sout(29), P(29), G(29));
    HA30 : half_adder port map(X(30), Y(30), Carry(30), Sout(30), P(30), G(30));
    HA31 : half_adder port map(X(31), Y(31), Carry(31), Sout(31), P(31), G(31));

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
    look15: lookAheadComp port map(Carry(15), P(15), G(15), Carry(16));
    
    look00: lookAheadComp port map(Carry(0), P(0), G(0), Carry(17));
    look01: lookAheadComp port map(Carry(1), P(1), G(1), Carry(18));
    look02: lookAheadComp port map(Carry(2), P(2), G(2), Carry(19));
    look03: lookAheadComp port map(Carry(3), P(3), G(3), Carry(20));

    look04: lookAheadComp port map(Carry(4), P(4), G(4), Carry(21));
    look05: lookAheadComp port map(Carry(5), P(5), G(5), Carry(22));
    look06: lookAheadComp port map(Carry(6), P(6), G(6), Carry(23));
    look07: lookAheadComp port map(Carry(7), P(7), G(7), Carry(24));

    look08: lookAheadComp port map(Carry(8), P(8), G(8), Carry(25));
    look09: lookAheadComp port map(Carry(9), P(9), G(9), Carry(26));
    look10: lookAheadComp port map(Carry(10), P(10), G(10), Carry(27));
    look11: lookAheadComp port map(Carry(11), P(11), G(11), Carry(28));

    look12: lookAheadComp port map(Carry(12), P(12), G(12), Carry(29));
    look13: lookAheadComp port map(Carry(13), P(13), G(13), Carry(30));
    look14: lookAheadComp port map(Carry(14), P(14), G(14), Carry(31));
    look15: lookAheadComp port map(Carry(15), P(15), G(15), Cout);

end Behavioral;