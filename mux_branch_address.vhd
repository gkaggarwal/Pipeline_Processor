
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_branch_address is
port(A,B,C: in std_logic_vector(15 downto 0);
select_line: in std_logic_vector(1 downto 0);
output:  out std_logic_vector(15 downto 0)
);
end mux_branch_address;

architecture Behavioral of mux_branch_address is

begin
process(A,B,C,select_line)
begin
if(select_line="00")then
output<=A;
elsif(select_line="01")then
output<=B;
elsif(select_line="10")then
output<=C;
else
output<=A;
end if;
end process;
end Behavioral;

