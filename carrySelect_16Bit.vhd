library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carrySelect_16Bit is
    Port ( X, Y : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           Sout : out STD_LOGIC_VECTOR (15 downto 0));
end carrySelect_16Bit;

architecture Behavioral of carrySelect_16Bit is
    component full_adder
    port( A, B, Cin : in std_logic; Sout, Cout : out std_logic);
    end component;
    
    component mux_2to1
    port( In1, In2, Sel : in std_logic; Sout : out std_logic);
    end component;
    
    signal C0, C1, S1, S2: std_logic_vector(15 downto 0);
    
begin
--First 16_bit adder with Cin = 0
    fa000 : full_adder port map(X(0), Y(0), '0', S1(0), C0(0));
    fa001 : full_adder port map(X(1), Y(1), C0(0), S1(1), C0(1));
    fa002 : full_adder port map(X(2), Y(2), C0(1), S1(2), C0(2));
    fa003 : full_adder port map(X(3), Y(3), C0(2), S1(3), C0(3));
    
    fa004 : full_adder port map(X(4), Y(4), C0(3), S1(4), C0(4));
    fa005 : full_adder port map(X(5), Y(5), C0(4), S1(5), C0(5));
    fa006 : full_adder port map(X(6), Y(6), C0(5), S1(6), C0(6));
    fa007 : full_adder port map(X(7), Y(7), C0(6), S1(7), C0(7));
    
    fa008 : full_adder port map(X(8), Y(8), C0(7), S1(8), C0(8));
    fa009 : full_adder port map(X(9), Y(9), C0(8), S1(9), C0(9));
    fa010 : full_adder port map(X(10), Y(10), C0(9), S1(10), C0(10));
    fa011 : full_adder port map(X(11), Y(11), C0(10), S1(11), C0(11));
    
    fa012 : full_adder port map(X(12), Y(12), C0(11), S1(12), C0(12));
    fa013 : full_adder port map(X(13), Y(13), C0(12), S1(13), C0(13));
    fa014 : full_adder port map(X(14), Y(14), C0(13), S1(14), C0(14));
    fa015 : full_adder port map(X(15), Y(15), C0(14), S1(15), C0(15));
    
--Second 16_bit adder with Cin = 1
    fa100 : full_adder port map(X(0), Y(0), '1', S2(0), C1(0));
    fa101 : full_adder port map(X(1), Y(1), C1(0), S2(1), C1(1));
    fa102 : full_adder port map(X(2), Y(2), C1(1), S2(2), C1(2));
    fa103 : full_adder port map(X(3), Y(3), C1(2), S2(3), C1(3));
    
    fa104 : full_adder port map(X(4), Y(4), C1(3), S2(4), C1(4));
    fa105 : full_adder port map(X(5), Y(5), C1(4), S2(5), C1(5));
    fa106 : full_adder port map(X(6), Y(6), C1(5), S2(6), C1(6));
    fa107 : full_adder port map(X(7), Y(7), C1(6), S2(7), C1(7));
    
    fa108 : full_adder port map(X(8), Y(8), C1(7), S2(8), C1(8));
    fa109 : full_adder port map(X(9), Y(9), C1(8), S2(9), C1(9));
    fa110 : full_adder port map(X(10), Y(10), C1(9), S2(10), C1(10));
    fa111 : full_adder port map(X(11), Y(11), C1(10), S2(11), C1(11));
    
    fa112 : full_adder port map(X(12), Y(12), C1(11), S2(12), C1(12));
    fa113 : full_adder port map(X(13), Y(13), C1(12), S2(13), C1(13));
    fa114 : full_adder port map(X(14), Y(14), C1(13), S2(14), C1(14));
    fa115 : full_adder port map(X(15), Y(15), C1(14), S2(15), C1(15));
    
--Multiplexers configuration
    mux00: mux_2to1 port map(S1(0), S2(0), Cin, Sout(0));
    mux01: mux_2to1 port map(S1(1), S2(1), Cin, Sout(1));
    mux02: mux_2to1 port map(S1(2), S2(2), Cin, Sout(2));
    mux03: mux_2to1 port map(S1(3), S2(3), Cin, Sout(3));
    
    mux04: mux_2to1 port map(S1(4), S2(4), Cin, Sout(4));
    mux05: mux_2to1 port map(S1(5), S2(5), Cin, Sout(5));
    mux06: mux_2to1 port map(S1(6), S2(6), Cin, Sout(6));
    mux07: mux_2to1 port map(S1(7), S2(7), Cin, Sout(7));
    
    mux08: mux_2to1 port map(S1(8), S2(8), Cin, Sout(8));
    mux09: mux_2to1 port map(S1(9), S2(9), Cin, Sout(9));
    mux10: mux_2to1 port map(S1(10), S2(10), Cin, Sout(10));
    mux11: mux_2to1 port map(S1(11), S2(11), Cin, Sout(11));
    
    mux12: mux_2to1 port map(S1(12), S2(12), Cin, Sout(12));
    mux13: mux_2to1 port map(S1(13), S2(13), Cin, Sout(13));
    mux14: mux_2to1 port map(S1(14), S2(14), Cin, Sout(14));
    mux15: mux_2to1 port map(S1(15), S2(15), Cin, Sout(15));
    
--Multiplexer for Carry out value
    mux: mux_2to1 port map(C0(15), C1(15), Cin, Cout);
    

end Behavioral;
