----------------------------------------------------------------------------------
-- Main Mac file for MAC 1,2,3
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.mult_cross_sec_300_pack.all;

entity mac_main1 is
    port (
        S1_inp : in  t_1d_array;
        S2_inp : in  t_1d_array;
        MAC1_OUT : out integer;
        MAC2_OUT : out integer;
        MAC3_OUT : out integer
        );
end mac_main1;

architecture Behavioral of mac_main1 is

component mac_3x1_array

    port (
        in_array1 : in  t_1d_array;
        in_array2 : in  t_1d_array;
        outp : out integer
        );
  end component;
begin
MAC1: mac_3x1_array port map (S1_inp,S2_inp,MAC1_OUT);
MAC2: mac_3x1_array port map (S1_inp,S1_inp,MAC2_OUT);
MAC3: mac_3x1_array port map (S2_inp,S2_inp,MAC3_OUT);

end Behavioral;
