----------------------------------------------------------------------------------
-- Test Bench for Multiplier Main Block Stage 2
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity tb_multiplier_main1 is
end tb_multiplier_main1;

architecture tb of tb_multiplier_main1 is

    component multiplier_main1
        port (clk         : in std_logic;
              MX1_inp     : in integer;
              MX2_inp     : in integer;
              MX3_inp     : in integer;
              MULTI1_outp : out integer;
              MULTI2_outp : out integer);
    end component;

    signal clk         : std_logic;
    signal MX1_inp     : integer;
    signal MX2_inp     : integer;
    signal MX3_inp     : integer;
    signal MULTI1_outp : integer;
    signal MULTI2_outp : integer;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : multiplier_main1
    port map (clk         => clk,
              MX1_inp     => MX1_inp,
              MX2_inp     => MX2_inp,
              MX3_inp     => MX3_inp,
              MULTI1_outp => MULTI1_outp,
              MULTI2_outp => MULTI2_outp);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        MX1_inp <= 18;
        MX2_inp <= -13;
        MX3_inp <= -2;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_multiplier_main1 of tb_multiplier_main1 is
    for tb
    end for;
end cfg_tb_multiplier_main1;