library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lookAhead_TB is
end lookAhead_TB;

architecture TestBench of lookAhead_TB is
    component carryLookahead_16Bit
        port(X, Y : in std_logic_vector(15 downto 0);
             Cin : in std_logic; Cout: out std_logic;
             Sout : out std_logic_vector(15 downto 0));
    end component;
    
    --input signals
    signal A, B : std_logic_vector (15 downto 0) := "0000000000000000";
    signal Cin : std_logic := '0';
    
    --output signals
    signal Sout : std_logic_vector(15 downto 0);
    signal Cout : std_logic;
begin
    uut: carryLookahead_16Bit port map(X => A, Y => B, Cin => Cin, Cout => Cout, Sout => Sout);
    stim: process
    begin
        wait for 10 ns;
        Cin <= '1';
        
        wait for 10 ns;
        A <= x"AAAA";
        B <= x"5555";
        Cin <= '0';
        
        wait for 10 ns;
        Cin <= '1';
        
        wait for 10 ns;
        A <= x"1234";
        B <= x"4321";
        Cin <= '0';
        
        wait for 10 ns;
        A <= x"00C4";
        B <= x"0032";
        
    end process;  
end TestBench;
