----------------------------------------------------------------------------------
-- Test Bench for SUBTRACTION main block
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_subtract_main is
end tb_subtract_main;

architecture tb of tb_subtract_main is

    component subtract_main
        port (clk      : in std_logic;
              SUB_inp1 : in integer;
              SUB_inp2 : in integer;
              SUB_outp : out integer);
    end component;

    signal clk      : std_logic;
    signal SUB_inp1 : integer;
    signal SUB_inp2 : integer;
    signal SUB_outp : integer;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : subtract_main
    port map (clk      => clk,
              SUB_inp1 => SUB_inp1,
              SUB_inp2 => SUB_inp2,
              SUB_outp => SUB_outp);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        SUB_inp1 <= 34;
        SUB_inp2 <= 43;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_subtract_main of tb_subtract_main is
    for tb
    end for;
end cfg_tb_subtract_main;