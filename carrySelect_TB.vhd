library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carrySelect_TB is
--  Port ( );
end carrySelect_TB;

architecture TestBench of carrySelect_TB is
    component carrySelect_16Bit
        Port ( X, Y : in STD_LOGIC_VECTOR (15 downto 0);
           Cin : in STD_LOGIC; Cout : out STD_LOGIC;
           Sout : out STD_LOGIC_VECTOR (15 downto 0));
    end component;
    
    --input signals
    signal A, B : std_logic_vector(15 downto 0) := x"0000";
    signal Cin :std_logic := '0';
    
    --output signals
    signal Sout : std_logic_vector(15 downto 0);
    signal Cout : std_logic;
begin
    uut: carrySelect_16Bit port map(X=>A, Y=>B, Cin=>Cin, Cout=>Cout, Sout=>Sout);
    stim:process
    begin
        wait for 10 ns;
        Cin <= '1';
        
        wait for 10 ns;
        A <= x"8888";
        B <= x"7777";
        Cin <= '0';
        
        wait for 10 ns;
        Cin <= '1';
        
        wait for 10 ns;
        A <= x"1234";
        B <= x"4321";
        Cin <= '0';
        
        wait for 10 ns;
        A <= x"006a";
        B <= x"001a";
        
    end process;
end TestBench;
