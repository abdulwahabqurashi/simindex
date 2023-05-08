----------------------------------------------------------------------------------
-- Cosine Similarity main block
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.mult_2x2_pack.all;                     ----------  defining vector/array dimensions                    
use ieee.numeric_std.all;


entity cosine_sim is
   port (
        clk: in std_logic;                     ----------  clock
        S1_vec : in  t_1d_array;               ----------  S1 vector/array of cross-section 4
        S2_vec : in  t_1d_array;               ----------  S2 Vector/array of cross-section 4
        Cosine_outp : out integer range 0 to 2147483647              ----------  Cosine Output (0-1)
        );
end cosine_sim;

 architecture Behavioral of cosine_sim is

--------------------------------------------------------   MAC main block components
component mac_main1 is
    port (
          clk: in std_logic ;                    ----------   clock
          S1_inp : in  t_1d_array;               ----------  S1 Vector/array of cross-section 4
          S2_inp : in  t_1d_array;               ----------  S2 Vector/array of cross-section 4
          MAC1_OUT : out integer;                ----------  MAC 1 output
          MAC2_OUT : out integer;                ----------  MAC 2 output
          MAC3_OUT : out integer                 ----------  MAC 3 output
        );
end component;

--------------------------------------------------------  MULTIPLIER main block components
component multiplier_main1
        port (
              clk: in std_logic ;              ----------   clock
              MX1_inp     : in integer;        ----------  Multiplier 1 block input
              MX2_inp     : in integer;        ----------  Multiplier 2 block input
              MX3_inp     : in integer;        ----------  Multiplier 3 block input
              MULTI1_outp : out unsigned(62 downto 0);       ----------  SUB-Multiplier 1 block output
              MULTI2_outp : out unsigned(62 downto 0)        ----------  SUB-Multiplier 2 block output
              );
    end component;

--------------------------------------------------------  DIVIDER block components    
component divider_main
        port (
              clk: in std_logic ;              ----------   clock
              DIV1_inp    : in unsigned(62 downto 0);        ----------  Divider 1 input
              DIV2_inp    : in unsigned(62 downto 0);        ----------  Divider 2 input
              DIVOUT_outp : out integer        ----------  Divider output
              );
end component;

--------------------------------------------------------  Stage 1 outputs signals
    signal MAC1_wire     : integer;
    signal MAC2_wire     : integer;
    signal MAC3_wire     : integer;
    
    

--------------------------------------------------------  Stage 2 outputs signals
    signal MULTI1_wire : unsigned(62 downto 0);
    signal MULTI2_wire : unsigned(62 downto 0);

begin

--------------------------------------------------------  Stage 1 MAC Block port mapping with name association 
Stage1: mac_main1 port map (clk=>clk,
                            S1_inp=>S1_vec,
                            S2_inp=>S2_vec, 
                            MAC1_OUT=>MAC1_wire,
                            MAC2_OUT=>MAC2_wire,
                            MAC3_OUT=>MAC3_wire
                            );

--------------------------------------------------------  Stage 2 MULTIPLIER Block port mapping with name association 
Stage2: multiplier_main1 port map (clk=>clk,
                                   MX1_inp=>MAC1_wire,
                                   MX2_inp=>MAC2_wire,
                                   MX3_inp=>MAC3_wire,
                                   MULTI1_outp=>MULTI1_wire,
                                   MULTI2_outp=>MULTI2_wire);
  
--------------------------------------------------------  Stage 3 DIVIDER port mapping with name association                                    
Stage3: divider_main port map (clk=>clk,
                               DIV1_inp=>MULTI1_wire,
                                DIV2_inp=>MULTI2_wire,
                                DIVOUT_outp=>Cosine_outp);

end Behavioral;
