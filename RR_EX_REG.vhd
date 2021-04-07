library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RR_EX_REG is
port(clock,reset: in std_logic;
A: in std_logic_vector(15 downto 0);
B,D,E: in std_logic_vector(15 downto 0);
C: in std_logic_vector(23 downto 0);
F: in std_logic_vector(2 downto 0);
G: in std_logic;
RR_EX_Register: out std_logic_vector(91 downto 0);
output_AB: out std_logic_vector(91 downto 0)
);
end RR_EX_REG;

architecture Behavioral of RR_EX_REG is
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

signal RR_EX: std_logic_vector(91 downto 0);
begin
A1: D_flipflop port map(clock,reset,'1','1',A,RR_EX(31 Downto 16));
A2: D_flipflop port map(clock,reset,'1','1',B,RR_EX(15 Downto 0));
A4: D_flipflop port map(clock,reset,'1','1',D,RR_EX(47 Downto 32));
A5: D_flipflop port map(clock,reset,'1','1',E,RR_EX(63 Downto 48));
A3: D_flipflop1 port map(clock,reset,'1','1',C,RR_EX(87 Downto 64));
A6: D_flip_3bit port map(clock,reset,'1','1',F,RR_EX(90 Downto 88));
A7: Dflip_1bit port map(clock,reset,'1','1',G,RR_EX(91));
RR_EX_Register<=RR_EX;
process(RR_EX,clock,reset,A,B)
begin
if(rising_edge(clock))then
output_AB(31 downto 16)<=RR_EX(31 downto 16);
output_AB(15 downto 0)<=RR_EX(15 downto 0);
output_AB(47 downto 32)<=RR_EX(47 downto 32);
output_AB(63 downto 48)<=RR_EX(63 downto 48);
output_AB(87 downto 64)<=RR_EX(87 downto 64);
output_AB(90 downto 88)<=RR_EX(90 downto 88);
output_AB(91)<=RR_EX(91);

end if;
end process;
end Behavioral;

