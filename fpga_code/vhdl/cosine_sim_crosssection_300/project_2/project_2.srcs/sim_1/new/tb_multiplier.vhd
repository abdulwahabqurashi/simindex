----------------------------------------------------------------------------------
-- Test Bench for Multiplier Main Block
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity tb_multiplier is
end tb_multiplier;

architecture tb of tb_multiplier is

    component multiplier
        port (clk  : in std_logic;
              inp1 : in integer;
              inp2 : in integer;
              outp : out std_logic_vector (31 downto 0));
    end component;

    signal clk  : std_logic;
    signal inp1 : integer;
    signal inp2 : integer;
    signal outp : std_logic_vector (31 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : multiplier
    port map (clk  => clk,
              inp1 => inp1,
              inp2 => inp2,
              outp => outp);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        inp1 <= 21345;
        inp2 <= 21345;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_multiplier of tb_multiplier is
    for tb
    end for;
end cfg_tb_multiplier;