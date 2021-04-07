
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instruction_memory is
port (Address: in std_logic_vector(15 downto 0);
instruction:out std_logic_vector(15 downto 0);
memory_0,memory_1,memory_2,memory_3,memory_4,memory_5,memory_6,memory_7,memory_8,memory_9,memory_10,memory_11,memory_12,memory_13,memory_14,memory_15,memory_16,memory_17,memory_18,memory_19,memory_20:in std_logic_vector(15 downto 0)
);
end instruction_memory;

architecture Behavioral of instruction_memory is

begin
process(Address)
begin
if(Address="0000000000000000")then
instruction<=memory_0;
elsif(Address="0000000000000001")then
instruction<=memory_1;
elsif(Address="0000000000000010")then
instruction<=memory_2;
elsif(Address="0000000000000011")then
instruction<=memory_3;
elsif(Address="0000000000000100")then
instruction<=memory_4;
elsif(Address="0000000000000101")then
instruction<=memory_5;
elsif(Address="0000000000000110")then
instruction<=memory_6;
elsif(Address="0000000000000111")then
instruction<=memory_7;
elsif(Address="0000000000001000")then
instruction<=memory_8;
elsif(Address="0000000000001001")then
instruction<=memory_9;
elsif(Address="0000000000001010")then
instruction<=memory_10;
elsif(Address="0000000000001011")then
instruction<=memory_11;
elsif(Address="0000000000001100")then
instruction<=memory_12;
elsif(Address="0000000000001101")then
instruction<=memory_13;
elsif(Address="0000000000001110")then
instruction<=memory_14;
elsif(Address="0000000000001111")then
instruction<=memory_15;
elsif(Address="0000000000010000")then
instruction<=memory_16;
elsif(Address="0000000000010001")then
instruction<=memory_17;
elsif(Address="0000000000010010")then
instruction<=memory_18;
elsif(Address="0000000000010011")then
instruction<=memory_19;
elsif(Address="0000000000010100")then
instruction<=memory_20;


end if;
end process;
end Behavioral;

