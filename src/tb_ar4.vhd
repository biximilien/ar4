-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Cadre       : GEN1333 - Conception de circuits integrés                   --
--             : Projet de conception d'un registre d'adresse mémoire        --
-- Par         : Maxime Gauthier                                             --
--               Jérémie St-Pierre Robitaille                                --
--               Philippe Tanguay                                            --
-- Date        : 04 / 18 / 2018                                              --
-- Fichier     : tb_ar4.vhd                                                  --
-- Description : Banc d'essais pour le registre d'adresse mémoire.           --
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity tb_ar4 is
end tb_ar4;

architecture behav of tb_ar4 is

  component ar4
    port (
      Ia, Ib, Ic, Id  : in  std_logic;
      LD, INC, CLR    : in  std_logic;
      CLK             : in  std_logic;
      OA, OB, OC, OD  : out std_logic
    );
  end component;

  signal clock : std_logic := '0';

  signal load  : std_logic := '0';
  signal incr  : std_logic := '0';
  signal clear : std_logic := '0';

  signal X  : std_logic_vector(3 downto 0) := "0000";
  signal Y  : std_logic_vector(3 downto 0);

  signal finished : std_logic := '0';

  begin

    uut: ar4 PORT MAP (
      Ia => X(3),
      Ib => X(2),
      Ic => X(1),
      Id => X(0),
      clk => clock,
      ld  => load,
      inc => incr,
      clr => clear,
      Oa => Y(3),
      Ob => Y(2),
      Oc => Y(1),
      Od => Y(0)
    );

    clock <= not clock after 50 ns when finished /= '1' else '0';

    stim_proc: process
      begin

        -- wait a full period
        wait for 100 ns;

        -- load 0 into register
        load <= '1';
        X <= "0000";

        wait for 100 ns;

        -- ensure load function works
        assert (Y = "0000") report "Test failed. Expected output to be '0000'." severity failure;

        -- tests incrementation function
        load <= '0';
        incr <= '1';

        wait for 100 ns;

        assert (Y = "0001") report "Test failed. Expected output to be '0001'." severity failure;

        wait for 100 ns;

        assert (Y = "0010") report "Test failed. Expected output to be '0010'." severity failure;

        wait for 100 ns;

        assert (Y = "0011") report "Test failed. Expected output to be '0011'." severity failure;

        wait for 100 ns;

        assert (Y = "0100") report "Test failed. Expected output to be '0100'." severity failure;

        wait for 100 ns;

        assert (Y = "0101") report "Test failed. Expected output to be '0101'." severity failure;

        wait for 100 ns;

        assert (Y = "0110") report "Test failed. Expected output to be '0110'." severity failure;

        wait for 100 ns;

        assert (Y = "0111") report "Test failed. Expected output to be '0111'." severity failure;

        wait for 100 ns;

        assert (Y = "1000") report "Test failed. Expected output to be '1000'." severity failure;

        wait for 100 ns;

        assert (Y = "1001") report "Test failed. Expected output to be '1001'." severity failure;

        wait for 100 ns;

        assert (Y = "1010") report "Test failed. Expected output to be '1010'." severity failure;

        wait for 100 ns;

        assert (Y = "1011") report "Test failed. Expected output to be '1011'." severity failure;

        wait for 100 ns;

        assert (Y = "1100") report "Test failed. Expected output to be '1100'." severity failure;

        wait for 100 ns;

        assert (Y = "1101") report "Test failed. Expected output to be '1101'." severity failure;

        wait for 100 ns;

        assert (Y = "1110") report "Test failed. Expected output to be '1110'." severity failure;

        wait for 100 ns;

        assert (Y = "1111") report "Test failed. Expected output to be '1111'." severity failure;

        wait for 100 ns;

        assert (Y = "0000") report "Test failed. Expected output to be '0000'." severity failure;

        incr <= '0';
        load <= '1';

        -- test load with arbitrary value
        X <= "0101";

        wait for 100 ns;

        X <= "0000";
        load <= '0';

        assert (Y = "0101") report "Test failed. Expected output to be '0101'." severity failure;

        -- test incrementation with arbitrary value
        incr <= '1';

        wait for 100 ns;

        assert (Y = "0110") report "Test failed. Expected output to be '0110'." severity failure;

        incr <= '0';
        -- test clear function
        clear <= '1';

        wait for 100 ns;

        assert (Y = "0000") report "Test failed. Expected output to be '0000'." severity failure;

        clear <= '0';

        finished <= '1';

        wait;

    end process;

end behav;
