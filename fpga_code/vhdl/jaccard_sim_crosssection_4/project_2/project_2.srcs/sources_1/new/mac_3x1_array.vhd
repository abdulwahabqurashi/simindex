----------------------------------------------------------------------------------
-- Basic Mac Block
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.mult_2x2_pack.all;

entity mac_3x1_array is
    port (
        clk: in std_logic ;                   ----------   clock
        in_array1 : in  t_1d_array:= (0,0,0,0);           ----------  S1 Vector/array of cross-section 4
        in_array2 : in  t_1d_array:= (0,0,0,0);           ----------  S2 Vector/array of cross-section 4
        outp : out integer                    ----------  Output of SUB-MAC block
        );
end mac_3x1_array;

architecture rtl of mac_3x1_array is

--------------------------------------------------------  Output signal for SUB-MAC block

signal outp_reg: integer;

begin
process
begin
wait until rising_edge(clk);                  ----------  rising clock edge
--------------------------------------------------------  2 vectors/array multiplication
    outp_reg <= integer(
                               (in_array1(0)) * (in_array2(0)) +
                               (in_array1(1)) * (in_array2(1)) +
                               (in_array1(2)) * (in_array2(2)) +
                               (in_array1(3)) * (in_array2(3))
                               );
end process;
--------------------------------------------------------  Output stores in Output Reg signal
outp<=outp_reg;
end rtl;