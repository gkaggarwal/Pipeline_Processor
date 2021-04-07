library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_16bit_input is
port(A,B: in std_logic_vector(15 downto 0);
select_line: in std_logic;
output:out std_logic_vector(15 downto 0)
);
end mux_16bit_input;

architecture Behavioral of mux_16bit_input is

begin
process(A,B,select_line)
begin
if(select_line='1')then
output<=A;
else
output<=B;
end if;
end process;

end Behavioral;

