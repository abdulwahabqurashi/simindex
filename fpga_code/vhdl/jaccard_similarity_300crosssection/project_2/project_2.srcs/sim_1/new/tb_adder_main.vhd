----------------------------------------------------------------------------------
-- Test Bench for Stage-2 ADDER block
----------------------------------------------------------------------------------

--library ieee;
--use ieee.std_logic_1164.all;

--entity tb_adder_main is
--end tb_adder_main;

--architecture tb of tb_adder_main is

--    component adder_main
--        port (clk      : in std_logic;
--              ADD_inp1 : in integer;
--              ADD_inp2 : in integer;
--              ADD_outp : out integer);
--    end component;

--    signal clk      : std_logic;
--    signal ADD_inp1 : integer;
--    signal ADD_inp2 : integer;
--    signal ADD_outp : integer;

--    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
--    signal TbClock : std_logic := '0';
--    signal TbSimEnded : std_logic := '0';

--begin

--    dut : adder_main
--    port map (clk      => clk,
--              ADD_inp1 => ADD_inp1,
--              ADD_inp2 => ADD_inp2,
--              ADD_outp => ADD_outp);

--    -- Clock generation
--    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

--    -- EDIT: Check that clk is really your main clock signal
--    clk <= TbClock;

--    stimuli : process
--    begin
--        -- EDIT Adapt initialization as needed
--        ADD_inp1 <= 22;
--        ADD_inp2 <= 55;

--        -- EDIT Add stimuli here
--        wait for 100 * TbPeriod;

--        -- Stop the clock and hence terminate the simulation
--        TbSimEnded <= '1';
--        wait;
--    end process;

--end tb;

---- Configuration block below is required by some simulators. Usually no need to edit.

--configuration cfg_tb_adder_main of tb_adder_main is
--    for tb
--    end for;
--end cfg_tb_adder_main;







library ieee;
use ieee.std_logic_1164.all;

entity tb_adder_main is
end tb_adder_main;

architecture tb of tb_adder_main is

    component adder_main
        port (rst      : in std_logic;
              clk      : in std_logic;
              ADD_inp1 : in integer;
              ADD_inp2 : in integer;
              ADD_outp : out integer);
    end component;

   -- signal rst      : std_logic;
     signal rst : std_logic := '1';
    signal clk      : std_logic;
    signal ADD_inp1 : integer;
    signal ADD_inp2 : integer;
    signal ADD_outp : integer;

    constant TbPeriod : time := 1000 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';
  

begin

    dut : adder_main
    port map (rst      => rst,
              clk      => clk,
              ADD_inp1 => ADD_inp1,
              ADD_inp2 => ADD_inp2,
              ADD_outp => ADD_outp);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';
    rst <= '1', '0' after 500 ns;


    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
    wait until (rst = '0');

        -- EDIT Adapt initialization as needed
        ADD_inp1 <= 22;
        ADD_inp2 <= 55;

        -- Reset generation
        -- EDIT: Check that rst is really your reset signal
--        rst <= '1';
--        wait for 100 ns;
--        rst <= '0';
--        wait for 100 ns;

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_adder_main of tb_adder_main is
    for tb
    end for;
end cfg_tb_adder_main;