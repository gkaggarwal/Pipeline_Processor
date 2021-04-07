library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EX_MEM_REG is
port(clock,reset: in std_logic;
A: in std_logic_vector(15 downto 0);
B,D: in std_logic_vector(15 downto 0);
C: in std_logic_vector(23 downto 0);
E,F,I,H:in std_logic;
G: in std_logic_vector(15 downto 0);
K,L,M: in std_logic_vector(15 downto 0);
O: in std_logic_vector(2 downto 0);
P: in std_logic;
EX_MEM_Register: out std_logic_vector(143 downto 0);
output_AB: out std_logic_vector(143 downto 0)
);
end EX_MEM_REG;

architecture Behavioral of EX_MEM_REG is
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
COMPONENT D_FLIP_1BIT is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic;
Q : out std_logic
);
end COMPONENT;
component D_flip_3 is
port (clock,reset,load,write1: in std_logic;
 Data : in std_logic_vector(2 downto 0);
Q : out std_logic_vector(2 downto 0)
);
end component;

signal EX_MEM: std_logic_vector(143 downto 0);
begin
A1: D_FLIP port map(clock,reset,'1','1',A,EX_MEM(31 Downto 16));
A2: D_FLIP port map(clock,reset,'1','1',B,EX_MEM(15 Downto 0));
A4: D_FLIP port map(clock,reset,'1','1',D,EX_MEM(47 Downto 32));
A5: D_FLIP_1BIT port map(clock,reset,'1','1',E,EX_MEM(48));
A6: D_FLIP_1BIT port map(clock,reset,'1','1',F,EX_MEM(49));
A9: D_FLIP_1BIT port map(clock,reset,'1','1',I,EX_MEM(90));
A8: D_FLIP_1BIT port map(clock,reset,'1','1',H,EX_MEM(91));
A10: D_FLIP port map(clock,reset,'1','1',K,EX_MEM(107 Downto 92));
A7: D_FLIP port map(clock,reset,'1','1',G,EX_MEM(89 Downto 74));
A3: D_FLIP1 port map(clock,reset,'1','1',C,EX_MEM(73 Downto 50));
A11: D_FLIP port map(clock,reset,'1','1',L,EX_MEM(123 Downto 108));
A12: D_FLIP port map(clock,reset,'1','1',M,EX_MEM(139 Downto 124));
A13: D_FLIP_1BIT port map(clock,reset,'1','1',P,EX_MEM(143));
A14: D_flip_3 port map(clock,reset,'1','1',O,EX_MEM(142 downto 140));

EX_MEM_Register<=EX_MEM;
process(EX_MEM,clock,reset,A,B)
begin
if(rising_edge(clock))then
output_AB(31 downto 16)<=EX_MEM(31 downto 16);
output_AB(15 downto 0)<=EX_MEM(15 downto 0);
output_AB(47 downto 32)<=EX_MEM(47 downto 32);
output_AB( 48)<=EX_MEM( 48);
output_AB( 49)<=EX_MEM( 49);
output_AB( 90)<=EX_MEM( 90);
output_AB( 91)<=EX_MEM( 91);
output_AB(73 downto 50)<=EX_MEM(73 downto 50);
output_AB(89 downto 74)<=EX_MEM(89 downto 74);
output_AB(107 downto 92)<=EX_MEM(107 downto 92);
output_AB(123 downto 108)<=EX_MEM(123 downto 108);
output_AB(139 downto 124)<=EX_MEM(139 downto 124);
output_AB(142 downto 140)<=EX_MEM(142 downto 140);
output_AB(143)<=EX_MEM(143);

end if;
end process;
end Behavioral;

