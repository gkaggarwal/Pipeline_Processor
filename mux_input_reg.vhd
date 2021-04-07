
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux_input_reg is
port( A: in std_logic_vector(2 downto 0);
pcwrite,write_s,clock:in std_logic;
selection: out std_logic_vector(7 downto 0)
);

end mux_input_reg;

architecture Behavioral of mux_input_reg is
signal sel : std_logic_vector(7 downto 0):="00000000";
begin
process(A,pcwrite,write_s)
begin
if(write_s='1')then
if(A="000" )then
sel(0)<='1';
else
sel(0)<='0';
end if;
if(A="001" )then
sel(1)<='1';
else
sel(1)<='0';
end if;
if(A="010" )then
sel(2)<='1';
else
sel(2)<='0';
end if;
if(A="011" )then
sel(3)<='1';
else
sel(3)<='0';
end if;
if(A="100" )then
sel(4)<='1';
else
sel(4)<='0';
end if;
if(A="101" )then
sel(5)<='1';
else
sel(5)<='0';
end if;
if(A="110" )then
sel(6)<='1';
else
sel(6)<='0';
end if;
if((A="111" or pcwrite='1') )then
sel(7)<='1';
else
sel(7)<='0';
end if;
end if;
end process;
selection<=sel;
end Behavioral;

