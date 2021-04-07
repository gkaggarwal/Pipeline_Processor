
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Forwarding_Unit is
port(RR_EX_1,RR_EX_2,EX_MEM,MEM_WB: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
EX_MEM_SIGNAL,MEM_WB_SIGNAL: IN STD_LOGIC;
FORWARD_A,FORWARD_B: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
end Forwarding_Unit;

architecture Behavioral of Forwarding_Unit is

begin
PROCESS(RR_EX_1,RR_EX_2,EX_MEM,MEM_WB,EX_MEM_SIGNAL,MEM_WB_SIGNAL)
BEGIN
---------------------------------------------------------
IF(EX_MEM_SIGNAL='1' AND (EX_MEM=RR_EX_1))THEN
FORWARD_A<="01";
ELSIF(MEM_WB_SIGNAL='1' AND (MEM_WB=RR_EX_1))THEN
FORWARD_A<="10";
ELSE
FORWARD_A<="00";
END IF;
--------------------------------------------------------------------------
IF(EX_MEM_SIGNAL='1' AND (EX_MEM=RR_EX_2))THEN
FORWARD_B<="01";
ELSIF(MEM_WB_SIGNAL='1' AND (MEM_WB=RR_EX_2))THEN
FORWARD_B<="10";
ELSE
FORWARD_B<="00";
END IF;
END PROCESS;
end Behavioral;

