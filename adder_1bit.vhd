library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity adder_1bit is
port(A,B,Cin: in std_logic;
s,c: out std_logic
);
end adder_1bit;

architecture Behavioral of adder_1bit is

begin
s<=((A xor B) xor Cin);
c<= ((A and B) or (B and Cin) or (A and Cin));

end Behavioral;

