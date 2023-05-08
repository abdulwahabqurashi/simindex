----------------------------------------------------------------------------------
-- Divider Main Block Stage 3
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity divider_main is
        port (
              clk: in std_logic ;              ----------   clock
              DIV1_inp    : in unsigned(62 downto 0);        ----------  Divider 1 input
              DIV2_inp    : in unsigned(62 downto 0);        ----------  Divider 2 input
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
inp1<= to_integer(DIV1_inp);
inp2<= to_integer(DIV2_inp);

process
begin
wait until rising_edge(clk);
--------------------------------------------------------  Division of two inputs
outp<= (inp1*1000000000) / inp2;
--outp<= inp1 / inp2;
end process;

--------------------------------------------------------  Asigning signals to output
DIVOUT_outp <= outp;
end Behavioral;
