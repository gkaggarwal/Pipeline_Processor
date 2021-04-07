
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Dflip_1bit is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic;
Q : out std_logic
);
end Dflip_1bit;

architecture Behavioral of Dflip_1bit is
begin
process(clock,reset,load,write1,Data)
begin
if(reset='1')then
Q<='0';
elsif((write1='1' and load='1' ) ) then
Q<= Data;
end if;
end process;

end Behavioral;

