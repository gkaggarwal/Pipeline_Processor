
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity D_flip_rise is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(15 downto 0);
Q : out std_logic_vector(15 downto 0)
);
end D_flip_rise;

architecture Behavioral of D_flip_rise is
begin
process(clock,reset,load,write1,Data)
begin
if(reset='1')then
Q<="0000000000000000";
elsif((write1='1' and load='1') and rising_edge(clock)) then
Q<= Data;
end if;
end process;

end Behavioral;

