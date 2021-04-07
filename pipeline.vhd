library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.arr_pkg.all;
use work.mem_pkg.all;

ENTITY pipeline IS
PORT (clock,reset: IN std_logic
);
END pipeline;

ARCHITECTURE Behavioral OF pipeline IS

COMPONENT register_file is
port (read_A1,read_A2,write_A3: in std_logic_vector(2 downto 0);
data_A1,data_A2,pc_out: out std_logic_vector(15 downto 0);
data_A3,pc_in: in std_logic_vector(15 downto 0);
register_file: inout reg_array;
read_signal,write_signal,reset,clock,pc_write: in std_logic

);
end COMPONENT;

COMPONENT mux_16bit_input is
port(A,B: in std_logic_vector(15 downto 0);
select_line: in std_logic;
output:out std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT pc_adder is
port (clock: in std_logic;
A: in std_logic_vector(15 downto 0);
output_pc: out std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT instruction_memory is
port (Address: in std_logic_vector(15 downto 0);
instruction:out std_logic_vector(15 downto 0);
memory_0,memory_1,memory_2,memory_3,memory_4,memory_5,memory_6,memory_7,memory_8,memory_9,memory_10,memory_11,memory_12,memory_13,memory_14,memory_15,memory_16,memory_17,memory_18,memory_19,memory_20:in std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT IF_ID_REG is
port(clock,reset,read_data: in std_logic;
A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(15 downto 0);
C: in std_logic_vector(7 downto 0);
D: in std_logic_vector(2 downto 0);
E:in std_logic;
IF_ID_Register: out std_logic_vector(47 downto 0);
output_AB: out std_logic_vector(47 downto 0)
);
end COMPONENT;

COMPONENT CONTROLLER is
PORT(A: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
OUTPUT: OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
);
end COMPONENT;

COMPONENT ID_RR is
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
end COMPONENT;

COMPONENT Alu_pipeline is
port(clock: in std_logic;
Alu_op: in std_logic_vector(3 downto 0); 
function_bit: in std_logic_vector(1 downto 0);
A,B: in std_logic_vector(15 downto 0);
Immediate_bit: in std_logic_vector(8 downto 0);
output: out std_logic_vector(15 downto 0);
Zero_flag,carry_flag,prev_carry,prev_zero: inout std_logic
);
end COMPONENT;

COMPONENT RR_EX_REG is
port(clock,reset: in std_logic;
A: in std_logic_vector(15 downto 0);
B,D,E: in std_logic_vector(15 downto 0);
C: in std_logic_vector(23 downto 0);
F: in std_logic_vector(2 downto 0);
G: in std_logic;
RR_EX_Register: out std_logic_vector(91 downto 0);
output_AB: out std_logic_vector(91 downto 0)
);
end COMPONENT;

COMPONENT EX_MEM_REG is
port(clock,reset: in std_logic;
A: in std_logic_vector(15 downto 0);
B,D: in std_logic_vector(15 downto 0);
C: in std_logic_vector(23 downto 0);
E,F,I,H:in std_logic;
G:in std_logic_vector(15 downto 0);
K,L,M: in std_logic_vector(15 downto 0);
O: in std_logic_vector(2 downto 0);
P: in std_logic;
EX_MEM_Register: out std_logic_vector(143 downto 0);
output_AB: out std_logic_vector(143 downto 0)
);
end COMPONENT;

COMPONENT data_memory is
port(Address:in std_logic_vector(15 downto 0);
data: in std_logic_vector(15 downto 0);
read_data:out std_logic_vector(15 downto 0);
ram: inout mem_array;
mem_write,mem_read,clock:in std_logic
);
end COMPONENT;

COMPONENT MEM_WB_REG is
port(clock,reset: in std_logic;
A: in std_logic_vector(15 downto 0);
B,D,E: in std_logic_vector(15 downto 0);
Z,Carry,G,H: in std_logic;
C: in std_logic_vector(23 downto 0);
I: in std_logic_vector(2 downto 0);
MEM_WB_Register: out std_logic_vector(94 downto 0);
output_AB: out std_logic_vector(94 downto 0)
);
end COMPONENT;

COMPONENT mux_write_signal is
port(A,B,C:in std_logic;
select_line: in std_logic_vector(1 downto 0);
output: out std_logic 
);
end COMPONENT;

COMPONENT mux_3bit_input is
port(A,B: in std_logic_vector(2 downto 0);
select_line: in std_logic;
output:out std_logic_vector(2 downto 0)
);
end COMPONENT;

COMPONENT address_adder is
port(A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(5 downto 0);
output: out std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT adder_9bit_immediate is
port (A: in std_logic_vector(15 downto 0);
B: in std_logic_vector(8 downto 0);
sum: out std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT mux_branch_address is
port(A,B,C: in std_logic_vector(15 downto 0);
select_line: in std_logic_vector(1 downto 0);
output:  out std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT mux_data_write is
port(A,B,C: in std_logic_vector(15 downto 0);
select_line: in std_logic_vector(1 downto 0);
output:out std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT And_gate is
port (A,B: in std_logic;
C: out std_logic
);
end COMPONENT;

COMPONENT priority_encoder is
port ( A: in std_logic_vector(3 downto 0);
x : in std_logic_vector(7 downto 0);
write_port:out std_logic_vector(2 downto 0);
 N :out std_logic) ;
end COMPONENT ;

COMPONENT priority_decoder is
port( s: in std_logic_vector(2 downto 0);
 x:in std_logic_vector(7 downto 0);
p:out std_logic_vector(7 downto 0)
);
end COMPONENT;

COMPONENT MUX_LM is
port(A,B: in std_logic_vector(7 downto 0);
select_line: in std_logic;
output: out std_logic_vector(7 downto 0)
);
end COMPONENT;

COMPONENT Add_Address_1 is
port(A: in std_logic_vector(15 downto 0);
output: out std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT mux_alu_result is
port(A,B: in std_logic_vector(15 downto 0);
select_line: in std_logic;
output:out std_logic_vector(15 downto 0)
);
end COMPONENT;

COMPONENT Forwarding_Unit is
port(RR_EX_1,RR_EX_2,EX_MEM,MEM_WB: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
EX_MEM_SIGNAL,MEM_WB_SIGNAL: IN STD_LOGIC;
FORWARD_A,FORWARD_B: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
);
end COMPONENT;

COMPONENT FORWARD_WRITE_DATA is
PORT(mem_write,ws: IN STD_LOGIC;
EX_MEM_read,MEM_WB_write:IN STD_LOGIC_VECTOR(2 DOWNTO 0);
FORWARD_WRITE_DATA_signal:OUT STD_LOGIC
) ;
end COMPONENT;
-------------------------------------------------------------------------------
signal read_signal,write_signal,pc_write,PCSrc,zero_flag,carry_flag,prev_carry,prev_zero,write_and_zero,write_and_carry: std_logic;
signal write_output,sel_input,sel_input_1,IF_ID_read_signal,N_control,forward_write_data_signal: std_logic;
signal read_A1,read_A2,write_A3,encoder_output: std_logic_vector(2 downto 0);
signal data_A1,data_A2,data_A3,pc_in,PC_OUT,ALU_Result_1,read_data_memory,oprand_B,ALU_Result,address_1,write_data_memory,write_data_memory_1: std_logic_vector(15 downto 0);
signal reg_file: reg_array;
signal ram_memory: mem_array;
SIGNAL FORWARD_A,FORWARD_B: STD_LOGIC_VECTOR(1 DOWNTO 0);
signal control_signal: std_logic_vector(23 downto 0);
signal IF_ID_REG_read,IF_ID_Reg1: std_logic_vector(47 downto 0);
signal ID_RR_REG_read,ID_RR_Reg1: std_logic_vector(67 downto 0);
signal RR_EX_REG_read,RR_EX_Reg1: std_logic_vector(91 downto 0);
signal EX_MEM_REG_read,EX_MEM_Reg1: std_logic_vector(143 downto 0);
signal MEM_WB_REG_read,MEM_WB_Reg1: std_logic_vector(94 downto 0);
signal encoder_input,decoder_output: std_logic_vector(7 downto 0);
signal Branch_address,pc_address,INSTRUCTION,JAL_address,BEQ_address,OP_A,OP_B: std_logic_vector(15 downto 0);
signal memory1_0,memory1_1,memory1_2,memory1_3,memory1_4,memory1_5,memory1_6,memory1_7,memory1_8,memory1_9,memory1_10,memory1_11,memory1_12,memory1_13,memory1_14,memory1_15,memory1_16,memory1_17,memory1_18,memory1_19,memory1_20: std_logic_vector(15 downto 0);
begin

--------------------------------------------------------------------------------------

mux_3bit: mux_3bit_input port map(ID_RR_REG_read(5 downto 3),ID_RR_REG_read(11 downto 9),sel_input,read_A2);

mux_3bit_1: mux_3bit_input port map(ID_RR_REG_read(8 downto 6),ID_RR_REG_read(66 downto 64),sel_input_1,read_A1);

register_file_1: register_file port map(read_A1,read_A2,write_A3,data_A1,data_A2,PC_OUT,data_A3,pc_in,reg_file,read_signal,write_signal,reset,clock,pc_write);

pcadder: pc_adder port map(clock,PC_OUT,pc_address);

mux_16bit: mux_16bit_input port map(EX_MEM_REG_read(107 downto 92),pc_address,PCSrc,BEQ_address);

inst_memory: instruction_memory port map(PC_OUT,INSTRUCTION,memory1_0,memory1_1,memory1_2,memory1_3,memory1_4,memory1_5,memory1_6,memory1_7,memory1_8,memory1_9,memory1_10,memory1_11,memory1_12,memory1_13,memory1_14,memory1_15,memory1_16,memory1_17,memory1_18,memory1_19,memory1_20);

IF_ID:IF_ID_REG port map(clock,reset,IF_ID_read_signal,pc_address,INSTRUCTION,decoder_output,encoder_output,N_control,IF_ID_Reg1,IF_ID_REG_read);

CONTROL: CONTROLLER port map(IF_ID_REG_read(15 downto 0),control_signal);

ID_RR1: ID_RR port map(clock,reset,IF_ID_REG_READ(31 DOWNTO 16),IF_ID_REG_READ(15  DOWNTO 0),control_signal,IF_ID_REG_read(39 downto 32),IF_ID_REG_read(42 downto 40),IF_ID_REG_read(43),ID_RR_Reg1,ID_RR_REG_read);

RR_EX1: RR_EX_REG port map(clock,reset,ID_RR_REG_read(31 downto 16),ID_RR_REG_read(15 downto 0),data_A2,data_A1,ID_RR_REG_read(55 downto 32),ID_RR_REG_read(66 downto 64),ID_RR_REG_read(67),RR_EX_Reg1,RR_EX_REG_read);

Alu_pipeline1: Alu_pipeline port map(clock,RR_EX_REG_read(15 downto 12),RR_EX_REG_read(1 downto 0),OP_A,OP_B,RR_EX_REG_read(8 downto 0),ALU_Result_1,zero_flag,carry_flag,prev_carry,prev_zero);

Branch_address1: address_adder port map(RR_EX_REG_read(31 downto 16),RR_EX_REG_read(5 downto 0),Branch_address);

adder_9bit_immediate1: adder_9bit_immediate port map(RR_EX_REG_read(31 downto 16),RR_EX_REG_read(8 downto 0),JAL_address);

EX_MEM1: EX_MEM_REG port map(clock,reset,RR_EX_REG_read(31 downto 16),RR_EX_REG_read(15 downto 0),ALU_Result,RR_EX_REG_read(87 downto 64),zero_flag,carry_flag,prev_zero,prev_carry,RR_EX_REG_read(47 downto 32),Branch_address,RR_EX_REG_read(63 downto 48),JAL_address,RR_EX_REG_read(90 downto 88),RR_EX_REG_read(91),EX_MEM_Reg1,EX_MEM_REG_read);

DATA_MEMORY1: data_memory port map(EX_MEM_REG_read(47 downto 32),write_data_memory,read_data_memory,ram_memory,EX_MEM_REG_read(62),EX_MEM_REG_read(63),clock);

--mux_16bit_1: mux_16bit_input port map(EX_MEM_REG_read(123 downto 108),EX_MEM_REG_read(89 downto 74),EX_MEM_REG_read(65),write_data_memory);

MEM_WB1: MEM_WB_REG port map(clock,reset,EX_MEM_REG_read(47 downto 32),EX_MEM_REG_read(15 downto 0),read_data_memory,EX_MEM_REG_read(31 downto 16),EX_MEM_REG_read(48),EX_MEM_REG_read(49),EX_MEM_REG_read(90),EX_MEM_REG_read(91),EX_MEM_REG_read(73 downto 50),EX_MEM_REG_read(142 downto 140),MEM_WB_Reg1,MEM_WB_REG_read);

MUX_DATA_WRITE1: mux_data_write port map(MEM_WB_REG_read(47 downto 32),MEM_WB_REG_read(31 downto 16),MEM_WB_REG_read(91 downto 76),MEM_WB_REG_read(70 downto 69),data_A3);

--MUX_WRITE: mux_write_signal port map(MEM_WB_REG_read(66),write_and_zero,write_and_carry,MEM_WB_REG_read(68 downto 67),write_output);

mux_branch_address1: mux_branch_address port map(BEQ_address,EX_MEM_REG_read(139 downto 124),EX_MEM_REG_read(123 downto 108),EX_MEM_REG_read(57 downto 56),pc_in);

And_gate1: And_gate port map(EX_MEM_REG_read(48),EX_MEM_REG_read(64),PCSrc);

MUX_LM1: MUX_LM port map(INSTRUCTION(7 downto 0),IF_ID_REG_read(39 downto 32),IF_ID_REG_read(44),encoder_input);

priority_encoder1: priority_encoder port map(INSTRUCTION(3 downto 0),encoder_input,encoder_output,N_control);

priority_decoder1: priority_decoder port map(encoder_output,encoder_input,decoder_output);

mux_3bit_2: mux_3bit_input port map(MEM_WB_REG_read(11 downto 9),MEM_WB_REG_read(94 downto 92),MEM_WB_REG_read(71),write_A3);

Add_Address2: Add_Address_1 port map(oprand_B,address_1);

---------------------------------------SIGNALS-----------------------------------------------------------------------------
sel_input<=ID_RR_REG_read(33);
sel_input_1<=ID_RR_REG_read(34);
read_signal<=ID_RR_REG_read(32);

write_and_zero<=(MEM_WB_REG_read(66) and MEM_WB_REG_read(74));
write_and_carry<=(MEM_WB_REG_read(66) and MEM_WB_REG_read(75));
--write_signal<=write_output;

process(MEM_WB_REG_read(66),write_and_zero,write_and_carry,MEM_WB_REG_read(68 downto 67))
begin
if(MEM_WB_REG_read(68 downto 67)="00")then
write_signal<=MEM_WB_REG_read(66);
elsif(MEM_WB_REG_read(68 downto 67)="01")then
write_signal<=write_and_zero;
elsif(MEM_WB_REG_read(68 downto 67)="10")then
write_signal<=write_and_carry;
else
write_signal<='0';
end if;
end process;
----------------------------------LM_SM----------------------------------------------------------------------
process(IF_ID_REG_read(39 downto 32),IF_ID_REG_read(43),IF_ID_REG_read(15 downto 12),N_control)
begin
if((IF_ID_REG_read(15 downto 12)="0110" or IF_ID_REG_read(15 downto 12)="0111") and N_control='0')then
IF_ID_read_signal<='0';
pc_write<='0';
elsif((IF_ID_REG_read(15 downto 12)="0110" or IF_ID_REG_read(15 downto 12)="0111") and N_control='1')then
IF_ID_read_signal<='1';
pc_write<='1';
else
IF_ID_read_signal<='1';
pc_write<='1';
end if;
end process;

------------------------------------ALU_RESULT------------------------------------------
process(address_1,ALU_result_1,RR_EX_REG_read(74))
begin
if(RR_EX_REG_read(74)='1')then
ALU_result<=address_1;
else
ALU_result<=ALU_result_1;
end if;
end process;
-----------------------------------OPRAND_B-----------------------------------------------------------
process(EX_MEM_REG_read(47 downto 32),RR_EX_REG_read(47 downto 32),EX_MEM_REG_read(58))
begin
if(EX_MEM_REG_read(58)='1')then
oprand_B<=EX_MEM_REG_read(47 downto 32);
else
oprand_B<=RR_EX_REG_read(47 downto 32);
end if;
end process;
-----------------------------------------WRITE_DATA_MEMORY------------------------------------------------

process(EX_MEM_REG_read(123 downto 108),EX_MEM_REG_read(89 downto 74),EX_MEM_REG_read(65))
begin
if(EX_MEM_REG_read(65)='1')then
write_data_memory_1<=EX_MEM_REG_read(123 downto 108);
else
write_data_memory_1<=EX_MEM_REG_read(89 downto 74);
end if;
end process;
----------------------------------------FORWARDING UNIT -----------------------------------
F:  Forwarding_unit PORT MAP(RR_EX_REG_read(8 downto 6),RR_EX_REG_read(5 downto 3),EX_MEM_REG_read(11 downto 9),write_A3,EX_MEM_REG_read(68),write_signal,FORWARD_A,FORWARD_B);
F1: FORWARD_WRITE_DATA PORT MAP(EX_MEM_REG_read(62),write_signal,EX_MEM_REG_read(11 downto 9),write_A3,forward_write_data_signal);

PROCESS(RR_EX_REG_read(63 downto 48),EX_MEM_REG_read(47 DOWNTO 32),FORWARD_A,data_A3)
BEGIN
IF(FORWARD_A="00")THEN
OP_A<=RR_EX_REG_read(63 downto 48);
ELSIF(FORWARD_A="01")THEN
OP_A<=EX_MEM_REG_read(47 DOWNTO 32);
ELSIF(FORWARD_A="10")THEN
OP_A<=data_A3;
END IF;
END PROCESS;

PROCESS(oprand_B,FORWARD_B,data_A3,EX_MEM_REG_read(47 DOWNTO 32))
BEGIN
IF(FORWARD_B="00")THEN
OP_B<=oprand_B;
ELSIF(FORWARD_B="01")THEN
OP_B<=EX_MEM_REG_read(47 DOWNTO 32);
ELSIF(FORWARD_B="10")THEN
OP_B<=data_A3;
END IF;
END PROCESS;
--------------------------------------------------LOAD/STORE BYPASSING-----------------------------------------
PROCESS(write_data_memory_1,forward_write_data_signal,data_A3)
BEGIN
IF(forward_write_data_signal='1')THEN
write_data_memory<=data_A3;
ELSE
write_data_memory<=write_data_memory_1;
END IF;
END PROCESS;


---------------------------------------------------------------------------------------------------------------------
end Behavioral;

