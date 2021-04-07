
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_write_signal is
port(A,B,C:in std_logic;
select_line: in std_logic_vector(1 downto 0);
output: out std_logic 
);
end mux_write_signal;

architecture Behavioral of mux_write_signal is

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
output<='0';
end if;

end process;
end Behavioral;

