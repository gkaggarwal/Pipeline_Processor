library ieee;
use ieee.std_logic_1164.all;

entity priority_decoder is
port( s: in std_logic_vector(2 downto 0);
 x:in std_logic_vector(7 downto 0);
p:out std_logic_vector(7 downto 0)
);
end priority_decoder;

 architecture Behavioral of priority_decoder is

begin
process(s(2),s(1),s(0))
begin
if(s(2)='0' and s(1)='0' and s(0)='0')then
p(0)<='0' ;p(1)<=x(1);p(2)<=x(2);p(3)<=x(3);p(4)<=x(4);p(5)<=x(5);p(6)<=x(6);p(7)<=x(7);

elsif(s(2)='0' and s(1)='0' and s(0)='1')then
p(0)<=x(0) ;p(1)<='0';p(2)<=x(2);p(3)<=x(3);p(4)<=x(4);p(5)<=x(5);p(6)<=x(6);p(7)<=x(7);
elsif(s(2)='0' and s(1)='1' and s(0)='0')then
p(0)<=x(0) ;p(1)<=x(1);p(2)<='0';p(3)<=x(3);p(4)<=x(4);p(5)<=x(5);p(6)<=x(6);p(7)<=x(7);

elsif(s(2)='0' and s(1)='1' and s(0)='1')then
p(0)<=x(0) ;p(1)<=x(1);p(2)<=x(2);p(3)<='0';p(4)<=x(4);p(5)<=x(5);p(6)<=x(6);p(7)<=x(7);

elsif(s(2)='1' and s(1)='0' and s(0)='0')then
p(0)<=x(0);p(1)<=x(1);p(2)<=x(2);p(3)<=x(3);p(4)<='0';p(5)<=x(5);p(6)<=x(6);p(7)<=x(7);

elsif(s(2)='1' and s(1)='0' and s(0)='1')then
p(0)<=x(0) ;p(1)<=x(1);p(2)<=x(2);p(3)<=x(3);p(4)<=x(4);p(5)<='0';p(6)<=x(6);p(7)<=x(7);
elsif(s(2)='1' and s(1)='1' and s(0)='0')then
p(0)<=x(0);p(1)<=x(1);p(2)<=x(2);p(3)<=x(3);p(4)<=x(4);p(5)<=x(5);p(6)<='0';p(7)<=x(7);
elsif(s(2)='1' and s(1)='1' and s(0)='1')then
p(0)<=x(0);p(1)<=x(1);p(2)<=x(2);p(3)<=x(3);p(4)<=x(4);p(5)<=x(5);p(6)<=x(6);p(7)<='0';
end if;

end process;
end Behavioral;