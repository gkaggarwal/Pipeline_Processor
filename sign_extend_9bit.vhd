
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_extend_9bit is
port(A: in std_logic_vector(8 downto 0);
B: out std_logic_vector(15 downto 0)
);
end sign_extend_9bit;

architecture Behavioral of sign_extend_9bit is

begin
B(15 downto 7)<=A;
B(6 downto 0)<="0000000";

end Behavioral;

