
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adder_16bit is
port(A,B: in std_logic_vector(15 downto 0);
sum_adder: out std_logic_vector(15 downto 0);
carry,zero: out std_logic
);
end adder_16bit;

architecture Behavioral of adder_16bit is
component adder_1bit is
port(A,B,Cin: in std_logic;
s,c: out std_logic
);
end component;
signal sum,c: std_logic_vector(15 downto 0);

begin
add0: adder_1bit port map(A(0),B(0),'0',sum(0),c(0));
add1: adder_1bit port map(A(1),B(1),c(0),sum(1),c(1));
add2: adder_1bit port map(A(2),B(2),c(1),sum(2),c(2));
add3: adder_1bit port map(A(3),B(3),c(2),sum(3),c(3));
add4: adder_1bit port map(A(4),B(4),c(3),sum(4),c(4));
add5: adder_1bit port map(A(5),B(5),c(4),sum(5),c(5));
add6: adder_1bit port map(A(6),B(6),c(5),sum(6),c(6));
add7: adder_1bit port map(A(7),B(7),c(6),sum(7),c(7));
add8: adder_1bit port map(A(8),B(8),c(7),sum(8),c(8));
add9: adder_1bit port map(A(9),B(9),c(8),sum(9),c(9));
add10: adder_1bit port map(A(10),B(10),c(9),sum(10),c(10));
add11: adder_1bit port map(A(11),B(11),c(10),sum(11),c(11));
add12: adder_1bit port map(A(12),B(12),c(11),sum(12),c(12));
add13: adder_1bit port map(A(13),B(13),c(12),sum(13),c(13));
add14: adder_1bit port map(A(14),B(14),c(13),sum(14),c(14));
add15: adder_1bit port map(A(15),B(15),c(14),sum(15),carry);
process(sum,A,B)
begin
if(sum="0000000000000000")then
zero<='1';
else 
zero<='0';
end if;
end process;
sum_adder<=sum;
end Behavioral;

