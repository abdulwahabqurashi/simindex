----------------------------------------------------------------------------------
-- Stage-2 ADDER block
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all; 


entity adder_main is
     Port ( 
           rst: in std_logic;                ----------   reset 
           clk: in std_logic;                ----------   clock  
           ADD_inp1 : in integer;            ----------  SUB-Adder 1 input
           ADD_inp2 : in integer;            ----------  SUB-Adder 2 input
           ADD_outp : out integer            ----------  SUB-Adder output 
           );
end adder_main;

architecture Behavioral of adder_main is
--------------------------------------------------------  Signals for input and output of SUB-Adder 
    signal ADD_inp1_sig : integer;
    signal ADD_inp2_sig : integer;
    signal ADD_outp_sig : integer;
begin
--------------------------------------------------------  Assigning signals to inputs
ADD_inp1_sig <= ADD_inp1;
ADD_inp2_sig <= ADD_inp2;


p_synchronous_reset : process
begin
   wait until rising_edge(clk);
      if rst = '1' then               -- do reset
         ADD_outp_sig <= 0;
      else                            -- normal operation
--------------------------------------------------------  Addition of two inputs
         ADD_outp_sig <= ADD_inp1_sig+ADD_inp2_sig;
      end if;
end process p_synchronous_reset;

--------------------------------------------------------  Assigning signals to output
ADD_outp <= ADD_inp1_sig+ADD_inp2_sig;
end Behavioral;
