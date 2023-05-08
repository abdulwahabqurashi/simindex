----------------------------------------------------------------------------------
-- Multiplier block
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity multiplier is
     Port ( 
           clk: in std_logic;        ----------   clock  
           inp1 : in integer;        ----------  SUB-Multiplier 1 input
           inp2 : in integer;        ----------  SUB-Multiplier 2 input
           outp : out std_logic_vector(31 downto 0)        ----------  SUB-Multiplier output 
           );
end multiplier;

architecture Behavioral of multiplier is
--------------------------------------------------------  Signals for input and output of SUB-Multiplier 
    signal inp1_sig : std_logic_vector(31 downto 0);
    signal inp2_sig : std_logic_vector(31 downto 0);
    signal outp_sig : std_logic_vector(31 downto 0);
begin
--------------------------------------------------------  Asigning signals to inputs
--inp1_sig <= inp1/10000000;
--inp2_sig <= inp2/10000000;

inp1_sig <= std_logic_vector(to_unsigned(inp1, 32));
inp2_sig <= std_logic_vector(to_unsigned(inp2, 32));
process
begin
wait until rising_edge(clk);
--------------------------------------------------------  Multiplication of two inputs
outp_sig <= inp1_sig*inp2_sig;
--outp_sig <= 188239286*188239286;
end process;

--------------------------------------------------------  Asigning signals to output
outp <= outp_sig;
end Behavioral;
