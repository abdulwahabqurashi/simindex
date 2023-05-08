----------------------------------------------------------------------------------
-- Test Bench for Basic Mac Block
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.mult_2x2_pack.all;

entity tb_mac_3x1_array is
end tb_mac_3x1_array;

architecture tb of tb_mac_3x1_array is

    component mac_3x1_array
        port (clk       : in std_logic;
              in_array1 : in t_1d_array;
              in_array2 : in t_1d_array;
              outp      : out integer);
    end component;

    signal clk       : std_logic;
    signal in_array1 : t_1d_array;
    signal in_array2 : t_1d_array;
    signal outp      : integer;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : mac_3x1_array
    port map (clk       => clk,
              in_array1 => in_array1,
              in_array2 => in_array2,
              outp      => outp);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        in_array1(0) <= 7;
        in_array1(1) <= 2;
        in_array1(2) <= 1;
        in_array1(3) <= 1;
        
        in_array2(0) <= 4;
        in_array2(1) <= 2;
        in_array2(2) <= 1;
        in_array2(3) <= 1;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mac_3x1_array of tb_mac_3x1_array is
    for tb
    end for;
end cfg_tb_mac_3x1_array;