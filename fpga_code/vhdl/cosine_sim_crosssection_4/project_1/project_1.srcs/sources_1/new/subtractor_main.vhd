----------------------------------------------------------------------------------
-- Adder block
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library work;
use work.mult_cross_sec_300_pack.all;


entity subtractor is
     Port (   sub_inp1 : in integer;
              sub_inp2 : in integer;
              sub_outp : out integer );
end subtractor;

architecture Behavioral of subtractor is
    signal sub_inp1_sig : std_logic_vector(31 downto 0);
    signal sub_inp2_sig : std_logic_vector(31 downto 0);
    signal sub_outp_sig : std_logic_vector(31 downto 0);
    
begin
sub_inp1_sig <= std_logic_vector(TO_UNSIGNED(sub_inp1,sub_inp1_sig'length));
sub_inp2_sig <= std_logic_vector(TO_UNSIGNED(sub_inp2,sub_inp2_sig'length));
--inp1_sig <= inp1;
--inp2_sig <= inp2;
sub_outp_sig <= sub_inp1_sig-sub_inp2_sig;
sub_outp <= TO_INTEGER(unsigned(sub_outp_sig));

end Behavioral;