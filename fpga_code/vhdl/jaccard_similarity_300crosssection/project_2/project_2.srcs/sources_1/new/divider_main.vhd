----------------------------------------------------------------------------------
-- Divider Block Stage 3
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 

entity divider_main is
        port (
              rst: in std_logic;                    ----------   reset
              clk: in std_logic ;                   ----------   clock
              DIV1_inp    : in integer;             ----------  Divider 1 input
              DIV2_inp    : in integer;             ----------  Divider 2 input
              DIVOUT_outp : out integer             ----------  Divider output
              );
end divider_main;

architecture Behavioral of divider_main is
--------------------------------------------------------  Signals for input and output of DIVIDER block 
signal DIV1_inp_sig: integer;
signal DIV2_inp_sig: integer;
signal DIVOUT_outp_sig: integer;
signal DIVOUT_outp_main_sig: integer;
begin
--------------------------------------------------------  Asigning signals to inputs
DIV1_inp_sig<= DIV1_inp;
DIV2_inp_sig<= DIV2_inp;

p_synchronous_reset : process (clk) is
begin
   if rising_edge(clk) then
      if rst = '1' then               -- do reset
         DIVOUT_outp_sig <= 0;
      else                            -- normal operation
----------------------------------------------------------  Division of two inputs
         ---DIV1_inp_result_sig<= DIV1_inp_sig*1000000;
         DIVOUT_outp_sig<= (DIV1_inp_sig*1000000) / DIV2_inp_sig;
      end if;
   end if;
end process p_synchronous_reset;

--------------------------------------------------------  Asigning signals to output
DIVOUT_outp <= DIVOUT_outp_sig;
end Behavioral;
