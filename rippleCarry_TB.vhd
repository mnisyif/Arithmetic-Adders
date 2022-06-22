library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rippleCarry_TB is
end rippleCarry_TB;

architecture TestBench of rippleCarry_TB is
    component rippleCarry_16Bit
        Port ( A, B : in STD_LOGIC_VECTOR (15 downto 0);
               Cin : in STD_LOGIC; Cout : out STD_LOGIC;
               Sout : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    --input signals
    signal A, B : std_logic_vector (15 downto 0) := x"0000";
    signal Cin : std_logic := '0';
    
    --output signals
    signal Sout : std_logic_vector(15 downto 0);
    signal Cout : std_logic;
begin
    uut: rippleCarry_16Bit port map(A=>A, B=>B, Cin=>Cin, Cout=>Cout, Sout=>Sout);
    stim: process
    begin
        wait for 10 ns;
        Cin <= '1';
        
        wait for 10 ns;
        A <= x"9999";
        B <= x"6666";
        Cin <= '0';
        
        wait for 10 ns;
        Cin <= '1';
        
        wait for 10 ns;
        A <= x"1234";
        B <= x"4321";
        Cin <= '0';
        
        wait for 10 ns;
        A <= x"0068";
        B <= x"00f5";
    end process;
end TestBench;
