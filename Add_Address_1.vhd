
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Add_Address_1 is
port(A: in std_logic_vector(15 downto 0);
output: out std_logic_vector(15 downto 0)
);
end Add_Address_1;

architecture Behavioral of Add_Address_1 is
component adder_1bit is
port(A,B,Cin: in std_logic;
s,c: out std_logic
);
end component;
signal sum, c: std_logic_vector(15 downto 0);

begin
add0: adder_1bit port map(A(0),'1','0',sum(0),c(0));
add1: adder_1bit port map(A(1),'0',c(0),sum(1),c(1));
add2: adder_1bit port map(A(2),'0',c(1),sum(2),c(2));
add3: adder_1bit port map(A(3),'0',c(2),sum(3),c(3));
add4: adder_1bit port map(A(4),'0',c(3),sum(4),c(4));
add5: adder_1bit port map(A(5),'0',c(4),sum(5),c(5));
add6: adder_1bit port map(A(6),'0',c(5),sum(6),c(6));
add7: adder_1bit port map(A(7),'0',c(6),sum(7),c(7));
add8: adder_1bit port map(A(8),'0',c(7),sum(8),c(8));
add9: adder_1bit port map(A(9),'0',c(8),sum(9),c(9));
add10: adder_1bit port map(A(10),'0',c(9),sum(10),c(10));
add11: adder_1bit port map(A(11),'0',c(10),sum(11),c(11));
add12: adder_1bit port map(A(12),'0',c(11),sum(12),c(12));
add13: adder_1bit port map(A(13),'0',c(12),sum(13),c(13));
add14: adder_1bit port map(A(14),'0',c(13),sum(14),c(14));
add15: adder_1bit port map(A(15),'0',c(14),sum(15),c(15));

output<=sum;
end Behavioral;

