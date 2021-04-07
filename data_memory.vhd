library ieee;
use ieee.std_logic_1164.all;
PACKAGE mem_pkg IS
type mem_array is array(0 to 255) of std_logic_vector(15 downto 0);
end;
 ---------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.mem_pkg.all;

entity data_memory is
port(Address:in std_logic_vector(15 downto 0);
data: in std_logic_vector(15 downto 0);
read_data:out std_logic_vector(15 downto 0);
ram: inout mem_array;
mem_write,mem_read,clock:in std_logic
);
end data_memory;

architecture Behavioral of data_memory is
begin
process(clock,mem_write,ram,data,address)
begin
if(mem_write='1')then
ram(conv_integer(Address))<=data;
end if;
end process;
process(clock,mem_read)
begin
if(falling_edge(clock) and mem_read='1')then
read_data<= ram(conv_integer(Address));
end if;
end process;
end Behavioral;

