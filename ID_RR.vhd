library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ID_RR is
port(clock,reset: in std_logic;
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
C: in std_logic_vector(23 downto 0);
D: in std_logic_vector(7 downto 0);
E: in std_logic_vector(2 downto 0);
F: in std_logic;
ID_RR_Register: out std_logic_vector(67 downto 0);
output_AB: out std_logic_vector(67 downto 0)
);
end ID_RR;

architecture Behavioral of ID_RR is
component D_flipflop is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(15 downto 0);
Q : out std_logic_vector(15 downto 0)
);
end component;
component D_flipflop1 is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(23 downto 0);
Q : out std_logic_vector(23 downto 0)
);
end component;

component D_flip_8bit is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(7 downto 0);
Q : out std_logic_vector(7 downto 0)
);
end component;

component D_flip_3bit is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(2 downto 0);
Q : out std_logic_vector(2 downto 0)
);
end component;

component Dflip_1bit is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic;
Q : out std_logic
);
end component;

-------------------------------------------------------------------------------

signal ID_RR: std_logic_vector(67 downto 0);
begin
A1: D_flipflop port map(clock,reset,'1','1',A,ID_RR(31 Downto 16));
A2: D_flipflop port map(clock,reset,'1','1',B,ID_RR(15 Downto 0));
A3: D_flipflop1 port map(clock,reset,'1','1',C,ID_RR(55 Downto 32));
A4: D_flip_8bit port map(clock,reset,'1','1',D,ID_RR(63 Downto 56));
A5: D_flip_3bit port map(clock,reset,'1','1',E,ID_RR(66 Downto 64));
A6: Dflip_1bit port map(clock,reset,'1','1',F,ID_RR(67));

ID_RR_Register<=ID_RR;
process(ID_RR,clock,reset,A,B)
begin
if(rising_edge(clock))then
output_AB(31 downto 16)<=ID_RR(31 downto 16);
output_AB(15 downto 0)<=ID_RR(15 downto 0);
output_AB(55 downto 32)<=ID_RR(55 downto 32);
output_AB(63 downto 56)<=ID_RR(63 downto 56);
output_AB(66 downto 64)<=ID_RR(66 downto 64);
output_AB(67)<=ID_RR(67);

end if;
end process;
end Behavioral;

