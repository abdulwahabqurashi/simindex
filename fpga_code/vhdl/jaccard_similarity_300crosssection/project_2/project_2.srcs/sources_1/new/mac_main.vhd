----------------------------------------------------------------------------------
-- Main Mac file for MAC 1,2,3
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.mult_2x2_pack.all;                     ----------  defining vector/array dimensions  

entity mac_main is
    port (
        rst: in std_logic;                                 ----------   reset
        clk: in std_logic ;                                ----------   clock
        S1_inp : in  t_1d_array;                           ----------  S1 Vector/array of cross-section 4
        S2_inp : in  t_1d_array;                           ----------  S2 Vector/array of cross-section 4
        MAC1_OUT : out integer;                            ----------  MAC 1 output
        MAC2_OUT : out integer;                            ----------  MAC 2 output
        MAC3_OUT : out integer                             ----------  MAC 3 output
        );
end mac_main;

architecture Behavioral of mac_main is

--------------------------------------------------------   SUB-MAC block components
component mac_3x1_array
    port (
        rst: in std_logic;                                ----------   reset
        clk: in std_logic ;                               ----------   clock
        in_array1 : in  t_1d_array;                       ----------  S1 Vector/array of cross-section 4
        in_array2 : in  t_1d_array;                       ----------  S2 Vector/array of cross-section 4
        outp : out integer                                ----------  Output of SUB-MAC block
        );
  end component;
begin

--------------------------------------------------------  MAC MAIN Block port mapping of 3 SUB-MAC blocks 
MAC1: mac_3x1_array port map (rst,clk,S1_inp,S2_inp,MAC1_OUT);
MAC2: mac_3x1_array port map (rst,clk,S1_inp,S1_inp,MAC2_OUT);
MAC3: mac_3x1_array port map (rst,clk,S2_inp,S2_inp,MAC3_OUT);


end Behavioral;
