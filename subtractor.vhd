library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
entity subtractor is
port(X,Y: in std_logic_vector(15 downto 0);
difference: out std_logic_vector(15 downto 0); 
 zero : out std_logic);
end subtractor;
architecture Behavioral of subtractor is
signal diff,borrowout: std_logic_vector (15 downto 0);

begin


diff(0)<= X(0) xor Y(0) xor '0';
diff(1)<=X(1) xor Y(1) xor borrowout(1);
diff(2)<= X(2) xor Y(2) xor borrowout(2);
diff(3)<= X(3) xor Y(3) xor borrowout(3); 
diff(4)<=X(4) xor Y(4) xor borrowout(4);
diff(5)<= X(5) xor Y(5) xor borrowout(5);
diff(6)<= X(6) xor Y(6) xor borrowout(6); 
diff(7)<=X(7) xor Y(7) xor borrowout(7);
diff(8)<= X(8) xor Y(8) xor borrowout(8);
diff(9)<= X(9) xor Y(9) xor borrowout(9); 
diff(10)<=X(10) xor Y(10) xor borrowout(10);
diff(11)<= X(11) xor Y(11) xor borrowout(11);
diff(12)<= X(12) xor Y(12) xor borrowout(12); 
diff(13)<=X(13) xor Y(13) xor borrowout(13);
diff(14)<= X(14) xor Y(14) xor borrowout(14);
diff(15)<= X(15) xor Y(15) xor borrowout(15); 
borrowout(1)<=(((not X(0)) and Y(0) )or(( X(0) xnor Y(0)) and '0')); 
borrowout(2)<=(((not X(1)) and Y(1)) or( (X(1) xnor Y(1) )and borrowout(1))); 
borrowout(3)<=(((not X(2)) and Y(2)) or( (X(2) xnor Y(2)) and borrowout(2))); 
borrowout(4)<=(((not X(3)) and Y(3)) or( (X(3) xnor Y(3) )and borrowout(3))); 
borrowout(5)<=(((not X(4)) and Y(4)) or( (X(4) xnor Y(4)) and borrowout(4))); 
borrowout(6)<=(((not X(5)) and Y(5)) or( (X(5) xnor Y(5) )and borrowout(5))); 
borrowout(7)<=(((not X(6)) and Y(6)) or( (X(6) xnor Y(6)) and borrowout(6))); 
borrowout(8)<=(((not X(7)) and Y(7)) or( (X(7) xnor Y(7) )and borrowout(7))); 
borrowout(9)<=(((not X(8)) and Y(8)) or( (X(8) xnor Y(8)) and borrowout(8))); 
borrowout(10)<=(((not X(9)) and Y(9)) or( (X(9) xnor Y(9) )and borrowout(9))); 
borrowout(11)<=(((not X(10)) and Y(10)) or( (X(10) xnor Y(10)) and borrowout(10))); 
borrowout(12)<=(((not X(11)) and Y(11)) or( (X(11) xnor Y(11) )and borrowout(11))); 
borrowout(13)<=(((not X(12)) and Y(12)) or( (X(12) xnor Y(12)) and borrowout(12))); 
borrowout(14)<=(((not X(13)) and Y(13)) or( (X(13) xnor Y(13) )and borrowout(13))); 
borrowout(15)<=(((not X(14)) and Y(14)) or( (X(14) xnor Y(14)) and borrowout(14))); 

borrowout(0)<=(((not X(15)) and Y(15)) or( (X(15) xnor Y(15)) and borrowout(15))); 
process(diff,X,Y)
begin
if(diff="0000000000000000")then
zero<='1';
else
zero<='0';
end if;
end process;
difference<=diff;
end Behavioral;