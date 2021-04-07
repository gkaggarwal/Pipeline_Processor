
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity dflip is
port(clock,A: in std_logic;
B: out std_logic
);
end dflip;

architecture Behavioral of dflip is

begin
process(clock)
begin
if(clock'event and clock='1')then
B<=A;
end if;
end process;
end Behavioral;

