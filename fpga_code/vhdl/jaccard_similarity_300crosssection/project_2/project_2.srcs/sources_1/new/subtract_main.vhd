----------------------------------------------------------------------------------
-- SUBTRACTION Main block
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtract_main is
     Port (
           rst: in std_logic;                                ----------   reset
           clk: in std_logic;                                ----------   clock  
           SUB_inp1 : in integer;                            ----------  SUB-SUBTRACTION 1 input
           SUB_inp2 : in integer;                            ----------  SUB-SUBTRACTION 2 input
           SUB_outp : out integer                            ----------  SUB-SUBTRACTION output 
           );
end subtract_main;

architecture Behavioral of subtract_main is
--------------------------------------------------------  Signals for input and output of SUB-SUBTRACTION 
    signal SUB_inp1_sig : integer;
    signal SUB_inp2_sig : integer;
    signal SUB_outp_sig : integer;
begin
--------------------------------------------------------  Assigning signals to inputs
SUB_inp1_sig <= SUB_inp1;
SUB_inp2_sig <= SUB_inp2;


p_synchronous_reset : process (clk) is
begin
   if rising_edge(clk) then
      if rst = '1' then               -- do reset
         SUB_outp_sig <= 0;
      else                            -- normal operation
----------------------------------------------------------  SUBTRACTION of two inputs
         SUB_outp_sig <= SUB_inp1_sig-SUB_inp2_sig;
      end if;
   end if;
end process p_synchronous_reset;



--------------------------------------------------------  Assigning signals to output
SUB_outp <= SUB_outp_sig;
end Behavioral;
