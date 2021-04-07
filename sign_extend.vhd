
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_extend is
port(A: in std_logic_vector(5 downto 0);
B: out std_logic_vector(15 downto 0)
);
end sign_extend;

architecture Behavioral of sign_extend is

begin
B(5 downto 0)<=A;
B(15 downto 6)<="0000000000";

end Behavioral;

