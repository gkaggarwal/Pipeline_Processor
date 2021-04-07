

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.arr_pkg.all;

entity register_file is
port (read_A1,read_A2,write_A3: in std_logic_vector(2 downto 0);
data_A1,data_A2,pc_out: out std_logic_vector(15 downto 0);
data_A3,pc_in: in std_logic_vector(15 downto 0);
register_file: inout reg_array;
read_signal,write_signal,reset,clock,pc_write: in std_logic

);
end register_file;

architecture Behavioral of register_file is
component mux_register_file is
port (clock: in std_logic;
A,B: in std_logic_vector(2 downto 0);
reg_file:  reg_array;
out1 , out2 : out std_logic_vector(15 downto 0)
);
end component;


signal reg_file: reg_array;
signal write_signal_pc: std_logic;
signal selection : std_logic_vector(7 downto 0);
signal out1,out2,data_A3_in ,output: std_logic_vector(15 downto 0);
signal sel : std_logic_vector(7 downto 0):="00000000";
begin
-----------------------------------write--------------------------------------------
process(data_A3,pc_in,pc_write,write_signal,write_A3)
begin
if( pc_write='1')then
if(write_signal='1' and write_A3="111")then
data_A3_in<= data_A3;
write_signal_pc<=write_signal;
else
data_A3_in<=pc_in;
write_signal_pc<=pc_write;
end if;
else
data_A3_in<= data_A3;
write_signal_pc<=write_signal;
end if;
end process;
-------------------------------------------------------------------------------------
process(write_A3,pc_write,write_signal,data_A3,data_A3_in,reset)
begin
if((write_A3="000" and reset='0') and write_signal='1')then
reg_file(0)<=data_A3;
elsif(reset='1')then
reg_file(0)<="0000000000000000";
end if;
if((write_A3="001" and reset='0') and write_signal='1' )then
reg_file(1)<=data_A3;
elsif(reset='1')then
reg_file(1)<="0000000000000000";

end if;
if((write_A3="010" and reset='0') and write_signal='1')then
reg_file(2)<=data_A3;
elsif(reset='1')then
reg_file(2)<="0000000000000000";
end if;
if((write_A3="011" and reset='0') and write_signal='1')then
reg_file(3)<=data_A3;
elsif(reset='1')then
reg_file(3)<="0000000000000000";
end if;
if((write_A3="100" and reset='0' )and write_signal='1')then
reg_file(4)<=data_A3;
elsif(reset='1')then
reg_file(4)<="0000000000000000";
end if;
if((write_A3="101" and reset='0' )and write_signal='1')then
reg_file(5)<=data_A3;
elsif(reset='1')then
reg_file(5)<="0000000000000000";
end if;
if((write_A3="110" and reset='0') and write_signal='1')then
reg_file(6)<=data_A3;
elsif(reset='1')then
reg_file(6)<="0000000000000000";
end if;
if(((write_A3="111" and write_signal='1') or pc_write='1') and reset='0')then
reg_file(7)<=data_A3_in;
elsif(reset='1')then
reg_file(7)<="0000000000000000";
end if;
end process;


register_file<= reg_file;
-----------------------------------read--------------------------------------
R: mux_register_file port map(clock,read_A1,read_A2,register_file,out1,out2);
process(clock,read_signal,out1,out2)
begin

if(falling_edge(clock))then
pc_out<=reg_file(7);
if ( read_signal='1')then
data_A1<=out1;
data_A2<=out2;
end if;
end if;
end process;
--------------------------------------------------------------------------------------

end Behavioral;

