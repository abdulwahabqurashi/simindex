----------------------------------------------------------------------------------
-- Test Bench for Divider Block Stage 3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_divider_main is
end tb_divider_main;

architecture tb of tb_divider_main is

    component divider_main
        port (clk         : in std_logic;
              DIV1_inp    : in integer;
              DIV2_inp    : in integer;
              DIVOUT_outp : out integer);
    end component;

    signal clk         : std_logic;
    signal DIV1_inp    : integer;
    signal DIV2_inp    : integer;
    signal DIVOUT_outp : integer;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : divider_main
    port map (clk         => clk,
              DIV1_inp    => DIV1_inp,
              DIV2_inp    => DIV2_inp,
              DIVOUT_outp => DIVOUT_outp);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
            DIV1_inp <= 34;
            DIV2_inp <= 43;
        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_divider_main of tb_divider_main is
    for tb
    end for;
end cfg_tb_divider_main;