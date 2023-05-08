----------------------------------------------------------------------------------
-- Divider Block
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity divider_main is
     Port (
              DIV1_inp : in integer;
              DIV2_inp : in integer;              
              DIVOUT_outp : out integer
             );
end divider_main;

architecture Behavioral of divider_main is
signal inp1: integer;
signal inp2: integer;
signal outp: integer;
begin
inp1<= DIV1_inp;
inp2<= DIV2_inp;

outp<= (inp1*1000000) / inp2;
DIVOUT_outp <= outp;

end Behavioral;
