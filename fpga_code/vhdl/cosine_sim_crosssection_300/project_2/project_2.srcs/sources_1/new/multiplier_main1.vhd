----------------------------------------------------------------------------------
-- Multiplier Main Block Stage 2
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity multiplier_main1 is
        port (
              clk: in std_logic ;              ----------   clock
              MX1_inp     : in integer;        ----------  Multiplier 1 block input
              MX2_inp     : in integer;        ----------  Multiplier 2 block input
              MX3_inp     : in integer;        ----------  Multiplier 3 block input
              MULTI1_outp : out unsigned(62 downto 0);       ----------  Multiplier 1 block output
              MULTI2_outp : out unsigned(62 downto 0)        ----------  Multiplier 2 block output
              );
end multiplier_main1;

architecture Behavioral of multiplier_main1 is
--------------------------------------------------------  SUB-MULTIPLIER components
component multiplier
     Port ( 
           clk: in std_logic;        ----------   clock  
           inp1 : in integer;        ----------  SUB-Multiplier 1 input
           inp2 : in integer;        ----------  SUB-Multiplier 2 input
           outp : out unsigned(62 downto 0)        ----------  SUB-Multiplier output 
           );
     end component;
     
     
begin

--------------------------------------------------------  MULTIPLIER MAIN Block port mapping of 2 SUB-MULTIPLIER blocks
MULTIPLIER1: multiplier port map (clk=>clk,
                                  inp1=>MX1_inp,
                                  inp2=>MX1_inp,
                                  outp=>MULTI1_outp);
MULTIPLIER2: multiplier port map (clk=>clk,
                                  inp1=>MX2_inp,
                                  inp2=>MX3_inp,
                                  outp=>MULTI2_outp);
                                  
end Behavioral;
