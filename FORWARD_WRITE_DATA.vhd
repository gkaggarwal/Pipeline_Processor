
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FORWARD_WRITE_DATA is
PORT(mem_write,ws: IN STD_LOGIC;
EX_MEM_read,MEM_WB_write:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
FORWARD_WRITE_DATA_signal:OUT STD_LOGIC
) ;
end FORWARD_WRITE_DATA;

architecture Behavioral of FORWARD_WRITE_DATA is

BEGIN
PROCESS(mem_write,EX_MEM_read,MEM_WB_write)
BEGIN
IF((mem_write='1' and ws='1') and (EX_MEM_read=MEM_WB_write))then
FORWARD_WRITE_DATA_signal<='1';
ELSE
FORWARD_WRITE_DATA_signal<='0';
END IF;
END PROCESS;

end Behavioral;

