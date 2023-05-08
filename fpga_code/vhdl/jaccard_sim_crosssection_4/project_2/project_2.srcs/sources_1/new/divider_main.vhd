----------------------------------------------------------------------------------
-- Divider Block Stage 3
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_main is
        port (
              clk: in std_logic ;              ----------   clock
              DIV1_inp    : in integer:= 0;        ----------  Divider 1 input
              DIV2_inp    : in integer:= 0;        ----------  Divider 2 input
              DIVOUT_outp : out integer        ----------  Divider output
              );
end divider_main;

architecture Behavioral of divider_main is
--------------------------------------------------------  Signals for input and output of DIVIDER block 
signal inp1: integer;
signal inp2: integer;
signal outp: integer;

begin
--------------------------------------------------------  Asigning signals to inputs
inp1<= DIV1_inp;
inp2<= DIV2_inp;

process
begin
wait until rising_edge(clk);
--------------------------------------------------------  Division of two inputs
outp<= (inp1*1000000) / inp2;
end process;

--------------------------------------------------------  Asigning signals to output
DIVOUT_outp <= outp;
end Behavioral;
