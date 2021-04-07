
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity And_gate is
port (A,B: in std_logic;
C: out std_logic
);
end And_gate;

architecture Behavioral of And_gate is

begin
process(A,B)
begin
if(A='1' AND B='1')THEN
C<='1';
ELSE
C<='0';
END IF;
END PROCESS;

end Behavioral;

