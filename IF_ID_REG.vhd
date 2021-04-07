library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IF_ID_REG is
port(clock,reset,read_data: in std_logic;
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
C: in std_logic_vector(7 downto 0);
D: in std_logic_vector(2 downto 0);
E:in std_logic;
IF_ID_Register: out std_logic_vector(47 downto 0);
output_AB: out std_logic_vector(47 downto 0)
);
end IF_ID_REG;

architecture Behavioral of IF_ID_REG is
component D_flipflop is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(15 downto 0);
Q : out std_logic_vector(15 downto 0)
);
end component;

signal F: std_logic_vector(15 downto 0);
signal IF_ID: std_logic_vector(47 downto 0);
begin
F(7 downto 0)<=C;
F(10 downto 8)<=D;
F(11)<=E;
F(12)<='1';
A1: D_flipflop port map(clock,reset,'1','1',A,IF_ID(31 Downto 16));
A2: D_flipflop port map(clock,reset,'1','1',B,IF_ID(15 Downto 0));
A3: D_flipflop port map(clock,reset,'1','1',F,IF_ID(47 Downto 32));

IF_ID_register<=IF_ID;
process(IF_ID,clock,reset,A,B,read_data)
begin
if(falling_edge(clock) )then
if(read_data='1')then
output_AB(31 downto 16)<=IF_ID(31 downto 16);
output_AB(15 downto 0)<=IF_ID(15 downto 0);
output_AB(47 downto 32)<=IF_ID(47 downto 32);
else
output_AB(47 downto 32)<=IF_ID(47 downto 32);
end if;
end if;
end process;
end Behavioral;

