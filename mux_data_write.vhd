library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_data_write is
port(A,B,C: in std_logic_vector(15 downto 0);
select_line: in std_logic_vector(1 downto 0);
output:out std_logic_vector(15 downto 0)
);
end mux_data_write;

architecture Behavioral of mux_data_write is

begin
process(A,B,C,select_line)
begin
if(select_line="01")then
output<=A;
elsif(select_line="10")then
output<=C;
else
output<=B;
end if;
end process;

end Behavioral;

