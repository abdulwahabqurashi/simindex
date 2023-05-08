----------------------------------------------------------------------------------
-- Jaccard Similarity main block
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library work;
use work.mult_cross_sec_300_pack.all;

entity jaccard_sim is
   port (
        S1_vec : in  t_1d_array;
        S2_vec : in  t_1d_array;
        M1_outp : out integer;
        M2_outp : out integer;
        M3_outp : out integer;
        MULTI1_outp : out integer;
        MULTI2_outp : out integer;
        Cosine_outp : out integer
        );
end jaccard_sim;

 architecture Behavioral of jaccard_sim is

component mac_main1 is
    port (
        S1_inp : in  t_1d_array;
        S2_inp : in  t_1d_array;
        MAC1_OUT : out integer;
        MAC2_OUT : out integer;
        MAC3_OUT : out integer
        );
end component;

component adder_main
        Port (add_inp1 : in integer;
              add_inp2 : in integer;
              add_outp : out integer );
    end component;
    
component subtrator_main
        Port (sub_inp1 : in integer;
              sub_inp2 : in integer;
              sub_outp : out integer );
    end component;
        
component divider_main
        port (DIV1_inp    : in integer;
              DIV2_inp    : in integer;
              DIVOUT_outp : out integer);
end component;

--stage 1 outputs
    signal MAC1_wire     : integer;
    signal MAC2_wire     : integer;
    signal MAC3_wire     : integer;
    
    
--stage 2 outputs    
--stage 1 outputs
    signal MAC1_wire_in     : integer;
    signal MAC2_wire_in     : integer;
    signal MAC3_wire_in     : integer;
    signal MULTI1_wire : integer;
    signal MULTI2_wire : integer;

    signal Done : integer;
    signal Dtwo : integer;
    
begin 
Stage1: mac_main1 port map (S1_inp=>S1_vec,
                            S2_inp=>S2_vec, 
                            MAC1_OUT=>MAC1_wire,
                            MAC2_OUT=>MAC2_wire,
                            MAC3_OUT=>MAC3_wire);

MAC1_wire_in<=MAC1_wire;
MAC2_wire_in<=MAC2_wire;
MAC3_wire_in<=MAC3_wire;

Stage2: multiplier_main1 port map (MX1_inp=>MAC1_wire_in,
                                   MX2_inp=>MAC2_wire_in,
                                   MX3_inp=>MAC3_wire_in,
                                   MULTI1_outp=>MULTI1_wire,
                                   MULTI2_outp=>MULTI2_wire);


Done<=MULTI1_wire;
Dtwo<=MULTI2_wire;  
                                   
Stage3: divider_main port map (DIV1_inp=>Done,
                                DIV2_inp=>Dtwo,
                                DIVOUT_outp=>Cosine_outp);
MULTI1_outp<=MULTI1_wire;
MULTI2_outp<=MULTI2_wire;
M1_outp<=MAC1_wire;
M2_outp<=MAC2_wire;
M3_outp<=MAC3_wire;

end Behavioral;
