library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEM_WB_REG is
port(clock,reset: in std_logic;
A: in std_logic_vector(15 downto 0);
B,D,E: in std_logic_vector(15 downto 0);
Z,Carry,G,H: in std_logic;
C: in std_logic_vector(23 downto 0);
I: in std_logic_vector(2 downto 0);
MEM_WB_Register: out std_logic_vector(94 downto 0);
output_AB: out std_logic_vector(94 downto 0)
);
end MEM_WB_REG;

architecture Behavioral of MEM_WB_REG is
component D_FLIP is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(15 downto 0);
Q : out std_logic_vector(15 downto 0)
);
end component;
component D_FLIP1 is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(23 downto 0);
Q : out std_logic_vector(23 downto 0)
);
end component;
component D_FLIP_1BIT is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic;
Q : out std_logic
);
end component;

component D_flip_3 is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(2 downto 0);
Q : out std_logic_vector(2 downto 0)
);
end component;

component D_flipflop is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(15 downto 0);
Q : out std_logic_vector(15 downto 0)
);
end component;

signal MEM_WB: std_logic_vector(94 downto 0);
begin
A1: D_FLIP port map(clock,reset,'1','1',A,MEM_WB(31 Downto 16));
A2: D_FLIP port map(clock,reset,'1','1',B,MEM_WB(15 Downto 0));
A4: D_flipflop port map(clock,reset,'1','1',D,MEM_WB(47 Downto 32));
A5:D_FLIP_1BIT port map(clock,reset,'1','1',Z,MEM_WB(72));
A6:D_FLIP_1BIT port map(clock,reset,'1','1',Carry,MEM_WB(73));
A7:D_FLIP_1BIT port map(clock,reset,'1','1',G,MEM_WB(74));
A8:D_FLIP_1BIT port map(clock,reset,'1','1',H,MEM_WB(75));
A3: D_FLIP1 port map(clock,reset,'1','1',C,MEM_WB(71 Downto 48));
A9: D_FLIP port map(clock,reset,'1','1',E,MEM_WB(91 Downto 76));
A10:D_flip_3 port map(clock,reset,'1','1',I,MEM_WB(94 Downto 92));
MEM_WB_Register<=MEM_WB;
process(MEM_WB,clock,reset,A,B)
begin
if(rising_edge(clock))then
output_AB(31 downto 16)<=MEM_WB(31 downto 16);
output_AB(15 downto 0)<=MEM_WB(15 downto 0);
output_AB(47 downto 32)<=MEM_WB(47 downto 32);
output_AB(71 downto 48)<=MEM_WB(71 downto 48);
output_AB(72)<=MEM_WB(72);
output_AB(73)<=MEM_WB(73);
output_AB(72)<=MEM_WB(74);
output_AB(73)<=MEM_WB(75);
output_AB(91 downto 76)<=MEM_WB(91 downto 76);
output_AB(94 downto 92)<=MEM_WB(94 downto 92);
end if;
end process;
end Behavioral;

