

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.arr_pkg.all;

entity test_module_register_file is
port (read_A1,read_A2,write_A3: in std_logic_vector(2 downto 0);
data_A1,data_A2,pc_out: out std_logic_vector(15 downto 0);
data_A3,pc_in: in std_logic_vector(15 downto 0);
register_file: inout reg_array;
read_signal,write_signal,reset,clock,pc_write: in std_logic

);
end test_module_register_file;

architecture Behavioral of test_module_register_file is
component mux_register_file is
port (clock: in std_logic;
A,B: in std_logic_vector(2 downto 0);
reg_file:  reg_array;
out1 , out2 : out std_logic_vector(15 downto 0)
);
end component;

component D_flip_flop is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(15 downto 0);
Q : out std_logic_vector(15 downto 0)
);
end component;
component mux_input_reg is
port( A: in std_logic_vector(2 downto 0);
pcwrite,write_s,clock:in std_logic;
selection: out std_logic_vector(7 downto 0)
);
end component;

signal reg_file: reg_array;
signal write_signal_pc: std_logic;
signal selection : std_logic_vector(7 downto 0);
signal out1,out2,data_A3_in : std_logic_vector(15 downto 0);
signal sel : std_logic_vector(7 downto 0):="00000000";
begin
-----------------------------------write--------------------------------------------
process(data_A3,pc_in,pc_write,write_signal)
begin
if( pc_write='1')then
data_A3_in<=pc_in;
write_signal_pc<=pc_write;
else
data_A3_in<= data_A3;
write_signal_pc<=write_signal;
end if;
end process;
-------------------------------------------------------------------------------------
process(write_A3,pc_write,write_signal)
begin
if(write_signal='1')then
if(write_A3="000" )then
sel(0)<='1';
else
sel(0)<='0';
end if;
if(write_A3="001" )then
sel(1)<='1';
else
sel(1)<='0';
end if;
if(write_A3="010" )then
sel(2)<='1';
else
sel(2)<='0';
end if;
if(write_A3="011" )then
sel(3)<='1';
else
sel(3)<='0';
end if;
if(write_A3="100" )then
sel(4)<='1';
else
sel(4)<='0';
end if;
if(write_A3="101" )then
sel(5)<='1';
else
sel(5)<='0';
end if;
if(write_A3="110" )then
sel(6)<='1';
else
sel(6)<='0';
end if;
if((write_A3="111" or pc_write='1') )then
sel(7)<='1';
else
sel(7)<='0';
end if;
end if;
end process;
process(clock,sel)
begin
case clock is
when '1'=>
selection<=sel;
when '0'=>
selection<="00000000";
when others=>
selection<="00000000";
end case;
end process;


---------------------------------------------------------------------------------------------
--p:mux_input_reg port map (write_A3,pc_write,write_signal,clock,selection);
w1: D_flip_flop port map(clock,reset,selection(0),write_signal,data_A3,reg_file(0));
w2: D_flip_flop port map(clock,reset,selection(1),write_signal,data_A3,reg_file(1));
w3: D_flip_flop port map(clock,reset,selection(2),write_signal,data_A3,reg_file(2));
w4: D_flip_flop port map(clock,reset,selection(3),write_signal,data_A3,reg_file(3));
w5: D_flip_flop port map(clock,reset,selection(4),write_signal,data_A3,reg_file(4));
w6: D_flip_flop port map(clock,reset,selection(5),write_signal,data_A3,reg_file(5));
w7: D_flip_flop port map(clock,reset,selection(6),write_signal,data_A3,reg_file(6));
w8: D_flip_flop port map(clock,reset,selection(7),write_signal_pc,data_A3_in,reg_file(7));
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

