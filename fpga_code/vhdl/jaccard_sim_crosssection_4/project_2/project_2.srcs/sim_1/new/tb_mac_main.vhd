----------------------------------------------------------------------------------
-- Test Bench for Main Mac file for MAC 1,2,3
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.mult_2x2_pack.all;

entity tb_mac_main is
end tb_mac_main;

architecture tb of tb_mac_main is

    component mac_main
        port (clk      : in std_logic;
              S1_inp   : in t_1d_array;
              S2_inp   : in t_1d_array;
              MAC1_OUT : out integer;
              MAC2_OUT : out integer;
              MAC3_OUT : out integer);
    end component;

    signal clk      : std_logic;
    signal S1_inp   : t_1d_array;
    signal S2_inp   : t_1d_array;
    signal MAC1_OUT : integer;
    signal MAC2_OUT : integer;
    signal MAC3_OUT : integer;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : mac_main
    port map (clk      => clk,
              S1_inp   => S1_inp,
              S2_inp   => S2_inp,
              MAC1_OUT => MAC1_OUT,
              MAC2_OUT => MAC2_OUT,
              MAC3_OUT => MAC3_OUT);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin

        -- First Array Input declaration 
        S1_inp(0) <= 4;
        S1_inp(1) <= 2;
        S1_inp(2) <= 1;
        S1_inp(3) <= 1;
        
        -- Second Array Input declaration 
        S2_inp(0) <= 7;
        S2_inp(1) <= 2;
        S2_inp(2) <= 1;
        S2_inp(3) <= 1;
 

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_mac_main of tb_mac_main is
    for tb
    end for;
end cfg_tb_mac_main;