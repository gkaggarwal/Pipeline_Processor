library ieee;
use ieee.std_logic_1164.all;
PACKAGE arr_pkg IS
type reg_array is array(0 to 7) of std_logic_vector(15 downto 0);
end;
 ---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.arr_pkg.all;

entity mux_register_file is
port (clock: in std_logic;
A,B: in std_logic_vector(2 downto 0);
reg_file: reg_array;
out1 , out2 : out std_logic_vector(15 downto 0)
);
end mux_register_file;

architecture Behavioral of mux_register_file is
signal output1 ,output2 : std_logic_vector(15 downto 0);
begin
process(A,B,reg_file)
begin
case A is
when "000"=>
output1<= reg_file(0); 
when "001"=>
output1<= reg_file(1); 
when "010"=>
output1<= reg_file(2); 
when "011"=>
output1<= reg_file(3); 
when "100"=>
output1<= reg_file(4); 
when "101"=>
output1<= reg_file(5); 
when "110"=>
output1<= reg_file(6); 
when "111"=>
output1<= reg_file(7);
when others=>
end case;
case B is  
when "000"=>
output2<= reg_file(0); 
when "001"=>
output2<= reg_file(1); 
when "010"=>
output2<= reg_file(2); 
when "011"=>
output2<= reg_file(3); 
when "100"=>
output2<= reg_file(4); 
when "101"=>
output2<= reg_file(5); 
when "110"=>
output2<= reg_file(6); 
when "111"=>
output2<= reg_file(7); 
when others=>
end case;
end process;
out1<=output1;
out2<=output2;
end Behavioral;

