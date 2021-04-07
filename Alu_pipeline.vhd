
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Alu_pipeline is
port(clock: in std_logic;
Alu_op: in std_logic_vector(3 downto 0); 
function_bit: in std_logic_vector(1 downto 0);
A,B: in std_logic_vector(15 downto 0);
Immediate_bit: in std_logic_vector(8 downto 0);
output: out std_logic_vector(15 downto 0);
Zero_flag,carry_flag,prev_carry,prev_zero: inout std_logic
);
end Alu_pipeline;

architecture Behavioral of Alu_pipeline is
component adder_16bit is
port(A,B: in std_logic_vector(15 downto 0);
sum_adder: out std_logic_vector(15 downto 0);
carry,zero: out std_logic
);
end component;
component dflip is
port(clock,A: in std_logic;
B: out std_logic
);
end component;
component nand_gate is
port(A,B: in std_logic_vector(15 downto 0);
output: out std_logic_vector(15 downto 0);
zero: out std_logic
);
end component;
component sign_extend is
port(A: in std_logic_vector(5 downto 0);
B: out std_logic_vector(15 downto 0)
);
end component;
component sign_extend_9bit is
port(A: in std_logic_vector(8 downto 0);
B: out std_logic_vector(15 downto 0)
);
end component;
component subtractor is
port(X,Y: in std_logic_vector(15 downto 0);
difference: out std_logic_vector(15 downto 0); 
 zero : out std_logic);
end component;

COMPONENT Add_Address_1 is
port(A: in std_logic_vector(15 downto 0);
output: out std_logic_vector(15 downto 0)
);
end COMPONENT;
---------------------------------------------------------------------------------------
signal sum1,sum,nand_output,Extended,sign_extended,subtract_result,sum2: std_logic_vector(15 downto 0);
signal nand_z,z,c,c1,z1,z2,carry,zero: std_logic;


-------------------------------------------------------------------------
begin
Add_Address: Add_Address_1 port map(B,sum2);
sign_ext: sign_extend_9bit port map(Immediate_bit,sign_extended);
sign: sign_extend port map(Immediate_bit(5 downto 0),Extended);
nand1: nand_gate port map(A,B,nand_output,nand_z);
add: adder_16bit port map(A,B,sum1,c,z);
add1: adder_16bit port map(A,Extended,sum,c1,z1);
subtract1: subtractor port map(A,B,subtract_result,z2);
a1: dflip port map(clock,carry_flag,carry);
a2: dflip port map(clock,zero_flag,zero);
process(clock)
begin
if(falling_edge(clock))then
prev_carry<=carry;
prev_zero<=zero;
end if;
end process;
process(Alu_op,function_bit,sum1,sum2,A,B,EXTENDED,clock,sum,subtract_result)
begin
if(Alu_op="0000" )then
if( function_bit="00")then
output<= sum1;
carry_flag<=c;
zero_flag<=z;
elsif( function_bit="10")then
if(carry='1')then
output<= sum1;
carry_flag<=c;
zero_flag<=z;
end if;
elsif( function_bit="01" )then
if(zero='1')then
output<= sum1;
carry_flag<=c;
zero_flag<=z;
end if;
end if;
--------------------------------------------------------
elsif(Alu_op="0001")then
output<=sum;
zero_flag<=z1;
carry_flag<=c1;
---------------------------------------------------------
elsif(Alu_op="0010")then
if(function_bit="00")then
output<=nand_output;
zero_flag<=nand_z;
end if;
------------------------------------------------------------------------
elsif(function_bit="10")then
if(carry='1')then
output<=nand_output;
zero_flag<=nand_z;
end if;
-------------------------------------------------------------------------
elsif(function_bit="01")then
if(zero='1')then
output<=nand_output;
zero_flag<=nand_z;
end if;

------------------------------------------------------------------
elsif(Alu_op="0011")then
output<=sign_extended;
------------------------------------------------------------------------------------

elsif(Alu_op="0100" or Alu_op="0101")then
output<=sum;
------------------------------------------------------------------------
elsif(Alu_op="0110")then
output<=sum2;


------------------------------------------------------------------
elsif(Alu_op="1100")then
output<=subtract_result;
zero_flag<=z2;
--------------------------------------------------------------------
end if;
end process;
end Behavioral;

