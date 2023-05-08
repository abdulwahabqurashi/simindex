----------------------------------------------------------------------------------
-- Jaccard Similarity main block
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.mult_2x2_pack.all;                      ----------  defining vector/array dimensions                    

entity jaccard_sim is
   port (rst: in std_logic;        ----------   clock 
        clk: in std_logic;                      ----------  clock
        S1_vec : in  t_1d_array:= (0,0,0,0);                ----------  S1 vector/array of cross-section 4
        S2_vec : in  t_1d_array:= (0,0,0,0);                ----------  S2 Vector/array of cross-section 4
        Jaccard_outp : out integer              ----------  Jaccard Output (0-1)
        );
end jaccard_sim;

 architecture Behavioral of jaccard_sim is


--signal S1_vec_reg : t_1d_array:= (others=>'0');
--signal S2_vec_reg : t_1d_array:= (others=>'0');
--------------------------------------------------------   MAC main block components
component mac_main is
    port (
          clk: in std_logic ;                    ----------   clock
          S1_inp : in  t_1d_array:= (0,0,0,0);              ----------  S1 Vector/array of cross-section 4
          S2_inp : in  t_1d_array:= (0,0,0,0);               ----------  S2 Vector/array of cross-section 4
          MAC1_OUT : out integer;                ----------  MAC 1 output
          MAC2_OUT : out integer;                ----------  MAC 2 output
          MAC3_OUT : out integer                 ----------  MAC 3 output
        );
end component;

--------------------------------------------------------  ADDITION main block components
component adder_main is
     Port (rst: in std_logic;        ----------   clock  
           clk: in std_logic;                    ----------   clock  
           ADD_inp1 : in integer:= 0;                ----------  SUB-Adder 1 input
           ADD_inp2 : in integer:= 0;                ----------  SUB-Adder 2 input
           ADD_outp : out integer                ----------  SUB-Adder output 
           );
    end component;
    
--------------------------------------------------------  SUBTRACTION main block components
component subtract_main is
     Port ( 
           clk: in std_logic;                   ----------   clock  
           SUB_inp1 : in integer:= 0;               ----------  SUB-SUBTRACTION 1 input
           SUB_inp2 : in integer:= 0;               ----------  SUB-SUBTRACTION 2 input
           SUB_outp : out integer               ----------  SUB-SUBTRACTION output 
           );
    end component;

--------------------------------------------------------  DIVIDER block components    
component divider_main
        port (
              clk: in std_logic ;              ----------   clock
              DIV1_inp    : in integer:= 0;        ----------  Divider 1 input
              DIV2_inp    : in integer:= 0;        ----------  Divider 2 input
              DIVOUT_outp : out integer        ----------  Divider output
              );
end component;

--------------------------------------------------------  Stage 1 outputs signals
    signal MAC1_wire     : integer;
    signal MAC2_wire     : integer;
    signal MAC3_wire     : integer;
    
--------------------------------------------------------  Stage 2 outputs signals
    signal ADD1_wire : integer;

--------------------------------------------------------  Stage 3 outputs signals
    signal SUB1_wire : integer;
    
    
    
begin

--------------------------------------------------------  Stage 1 MAC Block port mapping with name association 
Stage1: mac_main port map (clk=>clk,
                           S1_inp=>S1_vec,
                           S2_inp=>S2_vec, 
                           MAC1_OUT=>MAC1_wire,
                           MAC2_OUT=>MAC2_wire,
                           MAC3_OUT=>MAC3_wire
                           );

--------------------------------------------------------  Stage 2 ADDITION port mapping with name association 
Stage2: adder_main port map (rst=>rst,
                             clk=>clk,
                             ADD_inp1=>MAC2_wire,
                             ADD_inp2=>MAC3_wire,
                             ADD_outp=>ADD1_wire);
                             
--------------------------------------------------------  Stage 2 SUBTRACTION port mapping with name association 
Stage3: subtract_main port map (clk=>clk,
                                SUB_inp1=>MAC1_wire,
                                SUB_inp2=>ADD1_wire,
                                SUB_outp=>SUB1_wire);
  
--------------------------------------------------------  Stage 3 DIVIDER port mapping with name association                                    
Stage4: divider_main port map (clk=>clk,
                               DIV1_inp=>MAC1_wire,
                                DIV2_inp=>SUB1_wire,
                                DIVOUT_outp=>Jaccard_outp);

end Behavioral;
