library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_alu_result is
port(A,B: in std_logic_vector(15 downto 0);
select_line: in std_logic;
output:out std_logic_vector(15 downto 0)
);
end mux_alu_result;

architecture Behavioral of mux_alu_result is

begin
process(A,B,select_line)
begin
if(select_line='1')then
output<=A;
elsif(select_line='0')then
output<=B;
end if;
end process;

end Behavioral;

