library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity nand_gate is
port(A,B: in std_logic_vector(15 downto 0);
output: out std_logic_vector(15 downto 0);
zero: out std_logic
);
end nand_gate;

architecture Behavioral of nand_gate is
signal output1: std_logic_vector(15 downto 0);
begin
output1<= A nand B;
output<=output1;
process(output1)
begin
if(output1="0000000000000000")then
zero<='1';
else 
zero<='0';
end if;
end process;

end Behavioral;

