
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_LM is
port(A,B: in std_logic_vector(7 downto 0);
select_line: in std_logic;
output: out std_logic_vector(7 downto 0)
);
end MUX_LM;

architecture Behavioral of MUX_LM is

begin
process(A,B,select_line)
begin
if(select_line='0')then
output<=A;
else
output<=B;
end if;
end process;

end Behavioral;

